/*
 * ============================================
 * DISTRIBUTOR SETUP SCRIPT
 * ============================================
 * Mục đích: Cấu hình máy Ubuntu làm Distributor cho Replication
 * Chạy trên: SQL Server 2022 (Ubuntu - máy Tiến)
 * Người chạy: Tiến
 * 
 * QUAN TRỌNG:
 * - Chỉ chạy 1 lần duy nhất
 * - Phải enable SQL Server Agent trước
 * ============================================
 */

USE master;
GO

PRINT '==============================================';
PRINT 'BƯỚC 1: Kiểm tra SQL Server Agent';
PRINT '==============================================';
GO

-- Kiểm tra Agent có chạy không
IF EXISTS (
    SELECT 1 
    FROM sys.dm_server_services 
    WHERE servicename LIKE '%SQL Server Agent%' 
      AND status = 4  -- 4 = Running
)
BEGIN
    PRINT '✅ SQL Server Agent đang chạy';
END
ELSE
BEGIN
    PRINT '❌ SQL Server Agent CHƯA chạy!';
    PRINT 'Chạy lệnh sau trong terminal:';
    PRINT 'sudo /opt/mssql/bin/mssql-conf set sqlagent.enabled true';
    PRINT 'sudo systemctl restart mssql-server';
    RAISERROR('SQL Server Agent chưa chạy!', 16, 1);
END
GO

PRINT '';
PRINT '==============================================';
PRINT 'BƯỚC 2: Cấu hình Distributor';
PRINT '==============================================';
GO

-- Kiểm tra đã là Distributor chưa
IF NOT EXISTS (SELECT * FROM sys.servers WHERE is_distributor = 1)
BEGIN
    PRINT 'Đang cấu hình Distributor...';
    
    -- Thêm Distributor
    EXEC sp_adddistributor 
        @distributor = N'100.64.0.1',  -- ⚠️ SỬA IP NÀY!
        @password = N'Tt12345@';
    
    PRINT '✅ Đã cấu hình Distributor';
END
ELSE
BEGIN
    PRINT '⚠️ Máy này đã là Distributor rồi';
END
GO

PRINT '';
PRINT '==============================================';
PRINT 'BƯỚC 3: Tạo Distribution Database';
PRINT '==============================================';
GO

-- Kiểm tra distribution database đã có chưa
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'distribution')
BEGIN
    PRINT 'Đang tạo distribution database...';
    
    EXEC sp_adddistributiondb 
        @database = N'distribution',
        @data_folder = N'/var/opt/mssql/data',
        @log_folder = N'/var/opt/mssql/data',
        @log_file_size = 10,
        @min_distretention = 0,
        @max_distretention = 72,
        @history_retention = 48,
        @security_mode = 0,  -- SQL Authentication
        @login = N'sa',
        @password = N'Tt12345@';
    
    PRINT '✅ Đã tạo distribution database';
END
ELSE
BEGIN
    PRINT '⚠️ Distribution database đã tồn tại';
END
GO

PRINT '';
PRINT '==============================================';
PRINT 'BƯỚC 4: Tạo thư mục Snapshot';
PRINT '==============================================';
GO

-- Lưu ý: Phải tạo thư mục này trong terminal trước
PRINT 'Kiểm tra thư mục /var/opt/mssql/data/ReplData';
PRINT 'Nếu chưa có, chạy trong terminal:';
PRINT 'sudo mkdir -p /var/opt/mssql/data/ReplData';
PRINT 'sudo chown mssql:mssql /var/opt/mssql/data/ReplData';
PRINT 'sudo chmod 755 /var/opt/mssql/data/ReplData';
GO

PRINT '';
PRINT '==============================================';
PRINT 'BƯỚC 5: Đăng ký Publisher sử dụng Distributor';
PRINT '==============================================';
GO

-- Kiểm tra Publisher đã đăng ký chưa
IF NOT EXISTS (
    SELECT * 
    FROM sys.servers 
    WHERE name = '100.64.0.1'  -- ⚠️ SỬA IP NÀY!
      AND is_publisher = 1
)
BEGIN
    PRINT 'Đang đăng ký Publisher...';
    
    EXEC sp_adddistpublisher 
        @publisher = N'100.64.0.1',  -- ⚠️ SỬA IP NÀY!
        @distribution_db = N'distribution',
        @security_mode = 0,
        @login = N'sa',
        @password = N'Tt12345@',
        @working_directory = N'/var/opt/mssql/data/ReplData',
        @trusted = N'false',
        @thirdparty_flag = 0,
        @publisher_type = N'MSSQLSERVER';
    
    PRINT '✅ Đã đăng ký Publisher';
END
ELSE
BEGIN
    PRINT '⚠️ Publisher đã được đăng ký rồi';
END
GO

PRINT '';
PRINT '==============================================';
PRINT 'BƯỚC 6: Kiểm tra cấu hình';
PRINT '==============================================';
GO

-- Kiểm tra Distributor
SELECT 
    'Distributor' AS Role,
    name AS ServerName,
    is_distributor,
    is_publisher
FROM sys.servers
WHERE is_distributor = 1 OR is_publisher = 1;
GO

-- Kiểm tra Distribution Database
SELECT 
    name AS DatabaseName,
    create_date,
    state_desc AS State
FROM sys.databases
WHERE name = 'distribution';
GO

PRINT '';
PRINT '==============================================';
PRINT '✅ HOÀN TẤT SETUP DISTRIBUTOR!';
PRINT '==============================================';
PRINT '';
PRINT 'BƯỚC TIẾP THEO:';
PRINT '1. Chạy 02_Create_Publication.sql';
PRINT '==============================================';
GO
