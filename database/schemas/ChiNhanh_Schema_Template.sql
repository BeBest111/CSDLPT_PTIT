/*
 * ============================================
 * DATABASE SCHEMA - CHI NHÁNH (SUBSCRIBER)
 * ============================================
 * Template cho 6 chi nhánh Windows
 * Mỗi chi nhánh có 1 database riêng
 * 
 * CÁC CHI NHÁNH:
 * 1. QuanLyNhanSu_CN01 - Huế
 * 2. QuanLyNhanSu_CN02 - Nam Định  
 * 3. QuanLyNhanSu_CN03 - Vinh
 * 4. QuanLyNhanSu_CN04 - Nha Trang
 * 5. QuanLyNhanSu_CN05 - Thái Bình
 * 6. QuanLyNhanSu_CN06 - Hải Phòng
 * 
 * Vai trò: Subscriber
 * - Nhận data ĐỌC từ Trụ sở (ChinhSach, ChucVu, DuAn...)
 * - Tự quản lý nhân viên CHI NHÁNH MÌNH
 * - Gửi data cập nhật về Trụ sở
 * ============================================
 */

-- ⚠️ THAY ĐỔI: Đổi 'CN01' thành mã chi nhánh tương ứng
-- CN01 = Huế, CN02 = Nam Định, CN03 = Vinh, etc.

USE master;
GO

DECLARE @ChiNhanh VARCHAR(10) = 'CN01'; -- ⚠️ THAY ĐỔI CHỖ NÀY!
DECLARE @TenChiNhanh NVARCHAR(100) = N'Huế'; -- ⚠️ THAY ĐỔI CHỖ NÀY!
DECLARE @DBName NVARCHAR(100) = 'QuanLyNhanSu_' + @ChiNhanh;
DECLARE @SQL NVARCHAR(MAX);

-- Tạo database cho chi nhánh
SET @SQL = N'
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = ''' + @DBName + ''')
BEGIN
    CREATE DATABASE ' + @DBName + ';
    PRINT ''✅ Đã tạo database chi nhánh ' + @TenChiNhanh + ''';
END';

EXEC sp_executesql @SQL;
GO

-- ⚠️ SỬA DÒNG NÀY theo chi nhánh
USE QuanLyNhanSu_CN01; -- Đổi CN01 → CN02, CN03, etc.
GO

ALTER DATABASE QuanLyNhanSu_CN01 -- Đổi tên database
COLLATE Vietnamese_CI_AS;
GO

-- Thông tin chi nhánh này
CREATE TABLE ChiNhanh_Info(
    MaChiNhanh VARCHAR(10) PRIMARY KEY,
    TenChiNhanh NVARCHAR(255) NOT NULL,
    DiaChi NVARCHAR(500),
    Email VARCHAR(255),
    SoDienThoai VARCHAR(20),
    VPN_IP VARCHAR(50),
    Publisher_IP VARCHAR(50) DEFAULT '100.71.73.74' -- IP Trụ sở
);

-- INSERT thông tin chi nhánh (⚠️ SỬA CHO ĐÚNG)
INSERT INTO ChiNhanh_Info VALUES 
('CN01', N'Chi nhánh Huế', N'123 Lê Lợi, Huế', 'hue@company.vn', '0234123456', NULL, '100.71.73.74');
GO

-- Bảng Chính sách (REPLICATE từ Trụ sở - CHỈ ĐỌC)
CREATE TABLE ChinhSach(
    ID_ChinhSach VARCHAR(50) PRIMARY KEY,
    TenChinhSach NVARCHAR(255),
    MoTa NVARCHAR(1000),
    NgayBatDau DATE,
    NgayKetThuc DATE,
    ApDungChoChiNhanh VARCHAR(50), -- NULL = tất cả, hoặc mã chi nhánh cụ thể
    TrangThai BIT DEFAULT 1
);

