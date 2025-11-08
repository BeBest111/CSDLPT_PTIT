/*
 * ============================================
 * DATABASE SCHEMA - TRỤ SỞ CHÍNH (PUBLISHER)
 * ============================================
 * Máy: Ubuntu (Tiến) - VPN IP: 100.71.73.74
 * Role: Publisher - Distributor
 * Database: QuanLyNhanSu_TruSo
 * 
 * NỘI DUNG:
 * - Quản lý TOÀN BỘ 7 chi nhánh
 * - Dữ liệu tổng hợp từ tất cả chi nhánh
 * - Replicate data CHỈ ĐỌC về các chi nhánh
 * ============================================
 */

USE master;
GO

-- Tạo database Trụ sở chính
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'QuanLyNhanSu_TruSo')
BEGIN
    CREATE DATABASE QuanLyNhanSu_TruSo;
    PRINT '✅ Đã tạo database Trụ sở chính';
END
GO

USE QuanLyNhanSu_TruSo;
GO

ALTER DATABASE QuanLyNhanSu_TruSo
COLLATE Vietnamese_CI_AS;
GO

-- Bảng Trụ sở chính
CREATE TABLE TruSoChinh(
    ID_TruSoChinh VARCHAR(50) PRIMARY KEY,
    TenTruSoChinh NVARCHAR(255) NOT NULL,
    DiaChi NVARCHAR(500),
    Email VARCHAR(255),	
    SoDienThoai VARCHAR(20),
    NgayThanhLap DATE,
    TrangThai BIT DEFAULT 1 -- 1: Hoạt động, 0: Ngừng
);

-- Bảng Chi nhánh (7 chi nhánh)
CREATE TABLE ChiNhanh(
    ID_ChiNhanh VARCHAR(50) PRIMARY KEY,
    ID_TruSoChinh VARCHAR(50),
    TenChiNhanh NVARCHAR(255) NOT NULL,
    MaChiNhanh VARCHAR(10) UNIQUE NOT NULL, -- CN01, CN02, ...
    DiaChi NVARCHAR(500),
    Email VARCHAR(255),	
    SoDienThoai VARCHAR(20),
    VPN_IP VARCHAR(50), -- IP VPN của chi nhánh
    NgayThanhLap DATE,
    TrangThai BIT DEFAULT 1,
    FOREIGN KEY(ID_TruSoChinh) REFERENCES TruSoChinh(ID_TruSoChinh)
);

-- Bảng Chính sách (áp dụng cho toàn công ty)
CREATE TABLE ChinhSach(
    ID_ChinhSach VARCHAR(50) PRIMARY KEY,
    ID_ChiNhanh VARCHAR(50) NULL, -- NULL = chính sách chung, có giá trị = chính sách riêng
    TenChinhSach NVARCHAR(255) NOT NULL,
    MoTa NVARCHAR(1000),
    NgayBatDau DATE,
    NgayKetThuc DATE,
    TrangThai BIT DEFAULT 1,
    FOREIGN KEY(ID_ChiNhanh) REFERENCES ChiNhanh(ID_ChiNhanh)
);

-- Bảng Phòng ban (tất cả phòng ban của 7 chi nhánh)
CREATE TABLE PhongBan(
    ID_PhongBan VARCHAR(50) PRIMARY KEY,
    ID_ChiNhanh VARCHAR(50) NOT NULL,
    TenPhongBan NVARCHAR(255) NOT NULL,
    MaPhongBan VARCHAR(20),
    Email VARCHAR(255),
    SoDienThoai VARCHAR(20),
    FOREIGN KEY(ID_ChiNhanh) REFERENCES ChiNhanh(ID_ChiNhanh)
);

-- Bảng Dự án (tất cả dự án của 7 chi nhánh)
CREATE TABLE DuAn(
    ID_DuAn VARCHAR(50) PRIMARY KEY,
    ID_PhongBan VARCHAR(50),
    ID_ChiNhanh VARCHAR(50), -- Thêm để query nhanh
    TenDuAn NVARCHAR(255) NOT NULL,
    MaDuAn VARCHAR(20),
    NgayBatDau DATE,
    NgayKetThuc DATE,
    ThoiHan INT, -- Số ngày
    MoTa NVARCHAR(1000),
    TrangThai NVARCHAR(50), -- 'Đang thực hiện', 'Hoàn thành', 'Tạm dừng'
    FOREIGN KEY(ID_PhongBan) REFERENCES PhongBan(ID_PhongBan),
    FOREIGN KEY(ID_ChiNhanh) REFERENCES ChiNhanh(ID_ChiNhanh)
);

-- Bảng Chức vụ
CREATE TABLE ChucVu(
    ID_ChucVu VARCHAR(50) PRIMARY KEY,
    TenChucVu NVARCHAR(255) NOT NULL,
    MaChucVu VARCHAR(20),
    BacLuong INT,
    MucLuongCoBan DECIMAL(18,2)
);

-- Bảng Nhân viên (TẤT CẢ 280 nhân viên từ 7 chi nhánh)
CREATE TABLE NhanVien(
    ID_NhanVien VARCHAR(50) PRIMARY KEY,
    ID_ChiNhanh VARCHAR(50) NOT NULL, -- Chi nhánh đang làm việc
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
    TrangThai BIT DEFAULT 1, -- 1: Đang làm, 0: Đã nghỉ
    FOREIGN KEY(ID_ChiNhanh) REFERENCES ChiNhanh(ID_ChiNhanh),
    FOREIGN KEY(ID_PhongBan) REFERENCES PhongBan(ID_PhongBan),
    FOREIGN KEY(ID_ChucVu) REFERENCES ChucVu(ID_ChucVu),
    FOREIGN KEY(ID_DuAn) REFERENCES DuAn(ID_DuAn)
);

-- Bảng Lương
CREATE TABLE Luong(
    ID_Luong VARCHAR(50) PRIMARY KEY,
    ID_NhanVien VARCHAR(50) NOT NULL,
    MucLuong DECIMAL(18,2),
    PhuCap DECIMAL(18,2),
    Thuong DECIMAL(18,2),
    ThangNam DATE, -- Tháng/năm tính lương
    TongLuong AS (MucLuong + ISNULL(PhuCap,0) + ISNULL(Thuong,0)),
    FOREIGN KEY(ID_NhanVien) REFERENCES NhanVien(ID_NhanVien)
);

-- Bảng LOG đồng bộ (tracking replication)
CREATE TABLE SyncLog(
    ID_Log INT IDENTITY(1,1) PRIMARY KEY,
    ChiNhanh VARCHAR(50),
    ThoiGian DATETIME DEFAULT GETDATE(),
    SoLuongBanGhi INT,
    TrangThai NVARCHAR(50),
    GhiChu NVARCHAR(500)
);

PRINT '';
PRINT '✅ HOÀN TẤT TẠO SCHEMA TRỤ SỞ CHÍNH!';
PRINT 'Database: QuanLyNhanSu_TruSo';
PRINT 'Vai trò: Publisher - Quản lý toàn bộ hệ thống';
GO
