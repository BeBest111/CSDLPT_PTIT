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