-- Bảng Chức vụ (REPLICATE từ Trụ sở - CHỈ ĐỌC)
CREATE TABLE ChucVu(
    ID_ChucVu VARCHAR(50) PRIMARY KEY,
    TenChucVu NVARCHAR(255),
    MaChucVu VARCHAR(20),
    BacLuong INT,
    MucLuongCoBan DECIMAL(18,2)
);

-- Bảng Phòng ban (CHỈ CỦA CHI NHÁNH NÀY)
CREATE TABLE PhongBan(
    ID_PhongBan VARCHAR(50) PRIMARY KEY,
    TenPhongBan NVARCHAR(255) NOT NULL,
    MaPhongBan VARCHAR(20),
    Email VARCHAR(255),
    SoDienThoai VARCHAR(20),
    NgayThanhLap DATE
);

-- Bảng Dự án (CHỈ CỦA CHI NHÁNH NÀY)
CREATE TABLE DuAn(
    ID_DuAn VARCHAR(50) PRIMARY KEY,
    ID_PhongBan VARCHAR(50),
    TenDuAn NVARCHAR(255) NOT NULL,
    MaDuAn VARCHAR(20),
    NgayBatDau DATE,
    NgayKetThuc DATE,
    ThoiHan INT,
    MoTa NVARCHAR(1000),
    TrangThai NVARCHAR(50),
    FOREIGN KEY(ID_PhongBan) REFERENCES PhongBan(ID_PhongBan)
);

-- Bảng Nhân viên (CHỈ NHÂN VIÊN CHI NHÁNH NÀY - 40 người)
CREATE TABLE NhanVien(
    ID_NhanVien VARCHAR(50) PRIMARY KEY,
    ID_PhongBan VARCHAR(50),
    ID_ChucVu VARCHAR(50),
    ID_DuAn VARCHAR(50),
    HoTen NVARCHAR(255) NOT NULL,
    MaNhanVien VARCHAR(20) UNIQUE NOT NULL,
    NgaySinh DATE,
    GioiTinh NVARCHAR(10),
    DanToc NVARCHAR(50),
    CCCD VARCHAR(20) UNIQUE,
    SoDienThoai VARCHAR(20),
    Email VARCHAR(255),	
    DiaChi NVARCHAR(500),
    NgayVaoLam DATE,
    TrangThai BIT DEFAULT 1,
    FOREIGN KEY(ID_PhongBan) REFERENCES PhongBan(ID_PhongBan),
    FOREIGN KEY(ID_ChucVu) REFERENCES ChucVu(ID_ChucVu),
    FOREIGN KEY(ID_DuAn) REFERENCES DuAn(ID_DuAn)
);

-- Bảng Lương (CHỈ LƯƠNG NHÂN VIÊN CHI NHÁNH NÀY)
CREATE TABLE Luong(
    ID_Luong VARCHAR(50) PRIMARY KEY,
    ID_NhanVien VARCHAR(50) NOT NULL,
    MucLuong DECIMAL(18,2),
    PhuCap DECIMAL(18,2),
    Thuong DECIMAL(18,2),
    ThangNam DATE,
    TongLuong AS (MucLuong + ISNULL(PhuCap,0) + ISNULL(Thuong,0)),
    FOREIGN KEY(ID_NhanVien) REFERENCES NhanVien(ID_NhanVien)
);

-- Bảng LOG đồng bộ với Trụ sở
CREATE TABLE SyncLog(
    ID_Log INT IDENTITY(1,1) PRIMARY KEY,
    HanhDong NVARCHAR(100), -- 'Nhận ChinhSach', 'Gửi NhanVien', etc.
    ThoiGian DATETIME DEFAULT GETDATE(),
    SoLuongBanGhi INT,
    TrangThai NVARCHAR(50),
    GhiChu NVARCHAR(500)
);

PRINT '';
PRINT '✅ HOÀN TẤT TẠO SCHEMA CHI NHÁNH!';
PRINT 'Vai trò: Subscriber';
PRINT 'Lưu ý: Sửa MaChiNhanh và TenChiNhanh cho đúng!';
GO
