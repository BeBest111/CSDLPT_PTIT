# HƯỚNG DẪN LÀM TIẾP - PHẦN CÓ THỂ LÀM MỘT MÌNH

## 🎯 MỤC ĐÍCH
File này hướng dẫn các công việc bạn (Nguyễn Minh Tiến) có thể làm một mình trên máy Ubuntu, **KHÔNG cần** 5 bạn trong nhóm online.

---

## ✅ PHẦN 1: HOÀN THIỆN DATABASE (30 phút)

### 1.1. Tạo Views để truy vấn dễ hơn

**File: `Views.sql`**

```sql
USE QuanLyNhanSu;
GO

-- View 1: Thông tin nhân viên đầy đủ (JOIN tất cả bảng)
CREATE VIEW v_NhanVienDayDu AS
SELECT 
    nv.ID_NhanVien,
    nv.HoTen,
    nv.NgaySinh,
    DATEDIFF(YEAR, nv.NgaySinh, GETDATE()) AS Tuoi,
    nv.GioiTinh,
    nv.Email,
    nv.SoDienThoai,
    cv.TenChucVu,
    pb.TenPhongBan,
    cn.TenChiNhanh,
    da.TenDuAn,
    l.MucLuong
FROM NhanVien nv
LEFT JOIN ChucVu cv ON nv.ID_ChucVu = cv.ID_ChucVu
LEFT JOIN PhongBan pb ON nv.ID_PhongBan = pb.ID_PhongBan
LEFT JOIN ChiNhanh cn ON nv.ID_ChiNhanh = cn.ID_ChiNhanh
LEFT JOIN DuAn da ON nv.ID_DuAn = da.ID_DuAn
LEFT JOIN Luong l ON nv.ID_NhanVien = l.ID_NhanVien;
GO

-- View 2: Tổng lương theo chi nhánh
CREATE VIEW v_LuongTheoChiNhanh AS
SELECT 
    cn.ID_ChiNhanh,
    cn.TenChiNhanh,
    COUNT(nv.ID_NhanVien) AS SoNhanVien,
    SUM(CAST(l.MucLuong AS BIGINT)) AS TongLuong,
    AVG(l.MucLuong) AS LuongTrungBinh
FROM ChiNhanh cn
LEFT JOIN NhanVien nv ON cn.ID_ChiNhanh = nv.ID_ChiNhanh
LEFT JOIN Luong l ON nv.ID_NhanVien = l.ID_NhanVien
GROUP BY cn.ID_ChiNhanh, cn.TenChiNhanh;
GO

-- View 3: Nhân viên lương cao (>= 50 triệu)
CREATE VIEW v_NhanVienLuongCao AS
SELECT 
    nv.ID_NhanVien,
    nv.HoTen,
    cv.TenChucVu,
    pb.TenPhongBan,
    l.MucLuong
FROM NhanVien nv
INNER JOIN Luong l ON nv.ID_NhanVien = l.ID_NhanVien
INNER JOIN ChucVu cv ON nv.ID_ChucVu = cv.ID_ChucVu
INNER JOIN PhongBan pb ON nv.ID_PhongBan = pb.ID_PhongBan
WHERE l.MucLuong >= 50000000;
GO

PRINT 'Đã tạo 3 views thành công!';
```

**Chạy:**
```bash
sqlcmd -S localhost -U sa -P 'Tt12345@' -C -i Views.sql
```

---

### 1.2. Tạo Indexes để tăng tốc truy vấn

**File: `Indexes.sql`**

```sql
USE QuanLyNhanSu;
GO

-- Index 1: Tìm kiếm nhân viên theo họ tên
CREATE INDEX idx_NhanVien_HoTen ON NhanVien(HoTen);

-- Index 2: Tìm kiếm theo CCCD
CREATE INDEX idx_NhanVien_CCCD ON NhanVien(CCCD);

-- Index 3: Tìm kiếm theo Email
CREATE INDEX idx_NhanVien_Email ON NhanVien(Email);

-- Index 4: Lọc nhân viên theo chi nhánh
CREATE INDEX idx_NhanVien_ChiNhanh ON NhanVien(ID_ChiNhanh);

-- Index 5: Lọc theo phòng ban
CREATE INDEX idx_NhanVien_PhongBan ON NhanVien(ID_PhongBan);

-- Index 6: Sắp xếp lương
CREATE INDEX idx_Luong_MucLuong ON Luong(MucLuong DESC);

PRINT 'Đã tạo 6 indexes thành công!';
GO

-- Kiểm tra indexes
SELECT 
    t.name AS TableName,
    i.name AS IndexName,
    i.type_desc AS IndexType
FROM sys.indexes i
INNER JOIN sys.tables t ON i.object_id = t.object_id
WHERE t.name IN ('NhanVien', 'Luong')
ORDER BY t.name, i.name;
GO
```

