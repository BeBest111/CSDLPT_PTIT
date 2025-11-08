/*
 * ============================================
 * CREATE SNAPSHOT AGENT SCRIPT
 * ============================================
 * Mục đích: Tạo và chạy Snapshot Agent để lấy dữ liệu ban đầu
 * Chạy trên: SQL Server 2022 (Ubuntu - máy Tiến)
 * Người chạy: Tiến
 * 
 * YÊU CẦU:
 * - Đã chạy 02_Create_Publication.sql thành công
 * - Thư mục /var/opt/mssql/data/ReplData đã tạo và có quyền
 * ============================================
 */

USE QuanLyNhanSu_TruSo;
GO

PRINT '==============================================';
PRINT 'BƯỚC 1: Kiểm tra thư mục Snapshot';
PRINT '==============================================';
GO

PRINT 'Thư mục snapshot: /var/opt/mssql/data/ReplData';
PRINT 'Nếu lỗi, chạy trong terminal:';
PRINT 'sudo mkdir -p /var/opt/mssql/data/ReplData';
PRINT 'sudo chown mssql:mssql /var/opt/mssql/data/ReplData';
PRINT 'sudo chmod 755 /var/opt/mssql/data/ReplData';
GO

PRINT '';
PRINT '==============================================';
PRINT 'BƯỚC 2: Tạo Snapshot Agent Job';
PRINT '==============================================';
GO

-- Kiểm tra Snapshot Agent đã tồn tại chưa
IF NOT EXISTS (
    SELECT * 
    FROM syspublications 
    WHERE name = 'Pub_ChinhSach_ChucVu' 
      AND snapshot_jobid IS NOT NULL
)
BEGIN
    PRINT 'Đang tạo Snapshot Agent job...';
    
    EXEC sp_addpublication_snapshot 
        @publication = N'Pub_ChinhSach_ChucVu',
        @frequency_type = 1,  -- One time (có thể đổi thành 4 = Daily nếu muốn chạy định kỳ)
        @frequency_interval = 0,
        @frequency_relative_interval = 0,
        @frequency_recurrence_factor = 0,
        @frequency_subday = 0,
        @frequency_subday_interval = 0,
        @active_start_time_of_day = 0,
        @active_end_time_of_day = 235959,
        @active_start_date = 0,
        @active_end_date = 0,
        @job_login = NULL,
        @job_password = NULL,
        @publisher_security_mode = 0,  -- SQL Authentication
        @publisher_login = N'sa',
        @publisher_password = N'Tt12345@';
    
    PRINT '✅ Đã tạo Snapshot Agent job';
END
ELSE
BEGIN
    PRINT '⚠️ Snapshot Agent job đã tồn tại';
END
GO

PRINT '';
PRINT '==============================================';
PRINT 'BƯỚC 3: Chạy Snapshot Agent ngay lập tức';
PRINT '==============================================';
GO

PRINT 'Đang chạy Snapshot Agent...';
PRINT '(Quá trình này mất 30-60 giây)';
GO

EXEC sp_startpublication_snapshot 
    @publication = N'Pub_ChinhSach_ChucVu';
GO

-- Đợi 30 giây
PRINT 'Đợi 30 giây để snapshot hoàn tất...';
WAITFOR DELAY '00:00:30';
GO

PRINT '';
PRINT '==============================================';
PRINT 'BƯỚC 4: Kiểm tra Snapshot Status';
PRINT '==============================================';
GO

-- Kiểm tra Snapshot
SELECT 
    name AS PublicationName,
    snapshot_jobid,
    CASE 
        WHEN snapshot_ready = 1 THEN 'Sẵn sàng ✅'
        ELSE 'Chưa sẵn sàng ⏳'
    END AS SnapshotStatus
FROM syspublications
WHERE name = 'Pub_ChinhSach_ChucVu';
GO

-- Kiểm tra Snapshot Agent job
SELECT 
    job.name AS JobName,
    job.enabled AS Enabled,
    CASE 
        WHEN activity.run_requested_date IS NOT NULL THEN 'Đã chạy ✅'
        ELSE 'Chưa chạy ⏳'
    END AS RunStatus,
    activity.run_requested_date AS LastRun
FROM msdb.dbo.sysjobs job
LEFT JOIN msdb.dbo.sysjobactivity activity ON job.job_id = activity.job_id
WHERE job.name LIKE '%Pub_ChinhSach_ChucVu%Snapshot%'
ORDER BY activity.run_requested_date DESC;
GO

PRINT '';
PRINT '==============================================';
PRINT 'BƯỚC 5: Kiểm tra Snapshot Files';
PRINT '==============================================';
GO

PRINT 'Kiểm tra file snapshot trong terminal:';
PRINT 'ls -lh /var/opt/mssql/data/ReplData/';
PRINT '';
PRINT 'Phải thấy các file:';
PRINT '- *.sch (schema)';
PRINT '- *.bcp (data)';
PRINT '- *.pre, *.idx, *.trg, *.dri';
GO

PRINT '';
PRINT '==============================================';
PRINT '✅ HOÀN TẤT SETUP SNAPSHOT AGENT!';
PRINT '==============================================';
PRINT '';
PRINT 'BƯỚC TIẾP THEO:';
PRINT '1. Kiểm tra snapshot_ready = 1 (Sẵn sàng)';
PRINT '2. Nếu ready, chạy Subscriber_Setup.sql trên mỗi chi nhánh';
PRINT '3. Nếu chưa ready, đợi thêm 30 giây rồi chạy lại:';
PRINT '   SELECT snapshot_ready FROM syspublications WHERE name = ''Pub_ChinhSach_ChucVu'';';
PRINT '==============================================';
GO
