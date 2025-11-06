-- ============================================
-- FILE: Procedures.sql
-- MÔ TẢ: Các stored procedures để thống kê và báo cáo
-- TÁC GIẢ: Nguyễn Minh Tiến - Nhóm 5 - CSDLPT
-- NGÀY: 06/11/2025
-- ============================================

USE QuanLyNhanSu;
GO

PRINT '================================================';
PRINT 'BẮT ĐẦU TẠO STORED PROCEDURES';
PRINT '================================================';
GO

-- ============================================
-- PHẦN 1: PROCEDURES THỐNG KÊ NHÂN VIÊN
-- ============================================

-- Procedure 1: Đếm số nhân viên theo phòng ban
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'sp_ThongKeNhanVienTheoPhongBan')
    DROP PROCEDURE sp_ThongKeNhanVienTheoPhongBan;
GO

CREATE PROCEDURE sp_ThongKeNhanVienTheoPhongBan
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        pb.ID_PhongBan,
        pb.TenPhongBan,
        cn.TenChiNhanh,
        COUNT(nv.ID_NhanVien) AS SoNhanVien,
        COUNT(CASE WHEN nv.GioiTinh = 'Nam' THEN 1 END) AS SoNam,
        COUNT(CASE WHEN nv.GioiTinh = N'Nữ' THEN 1 END) AS SoNu
    FROM PhongBan pb
    LEFT JOIN NhanVien nv ON pb.ID_PhongBan = nv.ID_PhongBan
    LEFT JOIN ChiNhanh cn ON pb.ID_ChiNhanh = cn.ID_ChiNhanh
    GROUP BY pb.ID_PhongBan, pb.TenPhongBan, cn.TenChiNhanh
    ORDER BY SoNhanVien DESC;
END;
GO

PRINT N'✓ Đã tạo sp_ThongKeNhanVienTheoPhongBan';
GO

-- Procedure 2: Thống kê nhân viên theo độ tuổi
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'sp_ThongKeNhanVienTheoDoTuoi')
    DROP PROCEDURE sp_ThongKeNhanVienTheoDoTuoi;
GO

CREATE PROCEDURE sp_ThongKeNhanVienTheoDoTuoi
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        CASE 
            WHEN DATEDIFF(YEAR, NgaySinh, GETDATE()) BETWEEN 18 AND 25 THEN '18-25'
            WHEN DATEDIFF(YEAR, NgaySinh, GETDATE()) BETWEEN 26 AND 35 THEN '26-35'
            WHEN DATEDIFF(YEAR, NgaySinh, GETDATE()) BETWEEN 36 AND 45 THEN '36-45'
            WHEN DATEDIFF(YEAR, NgaySinh, GETDATE()) BETWEEN 46 AND 55 THEN '46-55'
            ELSE '56+'
        END AS NhomTuoi,
        COUNT(*) AS SoLuong,
        CAST(AVG(DATEDIFF(YEAR, NgaySinh, GETDATE())) AS DECIMAL(5,2)) AS TuoiTrungBinh
    FROM NhanVien
    GROUP BY 
        CASE 
            WHEN DATEDIFF(YEAR, NgaySinh, GETDATE()) BETWEEN 18 AND 25 THEN '18-25'
            WHEN DATEDIFF(YEAR, NgaySinh, GETDATE()) BETWEEN 26 AND 35 THEN '26-35'
            WHEN DATEDIFF(YEAR, NgaySinh, GETDATE()) BETWEEN 36 AND 45 THEN '36-45'
            WHEN DATEDIFF(YEAR, NgaySinh, GETDATE()) BETWEEN 46 AND 55 THEN '46-55'
            ELSE '56+'
        END
    ORDER BY NhomTuoi;
END;
GO

PRINT N'✓ Đã tạo sp_ThongKeNhanVienTheoDoTuoi';
GO

-- ============================================
-- PHẦN 2: PROCEDURES THỐNG KÊ LƯƠNG
-- ============================================

-- Procedure 3: Tính tổng lương theo phòng ban
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'sp_TongLuongTheoPhongBan')
    DROP PROCEDURE sp_TongLuongTheoPhongBan;
GO

