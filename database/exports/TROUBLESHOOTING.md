# 🆘 TROUBLESHOOTING - FIX LỖI RESTORE

## ❌ CÁC LỖI THƯỜNG GẶP:

### Lỗi 1: "Cannot open backup device"
```
Msg 3201: Cannot open backup device 'C:\Temp\QuanLyNhanSu_Backup.bak'
Operating system error 2 (The system cannot find the file specified.)
```

**NGUYÊN NHÂN:** File .bak không tồn tại hoặc đường dẫn sai

**FIX:**
1. Kiểm tra file đã download chưa
2. Check đường dẫn chính xác:
   ```cmd
   dir C:\Backup\QuanLyNhanSu_Backup.bak
   ```
3. Sửa đường dẫn trong script:
   ```sql
   FROM DISK = 'D:\Downloads\QuanLyNhanSu_Backup.bak'  -- Đổi đường dẫn
   ```

---

### Lỗi 2: "Directory lookup for the file failed"
```
Msg 3634: Directory lookup for the file 
"C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\..."
failed
```

**NGUYÊN NHÂN:** Đường dẫn DATA folder sai (MSSQL15 vs MSSQL16)

**FIX - Tìm đường dẫn đúng:**
```sql
-- Chạy query này để tìm đường dẫn:
SELECT 
    SUBSTRING(physical_name, 1, 
    CHARINDEX(N'master.mdf', LOWER(physical_name)) - 1) AS DataPath
FROM master.sys.master_files
WHERE database_id = 1 AND file_id = 1;
```

**Kết quả ví dụ:**
- SQL 2019: `C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\`
- SQL 2022: `C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\`

**Sửa trong script:**
```sql
MOVE 'QuanLyNhanSu' TO 'C:\...\MSSQL16...\QuanLyNhanSu.mdf',  -- Đổi MSSQL16
```

---

### Lỗi 3: "Database is in use"
```
Msg 3101: Exclusive access could not be obtained because 
the database is in use.
```

**FIX:**
```sql
-- Đóng tất cả kết nối:
USE master;
GO

ALTER DATABASE QuanLyNhanSu 
SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO

DROP DATABASE QuanLyNhanSu;
GO

-- Rồi chạy lại RESTORE
```

---

### Lỗi 4: "Media family incorrectly formed"
```
Msg 3241: The media family on device '...' is incorrectly formed.
```

**NGUYÊN NHÂN:** File .bak bị corrupt khi download

**FIX:**
1. Download lại file .bak
2. Check file size: phải = 7.6 MB (7,952,896 bytes)
3. Dùng checksum verify:
   ```cmd
   certutil -hashfile QuanLyNhanSu_Backup.bak MD5
   ```

---

## ✅ SCRIPT RESTORE ĐƠN GIẢN HÓA:

**Copy script này (tự động tìm đường dẫn):**

```sql
USE master;
GO

-- Xóa database cũ
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'QuanLyNhanSu')
BEGIN
    ALTER DATABASE QuanLyNhanSu SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE QuanLyNhanSu;
END
GO

-- Lấy đường dẫn tự động
DECLARE @sql NVARCHAR(MAX);
DECLARE @DataPath NVARCHAR(500);

SELECT @DataPath = SUBSTRING(physical_name, 1, 
    CHARINDEX(N'master.mdf', LOWER(physical_name)) - 1)
FROM master.sys.master_files
WHERE database_id = 1 AND file_id = 1;

SET @sql = N'
RESTORE DATABASE QuanLyNhanSu
FROM DISK = ''C:\Backup\QuanLyNhanSu_Backup.bak''
WITH 
    MOVE ''QuanLyNhanSu'' TO ''' + @DataPath + 'QuanLyNhanSu.mdf'',
    MOVE ''QuanLyNhanSu_log'' TO ''' + @DataPath + 'QuanLyNhanSu_log.ldf'',
    REPLACE, STATS = 10;
';

PRINT 'Executing: ' + @sql;
EXEC sp_executesql @sql;
GO

-- Verify
USE QuanLyNhanSu;
SELECT COUNT(*) AS ChiNhanh FROM ChiNhanh;
SELECT COUNT(*) AS NhanVien FROM NhanVien;
GO

PRINT '✅ RESTORE THÀNH CÔNG!';
```

---

## 🎯 CÁCH RESTORE ĐƠN GIẢN NHẤT (GUI):

**Nếu script lỗi, dùng SSMS GUI:**

1. Mở SSMS
2. Right-click **"Databases"** → **Restore Database...**
3. Chọn **"Device"**
4. Click **"..."** → **Add**
5. Browse tới `C:\Backup\QuanLyNhanSu_Backup.bak`
6. Click **OK**
7. Check **"Overwrite existing database"**
8. Click **OK**

**Done!** ✅

---

## 📞 HỖ TRỢ:

**Nếu vẫn lỗi, gửi vào group:**
1. Screenshot lỗi đầy đủ
2. SQL Server version (chạy `SELECT @@VERSION`)
3. Đường dẫn file .bak
4. Kết quả query tìm DataPath

Mình (Tiến) sẽ giúp fix!

---

**Cập nhật:** 08/11/2025 15:10
