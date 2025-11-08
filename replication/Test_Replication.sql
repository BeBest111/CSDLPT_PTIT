/*
 * ============================================
 * TEST REPLICATION SCRIPT
 * ============================================
 * Mục đích: Test đồng bộ dữ liệu giữa Publisher và Subscribers
 * Chạy trên: SQL Server 2022 (Ubuntu - máy Tiến)
 * Người chạy: Tiến (sau khi setup xong tất cả)
 * 
 * YÊU CẦU:
 * - Đã setup xong 5 Subscriptions
 * - Đã đợi Distribution Agent chạy (5-10 phút)
 * ============================================
 */

USE QuanLyNhanSu;
GO

PRINT '==============================================';
PRINT 'TEST REPLICATION - DỰ ÁN CSDLPT';
PRINT '==============================================';
GO

PRINT '';
PRINT '==============================================';
PRINT 'TEST 1: Kiểm tra số lượng Chính sách trên Publisher';
PRINT '==============================================';
GO

SELECT COUNT(*) AS TongChinhSachPublisher FROM ChinhSach;
-- Phải thấy 70 chính sách
GO

PRINT '';
PRINT '==============================================';
PRINT 'TEST 2: INSERT 1 chính sách mới';
PRINT '==============================================';
GO

-- Xóa nếu đã tồn tại (từ lần test trước)
IF EXISTS (SELECT * FROM ChinhSach WHERE ID_ChinhSach = 'CS_TEST_001')
BEGIN
    DELETE FROM ChinhSach WHERE ID_ChinhSach = 'CS_TEST_001';
    PRINT 'Đã xóa chính sách test cũ';
END
GO

-- Insert chính sách mới
INSERT INTO ChinhSach (ID_ChinhSach, ID_ChiNhanh, TenChinhSach, NoiDung, NgayApDung)
VALUES (
    'CS_TEST_001',
    'CN01',
    'Chính sách test Replication',
    'Test INSERT - Ngày ' + CAST(GETDATE() AS VARCHAR(50)),
    GETDATE()
);
GO

PRINT '✅ Đã INSERT chính sách CS_TEST_001';
GO

SELECT * FROM ChinhSach WHERE ID_ChinhSach = 'CS_TEST_001';
GO

PRINT '';
PRINT '⏳ ĐỢI 5-10 PHÚT RỒI KIỂM TRA TRÊN SUBSCRIBERS';
PRINT '';
PRINT 'Hướng dẫn 5 bạn chạy trên SSMS (Windows):';
PRINT '--------------------------------------------';
PRINT 'USE QuanLyNhanSu;';
PRINT 'SELECT * FROM ChinhSach WHERE ID_ChinhSach = ''CS_TEST_001'';';
PRINT '--------------------------------------------';
PRINT 'Nếu thấy record này → Replication thành công! ✅';
GO

PRINT '';
PRINT '==============================================';
PRINT 'TEST 3: UPDATE chính sách';
PRINT '==============================================';
GO

WAITFOR DELAY '00:00:05';  -- Đợi 5 giây để INSERT hoàn tất
GO

UPDATE ChinhSach 
SET NoiDung = 'Test UPDATE - Ngày ' + CAST(GETDATE() AS VARCHAR(50))
WHERE ID_ChinhSach = 'CS_TEST_001';
GO

PRINT '✅ Đã UPDATE chính sách CS_TEST_001';
GO

SELECT * FROM ChinhSach WHERE ID_ChinhSach = 'CS_TEST_001';
GO

PRINT '';
PRINT '⏳ ĐỢI 5-10 PHÚT RỒI KIỂM TRA TRÊN SUBSCRIBERS';
PRINT 'NoiDung phải thay đổi → Replication thành công! ✅';
GO

PRINT '';
PRINT '==============================================';
PRINT 'TEST 4: Kiểm tra Replication Status';
PRINT '==============================================';
GO

-- Xem tất cả Subscriptions
SELECT 
    p.publication AS Publication,
    s.subscriber_server AS Subscriber,
    s.subscriber_db AS SubscriberDB,
    CASE s.status
        WHEN 0 THEN 'Inactive'
        WHEN 1 THEN 'Subscribed'
        WHEN 2 THEN 'Active ✅'
        ELSE 'Unknown'
    END AS Status,
    s.sync_type