CREATE PROCEDURE sp_TongLuongTheoPhongBan
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        pb.ID_PhongBan,
        pb.TenPhongBan,
        cn.TenChiNhanh,
        COUNT(nv.ID_NhanVien) AS SoNhanVien,
        SUM(l.MucLuong) AS TongLuong,
        AVG(l.MucLuong) AS LuongTrungBinh,
        MAX(l.MucLuong) AS LuongCaoNhat,
        MIN(l.MucLuong) AS LuongThapNhat
    FROM PhongBan pb
    LEFT JOIN NhanVien nv ON pb.ID_PhongBan = nv.ID_PhongBan
    LEFT JOIN Luong l ON nv.ID_NhanVien = l.ID_NhanVien
    LEFT JOIN ChiNhanh cn ON pb.ID_ChiNhanh = cn.ID_ChiNhanh
    GROUP BY pb.ID_PhongBan, pb.TenPhongBan, cn.TenChiNhanh
    ORDER BY TongLuong DESC;
END;
GO

PRINT N'✓ Đã tạo sp_TongLuongTheoPhongBan';
GO

-- Procedure 4: Danh sách nhân viên có lương cao nhất
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'sp_TopNhanVienLuongCao')
    DROP PROCEDURE sp_TopNhanVienLuongCao;
GO

CREATE PROCEDURE sp_TopNhanVienLuongCao
    @TopN INT = 10
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT TOP (@TopN)
        nv.ID_NhanVien,
        nv.HoTen,
        cv.TenChucVu,
        pb.TenPhongBan,
        cn.TenChiNhanh,
        l.MucLuong,
        DATEDIFF(YEAR, nv.NgaySinh, GETDATE()) AS Tuoi
    FROM NhanVien nv
    INNER JOIN Luong l ON nv.ID_NhanVien = l.ID_NhanVien
    INNER JOIN ChucVu cv ON nv.ID_ChucVu = cv.ID_ChucVu
    INNER JOIN PhongBan pb ON nv.ID_PhongBan = pb.ID_PhongBan
    INNER JOIN ChiNhanh cn ON nv.ID_ChiNhanh = cn.ID_ChiNhanh
    ORDER BY l.MucLuong DESC;
END;
GO

PRINT N'✓ Đã tạo sp_TopNhanVienLuongCao';
GO

-- ============================================
-- PHẦN 3: PROCEDURES THỐNG KÊ DỰ ÁN
-- ============================================

-- Procedure 5: Thống kê dự án theo phòng ban
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'sp_ThongKeDuAnTheoPhongBan')
    DROP PROCEDURE sp_ThongKeDuAnTheoPhongBan;
GO

CREATE PROCEDURE sp_ThongKeDuAnTheoPhongBan
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        pb.ID_PhongBan,
        pb.TenPhongBan,
        cn.TenChiNhanh,
        COUNT(da.ID_DuAn) AS SoDuAn,
        COUNT(nv.ID_NhanVien) AS SoNhanVienThamGia,
        AVG(da.ThoiHan) AS ThoiHanTrungBinh
    FROM PhongBan pb
    LEFT JOIN DuAn da ON pb.ID_PhongBan = da.ID_PhongBan
    LEFT JOIN NhanVien nv ON da.ID_DuAn = nv.ID_DuAn
    LEFT JOIN ChiNhanh cn ON pb.ID_ChiNhanh = cn.ID_ChiNhanh
    GROUP BY pb.ID_PhongBan, pb.TenPhongBan, cn.TenChiNhanh
    ORDER BY SoDuAn DESC;
END;
GO

PRINT N'✓ Đã tạo sp_ThongKeDuAnTheoPhongBan';
GO

-- ============================================
-- PHẦN 4: PROCEDURES TÌM KIẾM
-- ============================================

-- Procedure 6: Tìm kiếm nhân viên theo tên
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'sp_TimKiemNhanVien')
    DROP PROCEDURE sp_TimKiemNhanVien;
GO

