# HƯỚNG DẪN CẤU HÌNH SQL SERVER REPLICATION

## 🎯 MỤC TIÊU
Cấu hình **Transactional Replication** để đồng bộ bảng `ChinhSach` từ Publisher (Ubuntu) đến 5 Subscribers (Windows).

---

## 📋 YÊU CẦU TRƯỚC KHI BẮT ĐẦU

### ✅ Checklist:
- [ ] Đã cài Tailscale và kết nối VPN thành công (6 máy ping được nhau)
- [ ] Đã mở port 1433 trên firewall tất cả các máy
- [ ] Đã test kết nối SQL Server giữa các máy (từ SSMS Windows → Ubuntu)
- [ ] Đã có danh sách IP VPN của 6 máy
- [ ] Đã enable SQL Server Authentication trên tất cả máy
- [ ] Đã enable SQL Server Agent trên tất cả máy

---

## 🏗️ KIẾN TRÚC REPLICATION

```
┌─────────────────────────────────────────────────────────────┐
│                    PUBLISHER (Máy Tiến - Ubuntu)             │
│                    IP: 100.64.0.1                            │
│                    SQL Server 2022                           │
│                                                              │
│  Database: QuanLyNhanSu                                      │
│  Bảng Replication: ChinhSach (70 chính sách)                 │
│  Vai trò: Distributor + Publisher                            │
└──────────────────────┬───────────────────────────────────────┘
                       │
         ┌─────────────┼─────────────┬─────────────┬──────────┐
         │             │             │             │          │
         ▼             ▼             ▼             ▼          ▼
┌─────────────┐ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐
│ SUBSCRIBER 1│ │ SUBSCRIBER 2│ │ SUBSCRIBER 3│ │ SUBSCRIBER 4│ │ SUBSCRIBER 5│
│ IP: .0.2    │ │ IP: .0.3    │ │ IP: .0.4    │ │ IP: .0.5    │ │ IP: .0.6    │
│ CN01 Huế    │ │ CN02 Nam Định│ │ CN03 Vinh   │ │ CN04 Nha T. │ │ CN05 Thái B.│
│ Windows     │ │ Windows     │ │ Windows     │ │ Windows     │ │ Windows     │
│ SQL 2019    │ │ SQL 2019    │ │ SQL 2019    │ │ SQL 2019    │ │ SQL 2019    │
└─────────────┘ └─────────────┘ └─────────────┘ └─────────────┘ └─────────────┘
```

**Lưu ý:** 
- **Publisher = Distributor:** Máy Tiến (Ubuntu) đóng vai trò cả Publisher và Distributor để đơn giản.
- **Push Subscription:** Publisher chủ động đẩy dữ liệu đến Subscribers (không cần Subscribers pull).

---

## 🔧 PHẦN 1: CẤU HÌNH PUBLISHER (Máy Tiến - Ubuntu)

### 1.1. Enable Replication Features

```bash
# Kiểm tra SQL Server Agent đã chạy chưa
sudo systemctl status mssql-server
sudo /opt/mssql/bin/mssql-conf set sqlagent.enabled true
sudo systemctl restart mssql-server

# Kiểm tra Agent
sudo systemctl status mssql-server | grep -i agent
```

---

### 1.2. Tạo Distributor

**File: `01_Setup_Distributor.sql`**

```sql
USE master;
GO

-- Kiểm tra đã là Distributor chưa
IF NOT EXISTS (SELECT * FROM sys.servers WHERE is_distributor = 1)
BEGIN
    -- Cấu hình Distributor
    EXEC sp_adddistributor 
        @distributor = N'100.64.0.1',  -- IP VPN của máy Tiến
        @password = N'Tt12345@';
    
    PRINT 'Đã cấu hình Distributor';
END
ELSE
BEGIN
    PRINT 'Máy này đã là Distributor rồi';
END
GO

-- Tạo Distribution Database
USE master;
GO

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
GO

-- Đăng ký Publisher sử dụng Distributor này
EXEC sp_adddistpublisher 
    @publisher = N'100.64.0.1',
    @distribution_db = N'distribution',
    @security_mode = 0,
    @login = N'sa',
    @password = N'Tt12345@',
    @working_directory = N'/var/opt/mssql/data/ReplData',
    @trusted = N'false',
    @thirdparty_flag = 0,
    @publisher_type = N'MSSQLSERVER';
GO

PRINT 'Setup Distributor hoàn tất!';
GO
```

