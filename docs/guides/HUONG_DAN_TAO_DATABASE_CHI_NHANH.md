# 📘 HƯỚNG DẪN TẠO DATABASE CHI NHÁNH

> **Dành cho**: 6 bạn quản lý chi nhánh CN01-CN06  
> **Thực hiện trên**: SQL Server 2019 (Windows)  
> **Mục đích**: Tạo database riêng cho mỗi chi nhánh

---

## 📋 DANH SÁCH CHI NHÁNH

| Mã CN | Tên Chi Nhánh | Người phụ trách | Database Name |
|-------|---------------|-----------------|---------------|
| CN01  | Chi nhánh Huế | (Tên bạn 1) | QuanLyNhanSu_CN01 |
| CN02  | Chi nhánh Nam Định | (Tên bạn 2) | QuanLyNhanSu_CN02 |
| CN03  | Chi nhánh Vinh | (Tên bạn 3) | QuanLyNhanSu_CN03 |
| CN04  | Chi nhánh Nha Trang | (Tên bạn 4) | QuanLyNhanSu_CN04 |
| CN05  | Chi nhánh Thái Bình | (Tên bạn 5) | QuanLyNhanSu_CN05 |
| CN06  | Chi nhánh Hải Phòng | (Tên bạn 6) | QuanLyNhanSu_CN06 |

---

## 🚀 BƯỚC 1: TẢI FILE TEMPLATE

1. Vào GitHub: https://github.com/BeBest111/CSDLPT_PTIT
2. Vào thư mục `database/schemas/`
3. Download file: **ChiNhanh_Schema_Template.sql**
4. Lưu vào Desktop

---

## ✏️ BƯỚC 2: TÙY CHỈNH FILE SQL

Mở file **ChiNhanh_Schema_Template.sql** bằng Notepad++:

### 2.1. Thay đổi Database Name
Tìm dòng:
```sql
CREATE DATABASE QuanLyNhanSu_ChiNhanh;
```

**Thay thành** (tùy theo chi nhánh của bạn):
- CN01: `CREATE DATABASE QuanLyNhanSu_CN01;`
- CN02: `CREATE DATABASE QuanLyNhanSu_CN02;`
- CN03: `CREATE DATABASE QuanLyNhanSu_CN03;`
- CN04: `CREATE DATABASE QuanLyNhanSu_CN04;`
- CN05: `CREATE DATABASE QuanLyNhanSu_CN05;`
- CN06: `CREATE DATABASE QuanLyNhanSu_CN06;`

### 2.2. Thay đổi USE statement
Tìm TẤT CẢ dòng:
```sql
USE QuanLyNhanSu_ChiNhanh;
```

**Thay thành**:
```sql
USE QuanLyNhanSu_CN01;  -- (hoặc CN02, CN03, CN04, CN05, CN06)
```

### 2.3. Cập nhật thông tin chi nhánh
Tìm đoạn INSERT vào bảng ChiNhanh_Info:

```sql
INSERT INTO ChiNhanh_Info (MaChiNhanh, TenChiNhanh, DiaChi, SoDienThoai, Email)
VALUES (
    'CN01',  -- <-- Thay MÃ CHI NHÁNH
    'Chi nhánh Huế',  -- <-- Thay TÊN CHI NHÁNH
    'Thành phố Huế, Thừa Thiên Huế',  -- <-- Thay ĐỊA CHỈ
    '0234567890',  -- <-- Thay SỐ ĐIỆN THOẠI
    'hue@company.vn'  -- <-- Thay EMAIL
);
```

**Thay thành** (theo chi nhánh):

#### CN01 - Huế:
```sql
VALUES (
    'CN01',
    'Chi nhánh Huế',
    'Thành phố Huế, Thừa Thiên Huế',
    '0234567890',
    'hue@company.vn'
);
```

#### CN02 - Nam Định:
```sql
VALUES (
    'CN02',
    'Chi nhánh Nam Định',
    'Thành phố Nam Định, Nam Định',
    '0228567890',
    'namdinh@company.vn'
);
```

#### CN03 - Vinh:
```sql
VALUES (
    'CN03',
    'Chi nhánh Vinh',
    'Thành phố Vinh, Nghệ An',
    '0238567890',
    'vinh@company.vn'
);
```

#### CN04 - Nha Trang:
```sql
VALUES (
    'CN04',
    'Chi nhánh Nha Trang',
    'Thành phố Nha Trang, Khánh Hòa',
    '0258567890',
    'nhatrang@company.vn'
);
```

#### CN05 - Thái Bình:
```sql
VALUES (
    'CN05',
    'Chi nhánh Thái Bình',
    'Thành phố Thái Bình, Thái Bình',
    '0227567890',
    'thaibinh@company.vn'
);
```

#### CN06 - Hải Phòng:
```sql
VALUES (
    'CN06',
    'Chi nhánh Hải Phòng',
    'Thành phố Hải Phòng, Hải Phòng',
    '0225567890',
    'haiphong@company.vn'
);
```

### 2.4. Lưu file
Lưu với tên: `ChiNhanh_CN01_Setup.sql` (hoặc CN02, CN03, ...)

---

## 🎯 BƯỚC 3: CHẠY SQL SCRIPT TRONG SSMS

