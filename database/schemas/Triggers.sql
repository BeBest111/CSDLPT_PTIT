-- ============================================
-- FILE: Triggers.sql
-- MÔ TẢ: Các triggers để bảo vệ và quản lý dữ liệu
-- TÁC GIẢ: Nguyễn Minh Tiến - Nhóm 5 - CSDLPT
-- NGÀY: 06/11/2025
-- ============================================

USE QuanLyNhanSu;
GO

PRINT '================================================';
PRINT 'BẮT ĐẦU TẠO TRIGGERS CHO DATABASE QuanLyNhanSu';
PRINT '================================================';
GO

-- ============================================
-- PHẦN 1: TRIGGERS CHO BẢNG NHANVIEN
-- ============================================

PRINT 'Tạo triggers cho bảng NhanVien...';
GO

-- Trigger 1: Kiểm tra và validate khi thêm/sửa nhân viên
IF EXISTS (SELECT * FROM sys.triggers WHERE name = 'trg_NhanVien_InsertUpdate')
    DROP TRIGGER trg_NhanVien_InsertUpdate;
GO

CREATE TRIGGER trg_NhanVien_InsertUpdate
ON NhanVien
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @ID_NhanVien VARCHAR(255);
    DECLARE @NgaySinh DATE;
    DECLARE @CCCD VARCHAR(255);
    DECLARE @Email VARCHAR(255);
    DECLARE @SoDienThoai VARCHAR(255);
    DECLARE @ErrorMsg NVARCHAR(500);
    
    -- Lấy thông tin từ bản ghi mới
    SELECT @ID_NhanVien = ID_NhanVien,
           @NgaySinh = NgaySinh,
           @CCCD = CCCD,
           @Email = Email,
           @SoDienThoai = SoDienThoai
    FROM inserted;
    
    -- Kiểm tra ID_NhanVien không NULL
    IF @ID_NhanVien IS NULL
    BEGIN
        SET @ErrorMsg = N'Lỗi: ID Nhân viên không được để trống!';
        RAISERROR(@ErrorMsg, 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
    
    -- Kiểm tra tuổi (phải >= 18)
    IF DATEDIFF(YEAR, @NgaySinh, GETDATE()) < 18
    BEGIN
        SET @ErrorMsg = N'Lỗi: Nhân viên phải đủ 18 tuổi. Tuổi hiện tại: ' 
                      + CAST(DATEDIFF(YEAR, @NgaySinh, GETDATE()) AS VARCHAR(3));
        RAISERROR(@ErrorMsg, 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
    
    -- Kiểm tra CCCD duy nhất
    IF EXISTS (
        SELECT 1 FROM NhanVien 
        WHERE CCCD = @CCCD 
        AND ID_NhanVien <> @ID_NhanVien
    )
    BEGIN
        SET @ErrorMsg = N'Lỗi: Số CCCD ' + @CCCD + N' đã tồn tại trong hệ thống!';
        RAISERROR(@ErrorMsg, 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
    
    -- Kiểm tra Email duy nhất
    IF EXISTS (
        SELECT 1 FROM NhanVien 
        WHERE Email = @Email 
        AND ID_NhanVien <> @ID_NhanVien
    )
    BEGIN
        SET @ErrorMsg = N'Lỗi: Email ' + @Email + N' đã được sử dụng bởi nhân viên khác!';
        RAISERROR(@ErrorMsg, 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
    
    -- Kiểm tra SĐT duy nhất
    IF EXISTS (
        SELECT 1 FROM NhanVien 
        WHERE SoDienThoai = @SoDienThoai 
        AND ID_NhanVien <> @ID_NhanVien
    )
    BEGIN
        SET @ErrorMsg = N'Lỗi: Số điện thoại ' + @SoDienThoai + N' đã được sử dụng!';
        RAISERROR(@ErrorMsg, 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
    
    PRINT N'✓ Thêm/Cập nhật nhân viên ' + @ID_NhanVien + N' thành công!';
END;
GO

-- Trigger 2: Kiểm tra khi xóa nhân viên
IF EXISTS (SELECT * FROM sys.triggers WHERE name = 'trg_NhanVien_Delete')
    DROP TRIGGER trg_NhanVien_Delete;
GO

CREATE TRIGGER trg_NhanVien_Delete
ON NhanVien
INSTEAD OF DELETE
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @ID_NhanVien VARCHAR(255);
    DECLARE @HoTen VARCHAR(255);
    
    SELECT @ID_NhanVien = ID_NhanVien, @HoTen = HoTen
    FROM deleted;
    
    -- Kiểm tra xem nhân viên có dữ liệu lương không
    IF EXISTS (SELECT 1 FROM Luong WHERE ID_NhanVien = @ID_NhanVien)
    BEGIN
        -- Xóa lương trước
        DELETE FROM Luong WHERE ID_NhanVien = @ID_NhanVien;
        PRINT N'✓ Đã xóa thông tin lương của nhân viên ' + @HoTen;
    END
    
    -- Xóa nhân viên
    DELETE FROM NhanVien WHERE ID_NhanVien = @ID_NhanVien;
    PRINT N'✓ Đã xóa nhân viên ' + @HoTen + ' (' + @ID_NhanVien + ')';
END;
GO

-- ============================================
-- PHẦN 2: TRIGGERS CHO BẢNG LUONG
-- ============================================

PRINT 'Tạo triggers cho bảng Luong...';
GO

-- Trigger 3: Kiểm tra mức lương tối thiểu
IF EXISTS (SELECT * FROM sys.triggers WHERE name = 'trg_Luong_ValidateMinSalary')
    DROP TRIGGER trg_Luong_ValidateMinSalary;
GO

CREATE TRIGGER trg_Luong_ValidateMinSalary
ON Luong
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @MucLuong INT;
    DECLARE @ID_NhanVien VARCHAR(255);
    DECLARE @ErrorMsg NVARCHAR(500);
    DECLARE @MinSalary INT = 3250000; -- Lương tối thiểu 2025
    
    SELECT @MucLuong = MucLuong, @ID_NhanVien = ID_NhanVien
    FROM inserted;
    
    -- Kiểm tra mức lương không được âm
    IF @MucLuong < 0
    BEGIN
        SET @ErrorMsg = N'Lỗi: Mức lương không được âm!';
        RAISERROR(@ErrorMsg, 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
    
    -- Kiểm tra mức lương tối thiểu
    IF @MucLuong < @MinSalary
    BEGIN
        SET @ErrorMsg = N'Lỗi: Mức lương ' + CAST(@MucLuong AS VARCHAR(20)) 
                      + N' VNĐ thấp hơn lương tối thiểu ' 
                      + CAST(@MinSalary AS VARCHAR(20)) + N' VNĐ!';
        RAISERROR(@ErrorMsg, 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
    
    PRINT N'✓ Mức lương hợp lệ cho nhân viên ' + @ID_NhanVien;
END;
GO

-- Trigger 4: Ngăn giảm lương
IF EXISTS (SELECT * FROM sys.triggers WHERE name = 'trg_Luong_PreventSalaryReduction')
    DROP TRIGGER trg_Luong_PreventSalaryReduction;
GO

CREATE TRIGGER trg_Luong_PreventSalaryReduction
ON Luong
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @MucLuongCu INT;
    DECLARE @MucLuongMoi INT;
    DECLARE @ID_Luong VARCHAR(255);
    DECLARE @ErrorMsg NVARCHAR(500);
    
    SELECT @MucLuongCu = d.MucLuong,
           @MucLuongMoi = i.MucLuong,
           @ID_Luong = i.ID_Luong
    FROM deleted d
    INNER JOIN inserted i ON d.ID_Luong = i.ID_Luong;
    
    -- Không cho phép giảm lương
    IF @MucLuongMoi < @MucLuongCu
    BEGIN
        SET @ErrorMsg = N'Lỗi: Không được phép giảm lương từ ' 
                      + CAST(@MucLuongCu AS VARCHAR(20)) + N' VNĐ xuống ' 
                      + CAST(@MucLuongMoi AS VARCHAR(20)) + N' VNĐ!';
        RAISERROR(@ErrorMsg, 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
    
    IF @MucLuongMoi > @MucLuongCu
    BEGIN
        DECLARE @TangThem INT = @MucLuongMoi - @MucLuongCu;
        PRINT N'✓ Tăng lương thành công! Tăng thêm: ' 
              + CAST(@TangThem AS VARCHAR(20)) + N' VNĐ';
    END
END;
GO

-- ============================================
-- PHẦN 3: TRIGGERS CHO BẢNG DUAN
-- ============================================

PRINT 'Tạo triggers cho bảng DuAn...';
GO

-- Trigger 5: Kiểm tra ngày bắt đầu dự án
IF EXISTS (SELECT * FROM sys.triggers WHERE name = 'trg_DuAn_ValidateStartDate')
    DROP TRIGGER trg_DuAn_ValidateStartDate;
GO

CREATE TRIGGER trg_DuAn_ValidateStartDate
ON DuAn
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @NgayBatDau DATE;
    DECLARE @ThoiHan INT;
    DECLARE @TenDuAn VARCHAR(255);
    DECLARE @ErrorMsg NVARCHAR(500);
    
    SELECT @NgayBatDau = NgayBatDau,
           @ThoiHan = ThoiHan,
           @TenDuAn = TenDuAn
    FROM inserted;
    
    -- Kiểm tra ngày bắt đầu không được trong quá khứ quá xa (> 5 năm)
    IF @NgayBatDau < DATEADD(YEAR, -5, GETDATE())
    BEGIN
        SET @ErrorMsg = N'Cảnh báo: Ngày bắt đầu dự án quá xa trong quá khứ!';
        PRINT @ErrorMsg;
    END
    
    -- Kiểm tra thời hạn hợp lý (1-1825 ngày = 5 năm)
    IF @ThoiHan < 1 OR @ThoiHan > 1825
    BEGIN
        SET @ErrorMsg = N'Lỗi: Thời hạn dự án phải từ 1 đến 1825 ngày (5 năm)!';
        RAISERROR(@ErrorMsg, 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
    
    PRINT N'✓ Dự án "' + @TenDuAn + N'" hợp lệ';
END;
GO

-- ============================================
-- PHẦN 4: TRIGGERS CHO BẢNG CHINHANH
-- ============================================

PRINT 'Tạo triggers cho bảng ChiNhanh...';
GO

-- Trigger 6: Kiểm tra email chi nhánh duy nhất
IF EXISTS (SELECT * FROM sys.triggers WHERE name = 'trg_ChiNhanh_UniqueEmail')
    DROP TRIGGER trg_ChiNhanh_UniqueEmail;
GO

CREATE TRIGGER trg_ChiNhanh_UniqueEmail
ON ChiNhanh
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @Email VARCHAR(255);
    DECLARE @ID_ChiNhanh VARCHAR(255);
    DECLARE @ErrorMsg NVARCHAR(500);
    
    SELECT @Email = Email, @ID_ChiNhanh = ID_ChiNhanh
    FROM inserted;
    
    -- Kiểm tra email duy nhất
    IF EXISTS (
        SELECT 1 FROM ChiNhanh 
        WHERE Email = @Email 
        AND ID_ChiNhanh <> @ID_ChiNhanh
    )
    BEGIN
        SET @ErrorMsg = N'Lỗi: Email ' + @Email + N' đã được sử dụng bởi chi nhánh khác!';
        RAISERROR(@ErrorMsg, 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
    
    PRINT N'✓ Chi nhánh ' + @ID_ChiNhanh + N' hợp lệ';
END;
GO

-- ============================================
-- PHẦN 5: AUDIT TRIGGER (GHI LOG)
-- ============================================

PRINT 'Tạo bảng và trigger audit log...';
GO

-- Tạo bảng AuditLog nếu chưa có
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'AuditLog')
BEGIN
    CREATE TABLE AuditLog (
        LogID INT IDENTITY(1,1) PRIMARY KEY,
        TableName VARCHAR(100),
        Operation VARCHAR(50),
        RecordID VARCHAR(255),
        OldValue VARCHAR(MAX),
        NewValue VARCHAR(MAX),
        ChangedBy VARCHAR(100) DEFAULT SYSTEM_USER,
        ChangedAt DATETIME DEFAULT GETDATE()
    );
    PRINT N'✓ Đã tạo bảng AuditLog';
END
GO

-- Trigger 7: Audit log cho NhanVien
IF EXISTS (SELECT * FROM sys.triggers WHERE name = 'trg_NhanVien_Audit')
    DROP TRIGGER trg_NhanVien_Audit;
GO

CREATE TRIGGER trg_NhanVien_Audit
ON NhanVien
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @Operation VARCHAR(50);
    DECLARE @RecordID VARCHAR(255);
    
    -- Xác định loại operation
    IF EXISTS(SELECT * FROM inserted) AND EXISTS(SELECT * FROM deleted)
        SET @Operation = 'UPDATE';
    ELSE IF EXISTS(SELECT * FROM inserted)
        SET @Operation = 'INSERT';
    ELSE
        SET @Operation = 'DELETE';
    
    -- Lấy ID
    IF @Operation = 'DELETE'
        SELECT @RecordID = ID_NhanVien FROM deleted;
    ELSE
        SELECT @RecordID = ID_NhanVien FROM inserted;
    
    -- Ghi log
    INSERT INTO AuditLog (TableName, Operation, RecordID)
    VALUES ('NhanVien', @Operation, @RecordID);
END;
GO

PRINT '================================================';
PRINT 'HOÀN THÀNH TẠO TẤT CẢ TRIGGERS';
PRINT '================================================';
GO

-- Hiển thị danh sách triggers đã tạo
SELECT 
    t.name AS TriggerName,
    OBJECT_NAME(t.parent_id) AS TableName,
    t.create_date AS CreatedDate
FROM sys.triggers t
WHERE t.parent_class = 1
ORDER BY OBJECT_NAME(t.parent_id), t.name;
GO