**Chạy:**
```bash
cd /home/tien/CSDLPT
sqlcmd -S localhost -U sa -P 'Tt12345@' -C -i 01_Setup_Distributor.sql
```

---

### 1.3. Tạo Publication

**File: `02_Create_Publication.sql`**

```sql
USE QuanLyNhanSu;
GO

-- Kiểm tra database đã enable replication chưa
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'QuanLyNhanSu' AND is_published = 1)
BEGIN
    EXEC sp_replicationdboption 
        @dbname = N'QuanLyNhanSu',
        @optname = N'publish',
        @value = N'true';
    
    PRINT 'Đã enable replication cho database QuanLyNhanSu';
END
GO

-- Tạo Publication
EXEC sp_addpublication 
    @publication = N'Pub_ChinhSach',
    @description = N'Nhân bản bảng ChinhSach đến các chi nhánh',
    @sync_method = N'concurrent',  -- Không lock bảng khi snapshot
    @retention = 0,
    @allow_push = N'true',  -- Cho phép push subscription
    @allow_pull = N'false',
    @allow_anonymous = N'false',
    @enabled_for_internet = N'false',
    @snapshot_in_defaultfolder = N'true',
    @compress_snapshot = N'false',
    @ftp_port = 21,
    @ftp_login = N'anonymous',
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
GO

-- Thêm bảng ChinhSach vào Publication
EXEC sp_addarticle 
    @publication = N'Pub_ChinhSach',
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
GO

PRINT 'Đã tạo Publication và thêm bảng ChinhSach!';
GO
```

**Chạy:**
```bash
sqlcmd -S localhost -U sa -P 'Tt12345@' -C -i 02_Create_Publication.sql
```

---

### 1.4. Tạo Snapshot Agent

**File: `03_Create_Snapshot.sql`**

```sql
USE QuanLyNhanSu;
GO

-- Tạo Snapshot Agent job
EXEC sp_addpublication_snapshot 
    @publication = N'Pub_ChinhSach',
    @frequency_type = 1,  -- One time
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
GO

-- Chạy Snapshot Agent ngay lập tức
EXEC sp_startpublication_snapshot 
    @publication = N'Pub_ChinhSach';
GO

PRINT 'Đã tạo và chạy Snapshot Agent!';
PRINT 'Đợi 30 giây để snapshot hoàn tất...';
GO

-- Kiểm tra Snapshot
WAITFOR DELAY '00:00:30';
GO

SELECT 
    name AS PublicationName,
    snapshot_jobid,
    snapshot_ready
FROM syspublications
WHERE name = 'Pub_ChinhSach';
GO
```

**Chạy:**
```bash
sqlcmd -S localhost -U sa -P 'Tt12345@' -C -i 03_Create_Snapshot.sql
```

---

## 🔧 PHẦN 2: CẤU HÌNH SUBSCRIBERS (5 Máy Windows)

### 2.1. Chuẩn bị Database trên Subscribers

**GỬI FILE NÀY CHO 5 BẠN:** `Subscriber_Setup.sql`

```sql
-- Chạy trên SQL Server 2019 (Windows)
USE master;
GO

-- Tạo database QuanLyNhanSu (nếu chưa có)
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'QuanLyNhanSu')
BEGIN
    CREATE DATABASE QuanLyNhanSu;
    PRINT 'Đã tạo database QuanLyNhanSu';
END
ELSE
BEGIN
    PRINT 'Database QuanLyNhanSu đã tồn tại';
END
GO

-- Tạo schema và bảng ChinhSach (để sẵn sàng nhận replication)
USE QuanLyNhanSu;
GO

-- Nếu chưa có bảng ChiNhanh, tạo trước (ChinhSach có FK đến ChiNhanh)
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ChiNhanh')
BEGIN
    CREATE TABLE ChiNhanh (
        ID_ChiNhanh VARCHAR(255) PRIMARY KEY,
        TenChiNhanh VARCHAR(255) NOT NULL,
        DiaChi VARCHAR(255),
        SoDienThoai VARCHAR(255),
        Email VARCHAR(255)
    );
    PRINT 'Đã tạo bảng ChiNhanh';
END
GO

-- Tạo bảng ChinhSach
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ChinhSach')
BEGIN
    CREATE TABLE ChinhSach (
        ID_ChinhSach VARCHAR(255) PRIMARY KEY,
        ID_ChiNhanh VARCHAR(255),
        TenChinhSach VARCHAR(255) NOT NULL,
        NoiDung VARCHAR(255),
        NgayApDung DATE,
        FOREIGN KEY (ID_ChiNhanh) REFERENCES ChiNhanh(ID_ChiNhanh)
    );
    PRINT 'Đã tạo bảng ChinhSach';
END
GO

-- Kiểm tra
SELECT 'Database sẵn sàng cho Replication!' AS Status;
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME IN ('ChiNhanh', 'ChinhSach');
GO
```

