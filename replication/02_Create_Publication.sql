/*
 * ============================================
 * CREATE PUBLICATION SCRIPT
 * ============================================
 * Mục đích: Tạo Publication để nhân bản bảng ChinhSach và ChucVu
 * Chạy trên: SQL Server 2022 (Ubuntu - máy Tiến)
 * Người chạy: Tiến
 * 
 * YÊU CẦU:
 * - Đã chạy 01_Setup_Distributor.sql thành công
 * - Database QuanLyNhanSu_TruSo đã có dữ liệu
 * ============================================
 */

USE QuanLyNhanSu_TruSo;
GO

PRINT '==============================================';
PRINT 'BƯỚC 1: Enable Replication cho Database';
PRINT '==============================================';
GO

-- Kiểm tra database đã enable replication chưa
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'QuanLyNhanSu_TruSo' AND is_published = 1)
BEGIN
    PRINT 'Đang enable replication...';
    
    EXEC sp_replicationdboption 
        @dbname = N'QuanLyNhanSu_TruSo',
        @optname = N'publish',
        @value = N'true';
    
    PRINT '✅ Đã enable replication cho database QuanLyNhanSu_TruSo';
END
ELSE
BEGIN
    PRINT '⚠️ Database đã được enable replication rồi';
END
GO

PRINT '';
PRINT '==============================================';
PRINT 'BƯỚC 2: Tạo Publication';
PRINT '==============================================';
GO

-- Kiểm tra Publication đã tồn tại chưa
IF NOT EXISTS (SELECT * FROM syspublications WHERE name = 'Pub_ChinhSach_ChucVu')
BEGIN
    PRINT 'Đang tạo Publication Pub_ChinhSach_ChucVu...';
    
    EXEC sp_addpublication 
        @publication = N'Pub_ChinhSach_ChucVu',
        @description = N'Nhân bản bảng ChinhSach và ChucVu đến các chi nhánh',
        @sync_method = N'concurrent',  -- Không lock bảng khi snapshot
        @retention = 0,
        @allow_push = N'true',  -- Cho phép push subscription
        @allow_pull = N'false',
        @allow_anonymous = N'false',
        @enabled_for_internet = N'false',
        @snapshot_in_defaultfolder = N'true',
        @compress_snapshot = N'false',
        @ftp_port = 21,
        @allow_subscription_copy = N'false',
        @add_to_active_directory = N'false',
        @repl_freq = N'continuous',  -- Đồng bộ liên tục
        @status = N'active',
        @independent_agent = N'true',
        @immediate_sync = N'true',
        @allow_sync_tran = N'false',
        @autogen_sync_procs = N'false',
        @allow_queued_tran = N'false',
        @allow_dts = N'false',
        @replicate_ddl = 1,  -- Nhân bản cả DDL (ALTER TABLE)
        @allow_initialize_from_backup = N'false',
        @enabled_for_p2p = N'false',
        @enabled_for_het_sub = N'false';
    
    PRINT '✅ Đã tạo Publication Pub_ChinhSach_ChucVu';
END
ELSE
BEGIN
    PRINT '⚠️ Publication Pub_ChinhSach_ChucVu đã tồn tại';
END
GO

PRINT '';
PRINT '==============================================';
PRINT 'BƯỚC 3: Thêm bảng ChinhSach vào Publication';
PRINT '==============================================';
GO

-- Kiểm tra article đã tồn tại chưa
IF NOT EXISTS (
    SELECT * 
    FROM sysarticles 
    WHERE publication_id = (SELECT pubid FROM syspublications WHERE name = 'Pub_ChinhSach_ChucVu')
      AND name = 'ChinhSach'
)
BEGIN
    PRINT 'Đang thêm bảng ChinhSach...';
    
    EXEC sp_addarticle 
        @publication = N'Pub_ChinhSach_ChucVu',
        @article = N'ChinhSach',
        @source_owner = N'dbo',
        @source_object = N'ChinhSach',
        @type = N'logbased',
        @description = N'Bảng Chính sách',
        @creation_script = NULL,
        @pre_creation_cmd = N'drop',  -- Xóa bảng cũ trước khi tạo mới
        @schema_option = 0x000000000803509F,
        @identityrangemanagementoption = N'manual',
        @destination_table = N'ChinhSach',
        @destination_owner = N'dbo',
        @status = 24,
        @vertical_partition = N'false',
        @ins_cmd = N'CALL [sp_MSins_dboChinhSach]',
        @del_cmd = N'CALL [sp_MSdel_dboChinhSach]',
        @upd_cmd = N'SCALL [sp_MSupd_dboChinhSach]';
    
    PRINT '✅ Đã thêm bảng ChinhSach vào Publication';
END
ELSE
BEGIN
    PRINT '⚠️ Bảng ChinhSach đã được thêm vào Publication rồi';
END
GO

PRINT '';
PRINT '==============================================';
PRINT 'BƯỚC 4: Thêm bảng ChucVu vào Publication';
PRINT '==============================================';
GO

-- Kiểm tra article đã tồn tại chưa
IF NOT EXISTS (
    SELECT * 
    FROM sysarticles 
    WHERE publication_id = (SELECT pubid FROM syspublications WHERE name = 'Pub_ChinhSach_ChucVu')
      AND name = 'ChucVu'
)
BEGIN
    PRINT 'Đang thêm bảng ChucVu...';
    
    EXEC sp_addarticle 
        @publication = N'Pub_ChinhSach_ChucVu',
        @article = N'ChucVu',
        @source_owner = N'dbo',
        @source_object = N'ChucVu',
        @type = N'logbased',
        @description = N'Bảng Chức vụ',
        @creation_script = NULL,
        @pre_creation_cmd = N'drop',  -- Xóa bảng cũ trước khi tạo mới
        @schema_option = 0x000000000803509F,
        @identityrangemanagementoption = N'manual',
        @destination_table = N'ChucVu',
        @destination_owner = N'dbo',
        @status = 24,
        @vertical_partition = N'false',
        @ins_cmd = N'CALL [sp_MSins_dboChucVu]',
        @del_cmd = N'CALL [sp_MSdel_dboChucVu]',
        @upd_cmd = N'SCALL [sp_MSupd_dboChucVu]';
    
    PRINT '✅ Đã thêm bảng ChucVu vào Publication';
END
ELSE
BEGIN
    PRINT '⚠️ Bảng ChucVu đã được thêm vào Publication rồi';
END
GO

PRINT '';
PRINT '==============================================';
PRINT 'BƯỚC 5: Kiểm tra Publication';
PRINT '==============================================';
GO

-- Xem thông tin Publication
SELECT 
    name AS PublicationName,
    description,
    status,
    repl_freq,
    allow_push
FROM syspublications
WHERE name = 'Pub_ChinhSach_ChucVu';
GO

-- Xem các bảng trong Publication
SELECT 
    a.article AS TableName,
    a.destination_object AS DestinationTable,
    a.type_desc AS ReplicationType
FROM sysarticles a
INNER JOIN syspublications p ON a.publication_id = p.pubid
WHERE p.name = 'Pub_ChinhSach_ChucVu';
GO

PRINT '';
PRINT '==============================================';
PRINT '✅ HOÀN TẤT SETUP PUBLICATION!';
PRINT '==============================================';
PRINT '';
PRINT 'BƯỚC TIẾP THEO:';
PRINT '1. Chạy 03_Create_Snapshot.sql';
PRINT '==============================================';
GO