**Chạy:**
```bash
sqlcmd -S localhost -U sa -P 'Tt12345@' -C -i Indexes.sql
```

---

### 1.3. Tạo Users & Phân quyền

**File: `Users.sql`**

```sql
USE QuanLyNhanSu;
GO

-- User 1: Admin (full quyền)
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'Admin_TongGiamDoc')
BEGIN
    CREATE USER Admin_TongGiamDoc WITHOUT LOGIN;
    ALTER ROLE db_owner ADD MEMBER Admin_TongGiamDoc;
    PRINT 'Đã tạo user Admin_TongGiamDoc';
END
GO

-- User 2: Giám đốc chi nhánh (quản lý chi nhánh mình)
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'GiamDoc_ChiNhanh')
BEGIN
    CREATE USER GiamDoc_ChiNhanh WITHOUT LOGIN;
    -- Quyền SELECT/INSERT/UPDATE/DELETE trên các bảng liên quan chi nhánh
    GRANT SELECT, INSERT, UPDATE, DELETE ON NhanVien TO GiamDoc_ChiNhanh;
    GRANT SELECT, INSERT, UPDATE, DELETE ON Luong TO GiamDoc_ChiNhanh;
    GRANT SELECT, INSERT, UPDATE, DELETE ON PhongBan TO GiamDoc_ChiNhanh;
    GRANT SELECT ON ChiNhanh TO GiamDoc_ChiNhanh;
    GRANT SELECT ON ChinhSach TO GiamDoc_ChiNhanh;
    GRANT SELECT ON ChucVu TO GiamDoc_ChiNhanh;
    PRINT 'Đã tạo user GiamDoc_ChiNhanh';
END
GO

-- User 3: Trưởng phòng (chỉ xem nhân viên trong phòng)
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'TruongPhong')
BEGIN
    CREATE USER TruongPhong WITHOUT LOGIN;
    GRANT SELECT ON NhanVien TO TruongPhong;
    GRANT SELECT, INSERT, UPDATE ON Luong TO TruongPhong;
    GRANT SELECT ON PhongBan TO TruongPhong;
    GRANT SELECT ON ChucVu TO TruongPhong;
    PRINT 'Đã tạo user TruongPhong';
END
GO

-- User 4: Nhân viên (chỉ xem thông tin mình)
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'NhanVien_CanBo')
BEGIN
    CREATE USER NhanVien_CanBo WITHOUT LOGIN;
    GRANT SELECT ON v_NhanVienDayDu TO NhanVien_CanBo;
    GRANT SELECT ON ChinhSach TO NhanVien_CanBo;
    PRINT 'Đã tạo user NhanVien_CanBo';
END
GO

-- Hiển thị danh sách users
SELECT 
    dp.name AS UserName,
    dp.type_desc AS UserType,
    dp.create_date AS CreatedDate
FROM sys.database_principals dp
WHERE dp.type IN ('S', 'U') -- SQL user, Windows user
  AND dp.name NOT IN ('dbo', 'guest', 'INFORMATION_SCHEMA', 'sys')
ORDER BY dp.name;
GO
```

**Chạy:**
```bash
sqlcmd -S localhost -U sa -P 'Tt12345@' -C -i Users.sql
```

---

## ✅ PHẦN 2: TẠO THÊM PROCEDURES HỮU ÍCH (20 phút)

**File: `Additional_Procedures.sql`**