**Hướng dẫn 5 bạn:**
1. Mở SSMS
2. Connect to local SQL Server
3. File → Open → `Subscriber_Setup.sql`
4. Execute (F5)
5. Chụp screenshot kết quả, gửi vào group

---

### 2.2. Tạo Subscriptions từ Publisher (Máy Tiến)

**LƯU Ý:** Bước này chỉ Tiến làm trên máy Ubuntu.

**File: `04_Create_Subscriptions.sql`**

```sql
USE QuanLyNhanSu;
GO

-- ============================================
-- SUBSCRIBER 1: CN01 Huế (IP: 100.64.0.2)
-- ============================================
EXEC sp_addsubscription 
    @publication = N'Pub_ChinhSach',
    @subscriber = N'100.64.0.2',  -- Thay bằng IP VPN thực tế
    @destination_db = N'QuanLyNhanSu',
    @subscription_type = N'Push',
    @sync_type = N'automatic',
    @article = N'all',
    @update_mode = N'read only',
    @subscriber_type = 0;
GO

EXEC sp_addpushsubscription_agent 
    @publication = N'Pub_ChinhSach',
    @subscriber = N'100.64.0.2',
    @subscriber_db = N'QuanLyNhanSu',
    @job_login = NULL,
    @job_password = NULL,
    @subscriber_security_mode = 0,  -- SQL Authentication
    @subscriber_login = N'sa',
    @subscriber_password = N'Tt12345@',
    @frequency_type = 64,  -- Continuous
    @frequency_interval = 1,
    @frequency_relative_interval = 1,
    @frequency_recurrence_factor = 0,
    @frequency_subday = 4,  -- Minute
    @frequency_subday_interval = 5,  -- Every 5 minutes
    @active_start_time_of_day = 0,
    @active_end_time_of_day = 235959,
    @active_start_date = 0,
    @active_end_date = 0,
    @dts_package_location = N'Distributor';
GO

PRINT 'Đã tạo Subscription cho CN01 Huế!';
GO

-- ============================================
-- SUBSCRIBER 2: CN02 Nam Định (IP: 100.64.0.3)
-- ============================================
EXEC sp_addsubscription 
    @publication = N'Pub_ChinhSach',
    @subscriber = N'100.64.0.3',
    @destination_db = N'QuanLyNhanSu',
    @subscription_type = N'Push',
    @sync_type = N'automatic',
    @article = N'all',
    @update_mode = N'read only',
    @subscriber_type = 0;
GO

EXEC sp_addpushsubscription_agent 
    @publication = N'Pub_ChinhSach',
    @subscriber = N'100.64.0.3',
    @subscriber_db = N'QuanLyNhanSu',
    @job_login = NULL,
    @job_password = NULL,
    @subscriber_security_mode = 0,
    @subscriber_login = N'sa',
    @subscriber_password = N'Tt12345@',
    @frequency_type = 64,
    @frequency_interval = 1,
    @frequency_relative_interval = 1,
    @frequency_recurrence_factor = 0,
    @frequency_subday = 4,
    @frequency_subday_interval = 5,
    @active_start_time_of_day = 0,
    @active_end_time_of_day = 235959,
    @active_start_date = 0,
    @active_end_date = 0,
    @dts_package_location = N'Distributor';
GO

PRINT 'Đã tạo Subscription cho CN02 Nam Định!';
GO

-- ============================================
-- SUBSCRIBER 3: CN03 Vinh (IP: 100.64.0.4)
-- ============================================
EXEC sp_addsubscription 
    @publication = N'Pub_ChinhSach',
    @subscriber = N'100.64.0.4',
    @destination_db = N'QuanLyNhanSu',
    @subscription_type = N'Push',
    @sync_type = N'automatic',
    @article = N'all',
    @update_mode = N'read only',
    @subscriber_type = 0;
GO

EXEC sp_addpushsubscription_agent 
    @publication = N'Pub_ChinhSach',
    @subscriber = N'100.64.0.4',
    @subscriber_db = N'QuanLyNhanSu',
    @job_login = NULL,
    @job_password = NULL,
    @subscriber_security_mode = 0,
    @subscriber_login = N'sa',
    @subscriber_password = N'Tt12345@',
    @frequency_type = 64,
    @frequency_interval = 1,
    @frequency_relative_interval = 1,
    @frequency_recurrence_factor = 0,
    @frequency_subday = 4,
    @frequency_subday_interval = 5,
    @active_start_time_of_day = 0,
    @active_end_time_of_day = 235959,
    @active_start_date = 0,
    @active_end_date = 0,
    @dts_package_location = N'Distributor';
GO

PRINT 'Đã tạo Subscription cho CN03 Vinh!';
GO

-- ============================================
-- SUBSCRIBER 4: CN04 Nha Trang (IP: 100.64.0.5)
-- ============================================
EXEC sp_addsubscription 
    @publication = N'Pub_ChinhSach',
    @subscriber = N'100.64.0.5',
    @destination_db = N'QuanLyNhanSu',
    @subscription_type = N'Push',
    @sync_type = N'automatic',
    @article = N'all',
    @update_mode = N'read only',
    @subscriber_type = 0;
GO

EXEC sp_addpushsubscription_agent 
    @publication = N'Pub_ChinhSach',
    @subscriber = N'100.64.0.5',
    @subscriber_db = N'QuanLyNhanSu',
    @job_login = NULL,
    @job_password = NULL,
    @subscriber_security_mode = 0,
    @subscriber_login = N'sa',
    @subscriber_password = N'Tt12345@',
    @frequency_type = 64,
    @frequency_interval = 1,
    @frequency_relative_interval = 1,
    @frequency_recurrence_factor = 0,
    @frequency_subday = 4,
    @frequency_subday_interval = 5,
    @active_start_time_of_day = 0,
    @active_end_time_of_day = 235959,
    @active_start_date = 0,
    @active_end_date = 0,
    @dts_package_location = N'Distributor';
GO

PRINT 'Đã tạo Subscription cho CN04 Nha Trang!';
GO

-- ============================================
-- SUBSCRIBER 5: CN05 Thái Bình (IP: 100.64.0.6)
-- ============================================
EXEC sp_addsubscription 
    @publication = N'Pub_ChinhSach',
    @subscriber = N'100.64.0.6',
    @destination_db = N'QuanLyNhanSu',
    @subscription_type = N'Push',
    @sync_type = N'automatic',
    @article = N'all',
    @update_mode = N'read only',
    @subscriber_type = 0;
GO

EXEC sp_addpushsubscription_agent 
    @publication = N'Pub_ChinhSach',
    @subscriber = N'100.64.0.6',
    @subscriber_db = N'QuanLyNhanSu',
    @job_login = NULL,
    @job_password = NULL,
    @subscriber_security_mode = 0,
    @subscriber_login = N'sa',
    @subscriber_password = N'Tt12345@',
    @frequency_type = 64,
    @frequency_interval = 1,
    @frequency_relative_interval = 1,
    @frequency_recurrence_factor = 0,
    @frequency_subday = 4,
    @frequency_subday_interval = 5,
    @active_start_time_of_day = 0,
    @active_end_time_of_day = 235959,
    @active_start_date = 0,
    @active_end_date = 0,
    @dts_package_location = N'Distributor';
GO

PRINT 'Đã tạo Subscription cho CN05 Thái Bình!';
GO

-- Kiểm tra tất cả Subscriptions
SELECT 
    p.publication AS Publication,
    s.subscriber_db AS SubscriberDB,
    s.subscriber_server AS Subscriber,
    s.status AS Status
FROM dbo.syspublications p
INNER JOIN dbo.syssubscriptions s ON p.pubid = s.pubid
WHERE p.name = 'Pub_ChinhSach';
GO
```

