/*
 * ============================================
 * RESTORE DATABASE - CHO CÁC BẠN WINDOWS
 * ============================================
 * Cách dùng:
 * 1. Download file QuanLyNhanSu_Backup.bak từ GitHub
 * 2. Copy vào C:\Backup\
 * 3. Chạy script này trong SSMS
 * 
 * LƯU Ý: 
 * - Sửa đường dẫn DISK nếu bạn đặt file ở chỗ khác
 * - Sửa MSSQL15 thành MSSQL16 nếu dùng SQL Server 2022
 * ============================================
 */

USE master;
GO

-- Drop database nếu đã tồn tại
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'QuanLyNhanSu')
BEGIN
    ALTER DATABASE QuanLyNhanSu SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE QuanLyNhanSu;
    PRINT '✅ Đã xóa database cũ';
END
GO

-- Lấy thông tin đường dẫn mặc định của SQL Server
DECLARE @DataPath NVARCHAR(500);
DECLARE @LogPath NVARCHAR(500);

SELECT @DataPath = SUBSTRING(physical_name, 1, CHARINDEX(N'master.mdf', LOWER(physical_name)) - 1)
FROM master.sys.master_files
WHERE database_id = 1 AND file_id = 1;

SET @LogPath = @DataPath;

PRINT 'Data Path: ' + @DataPath;
PRINT 'Log Path: ' + @LogPath;
GO

-- Restore từ backup file
-- ⚠️ SỬA ĐƯỜNG DẪN NÀY nếu cần:
RESTORE DATABASE QuanLyNhanSu
FROM DISK = 'C:\Backup\QuanLyNhanSu_Backup.bak'
WITH 
    MOVE 'QuanLyNhanSu' TO 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QuanLyNhanSu.mdf',
    MOVE 'QuanLyNhanSu_log' TO 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QuanLyNhanSu_log.ldf',
    REPLACE,
    STATS = 10;
GO

-- Verify
USE QuanLyNhanSu;
GO

SELECT 
    'Chi nhánh' AS [Loại],
    COUNT(*) AS [Số lượng]
FROM ChiNhanh
UNION ALL
SELECT 'Nhân viên', COUNT(*) FROM NhanVien
UNION ALL
SELECT 'Phòng ban', COUNT(*) FROM PhongBan
UNION ALL
SELECT 'Dự án', COUNT(*) FROM DuAn
UNION ALL
SELECT 'Chính sách', COUNT(*) FROM ChinhSach;
GO

PRINT '';
PRINT '✅ RESTORE THÀNH CÔNG!';
PRINT 'Database QuanLyNhanSu đã sẵn sàng!';
GO