```sql
USE QuanLyNhanSu;
GO

-- Procedure 10: Thêm nhân viên mới (với validation đầy đủ)
CREATE PROCEDURE sp_ThemNhanVien
    @ID_NhanVien VARCHAR(255),
    @HoTen VARCHAR(255),
    @NgaySinh DATE,
    @GioiTinh VARCHAR(255),
    @CCCD VARCHAR(255),
    @Email VARCHAR(255),
    @SoDienThoai VARCHAR(255),
    @DiaChi VARCHAR(255),
    @ID_ChiNhanh VARCHAR(255),
    @ID_PhongBan VARCHAR(255),
    @ID_ChucVu VARCHAR(255),
    @ID_DuAn VARCHAR(255),
    @MucLuong INT
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Thêm nhân viên
        INSERT INTO NhanVien (ID_NhanVien, ID_DuAn, ID_ChucVu, ID_ChiNhanh, ID_PhongBan, 
                             HoTen, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi)
        VALUES (@ID_NhanVien, @ID_DuAn, @ID_ChucVu, @ID_ChiNhanh, @ID_PhongBan,
                @HoTen, @NgaySinh, @GioiTinh, 'Kinh', @CCCD, @SoDienThoai, @Email, @DiaChi);
        
        -- Thêm lương
        INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong)
        VALUES ('L' + @ID_NhanVien, @ID_NhanVien, @MucLuong);
        
        COMMIT;
        PRINT 'Đã thêm nhân viên ' + @HoTen + ' thành công!';
    END TRY
    BEGIN CATCH
        ROLLBACK;
        PRINT 'Lỗi: ' + ERROR_MESSAGE();
    END CATCH
END;
GO

-- Procedure 11: Cập nhật lương nhân viên
CREATE PROCEDURE sp_CapNhatLuong
    @ID_NhanVien VARCHAR(255),
    @MucLuongMoi INT
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @MucLuongCu INT;
    SELECT @MucLuongCu = MucLuong FROM Luong WHERE ID_NhanVien = @ID_NhanVien;
    
    IF @MucLuongMoi < @MucLuongCu
    BEGIN
        PRINT 'Lỗi: Không được giảm lương!';
        RETURN;
    END
    
    UPDATE Luong SET MucLuong = @MucLuongMoi WHERE ID_NhanVien = @ID_NhanVien;
    PRINT 'Đã tăng lương từ ' + CAST(@MucLuongCu AS VARCHAR) + ' lên ' + CAST(@MucLuongMoi AS VARCHAR);
END;
GO

-- Procedure 12: Xóa nhân viên (cascade)
CREATE PROCEDURE sp_XoaNhanVien
    @ID_NhanVien VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Xóa lương trước
        DELETE FROM Luong WHERE ID_NhanVien = @ID_NhanVien;
        
        -- Xóa nhân viên
        DELETE FROM NhanVien WHERE ID_NhanVien = @ID_NhanVien;
        
        COMMIT;
        PRINT 'Đã xóa nhân viên ' + @ID_NhanVien + ' thành công!';
    END TRY
    BEGIN CATCH
        ROLLBACK;
        PRINT 'Lỗi: ' + ERROR_MESSAGE();
    END CATCH
END;
GO

-- Procedure 13: Báo cáo nhân viên theo chi nhánh và độ tuổi
CREATE PROCEDURE sp_BaoCaoNhanVienTheoTuoi
    @ID_ChiNhanh VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        CASE 
            WHEN DATEDIFF(YEAR, NgaySinh, GETDATE()) BETWEEN 18 AND 25 THEN '18-25 tuổi'
            WHEN DATEDIFF(YEAR, NgaySinh, GETDATE()) BETWEEN 26 AND 35 THEN '26-35 tuổi'
            WHEN DATEDIFF(YEAR, NgaySinh, GETDATE()) BETWEEN 36 AND 45 THEN '36-45 tuổi'
            ELSE '46+ tuổi'
        END AS NhomTuoi,
        COUNT(*) AS SoLuong,
        AVG(l.MucLuong) AS LuongTrungBinh
    FROM NhanVien nv
    LEFT JOIN Luong l ON nv.ID_NhanVien = l.ID_NhanVien
    WHERE nv.ID_ChiNhanh = @ID_ChiNhanh
    GROUP BY 
        CASE 
            WHEN DATEDIFF(YEAR, NgaySinh, GETDATE()) BETWEEN 18 AND 25 THEN '18-25 tuổi'
            WHEN DATEDIFF(YEAR, NgaySinh, GETDATE()) BETWEEN 26 AND 35 THEN '26-35 tuổi'
            WHEN DATEDIFF(YEAR, NgaySinh, GETDATE()) BETWEEN 36 AND 45 THEN '36-45 tuổi'
            ELSE '46+ tuổi'
        END
    ORDER BY NhomTuoi;
END;
GO

PRINT 'Đã tạo 4 procedures mới thành công!';
GO
```

**Chạy:**
```bash
sqlcmd -S localhost -U sa -P 'Tt12345@' -C -i Additional_Procedures.sql
```