1. Mở **SQL Server Management Studio (SSMS)**
2. Connect to: **localhost** (SQL Server 2019 trên máy Windows)
3. Đăng nhập: sa / Tt12345@
4. File → Open → File → Chọn file vừa tùy chỉnh
5. **Đọc kỹ** script trước khi chạy
6. Nhấn **F5** hoặc **Execute**

---

## ✅ BƯỚC 4: KIỂM TRA KẾT QUẢ

Sau khi chạy xong, kiểm tra:

```sql
-- Kiểm tra database đã tạo
SELECT name FROM sys.databases WHERE name LIKE 'QuanLyNhanSu_CN%';

-- Kiểm tra thông tin chi nhánh
USE QuanLyNhanSu_CN01;  -- Thay CN01 thành chi nhánh của bạn
SELECT * FROM ChiNhanh_Info;

-- Kiểm tra các bảng đã tạo
SELECT TABLE_NAME 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;
```

**Kết quả mong đợi**:
- ✅ Database: QuanLyNhanSu_CN0X (X = 1-6)
- ✅ 7 bảng: ChiNhanh_Info, ChinhSach, ChucVu, PhongBan, DuAn, NhanVien, Luong, SyncLog
- ✅ ChiNhanh_Info có 1 record (thông tin chi nhánh của bạn)
- ✅ ChinhSach và ChucVu **rỗng** (chưa có dữ liệu - sẽ nhận từ Replication)

---

## 📸 BƯỚC 5: CHỤP SCREENSHOT

Chụp các màn hình sau:

1. **Object Explorer** trong SSMS:
   - Mở rộng `Databases` → `QuanLyNhanSu_CN0X` → `Tables`
   - Phải thấy 7 bảng

2. **Kết quả query**:
```sql
USE QuanLyNhanSu_CN01;  -- Thay CN01
SELECT * FROM ChiNhanh_Info;
SELECT COUNT(*) AS TongSoBang FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE';
```

3. **Replication Folder** (sẽ setup sau):
   - Object Explorer → Replication → Local Subscriptions (chưa có gì - OK)

Gửi 3 screenshot vào group chat!

---

## 🔄 BƯỚC 6: ĐĂNG KÝ REPLICATION (CHỜ TIẾN)

**QUAN TRỌNG**: Chỉ làm bước này sau khi Tiến đã:
- ✅ Setup Distributor trên Ubuntu
- ✅ Tạo Publication
- ✅ Tạo Snapshot
- ✅ Gửi lệnh subscription cho bạn

**File cần chạy**: `Subscriber_Setup_CN01.sql` (Tiến sẽ tạo riêng cho mỗi chi nhánh)

---

## ⚠️ LƯU Ý QUAN TRỌNG

### ❌ KHÔNG làm:
- ❌ Không INSERT dữ liệu vào bảng **ChinhSach** (READ-ONLY, nhận từ HQ)
- ❌ Không INSERT dữ liệu vào bảng **ChucVu** (READ-ONLY, nhận từ HQ)
- ❌ Không DELETE/UPDATE dữ liệu đã nhận từ Replication

### ✅ CÓ THỂ làm:
- ✅ INSERT/UPDATE/DELETE dữ liệu vào bảng **PhongBan** (10 phòng ban của chi nhánh)
- ✅ INSERT/UPDATE/DELETE dữ liệu vào bảng **DuAn** (10 dự án của chi nhánh)
- ✅ INSERT/UPDATE/DELETE dữ liệu vào bảng **NhanVien** (40 nhân viên của chi nhánh)
- ✅ INSERT/UPDATE/DELETE dữ liệu vào bảng **Luong** (40 bản ghi lương)

---

## 🆘 TROUBLESHOOTING

### Lỗi: Database already exists
```
Msg 1801: Database 'QuanLyNhanSu_CN01' already exists.
```

**Giải pháp**:
```sql
-- Xóa database cũ
USE master;
DROP DATABASE QuanLyNhanSu_CN01;  -- Thay CN01
GO

-- Chạy lại script tạo database
```

### Lỗi: Permission denied
```
Msg 262: CREATE DATABASE permission denied
```

**Giải pháp**:
- Đăng nhập lại SSMS với tài khoản **sa**
- Hoặc user có quyền **sysadmin**

### Lỗi: Cannot find file
```
Could not open file ... for file number 0
```

**Giải pháp**:
- Kiểm tra đường dẫn trong script:
```sql
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\...'
```
- Đảm bảo folder tồn tại
- Hoặc để SQL Server tự chọn vị trí:
```sql
CREATE DATABASE QuanLyNhanSu_CN01;  -- Không chỉ định FILENAME
```

---

## 📞 HỖ TRỢ

Nếu gặp lỗi:
1. Chụp screenshot thông báo lỗi
2. Gửi vào group chat
3. Tag: @Tiến

**Hotline**: Zalo nhóm

---

## 🎓 KẾT QUẢ MONG ĐỢI

Sau khi hoàn thành:
- ✅ Mỗi chi nhánh có database riêng với 40 nhân viên
- ✅ Tất cả nhận cùng ChinhSach và ChucVu từ Trụ sở chính
- ✅ Mỗi chi nhánh độc lập quản lý nhân viên, lương, dự án
- ✅ Replication tự động đồng bộ policies từ HQ → 6 chi nhánh

**Thời gian ước tính**: 15-20 phút/người

---

*Tài liệu này được tạo ngày 08/11/2025*  
*Repo: https://github.com/BeBest111/CSDLPT_PTIT*
