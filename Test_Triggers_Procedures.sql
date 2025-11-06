-- ============================================
-- FILE: Test_Triggers_Procedures.sql
-- MÔ TẢ: Script test các triggers và procedures
-- TÁC GIẢ: Nhóm 5 - CSDLPT
-- NGÀY: 06/11/2025
-- ============================================

USE QuanLyNhanSu;
GO

PRINT '================================================';
PRINT 'BẮT ĐẦU TEST TRIGGERS VÀ STORED PROCEDURES';
PRINT '================================================';
GO

-- ============================================
-- PHẦN 1: TEST TRIGGERS
-- ============================================

PRINT '';
PRINT '--- TEST 1: Thêm nhân viên hợp lệ ---';
GO

INSERT INTO NhanVien (ID_NhanVien, ID_DuAn, ID_ChucVu, ID_ChiNhanh, ID_PhongBan, HoTen, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi)
VALUES ('TEST01', 'NTDA01', 'NTCV01', 'CN04', 'NTPB01', N'Nguyễn Test', '1995-01-01', 'Nam', 'Kinh', '099999999999', '0999999999', 'test@example.com', N'Hà Nội');
GO

PRINT '';
PRINT '--- TEST 2: Thêm lương hợp lệ ---';
GO

INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong)
VALUES ('TEST_L01', 'TEST01', 10000000);
GO

PRINT '';
PRINT '--- TEST 3: Thử thêm nhân viên dưới 18 tuổi (sẽ BỊ CHẶN) ---';
GO

BEGIN TRY
    INSERT INTO NhanVien (ID_NhanVien, ID_DuAn, ID_ChucVu, ID_ChiNhanh, ID_PhongBan, HoTen, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi)
    VALUES ('TEST02', 'NTDA01', 'NTCV01', 'CN04', 'NTPB01', N'Trẻ Em Test', '2015-01-01', 'Nam', 'Kinh', '088888888888', '0888888888', 'test2@example.com', N'Hà Nội');
    PRINT N'❌ LỖI: Trigger không hoạt động!';
END TRY
BEGIN CATCH
    PRINT N'✓ ĐÚNG: Trigger đã chặn thêm nhân viên dưới 18 tuổi';
    PRINT N'   Lỗi: ' + ERROR_MESSAGE();
END CATCH
GO

PRINT '';
PRINT '--- TEST 4: Thử thêm CCCD trùng (sẽ BỊ CHẶN) ---';
GO

BEGIN TRY
    INSERT INTO NhanVien (ID_NhanVien, ID_DuAn, ID_ChucVu, ID_ChiNhanh, ID_PhongBan, HoTen, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi)
    VALUES ('TEST03', 'NTDA01', 'NTCV01', 'CN04', 'NTPB01', N'Trùng CCCD', '1990-01-01', 'Nam', 'Kinh', '012345678901', '0777777777', 'test3@example.com', N'Hà Nội');
    PRINT N'❌ LỖI: Trigger không hoạt động!';
END TRY
BEGIN CATCH
    PRINT N'✓ ĐÚNG: Trigger đã chặn CCCD trùng lặp';
    PRINT N'   Lỗi: ' + ERROR_MESSAGE();
END CATCH
GO

PRINT '';
PRINT '--- TEST 5: Thử thêm lương dưới mức tối thiểu (sẽ BỊ CHẶN) ---';
GO

BEGIN TRY
    INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong)
    VALUES ('TEST_L02', 'TEST01', 2000000);
    PRINT N'❌ LỖI: Trigger không hoạt động!';
END TRY
BEGIN CATCH
    PRINT N'✓ ĐÚNG: Trigger đã chặn lương dưới mức tối thiểu';
    PRINT N'   Lỗi: ' + ERROR_MESSAGE();
END CATCH
GO

PRINT '';
PRINT '--- TEST 6: Thử giảm lương (sẽ BỊ CHẶN) ---';
GO

BEGIN TRY
    UPDATE Luong SET MucLuong = 8000000 WHERE ID_Luong = 'TEST_L01';
    PRINT N'❌ LỖI: Trigger không hoạt động!';