---

## ✅ PHẦN 3: CHỤP SCREENSHOTS CHO BÁO CÁO (45 phút)

### 3.1. Cài công cụ chụp màn hình
```bash
sudo apt install -y flameshot
# Sau khi cài, nhấn PrtScn để chụp
```

### 3.2. Danh sách screenshots cần chụp

**Tạo thư mục:**
```bash
mkdir -p ~/CSDLPT/screenshots
cd ~/CSDLPT/screenshots
```

**Checklist:**

1. **Database Schema (5 ảnh)**
   - [ ] ER Diagram (dùng DBeaver hoặc vẽ tay)
   - [ ] Danh sách 8 bảng với columns
   - [ ] Foreign keys
   - [ ] Indexes
   - [ ] Views

2. **Dữ liệu mẫu (3 ảnh)**
   - [ ] `SELECT * FROM ChiNhanh` - 7 chi nhánh
   - [ ] `SELECT TOP 10 * FROM NhanVien` - Mẫu nhân viên
   - [ ] `EXEC sp_BaoCaoTongQuan` - Tổng quan hệ thống

3. **Triggers (7 ảnh - mỗi trigger 1 ảnh)**
   - [ ] Test trigger trg_NhanVien_InsertUpdate (chặn tuổi <18)
   - [ ] Test trigger chặn CCCD trùng
   - [ ] Test trigger chặn Email trùng
   - [ ] Test trigger chặn lương <3.25M
   - [ ] Test trigger ngăn giảm lương
   - [ ] Test trigger validate dự án
   - [ ] Xem audit log

4. **Procedures (5 ảnh)**
   - [ ] `EXEC sp_ThongKeTheoChiNhanh` - Quan trọng nhất!
   - [ ] `EXEC sp_TongLuongTheoPhongBan`
   - [ ] `EXEC sp_TopNhanVienLuongCao @TopN=10`
   - [ ] `EXEC sp_TimKiemNhanVien @TuKhoa='Nguyen'`
   - [ ] `EXEC sp_XemChiTietNhanVien @ID_NhanVien='NV0001'`

5. **Phân quyền (2 ảnh)**
   - [ ] Danh sách users
   - [ ] Quyền của từng user

**Script chụp tự động:**
```bash
#!/bin/bash
# File: capture_screenshots.sh

cd ~/CSDLPT/screenshots

echo "=== Chụp screenshot Database ==="
sqlcmd -S localhost -U sa -P 'Tt12345@' -C -Q "USE QuanLyNhanSu; SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES;" > tables.txt
cat tables.txt
read -p "Chụp màn hình này (Enter để tiếp tục)"

echo "=== Chụp screenshot Procedures ==="
sqlcmd -S localhost -U sa -P 'Tt12345@' -C -Q "USE QuanLyNhanSu; EXEC sp_ThongKeTheoChiNhanh;"
read -p "Chụp màn hình này (Enter để tiếp tục)"

echo "Hoàn thành! Kiểm tra screenshots trong ~/CSDLPT/screenshots/"
```

---

## ✅ PHẦN 4: TẠO FILE WORD BÁO CÁO (60 phút)

### 4.1. Cài LibreOffice
```bash
sudo apt install -y libreoffice
```

### 4.2. Cấu trúc báo cáo

**File: `BAO_CAO_BTL_NHOM5.docx`**

```
PHẦN 1: ĐẶT VẤN ĐỀ
  - Copy từ bai_lam.txt

PHẦN 2: PHÂN TÍCH VÀ THIẾT KẾ
  2.1. Phân tích chức năng
  2.2. Thiết kế CSDL
    - ER Diagram (chèn ảnh)
    - Danh sách bảng (chèn ảnh)
  2.3. Phân mảnh và nhân bản
    - Bảng phân mảnh ngang (PhongBan, NhanVien)
    - Bảng nhân bản (ChinhSach)
  2.4. Triggers (7 triggers - chèn code + ảnh test)
  2.5. Procedures (9 procedures - chèn code + ảnh kết quả)

PHẦN 3: CÀI ĐẶT VẬT LÝ
  3.1. SQL Server trên Ubuntu (chèn ảnh)
  3.2. Tạo database (chèn code HR.sql)
  3.3. Import dữ liệu (chèn ảnh sp_ThongKeTheoChiNhanh)
  3.4. Test triggers (chèn 7 ảnh)
  3.5. Test procedures (chèn 5 ảnh)

PHẦN 4: KẾT QUẢ VÀ ĐÁNH GIÁ
  4.1. Kết quả đạt được
  4.2. Hạn chế (chưa có VPN/Replication)
  4.3. Hướng phát triển

PHỤ LỤC
  - Code đầy đủ (HR.sql, Triggers.sql, Procedures.sql)
  - Screenshots
```

