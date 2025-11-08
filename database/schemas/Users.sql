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