END TRY
BEGIN CATCH
    PRINT N'✓ ĐÚNG: Trigger đã chặn giảm lương';
    PRINT N'   Lỗi: ' + ERROR_MESSAGE();
END CATCH
GO

PRINT '';
PRINT '--- TEST 7: Tăng lương (ĐƯỢC PHÉP) ---';
GO

UPDATE Luong SET MucLuong = 12000000 WHERE ID_Luong = 'TEST_L01';
GO

-- ============================================
-- PHẦN 2: TEST STORED PROCEDURES
-- ============================================

PRINT '';
PRINT '================================================';
PRINT 'TEST STORED PROCEDURES';
PRINT '================================================';
GO

PRINT '';
PRINT '--- TEST 8: Báo cáo tổng quan ---';
GO
EXEC sp_BaoCaoTongQuan;
GO

PRINT '';
PRINT '--- TEST 9: Thống kê nhân viên theo phòng ban ---';
GO
EXEC sp_ThongKeNhanVienTheoPhongBan;
GO

PRINT '';
PRINT '--- TEST 10: Thống kê nhân viên theo độ tuổi ---';
GO
EXEC sp_ThongKeNhanVienTheoDoTuoi;
GO

PRINT '';
PRINT '--- TEST 11: Tổng lương theo phòng ban ---';
GO
EXEC sp_TongLuongTheoPhongBan;
GO

PRINT '';
PRINT '--- TEST 12: Top 5 nhân viên lương cao ---';
GO
EXEC sp_TopNhanVienLuongCao @TopN = 5;
GO

PRINT '';
PRINT '--- TEST 13: Thống kê theo chi nhánh ---';
GO
EXEC sp_ThongKeTheoChiNhanh;
GO

PRINT '';
PRINT '--- TEST 13.1: Đối chiếu tổng quỹ lương (từ proc vs từ bảng Luong) ---';
GO

-- Lưu kết quả proc vào bảng tạm để cộng tổng
IF OBJECT_ID('tempdb..#tmpThongKeCN') IS NOT NULL DROP TABLE #tmpThongKeCN;
CREATE TABLE #tmpThongKeCN (
    ID_ChiNhanh VARCHAR(255),
    TenChiNhanh VARCHAR(255),
    DiaChi VARCHAR(255),
    SoPhongBan INT,
    SoDuAn INT,
    SoNhanVien INT,
    TongQuiLuong BIGINT
);

INSERT INTO #tmpThongKeCN
EXEC sp_ThongKeTheoChiNhanh;

SELECT 
    (SELECT SUM(CAST(MucLuong AS BIGINT)) FROM Luong) AS TongQuyLuong_TuBangLuong,
    (SELECT SUM(TongQuiLuong) FROM #tmpThongKeCN) AS TongQuyLuong_TuProc;

DROP TABLE #tmpThongKeCN;
GO

PRINT '';
PRINT '--- TEST 14: Tìm kiếm nhân viên ---';
GO
EXEC sp_TimKiemNhanVien @TuKhoa = N'Nguyen';
GO

PRINT '';
PRINT '--- TEST 15: Xem chi tiết nhân viên ---';
GO
EXEC sp_XemChiTietNhanVien @ID_NhanVien = 'NTNV01';
GO

-- ============================================
-- PHẦN 3: KIỂM TRA AUDIT LOG
-- ============================================

PRINT '';
PRINT '================================================';
PRINT 'KIỂM TRA AUDIT LOG';
PRINT '================================================';
GO

SELECT TOP 10
    LogID,
    TableName,
    Operation,
    RecordID,
    ChangedBy,
    ChangedAt
FROM AuditLog
ORDER BY ChangedAt DESC;
GO

-- ============================================
-- PHẦN 4: DỌN DẸP DỮ LIỆU TEST
-- ============================================

PRINT '';
PRINT '================================================';
PRINT 'DỌN DẸP DỮ LIỆU TEST';
PRINT '================================================';
GO

DELETE FROM Luong WHERE ID_Luong = 'TEST_L01';
DELETE FROM NhanVien WHERE ID_NhanVien = 'TEST01';
GO

PRINT N'✓ Đã xóa dữ liệu test';
GO

PRINT '';
PRINT '================================================';
PRINT 'HOÀN THÀNH TEST';
PRINT '================================================';
GO