---

## ✅ PHẦN 5: CHUẨN BỊ DEMO CHO CÔ (30 phút)

### 5.1. Tạo script demo

**File: `Demo_Presentation.sql`**

```sql
USE QuanLyNhanSu;
GO

PRINT '================================================';
PRINT 'DEMO DỰ ÁN CSDLPT - NHÓM 5';
PRINT 'Đề tài: Quản lý nhân viên công ty đa chi nhánh';
PRINT '================================================';
GO

PRINT '';
PRINT '--- 1. TỔNG QUAN HỆ THỐNG ---';
EXEC sp_BaoCaoTongQuan;
GO

PRINT '';
PRINT '--- 2. PHÂN BỔ DỮ LIỆU THEO CHI NHÁNH (PHÂN MẢNH NGANG) ---';
EXEC sp_ThongKeTheoChiNhanh;
GO

PRINT '';
PRINT '--- 3. CHÍNH SÁCH ĐƯỢC NHÂN BẢN TẠI MỖI CHI NHÁNH ---';
SELECT ID_ChiNhanh, COUNT(*) AS SoChinhSach
FROM ChinhSach
GROUP BY ID_ChiNhanh;
GO

PRINT '';
PRINT '--- 4. TEST TRIGGER: Chặn thêm nhân viên dưới 18 tuổi ---';
BEGIN TRY
    INSERT INTO NhanVien (ID_NhanVien, ID_DuAn, ID_ChucVu, ID_ChiNhanh, ID_PhongBan, HoTen, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi)
    VALUES ('DEMO01', 'DA001', 'CV01', 'CN01', 'PB001', 'Test Kid', '2015-01-01', 'Nam', 'Kinh', '999999999999', '0999999999', 'kid@test.com', 'HN');
END TRY
BEGIN CATCH
    PRINT 'Trigger đã chặn: ' + ERROR_MESSAGE();
END CATCH
GO

PRINT '';
PRINT '--- 5. TOP 10 NHÂN VIÊN LƯƠNG CAO ---';
EXEC sp_TopNhanVienLuongCao @TopN=10;
GO

PRINT '';
PRINT '--- 6. AUDIT LOG (Lịch sử thay đổi) ---';
SELECT TOP 5 * FROM AuditLog ORDER BY ChangedAt DESC;
GO

PRINT '================================================';
PRINT 'HOÀN THÀNH DEMO';
PRINT '================================================';
```

**Chạy demo:**
```bash
sqlcmd -S localhost -U sa -P 'Tt12345@' -C -i Demo_Presentation.sql > demo_output.txt
```

---

## 📝 CHECKLIST CÔNG VIỆC

### Hôm nay (2-3 giờ):
- [ ] Chạy Views.sql
- [ ] Chạy Indexes.sql
- [ ] Chạy Users.sql
- [ ] Chạy Additional_Procedures.sql
- [ ] Chụp 20 screenshots

### Ngày mai (2 giờ):
- [ ] Viết báo cáo Word
- [ ] Chèn screenshots vào báo cáo
- [ ] Tạo script demo
- [ ] Test demo từ đầu đến cuối

### Tuần sau (khi có nhóm):
- [ ] Họp nhóm, phân công VPN
- [ ] Setup Replication
- [ ] Test đồng bộ
- [ ] Chụp screenshots VPN/Replication

---

## 🚀 LỢI ÍCH KHI LÀM CÁC BƯỚC NÀY

1. **Views:** Cô có thể hỏi "Làm sao query thông tin nhân viên đầy đủ?" → Có sẵn view
2. **Indexes:** Cô hỏi "Làm sao tăng tốc tìm kiếm?" → Đã tạo index
3. **Users:** Cô hỏi "Phân quyền như thế nào?" → Demo ngay 4 loại user
4. **Screenshots:** Báo cáo có hình ảnh sinh động
5. **Script demo:** Tự tin khi cô yêu cầu chạy thử

---

**Thời gian ước tính:** 3-4 giờ (có thể làm trong 1 ngày)  
**Người hướng dẫn:** AI Assistant  
**Cập nhật:** 06/11/2025
