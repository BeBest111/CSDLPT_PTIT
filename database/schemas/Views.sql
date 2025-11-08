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