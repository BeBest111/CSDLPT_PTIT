/*
 * ============================================
 * SUBSCRIBER SETUP SCRIPT
 * ============================================
 * Mục đích: Chuẩn bị máy Windows để nhận Replication từ Publisher (Ubuntu)
 * Chạy trên: SQL Server 2019 (Windows)
 * Người chạy: 5 bạn trong nhóm (Subscriber CN01-CN05)
 * 
 * HƯỚNG DẪN:
 * 1. Mở SSMS trên máy Windows
 * 2. Connect to localhost
 * 3. File → Open → Chọn file này
 * 4. Execute (F5)
 * 5. Chụp screenshot kết quả, gửi cho Tiến
 * ============================================
 */

USE master;
GO

PRINT '==============================================';
PRINT 'BƯỚC 1: Tạo database QuanLyNhanSu';
PRINT '==============================================';
GO

-- Tạo database (nếu chưa có)
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'QuanLyNhanSu')
BEGIN
    CREATE DATABASE QuanLyNhanSu;
    PRINT '✅ Đã tạo database QuanLyNhanSu';
END
ELSE
BEGIN
    PRINT '⚠️ Database QuanLyNhanSu đã tồn tại';
END
GO

USE QuanLyNhanSu;
GO

PRINT '';
PRINT '==============================================';
PRINT 'BƯỚC 2: Tạo bảng ChiNhanh';
PRINT '==============================================';
GO

-- Tạo bảng ChiNhanh (để sẵn sàng cho FK từ ChinhSach)
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ChiNhanh')
BEGIN
    CREATE TABLE ChiNhanh (
        ID_ChiNhanh VARCHAR(255) PRIMARY KEY,
        TenChiNhanh VARCHAR(255) NOT NULL,
        DiaChi VARCHAR(255),
        SoDienThoai VARCHAR(255),
        Email VARCHAR(255)
    );
    PRINT '✅ Đã tạo bảng ChiNhanh';
END
ELSE
BEGIN
    PRINT '⚠️ Bảng ChiNhanh đã tồn tại';
END
GO

-- Insert dữ liệu mẫu (7 chi nhánh)
IF NOT EXISTS (SELECT * FROM ChiNhanh WHERE ID_ChiNhanh = 'CN01')
BEGIN
    INSERT INTO ChiNhanh (ID_ChiNhanh, TenChiNhanh, DiaChi, SoDienThoai, Email)
    VALUES 
        ('CN01', 'Chi nhánh Huế', 'Thành phố Huế, Thừa Thiên Huế', '0234567890', 'hue@orgasm.vn'),
        ('CN02', 'Chi nhánh Nam Định', 'Thành phố Nam Định, Nam Định', '0228567890', 'namdinh@orgasm.vn'),
        ('CN03', 'Chi nhánh Vinh', 'Thành phố Vinh, Nghệ An', '0238567890', 'vinh@orgasm.vn'),
        ('CN04', 'Chi nhánh Nha Trang', 'Thành phố Nha Trang, Khánh Hòa', '0258567890', 'nhatrang@orgasm.vn'),
        ('CN05', 'Chi nhánh Thái Bình', 'Thành phố Thái Bình, Thái Bình', '0227567890', 'thaibinh@orgasm.vn'),
        ('CN06', 'Chi nhánh Đồng Nai', 'Thành phố Biên Hòa, Đồng Nai', '0251567890', 'dongnai@orgasm.vn'),
        ('CN07', 'Chi nhánh Bình Dương', 'Thành phố Thủ Dầu Một, Bình Dương', '0274567890', 'binhduong@orgasm.vn');
    
    PRINT '✅ Đã insert 7 chi nhánh';
END
ELSE
BEGIN
    PRINT '⚠️ Dữ liệu ChiNhanh đã tồn tại';
END
GO

PRINT '';
PRINT '==============================================';
PRINT 'BƯỚC 3: Tạo bảng ChinhSach (để nhận Replication)';
PRINT '==============================================';
GO

-- Tạo bảng ChinhSach
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ChinhSach')
BEGIN
    CREATE TABLE ChinhSach (
        ID_ChinhSach VARCHAR(255) PRIMARY KEY,
        ID_ChiNhanh VARCHAR(255),
        TenChinhSach VARCHAR(255) NOT NULL,
        NoiDung VARCHAR(255),
        NgayApDung DATE,
        FOREIGN KEY (ID_ChiNhanh) REFERENCES ChiNhanh(ID_ChiNhanh)
    );
    PRINT '✅ Đã tạo bảng ChinhSach';
    PRINT 'ℹ️ Bảng này sẽ nhận dữ liệu từ Publisher qua Replication';
END
ELSE
BEGIN
    PRINT '⚠️ Bảng ChinhSach đã tồn tại';
    PRINT 'ℹ️ Nếu muốn tạo lại, chạy: DROP TABLE ChinhSach;';
END
GO

PRINT '';
PRINT '==============================================';
PRINT 'BƯỚC 4: Kiểm tra cấu trúc database';
PRINT '==============================================';
GO

SELECT 
    'Bảng' AS Loai,
    TABLE_NAME AS Ten
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_NAME IN ('ChiNhanh', 'ChinhSach')
ORDER BY TABLE_NAME;
GO

PRINT '';
PRINT '==============================================';
PRINT 'BƯỚC 5: Kiểm tra dữ liệu hiện tại';
PRINT '==============================================';
GO

-- Kiểm tra số lượng chi nhánh
SELECT COUNT(*) AS SoChiNhanh FROM ChiNhanh;

-- Kiểm tra số lượng chính sách (trước khi replication sẽ là 0)
SELECT COUNT(*) AS SoChinhSach FROM ChinhSach;
GO

PRINT '';
PRINT '==============================================';
PRINT '✅ HOÀN TẤT SETUP SUBSCRIBER!';
PRINT '==============================================';
PRINT '';
PRINT 'BƯỚC TIẾP THEO:';
PRINT '1. Chụp screenshot kết quả này';
PRINT '2. Gửi cho Tiến trong group chat';
PRINT '3. Đợi Tiến setup Replication từ Publisher';
PRINT '4. Sau khi Replication chạy, chạy lại:';
PRINT '   SELECT COUNT(*) FROM ChinhSach;';
PRINT '   Phải thấy 70 chính sách';
PRINT '';
PRINT 'Nếu có lỗi, gửi screenshot cho Tiến!';
PRINT '==============================================';
GO