FROM dbo.syspublications p
INNER JOIN dbo.syssubscriptions s ON p.pubid = s.pubid
WHERE p.name = 'Pub_ChinhSach';
GO

PRINT '';
PRINT '==============================================';
PRINT 'TEST 5: Kiểm tra Distribution Agent Jobs';
PRINT '==============================================';
GO

SELECT 
    job.name AS JobName,
    CASE job.enabled
        WHEN 1 THEN 'Enabled ✅'
        ELSE 'Disabled ❌'
    END AS Status,
    activity.run_requested_date AS LastRun,
    activity.stop_execution_date AS LastStop
FROM msdb.dbo.sysjobs job
LEFT JOIN msdb.dbo.sysjobactivity activity ON job.job_id = activity.job_id
WHERE job.name LIKE '%Pub_ChinhSach%' AND job.name LIKE '%Distribution%'
ORDER BY activity.run_requested_date DESC;
GO

PRINT '';
PRINT '==============================================';
PRINT 'TEST 6: Kiểm tra Agent History (10 giao dịch gần nhất)';
PRINT '==============================================';
GO

USE distribution;
GO

SELECT TOP 10
    CASE h.runstatus
        WHEN 1 THEN 'Start'
        WHEN 2 THEN 'Succeed ✅'
        WHEN 3 THEN 'In Progress'
        WHEN 4 THEN 'Idle'
        WHEN 5 THEN 'Retry'
        WHEN 6 THEN 'Fail ❌'
        ELSE 'Unknown'
    END AS Status,
    h.comments AS Message,
    h.time AS Timestamp
FROM MSdistribution_history h
ORDER BY h.time DESC;
GO

USE QuanLyNhanSu;
GO

PRINT '';
PRINT '==============================================';
PRINT 'TEST 7: Chạy Distribution Agent thủ công (nếu cần)';
PRINT '==============================================';
GO

PRINT 'Nếu muốn force đồng bộ ngay lập tức, chạy:';
PRINT '';
PRINT 'USE msdb;';
PRINT 'GO';
PRINT '';
PRINT 'DECLARE @job_name NVARCHAR(255);';
PRINT 'DECLARE @job_id UNIQUEIDENTIFIER;';
PRINT '';
PRINT 'DECLARE job_cursor CURSOR FOR';
PRINT 'SELECT name, job_id ';
PRINT 'FROM msdb.dbo.sysjobs ';
PRINT 'WHERE name LIKE ''%Pub_ChinhSach%'' AND name LIKE ''%Distribution%'';';
PRINT '';
PRINT 'OPEN job_cursor;';
PRINT 'FETCH NEXT FROM job_cursor INTO @job_name, @job_id;';
PRINT '';
PRINT 'WHILE @@FETCH_STATUS = 0';
PRINT 'BEGIN';
PRINT '    EXEC msdb.dbo.sp_start_job @job_id = @job_id;';
PRINT '    PRINT ''Đã chạy job: '' + @job_name;';
PRINT '    FETCH NEXT FROM job_cursor INTO @job_name, @job_id;';
PRINT 'END';
PRINT '';
PRINT 'CLOSE job_cursor;';
PRINT 'DEALLOCATE job_cursor;';
PRINT 'GO';
GO

PRINT '';
PRINT '==============================================';
PRINT '✅ HOÀN TẤT TEST REPLICATION!';
PRINT '==============================================';
PRINT '';
PRINT 'CHECKLIST:';
PRINT '[ ] INSERT thành công trên Publisher';
PRINT '[ ] Đợi 5-10 phút';
PRINT '[ ] 5 bạn kiểm tra trên Subscriber, thấy CS_TEST_001';
PRINT '[ ] UPDATE thành công trên Publisher';
PRINT '[ ] 5 bạn kiểm tra lại, NoiDung đã thay đổi';
PRINT '[ ] Tất cả Distribution Agents đang chạy (Enabled ✅)';
PRINT '[ ] Chụp screenshots cho báo cáo';
PRINT '';
PRINT 'Nếu có lỗi, kiểm tra:';
PRINT '1. Firewall (port 1433)';
PRINT '2. SQL Server Agent có chạy không';
PRINT '3. Agent History có lỗi gì không';
PRINT '4. Subscriber có connect được vào Publisher không';
PRINT '==============================================';
GO