**QUAN TRỌNG:** Trước khi chạy, **SỬA IP VPN** cho đúng với máy của 5 bạn!

**Chạy:**
```bash
# Sửa IP trong file trước
nano 04_Create_Subscriptions.sql
# Thay 100.64.0.2, .0.3, .0.4, .0.5, .0.6 bằng IP thực tế

# Chạy
sqlcmd -S localhost -U sa -P 'Tt12345@' -C -i 04_Create_Subscriptions.sql
```

---

## 🧪 PHẦN 3: KIỂM TRA REPLICATION

### 3.1. Test Snapshot đã tạo chưa

**Trên máy Tiến (Publisher):**

```bash
sqlcmd -S localhost -U sa -P 'Tt12345@' -C -Q "
USE QuanLyNhanSu;
SELECT name, snapshot_ready FROM syspublications WHERE name = 'Pub_ChinhSach';
"
```

**Kết quả mong đợi:**
```
snapshot_ready
--------------
1
```

---

### 3.2. Test dữ liệu đã đồng bộ chưa

**Trên máy Windows (Subscriber), chạy trong SSMS:**

```sql
USE QuanLyNhanSu;
GO

-- Kiểm tra số lượng chính sách
SELECT COUNT(*) AS TongChinhSach FROM ChinhSach;
-- Phải có 70 records (giống Publisher)

-- Kiểm tra 5 chính sách đầu tiên
SELECT TOP 5 * FROM ChinhSach ORDER BY ID_ChinhSach;
GO
```