CREATE PROCEDURE sp_TimKiemNhanVien
    @TuKhoa NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        nv.ID_NhanVien,
        nv.HoTen,
        nv.NgaySinh,
        nv.GioiTinh,
        nv.Email,
        nv.SoDienThoai,
        cv.TenChucVu,
        pb.TenPhongBan,
        cn.TenChiNhanh,
        l.MucLuong
    FROM NhanVien nv
    LEFT JOIN ChucVu cv ON nv.ID_ChucVu = cv.ID_ChucVu
    LEFT JOIN PhongBan pb ON nv.ID_PhongBan = pb.ID_PhongBan
    LEFT JOIN ChiNhanh cn ON nv.ID_ChiNhanh = cn.ID_ChiNhanh
    LEFT JOIN Luong l ON nv.ID_NhanVien = l.ID_NhanVien
    WHERE nv.HoTen LIKE '%' + @TuKhoa + '%'
       OR nv.Email LIKE '%' + @TuKhoa + '%'
       OR nv.CCCD LIKE '%' + @TuKhoa + '%'
       OR nv.SoDienThoai LIKE '%' + @TuKhoa + '%'
    ORDER BY nv.HoTen;
END;
GO

PRINT N'✓ Đã tạo sp_TimKiemNhanVien';
GO

-- ============================================
-- PHẦN 5: PROCEDURES BÁO CÁO TỔNG HỢP
-- ============================================

-- Procedure 7: Báo cáo tổng quan hệ thống
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'sp_BaoCaoTongQuan')
    DROP PROCEDURE sp_BaoCaoTongQuan;
GO

CREATE PROCEDURE sp_BaoCaoTongQuan
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Thống kê tổng quan
    PRINT '================================================';
    PRINT 'BÁO CÁO TỔNG QUAN HỆ THỐNG';
    PRINT '================================================';
    
    SELECT 'Tổng số Chi nhánh' AS MucTin, COUNT(*) AS SoLuong FROM ChiNhanh
    UNION ALL
    SELECT 'Tổng số Phòng ban', COUNT(*) FROM PhongBan
    UNION ALL
    SELECT 'Tổng số Dự án', COUNT(*) FROM DuAn
    UNION ALL
    SELECT 'Tổng số Nhân viên', COUNT(*) FROM NhanVien
    UNION ALL
    SELECT 'Tổng số Chính sách', COUNT(*) FROM ChinhSach;
    
    PRINT '';
    PRINT 'Thống kê lương:';
    
    SELECT 
        COUNT(*) AS TongNhanVien,
        SUM(CAST(MucLuong AS BIGINT)) AS TongQuiLuong,
        AVG(MucLuong) AS LuongTrungBinh,
        MAX(MucLuong) AS LuongCaoNhat,
        MIN(MucLuong) AS LuongThapNhat
    FROM Luong;
END;
GO

PRINT N'✓ Đã tạo sp_BaoCaoTongQuan';
GO

-- Procedure 8: Xem chi tiết nhân viên
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'sp_XemChiTietNhanVien')
    DROP PROCEDURE sp_XemChiTietNhanVien;
GO

CREATE PROCEDURE sp_XemChiTietNhanVien
    @ID_NhanVien VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Thông tin cơ bản
    SELECT 
        nv.ID_NhanVien,
        nv.HoTen,
        nv.NgaySinh,
        DATEDIFF(YEAR, nv.NgaySinh, GETDATE()) AS Tuoi,
        nv.GioiTinh,
        nv.DanToc,
        nv.CCCD,
        nv.Email,
        nv.SoDienThoai,
        nv.DiaChi
    FROM NhanVien nv
    WHERE nv.ID_NhanVien = @ID_NhanVien;
    
    -- Thông tin công việc
    SELECT 
        cv.TenChucVu,
        pb.TenPhongBan,
        cn.TenChiNhanh,
        da.TenDuAn,
        da.NgayBatDau AS NgayBatDauDuAn,
        da.ThoiHan AS ThoiHanDuAn
    FROM NhanVien nv
    LEFT JOIN ChucVu cv ON nv.ID_ChucVu = cv.ID_ChucVu
    LEFT JOIN PhongBan pb ON nv.ID_PhongBan = pb.ID_PhongBan
    LEFT JOIN ChiNhanh cn ON nv.ID_ChiNhanh = cn.ID_ChiNhanh
    LEFT JOIN DuAn da ON nv.ID_DuAn = da.ID_DuAn
    WHERE nv.ID_NhanVien = @ID_NhanVien;
    
    -- Thông tin lương
    SELECT 
        l.ID_Luong,
        l.MucLuong,
        cv.BacLuong
    FROM NhanVien nv
    LEFT JOIN Luong l ON nv.ID_NhanVien = l.ID_NhanVien
    LEFT JOIN ChucVu cv ON nv.ID_ChucVu = cv.ID_ChucVu
    WHERE nv.ID_NhanVien = @ID_NhanVien;
