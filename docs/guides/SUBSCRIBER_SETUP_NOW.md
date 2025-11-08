# 🎯 SETUP SUBSCRIBER - LÀM NGAY!

**TIN VUI:** Mình (Tiến) đã setup xong Publisher!  
**BƯỚC CUỐI - CÁC BẠN SETUP SUBSCRIBER!**

---

## ✅ PUBLISHER ĐÃ XONG:

- ✅ Distributor configured  
- ✅ Publication 'Pub_ChinhSach' created
- ✅ Snapshot generated
- ✅ **SẴN SÀNG REPLICATE!**

---

## 📋 CÁC BẠN LÀM (15 PHÚT):

### BƯỚC 1: Copy Script Này

```sql
/*
 * SUBSCRIBER SETUP SCRIPT
 * Chạy trên máy Windows của các bạn
 */

USE master;
GO

-- Tạo database nếu chưa có
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'QuanLyNhanSu')
BEGIN
    CREATE DATABASE QuanLyNhanSu;
    PRINT '✅ Đã tạo database QuanLyNhanSu';
END
GO

USE QuanLyNhanSu;
GO

PRINT '==============================================';
PRINT 'SETUP PULL SUBSCRIPTION';
PRINT '==============================================';
GO

-- Add subscription
EXEC sp_addpullsubscription 
    @publisher = N'100.71.73.74',
    @publisher_db = N'QuanLyNhanSu',
    @publication = N'Pub_ChinhSach',
    @independent_agent = N'True',
    @subscription_type = N'pull',
    @description = N'',
    @update_mode = N'read only',
    @immediate_sync = 1;
GO

-- Add pull subscription agent
EXEC sp_addpullsubscription_agent 
    @publisher = N'100.71.73.74',
    @publisher_db = N'QuanLyNhanSu',
    @publication = N'Pub_ChinhSach',
    @distributor = N'100.71.73.74',
    @distributor_security_mode = 0,
    @distributor_login = N'sa',
    @distributor_password = N'Tt12345@',
    @enabled_for_syncmgr = N'False',
    @frequency_type = 64,
    @frequency_interval = 0,
    @frequency_relative_interval = 0,
    @frequency_recurrence_factor = 0,
    @frequency_subday = 0,
    @frequency_subday_interval = 0,
    @active_start_time_of_day = 0,
    @active_end_time_of_day = 235959,
    @active_start_date = 20000101,
    @active_end_date = 99991231,
    @job_login = NULL,
    @job_password = NULL,
    @publisher_security_mode = 0,
    @publisher_login = N'sa',
    @publisher_password = N'Tt12345@';
GO

-- Start sync
EXEC sp_MSstartdistribution_agent
    @publisher = N'100.71.73.74',
    @publisher_db = N'QuanLyNhanSu',
    @publication = N'Pub_ChinhSach';
GO

PRINT '✅ HOÀN TẤT SETUP SUBSCRIBER!';
PRINT 'Đợi 30 giây rồi kiểm tra data...';
GO
```

---

### BƯỚC 2: Chạy Script

**Mở SSMS:**
1. Server: `localhost`
2. Auth: SQL Server Authentication
3. Login: `sa` / `Tt12345@`

**Copy script trên → Execute (F5)**

---

### BƯỚC 3: Verify Data

**Sau 30 giây, chạy:**
```sql
USE QuanLyNhanSu;
SELECT COUNT(*) FROM ChinhSach;
GO
```

**Phải thấy data > 0!** ✅

---

### BƯỚC 4: Test Replication

**Mình (Tiến) sẽ INSERT test:**
```sql
INSERT INTO ChinhSach VALUES ('CS999', N'Test', GETDATE(), GETDATE(), N'Test');
```

**Các bạn check sau 20 giây:**
```sql
SELECT * FROM ChinhSach WHERE MaCS = 'CS999';
```

**Thấy dòng CS999 = THÀNH CÔNG!** 🎉

---

## 📸 GỬI SCREENSHOTS:

1. Execute Subscriber script (kết quả thành công)
2. `SELECT COUNT(*) FROM ChinhSach` (có data)
3. Test replication (thấy CS999)

---

## DEADLINE: 16:00 CHIỀU NAY!

Gửi: "✅ [Tên] - Replication Done!"

---

**CHÚNG TA SẮP XONG RỒI! 💪**