**Nếu chưa có dữ liệu:**
- Đợi 5-10 phút (agent chạy mỗi 5 phút)
- Hoặc chạy agent thủ công (xem bước 3.3)

---

### 3.3. Chạy Replication Agent thủ công (nếu cần)

**Trên máy Tiến (Publisher):**

```sql
USE distribution;
GO

-- Xem danh sách agents
SELECT 
    job.name AS JobName,
    job.enabled AS Enabled,
    activity.run_requested_date AS LastRun,
    activity.stop_execution_date AS LastStop
FROM msdb.dbo.sysjobs job
LEFT JOIN msdb.dbo.sysjobactivity activity ON job.job_id = activity.job_id
WHERE job.name LIKE '%Pub_ChinhSach%'
ORDER BY activity.run_requested_date DESC;
GO

-- Chạy Snapshot Agent
EXEC sp_startpublication_snapshot @publication = 'Pub_ChinhSach';
GO

-- Đợi 30 giây
WAITFOR DELAY '00:00:30';
GO

-- Chạy Distribution Agents (cho từng subscriber)
-- Tìm job_id của Distribution Agent
DECLARE @job_name NVARCHAR(255);
DECLARE @job_id UNIQUEIDENTIFIER;

-- Tìm tất cả Distribution Agents
DECLARE job_cursor CURSOR FOR
SELECT name, job_id 
FROM msdb.dbo.sysjobs 
WHERE name LIKE '%Pub_ChinhSach%' AND name LIKE '%Distribution%';

OPEN job_cursor;
FETCH NEXT FROM job_cursor INTO @job_name, @job_id;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Chạy job: ' + @job_name;
    EXEC msdb.dbo.sp_start_job @job_id = @job_id;
    
    FETCH NEXT FROM job_cursor INTO @job_name, @job_id;
END

CLOSE job_cursor;
DEALLOCATE job_cursor;
GO
```

---

### 3.4. Test đồng bộ thời gian thực

**Trên máy Tiến (Publisher):**

```sql
USE QuanLyNhanSu;
GO

-- Thêm 1 chính sách mới
INSERT INTO ChinhSach (ID_ChinhSach, ID_ChiNhanh, TenChinhSach, NoiDung, NgayApDung)
VALUES ('CS999', 'CN01', 'Chính sách test replication', 'Kiểm tra đồng bộ', GETDATE());
GO

-- Kiểm tra
SELECT * FROM ChinhSach WHERE ID_ChinhSach = 'CS999';
GO
```