END;
GO

PRINT N'✓ Đã tạo sp_XemChiTietNhanVien';
GO

-- Procedure 9: Thống kê nhân viên theo chi nhánh
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'sp_ThongKeTheoChiNhanh')
    DROP PROCEDURE sp_ThongKeTheoChiNhanh;
GO

CREATE PROCEDURE sp_ThongKeTheoChiNhanh
AS
BEGIN
    SET NOCOUNT ON;
    
    /*
        Lưu ý: Tránh nhân bản dòng khi JOIN nhiều bảng (ChiNhanh -> PhongBan -> DuAn và ChiNhanh -> NhanVien -> Luong)
        bằng cách tiền tổng hợp (pre-aggregate) từng chỉ số theo chi nhánh rồi JOIN kết quả.
        Đồng thời ép kiểu SUM(MucLuong) sang BIGINT để tránh tràn INT.
    */
    SELECT 
        cn.ID_ChiNhanh,
        cn.TenChiNhanh,
        cn.DiaChi,
        ISNULL(pb_cnt.SoPhongBan, 0) AS SoPhongBan,
        ISNULL(da_cnt.SoDuAn, 0) AS SoDuAn,
        ISNULL(nv_cnt.SoNhanVien, 0) AS SoNhanVien,
        ISNULL(l_sum.TongQuiLuong, 0) AS TongQuiLuong
    FROM ChiNhanh cn
    -- Đếm phòng ban theo chi nhánh
    LEFT JOIN (
        SELECT pb.ID_ChiNhanh, COUNT(*) AS SoPhongBan
        FROM PhongBan pb
        GROUP BY pb.ID_ChiNhanh
    ) pb_cnt ON pb_cnt.ID_ChiNhanh = cn.ID_ChiNhanh
    -- Đếm dự án theo chi nhánh (qua phòng ban)
    LEFT JOIN (
        SELECT pb.ID_ChiNhanh, COUNT(DISTINCT da.ID_DuAn) AS SoDuAn
        FROM PhongBan pb
        LEFT JOIN DuAn da ON da.ID_PhongBan = pb.ID_PhongBan
        GROUP BY pb.ID_ChiNhanh
    ) da_cnt ON da_cnt.ID_ChiNhanh = cn.ID_ChiNhanh
    -- Đếm nhân viên theo chi nhánh
    LEFT JOIN (
        SELECT nv.ID_ChiNhanh, COUNT(*) AS SoNhanVien
        FROM NhanVien nv
        GROUP BY nv.ID_ChiNhanh
    ) nv_cnt ON nv_cnt.ID_ChiNhanh = cn.ID_ChiNhanh
    -- Tổng quỹ lương theo chi nhánh (1:1 NhanVien-Luong, tổng theo chi nhánh)
    LEFT JOIN (
        SELECT nv.ID_ChiNhanh, SUM(CAST(l.MucLuong AS BIGINT)) AS TongQuiLuong
        FROM NhanVien nv
        INNER JOIN Luong l ON l.ID_NhanVien = nv.ID_NhanVien
        GROUP BY nv.ID_ChiNhanh
    ) l_sum ON l_sum.ID_ChiNhanh = cn.ID_ChiNhanh
    ORDER BY SoNhanVien DESC, cn.ID_ChiNhanh;
END;
GO

PRINT N'✓ Đã tạo sp_ThongKeTheoChiNhanh';
GO

PRINT '================================================';
PRINT 'HOÀN THÀNH TẠO TẤT CẢ STORED PROCEDURES';
PRINT '================================================';
GO

-- Hiển thị danh sách procedures đã tạo
SELECT 
    name AS ProcedureName,
    create_date AS CreatedDate,
    modify_date AS ModifiedDate
FROM sys.procedures
WHERE name LIKE 'sp_%'
ORDER BY name;
GO
