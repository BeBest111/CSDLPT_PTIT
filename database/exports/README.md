# 📦 DATABASE EXPORTS

## 📁 Files Trong Thư Mục Này:

### 1. QuanLyNhanSu_Backup.bak (7.6 MB)
**Mục đích:** Full backup của database QuanLyNhanSu  
**Bao gồm:**
- 7 chi nhánh
- 280 nhân viên
- 70 phòng ban
- 70 dự án
- Tất cả triggers, stored procedures, views

**Dùng cho:** Restore nhanh trên Windows

---

### 2. RESTORE_DATABASE.sql
**Mục đích:** Script tự động restore database  
**Cách dùng:**

#### Bước 1: Download Files
```
1. Download QuanLyNhanSu_Backup.bak
2. Download RESTORE_DATABASE.sql
```

#### Bước 2: Chuẩn Bị
```
1. Tạo thư mục C:\Temp\ trên Windows
2. Copy file QuanLyNhanSu_Backup.bak vào C:\Temp\
```

#### Bước 3: Restore
```
1. Mở SSMS
2. Server: localhost
3. Auth: Windows Authentication hoặc sa/Tt12345@
4. File → Open → RESTORE_DATABASE.sql
5. Execute (F5)
```

#### Bước 4: Verify
```sql
USE QuanLyNhanSu;
SELECT COUNT(*) FROM ChiNhanh;  -- Phải = 7
SELECT COUNT(*) FROM NhanVien;  -- Phải = 280
```

---

## 🔄 CÁCH KHÁC: Dùng Replication (Khuyến Nghị)

**Thay vì restore thủ công, các bạn nên dùng Replication:**

Xem hướng dẫn:
- `docs/guides/SUBSCRIBER_SETUP_NOW.md`

**Ưu điểm:**
- ✅ Tự động sync data
- ✅ Realtime updates
- ✅ Đúng yêu cầu đề bài
- ✅ Ít bước hơn

**Chỉ dùng file .bak khi:**
- ❌ Replication lỗi
- ❌ Cần test offline
- ❌ Demo nhanh

---

## 📊 Thông Tin Database:

| Bảng | Số dòng | Mô tả |
|------|---------|-------|
| ChiNhanh | 7 | 7 chi nhánh (HN + 6 tỉnh) |
| NhanVien | 280 | 40 nhân viên × 7 chi nhánh |
| PhongBan | 70 | 10 phòng ban × 7 chi nhánh |
| DuAn | 70 | 10 dự án × 7 chi nhánh |
| ChinhSach | ~20 | Chính sách chung |

---

## 🆘 Troubleshooting:

### Lỗi: "Cannot open backup device"
**Fix:**
```sql
-- Sửa đường dẫn trong RESTORE_DATABASE.sql
FROM DISK = 'D:\QuanLyNhanSu_Backup.bak'  -- Đổi đường dẫn
```

### Lỗi: "Database already exists"
**Fix:**
```sql
-- Script đã có sẵn DROP DATABASE
-- Hoặc xóa thủ công:
DROP DATABASE QuanLyNhanSu;
```

### Lỗi: "Directory lookup failed"
**Fix:**
```sql
-- Kiểm tra đường dẫn SQL Server Data folder
-- Thường là:
-- SQL 2019: MSSQL15.MSSQLSERVER
-- SQL 2022: MSSQL16.MSSQLSERVER
```

---

**Cập nhật:** 08/11/2025 14:59  
**Kích thước:** 7.6 MB  
**Backup type:** FULL