**Trên máy Windows (Subscriber), đợi 5-10 phút rồi chạy:**

```sql
USE QuanLyNhanSu;
GO

SELECT * FROM ChinhSach WHERE ID_ChinhSach = 'CS999';
GO
```

**Nếu thấy record CS999 → Replication thành công! 🎉**

---

## 🔍 TROUBLESHOOTING

### Lỗi 1: "Could not connect to Subscriber"

**Nguyên nhân:** Firewall chặn port 1433 hoặc SQL Server không lắng nghe 0.0.0.0

**Giải pháp:**
```bash
# Trên Subscriber (Windows), test từ Publisher có connect được không
sqlcmd -S 100.64.0.2 -U sa -P 'Tt12345@' -C -Q "SELECT @@VERSION;"

# Nếu lỗi, kiểm tra:
# 1. Firewall (xem HUONG_DAN_VPN.md)
# 2. SQL Server Configuration Manager → TCP/IP Enabled
# 3. Restart SQL Server service
```

---

### Lỗi 2: "Snapshot folder is not accessible"

**Nguyên nhân:** SQL Server Agent không có quyền ghi vào thư mục snapshot

**Giải pháp (Ubuntu):**
```bash
# Tạo thư mục snapshot
sudo mkdir -p /var/opt/mssql/data/ReplData
sudo chown mssql:mssql /var/opt/mssql/data/ReplData
sudo chmod 755 /var/opt/mssql/data/ReplData

# Restart SQL Server
sudo systemctl restart mssql-server
```

---

### Lỗi 3: "Login failed for user 'sa'"

**Nguyên nhân:** Subscriber chưa enable SQL Authentication hoặc sai password

**Giải pháp (Windows):**
```sql
-- Trên Subscriber
ALTER LOGIN sa ENABLE;
ALTER LOGIN sa WITH PASSWORD = 'Tt12345@';
GO
```

---

### Lỗi 4: Agent không chạy

**Kiểm tra Agent:**
```sql
USE msdb;
GO

-- Xem lịch sử chạy agent
SELECT 
    job.name,
    history.run_status,
    history.message,
    history.run_date,
    history.run_time
FROM msdb.dbo.sysjobs job
INNER JOIN msdb.dbo.sysjobhistory history ON job.job_id = history.job_id
WHERE job.name LIKE '%Pub_ChinhSach%'
ORDER BY history.run_date DESC, history.run_time DESC;
GO
```

---

## 📸 CHECKLIST SCREENSHOTS

- [ ] Publisher: Kết quả `SELECT * FROM syspublications`
- [ ] Publisher: Snapshot folder (ls /var/opt/mssql/data/ReplData)
- [ ] Publisher: Danh sách subscriptions
- [ ] Subscriber 1: `SELECT COUNT(*) FROM ChinhSach` (phải có 70)
- [ ] Subscriber 1: `SELECT TOP 5 * FROM ChinhSach`
- [ ] Test đồng bộ: INSERT trên Publisher, sau 5 phút thấy trên Subscriber
- [ ] Replication Monitor (nếu dùng SSMS trên Windows để quản lý Publisher)

---

## 🚀 TỔNG KẾT

### Các file SQL đã tạo:
1. `01_Setup_Distributor.sql` - Cấu hình Distributor
2. `02_Create_Publication.sql` - Tạo Publication
3. `03_Create_Snapshot.sql` - Tạo Snapshot
4. `04_Create_Subscriptions.sql` - Tạo 5 Subscriptions
5. `Subscriber_Setup.sql` - Gửi cho 5 bạn chạy trên Windows

### Thời gian ước tính:
- Setup Distributor/Publisher: 15 phút
- Tạo Subscriptions: 30 phút
- Test và troubleshoot: 30-60 phút
- **Tổng:** 1.5 - 2 giờ

### Bước tiếp theo:
👉 **Test_Replication.sql** - Script test tự động  
👉 **HUONG_DAN_SCREENSHOTS.md** - Chụp ảnh cho báo cáo

---

**Người tạo:** Nguyễn Minh Tiến  
**Cập nhật:** 08/11/2025  
**Trạng thái:** Ready for deployment
