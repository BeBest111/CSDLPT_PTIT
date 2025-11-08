USE QuanLyNhanSu_TruSo;
GO

-- ============================================
-- DATA GENERATION - TRỤ SỞ CHÍNH
-- Generated: 2025-11-08 16:59:20
-- ============================================

-- 1. TRỤ SỞ CHÍNH
INSERT INTO TruSoChinh (ID_TruSoChinh, TenTruSoChinh, DiaChi, Email, SoDienThoai, NgayThanhLap, TrangThai)
VALUES ('TSC01', N'Công ty TNHH Quản lý Nhân sự Việt Nam', N'123 Trần Hưng Đạo, Hoàn Kiếm, Hà Nội', 'contact@company.vn', '0243123456', '2010-01-15', 1);
GO

-- 2. CHI NHÁNH (7 chi nhánh)
INSERT INTO ChiNhanh (ID_ChiNhanh, ID_TruSoChinh, TenChiNhanh, MaChiNhanh, DiaChi, Email, SoDienThoai, VPN_IP, NgayThanhLap, TrangThai)
VALUES ('CN00', 'TSC01', N'Trụ sở chính Hà Nội', 'CN00', N'123 Trần Hưng Đạo, Hoàn Kiếm, Hà Nội', 'hanoi@company.vn', '0243123456', '100.71.73.74', '2011-10-28', 1);
INSERT INTO ChiNhanh (ID_ChiNhanh, ID_TruSoChinh, TenChiNhanh, MaChiNhanh, DiaChi, Email, SoDienThoai, VPN_IP, NgayThanhLap, TrangThai)
VALUES ('CN01', 'TSC01', N'Chi nhánh Huế', 'CN01', N'456 Lê Lợi, Thành phố Huế', 'hue@company.vn', '0234123456', '100.98.162.243', '2020-09-29', 1);
INSERT INTO ChiNhanh (ID_ChiNhanh, ID_TruSoChinh, TenChiNhanh, MaChiNhanh, DiaChi, Email, SoDienThoai, VPN_IP, NgayThanhLap, TrangThai)
VALUES ('CN02', 'TSC01', N'Chi nhánh Nam Định', 'CN02', N'789 Trần Phú, Thành phố Nam Định', 'namdinh@company.vn', '0228123456', '100.100.223.213', '2012-07-13', 1);
INSERT INTO ChiNhanh (ID_ChiNhanh, ID_TruSoChinh, TenChiNhanh, MaChiNhanh, DiaChi, Email, SoDienThoai, VPN_IP, NgayThanhLap, TrangThai)
VALUES ('CN03', 'TSC01', N'Chi nhánh Vinh', 'CN03', N'321 Quang Trung, Thành phố Vinh', 'vinh@company.vn', '0238123456', '100.80.112.124', '2019-01-30', 1);
INSERT INTO ChiNhanh (ID_ChiNhanh, ID_TruSoChinh, TenChiNhanh, MaChiNhanh, DiaChi, Email, SoDienThoai, VPN_IP, NgayThanhLap, TrangThai)
VALUES ('CN04', 'TSC01', N'Chi nhánh Nha Trang', 'CN04', N'654 Trần Phú, Thành phố Nha Trang', 'nhatrang@company.vn', '0258123456', '100.87.204.231', '2010-03-03', 1);
INSERT INTO ChiNhanh (ID_ChiNhanh, ID_TruSoChinh, TenChiNhanh, MaChiNhanh, DiaChi, Email, SoDienThoai, VPN_IP, NgayThanhLap, TrangThai)
VALUES ('CN05', 'TSC01', N'Chi nhánh Thái Bình', 'CN05', N'987 Lý Bôn, Thành phố Thái Bình', 'thaibinh@company.vn', '0227123456', '100.95.78.154', '2014-05-03', 1);
INSERT INTO ChiNhanh (ID_ChiNhanh, ID_TruSoChinh, TenChiNhanh, MaChiNhanh, DiaChi, Email, SoDienThoai, VPN_IP, NgayThanhLap, TrangThai)
VALUES ('CN06', 'TSC01', N'Chi nhánh Hải Phòng', 'CN06', N'147 Điện Biên Phủ, Hải Phòng', 'haiphong@company.vn', '0225123456', '100.84.94.84', '2018-09-16', 1);
GO

-- 3. CHỨC VỤ
INSERT INTO ChucVu (ID_ChucVu, TenChucVu, MaChucVu, BacLuong, MucLuongCoBan)
VALUES ('CV01', N'Giám đốc', 'GD', 10, 50000000);
INSERT INTO ChucVu (ID_ChucVu, TenChucVu, MaChucVu, BacLuong, MucLuongCoBan)
VALUES ('CV02', N'Phó giám đốc', 'PGD', 9, 40000000);
INSERT INTO ChucVu (ID_ChucVu, TenChucVu, MaChucVu, BacLuong, MucLuongCoBan)
VALUES ('CV03', N'Trưởng phòng', 'TP', 8, 30000000);
INSERT INTO ChucVu (ID_ChucVu, TenChucVu, MaChucVu, BacLuong, MucLuongCoBan)
VALUES ('CV04', N'Phó phòng', 'PP', 7, 25000000);
INSERT INTO ChucVu (ID_ChucVu, TenChucVu, MaChucVu, BacLuong, MucLuongCoBan)
VALUES ('CV05', N'Trưởng nhóm', 'TN', 6, 20000000);
INSERT INTO ChucVu (ID_ChucVu, TenChucVu, MaChucVu, BacLuong, MucLuongCoBan)
VALUES ('CV06', N'Chuyên viên chính', 'CVC', 5, 15000000);
INSERT INTO ChucVu (ID_ChucVu, TenChucVu, MaChucVu, BacLuong, MucLuongCoBan)
VALUES ('CV07', N'Chuyên viên', 'CV', 4, 12000000);
INSERT INTO ChucVu (ID_ChucVu, TenChucVu, MaChucVu, BacLuong, MucLuongCoBan)
VALUES ('CV08', N'Nhân viên', 'NV', 3, 10000000);
INSERT INTO ChucVu (ID_ChucVu, TenChucVu, MaChucVu, BacLuong, MucLuongCoBan)
VALUES ('CV09', N'Thực tập sinh', 'TTS', 2, 5000000);
INSERT INTO ChucVu (ID_ChucVu, TenChucVu, MaChucVu, BacLuong, MucLuongCoBan)
VALUES ('CV10', N'Cộng tác viên', 'CTV', 1, 4000000);
GO

-- 4. CHÍNH SÁCH
INSERT INTO ChinhSach (ID_ChinhSach, ID_ChiNhanh, TenChinhSach, MoTa, NgayBatDau, NgayKetThuc, TrangThai)
VALUES ('CS001', NULL, N'Chính sách bảo hiểm xã hội', N'Áp dụng cho tất cả nhân viên chính thức', '2023-12-27', '2025-12-19', 1);
INSERT INTO ChinhSach (ID_ChinhSach, ID_ChiNhanh, TenChinhSach, MoTa, NgayBatDau, NgayKetThuc, TrangThai)
VALUES ('CS002', NULL, N'Chính sách nghỉ phép năm', N'15 ngày phép/năm cho nhân viên', '2021-11-14', '2025-06-22', 1);
INSERT INTO ChinhSach (ID_ChinhSach, ID_ChiNhanh, TenChinhSach, MoTa, NgayBatDau, NgayKetThuc, TrangThai)
VALUES ('CS003', NULL, N'Chính sách thưởng tết', N'Thưởng tết dựa trên kết quả làm việc', '2020-10-05', '2025-08-15', 1);
INSERT INTO ChinhSach (ID_ChinhSach, ID_ChiNhanh, TenChinhSach, MoTa, NgayBatDau, NgayKetThuc, TrangThai)
VALUES ('CS004', NULL, N'Chính sách đào tạo', N'Hỗ trợ 100% học phí các khóa đào tạo', '2021-11-13', '2025-12-04', 1);
INSERT INTO ChinhSach (ID_ChinhSach, ID_ChiNhanh, TenChinhSach, MoTa, NgayBatDau, NgayKetThuc, TrangThai)
VALUES ('CS005', 'CN00', N'Chính sách đặc thù Hà Nội', N'Chính sách riêng cho Hà Nội', '2023-06-13', '2026-03-20', 1);
INSERT INTO ChinhSach (ID_ChinhSach, ID_ChiNhanh, TenChinhSach, MoTa, NgayBatDau, NgayKetThuc, TrangThai)
VALUES ('CS006', 'CN01', N'Chính sách đặc thù Huế', N'Chính sách riêng cho Huế', '2022-08-19', '2026-11-07', 1);
INSERT INTO ChinhSach (ID_ChinhSach, ID_ChiNhanh, TenChinhSach, MoTa, NgayBatDau, NgayKetThuc, TrangThai)
VALUES ('CS007', 'CN02', N'Chính sách đặc thù Nam Định', N'Chính sách riêng cho Nam Định', '2022-09-25', '2025-05-21', 1);
INSERT INTO ChinhSach (ID_ChinhSach, ID_ChiNhanh, TenChinhSach, MoTa, NgayBatDau, NgayKetThuc, TrangThai)
VALUES ('CS008', 'CN03', N'Chính sách đặc thù Vinh', N'Chính sách riêng cho Vinh', '2022-05-13', '2027-10-29', 1);
INSERT INTO ChinhSach (ID_ChinhSach, ID_ChiNhanh, TenChinhSach, MoTa, NgayBatDau, NgayKetThuc, TrangThai)
VALUES ('CS009', 'CN04', N'Chính sách đặc thù Nha Trang', N'Chính sách riêng cho Nha Trang', '2021-10-24', '2025-08-04', 1);
INSERT INTO ChinhSach (ID_ChinhSach, ID_ChiNhanh, TenChinhSach, MoTa, NgayBatDau, NgayKetThuc, TrangThai)
VALUES ('CS010', 'CN05', N'Chính sách đặc thù Thái Bình', N'Chính sách riêng cho Thái Bình', '2021-04-22', '2025-04-22', 1);
INSERT INTO ChinhSach (ID_ChinhSach, ID_ChiNhanh, TenChinhSach, MoTa, NgayBatDau, NgayKetThuc, TrangThai)
VALUES ('CS011', 'CN06', N'Chính sách đặc thù Hải Phòng', N'Chính sách riêng cho Hải Phòng', '2022-07-21', '2025-12-18', 1);
GO

-- 5. PHÒNG BAN (70 phòng - 10/chi nhánh)
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB001', 'CN00', N'Nhân sự', 'CN00-PB01', 'nhânsự@cn00.vn', '0954756982');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB002', 'CN00', N'Kế toán', 'CN00-PB02', 'kếtoán@cn00.vn', '0967351554');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB003', 'CN00', N'Kinh doanh', 'CN00-PB03', 'kinhdoanh@cn00.vn', '0966665895');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB004', 'CN00', N'Marketing', 'CN00-PB04', 'marketing@cn00.vn', '0974211874');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB005', 'CN00', N'IT', 'CN00-PB05', 'it@cn00.vn', '0995475612');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB006', 'CN00', N'Hành chính', 'CN00-PB06', 'hànhchính@cn00.vn', '0968701013');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB007', 'CN00', N'Sản xuất', 'CN00-PB07', 'sảnxuất@cn00.vn', '0979631323');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB008', 'CN00', N'Kỹ thuật', 'CN00-PB08', 'kỹthuật@cn00.vn', '0960992537');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB009', 'CN00', N'Nghiên cứu', 'CN00-PB09', 'nghiêncứu@cn00.vn', '0934884917');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB010', 'CN00', N'Chăm sóc KH', 'CN00-PB10', 'chămsóckh@cn00.vn', '0939043963');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB011', 'CN01', N'Nhân sự', 'CN01-PB01', 'nhânsự@cn01.vn', '0959315735');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB012', 'CN01', N'Kế toán', 'CN01-PB02', 'kếtoán@cn01.vn', '0979348095');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB013', 'CN01', N'Kinh doanh', 'CN01-PB03', 'kinhdoanh@cn01.vn', '0970259115');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB014', 'CN01', N'Marketing', 'CN01-PB04', 'marketing@cn01.vn', '0931328755');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB015', 'CN01', N'IT', 'CN01-PB05', 'it@cn01.vn', '0977792128');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB016', 'CN01', N'Hành chính', 'CN01-PB06', 'hànhchính@cn01.vn', '0918066385');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB017', 'CN01', N'Sản xuất', 'CN01-PB07', 'sảnxuất@cn01.vn', '0932346805');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB018', 'CN01', N'Kỹ thuật', 'CN01-PB08', 'kỹthuật@cn01.vn', '0967520224');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB019', 'CN01', N'Nghiên cứu', 'CN01-PB09', 'nghiêncứu@cn01.vn', '0914443643');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB020', 'CN01', N'Chăm sóc KH', 'CN01-PB10', 'chămsóckh@cn01.vn', '0947353734');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB021', 'CN02', N'Nhân sự', 'CN02-PB01', 'nhânsự@cn02.vn', '0947150729');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB022', 'CN02', N'Kế toán', 'CN02-PB02', 'kếtoán@cn02.vn', '0910394415');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB023', 'CN02', N'Kinh doanh', 'CN02-PB03', 'kinhdoanh@cn02.vn', '0963078953');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB024', 'CN02', N'Marketing', 'CN02-PB04', 'marketing@cn02.vn', '0914437230');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB025', 'CN02', N'IT', 'CN02-PB05', 'it@cn02.vn', '0927752001');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB026', 'CN02', N'Hành chính', 'CN02-PB06', 'hànhchính@cn02.vn', '0993619574');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB027', 'CN02', N'Sản xuất', 'CN02-PB07', 'sảnxuất@cn02.vn', '0977748087');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB028', 'CN02', N'Kỹ thuật', 'CN02-PB08', 'kỹthuật@cn02.vn', '0969494744');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB029', 'CN02', N'Nghiên cứu', 'CN02-PB09', 'nghiêncứu@cn02.vn', '0967016646');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB030', 'CN02', N'Chăm sóc KH', 'CN02-PB10', 'chămsóckh@cn02.vn', '0964893962');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB031', 'CN03', N'Nhân sự', 'CN03-PB01', 'nhânsự@cn03.vn', '0996605681');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB032', 'CN03', N'Kế toán', 'CN03-PB02', 'kếtoán@cn03.vn', '0936700797');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB033', 'CN03', N'Kinh doanh', 'CN03-PB03', 'kinhdoanh@cn03.vn', '0990226114');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB034', 'CN03', N'Marketing', 'CN03-PB04', 'marketing@cn03.vn', '0953844553');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB035', 'CN03', N'IT', 'CN03-PB05', 'it@cn03.vn', '0986099435');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB036', 'CN03', N'Hành chính', 'CN03-PB06', 'hànhchính@cn03.vn', '0994114282');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB037', 'CN03', N'Sản xuất', 'CN03-PB07', 'sảnxuất@cn03.vn', '0939524270');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB038', 'CN03', N'Kỹ thuật', 'CN03-PB08', 'kỹthuật@cn03.vn', '0924187179');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB039', 'CN03', N'Nghiên cứu', 'CN03-PB09', 'nghiêncứu@cn03.vn', '0999024755');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB040', 'CN03', N'Chăm sóc KH', 'CN03-PB10', 'chămsóckh@cn03.vn', '0935461275');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB041', 'CN04', N'Nhân sự', 'CN04-PB01', 'nhânsự@cn04.vn', '0938667082');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB042', 'CN04', N'Kế toán', 'CN04-PB02', 'kếtoán@cn04.vn', '0943069533');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB043', 'CN04', N'Kinh doanh', 'CN04-PB03', 'kinhdoanh@cn04.vn', '0996452707');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB044', 'CN04', N'Marketing', 'CN04-PB04', 'marketing@cn04.vn', '0992678274');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB045', 'CN04', N'IT', 'CN04-PB05', 'it@cn04.vn', '0930824311');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB046', 'CN04', N'Hành chính', 'CN04-PB06', 'hànhchính@cn04.vn', '0951314230');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB047', 'CN04', N'Sản xuất', 'CN04-PB07', 'sảnxuất@cn04.vn', '0998640702');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB048', 'CN04', N'Kỹ thuật', 'CN04-PB08', 'kỹthuật@cn04.vn', '0929722803');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB049', 'CN04', N'Nghiên cứu', 'CN04-PB09', 'nghiêncứu@cn04.vn', '0940631381');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB050', 'CN04', N'Chăm sóc KH', 'CN04-PB10', 'chămsóckh@cn04.vn', '0995540244');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB051', 'CN05', N'Nhân sự', 'CN05-PB01', 'nhânsự@cn05.vn', '0980481738');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB052', 'CN05', N'Kế toán', 'CN05-PB02', 'kếtoán@cn05.vn', '0931510004');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB053', 'CN05', N'Kinh doanh', 'CN05-PB03', 'kinhdoanh@cn05.vn', '0958728349');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB054', 'CN05', N'Marketing', 'CN05-PB04', 'marketing@cn05.vn', '0956514464');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB055', 'CN05', N'IT', 'CN05-PB05', 'it@cn05.vn', '0916354584');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB056', 'CN05', N'Hành chính', 'CN05-PB06', 'hànhchính@cn05.vn', '0982258830');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB057', 'CN05', N'Sản xuất', 'CN05-PB07', 'sảnxuất@cn05.vn', '0996664829');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB058', 'CN05', N'Kỹ thuật', 'CN05-PB08', 'kỹthuật@cn05.vn', '0980757343');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB059', 'CN05', N'Nghiên cứu', 'CN05-PB09', 'nghiêncứu@cn05.vn', '0972768879');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB060', 'CN05', N'Chăm sóc KH', 'CN05-PB10', 'chămsóckh@cn05.vn', '0994085387');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB061', 'CN06', N'Nhân sự', 'CN06-PB01', 'nhânsự@cn06.vn', '0912867567');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB062', 'CN06', N'Kế toán', 'CN06-PB02', 'kếtoán@cn06.vn', '0915741897');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB063', 'CN06', N'Kinh doanh', 'CN06-PB03', 'kinhdoanh@cn06.vn', '0980587314');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB064', 'CN06', N'Marketing', 'CN06-PB04', 'marketing@cn06.vn', '0998235251');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB065', 'CN06', N'IT', 'CN06-PB05', 'it@cn06.vn', '0973229424');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB066', 'CN06', N'Hành chính', 'CN06-PB06', 'hànhchính@cn06.vn', '0999870086');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB067', 'CN06', N'Sản xuất', 'CN06-PB07', 'sảnxuất@cn06.vn', '0989340838');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB068', 'CN06', N'Kỹ thuật', 'CN06-PB08', 'kỹthuật@cn06.vn', '0969015922');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB069', 'CN06', N'Nghiên cứu', 'CN06-PB09', 'nghiêncứu@cn06.vn', '0951053741');
INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)
VALUES ('PB070', 'CN06', N'Chăm sóc KH', 'CN06-PB10', 'chămsóckh@cn06.vn', '0992760363');
GO

-- 6. DỰ ÁN (70 dự án - 10/chi nhánh)
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA001', 'PB001', 'CN00', N'Dự án Phát triển Hà Nội 1', 'CN00-DA01', '2022-08-10', '2026-11-01', 577, N'Mô tả Dự án Phát triển Hà Nội 1', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA002', 'PB002', 'CN00', N'Dự án Mở rộng Hà Nội 2', 'CN00-DA02', '2022-02-04', '2026-01-18', 508, N'Mô tả Dự án Mở rộng Hà Nội 2', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA003', 'PB003', 'CN00', N'Dự án Số hóa Hà Nội 3', 'CN00-DA03', '2023-01-17', '2025-05-06', 410, N'Mô tả Dự án Số hóa Hà Nội 3', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA004', 'PB004', 'CN00', N'Dự án Mở rộng Hà Nội 4', 'CN00-DA04', '2024-04-17', '2026-04-15', 658, N'Mô tả Dự án Mở rộng Hà Nội 4', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA005', 'PB005', 'CN00', N'Dự án Mở rộng Hà Nội 5', 'CN00-DA05', '2023-09-14', '2025-10-03', 626, N'Mô tả Dự án Mở rộng Hà Nội 5', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA006', 'PB006', 'CN00', N'Dự án Phát triển Hà Nội 6', 'CN00-DA06', '2022-04-13', '2026-06-03', 354, N'Mô tả Dự án Phát triển Hà Nội 6', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA007', 'PB007', 'CN00', N'Dự án Số hóa Hà Nội 7', 'CN00-DA07', '2023-12-19', '2026-06-14', 223, N'Mô tả Dự án Số hóa Hà Nội 7', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA008', 'PB008', 'CN00', N'Dự án Mở rộng Hà Nội 8', 'CN00-DA08', '2023-09-01', '2026-04-12', 412, N'Mô tả Dự án Mở rộng Hà Nội 8', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA009', 'PB009', 'CN00', N'Dự án Mở rộng Hà Nội 9', 'CN00-DA09', '2022-05-20', '2026-03-02', 654, N'Mô tả Dự án Mở rộng Hà Nội 9', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA010', 'PB010', 'CN00', N'Dự án Nâng cấp Hà Nội 10', 'CN00-DA10', '2023-12-09', '2025-12-15', 388, N'Mô tả Dự án Nâng cấp Hà Nội 10', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA011', 'PB011', 'CN01', N'Dự án Nâng cấp Huế 1', 'CN01-DA01', '2024-11-25', '2025-08-29', 457, N'Mô tả Dự án Nâng cấp Huế 1', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA012', 'PB012', 'CN01', N'Dự án Phát triển Huế 2', 'CN01-DA02', '2023-12-13', '2026-11-21', 547, N'Mô tả Dự án Phát triển Huế 2', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA013', 'PB013', 'CN01', N'Dự án Phát triển Huế 3', 'CN01-DA03', '2024-11-22', '2026-04-18', 482, N'Mô tả Dự án Phát triển Huế 3', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA014', 'PB014', 'CN01', N'Dự án Mở rộng Huế 4', 'CN01-DA04', '2022-05-14', '2025-10-02', 385, N'Mô tả Dự án Mở rộng Huế 4', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA015', 'PB015', 'CN01', N'Dự án Số hóa Huế 5', 'CN01-DA05', '2023-07-20', '2026-07-14', 554, N'Mô tả Dự án Số hóa Huế 5', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA016', 'PB016', 'CN01', N'Dự án Phát triển Huế 6', 'CN01-DA06', '2023-12-09', '2025-02-15', 410, N'Mô tả Dự án Phát triển Huế 6', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA017', 'PB017', 'CN01', N'Dự án Nâng cấp Huế 7', 'CN01-DA07', '2024-11-09', '2025-11-03', 470, N'Mô tả Dự án Nâng cấp Huế 7', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA018', 'PB018', 'CN01', N'Dự án Mở rộng Huế 8', 'CN01-DA08', '2023-01-20', '2026-08-10', 612, N'Mô tả Dự án Mở rộng Huế 8', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA019', 'PB019', 'CN01', N'Dự án Nâng cấp Huế 9', 'CN01-DA09', '2022-06-22', '2026-09-07', 647, N'Mô tả Dự án Nâng cấp Huế 9', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA020', 'PB020', 'CN01', N'Dự án Phát triển Huế 10', 'CN01-DA10', '2022-02-11', '2025-03-14', 204, N'Mô tả Dự án Phát triển Huế 10', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA021', 'PB021', 'CN02', N'Dự án Nâng cấp Nam Định 1', 'CN02-DA01', '2024-06-03', '2026-08-12', 373, N'Mô tả Dự án Nâng cấp Nam Định 1', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA022', 'PB022', 'CN02', N'Dự án Nâng cấp Nam Định 2', 'CN02-DA02', '2023-10-28', '2026-10-06', 572, N'Mô tả Dự án Nâng cấp Nam Định 2', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA023', 'PB023', 'CN02', N'Dự án Nâng cấp Nam Định 3', 'CN02-DA03', '2022-08-24', '2026-03-31', 488, N'Mô tả Dự án Nâng cấp Nam Định 3', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA024', 'PB024', 'CN02', N'Dự án Phát triển Nam Định 4', 'CN02-DA04', '2023-01-30', '2026-07-07', 238, N'Mô tả Dự án Phát triển Nam Định 4', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA025', 'PB025', 'CN02', N'Dự án Số hóa Nam Định 5', 'CN02-DA05', '2023-10-08', '2026-12-24', 530, N'Mô tả Dự án Số hóa Nam Định 5', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA026', 'PB026', 'CN02', N'Dự án Số hóa Nam Định 6', 'CN02-DA06', '2022-11-08', '2026-05-16', 535, N'Mô tả Dự án Số hóa Nam Định 6', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA027', 'PB027', 'CN02', N'Dự án Phát triển Nam Định 7', 'CN02-DA07', '2023-07-31', '2025-05-27', 709, N'Mô tả Dự án Phát triển Nam Định 7', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA028', 'PB028', 'CN02', N'Dự án Số hóa Nam Định 8', 'CN02-DA08', '2024-01-06', '2026-04-17', 570, N'Mô tả Dự án Số hóa Nam Định 8', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA029', 'PB029', 'CN02', N'Dự án Số hóa Nam Định 9', 'CN02-DA09', '2024-02-16', '2025-12-24', 243, N'Mô tả Dự án Số hóa Nam Định 9', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA030', 'PB030', 'CN02', N'Dự án Phát triển Nam Định 10', 'CN02-DA10', '2022-05-04', '2025-09-22', 267, N'Mô tả Dự án Phát triển Nam Định 10', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA031', 'PB031', 'CN03', N'Dự án Số hóa Vinh 1', 'CN03-DA01', '2023-12-10', '2025-07-27', 388, N'Mô tả Dự án Số hóa Vinh 1', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA032', 'PB032', 'CN03', N'Dự án Số hóa Vinh 2', 'CN03-DA02', '2024-04-25', '2025-05-24', 436, N'Mô tả Dự án Số hóa Vinh 2', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA033', 'PB033', 'CN03', N'Dự án Mở rộng Vinh 3', 'CN03-DA03', '2023-06-16', '2025-11-28', 221, N'Mô tả Dự án Mở rộng Vinh 3', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA034', 'PB034', 'CN03', N'Dự án Nâng cấp Vinh 4', 'CN03-DA04', '2022-11-24', '2025-10-24', 538, N'Mô tả Dự án Nâng cấp Vinh 4', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA035', 'PB035', 'CN03', N'Dự án Phát triển Vinh 5', 'CN03-DA05', '2023-10-09', '2026-06-04', 486, N'Mô tả Dự án Phát triển Vinh 5', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA036', 'PB036', 'CN03', N'Dự án Nâng cấp Vinh 6', 'CN03-DA06', '2022-04-05', '2026-06-16', 656, N'Mô tả Dự án Nâng cấp Vinh 6', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA037', 'PB037', 'CN03', N'Dự án Mở rộng Vinh 7', 'CN03-DA07', '2023-04-11', '2026-05-31', 593, N'Mô tả Dự án Mở rộng Vinh 7', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA038', 'PB038', 'CN03', N'Dự án Mở rộng Vinh 8', 'CN03-DA08', '2023-02-12', '2026-01-18', 412, N'Mô tả Dự án Mở rộng Vinh 8', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA039', 'PB039', 'CN03', N'Dự án Mở rộng Vinh 9', 'CN03-DA09', '2023-01-31', '2026-09-21', 692, N'Mô tả Dự án Mở rộng Vinh 9', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA040', 'PB040', 'CN03', N'Dự án Phát triển Vinh 10', 'CN03-DA10', '2022-10-17', '2026-11-20', 294, N'Mô tả Dự án Phát triển Vinh 10', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA041', 'PB041', 'CN04', N'Dự án Nâng cấp Nha Trang 1', 'CN04-DA01', '2023-11-02', '2025-06-11', 206, N'Mô tả Dự án Nâng cấp Nha Trang 1', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA042', 'PB042', 'CN04', N'Dự án Nâng cấp Nha Trang 2', 'CN04-DA02', '2022-04-28', '2025-04-27', 659, N'Mô tả Dự án Nâng cấp Nha Trang 2', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA043', 'PB043', 'CN04', N'Dự án Nâng cấp Nha Trang 3', 'CN04-DA03', '2023-10-23', '2025-05-01', 476, N'Mô tả Dự án Nâng cấp Nha Trang 3', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA044', 'PB044', 'CN04', N'Dự án Nâng cấp Nha Trang 4', 'CN04-DA04', '2024-07-17', '2026-12-09', 245, N'Mô tả Dự án Nâng cấp Nha Trang 4', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA045', 'PB045', 'CN04', N'Dự án Nâng cấp Nha Trang 5', 'CN04-DA05', '2023-07-06', '2026-04-15', 272, N'Mô tả Dự án Nâng cấp Nha Trang 5', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA046', 'PB046', 'CN04', N'Dự án Số hóa Nha Trang 6', 'CN04-DA06', '2024-04-20', '2026-12-16', 695, N'Mô tả Dự án Số hóa Nha Trang 6', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA047', 'PB047', 'CN04', N'Dự án Mở rộng Nha Trang 7', 'CN04-DA07', '2022-09-26', '2025-04-27', 644, N'Mô tả Dự án Mở rộng Nha Trang 7', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA048', 'PB048', 'CN04', N'Dự án Số hóa Nha Trang 8', 'CN04-DA08', '2024-06-18', '2025-11-27', 504, N'Mô tả Dự án Số hóa Nha Trang 8', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA049', 'PB049', 'CN04', N'Dự án Số hóa Nha Trang 9', 'CN04-DA09', '2024-03-10', '2026-09-12', 319, N'Mô tả Dự án Số hóa Nha Trang 9', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA050', 'PB050', 'CN04', N'Dự án Mở rộng Nha Trang 10', 'CN04-DA10', '2023-02-27', '2025-11-30', 293, N'Mô tả Dự án Mở rộng Nha Trang 10', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA051', 'PB051', 'CN05', N'Dự án Nâng cấp Thái Bình 1', 'CN05-DA01', '2023-07-09', '2025-11-10', 323, N'Mô tả Dự án Nâng cấp Thái Bình 1', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA052', 'PB052', 'CN05', N'Dự án Mở rộng Thái Bình 2', 'CN05-DA02', '2023-04-13', '2025-12-09', 333, N'Mô tả Dự án Mở rộng Thái Bình 2', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA053', 'PB053', 'CN05', N'Dự án Mở rộng Thái Bình 3', 'CN05-DA03', '2023-11-22', '2026-12-07', 324, N'Mô tả Dự án Mở rộng Thái Bình 3', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA054', 'PB054', 'CN05', N'Dự án Số hóa Thái Bình 4', 'CN05-DA04', '2023-11-19', '2026-08-14', 195, N'Mô tả Dự án Số hóa Thái Bình 4', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA055', 'PB055', 'CN05', N'Dự án Mở rộng Thái Bình 5', 'CN05-DA05', '2023-03-10', '2025-11-24', 697, N'Mô tả Dự án Mở rộng Thái Bình 5', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA056', 'PB056', 'CN05', N'Dự án Phát triển Thái Bình 6', 'CN05-DA06', '2024-04-20', '2025-04-21', 599, N'Mô tả Dự án Phát triển Thái Bình 6', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA057', 'PB057', 'CN05', N'Dự án Nâng cấp Thái Bình 7', 'CN05-DA07', '2023-07-28', '2026-09-09', 460, N'Mô tả Dự án Nâng cấp Thái Bình 7', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA058', 'PB058', 'CN05', N'Dự án Mở rộng Thái Bình 8', 'CN05-DA08', '2022-12-09', '2026-02-20', 413, N'Mô tả Dự án Mở rộng Thái Bình 8', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA059', 'PB059', 'CN05', N'Dự án Số hóa Thái Bình 9', 'CN05-DA09', '2024-11-10', '2025-08-06', 540, N'Mô tả Dự án Số hóa Thái Bình 9', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA060', 'PB060', 'CN05', N'Dự án Nâng cấp Thái Bình 10', 'CN05-DA10', '2022-09-09', '2026-12-11', 585, N'Mô tả Dự án Nâng cấp Thái Bình 10', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA061', 'PB061', 'CN06', N'Dự án Phát triển Hải Phòng 1', 'CN06-DA01', '2024-12-17', '2026-03-25', 487, N'Mô tả Dự án Phát triển Hải Phòng 1', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA062', 'PB062', 'CN06', N'Dự án Số hóa Hải Phòng 2', 'CN06-DA02', '2023-12-14', '2025-03-19', 402, N'Mô tả Dự án Số hóa Hải Phòng 2', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA063', 'PB063', 'CN06', N'Dự án Phát triển Hải Phòng 3', 'CN06-DA03', '2024-11-05', '2026-11-20', 270, N'Mô tả Dự án Phát triển Hải Phòng 3', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA064', 'PB064', 'CN06', N'Dự án Phát triển Hải Phòng 4', 'CN06-DA04', '2023-11-10', '2026-01-07', 581, N'Mô tả Dự án Phát triển Hải Phòng 4', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA065', 'PB065', 'CN06', N'Dự án Mở rộng Hải Phòng 5', 'CN06-DA05', '2023-08-03', '2025-01-03', 670, N'Mô tả Dự án Mở rộng Hải Phòng 5', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA066', 'PB066', 'CN06', N'Dự án Mở rộng Hải Phòng 6', 'CN06-DA06', '2024-02-10', '2025-12-11', 709, N'Mô tả Dự án Mở rộng Hải Phòng 6', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA067', 'PB067', 'CN06', N'Dự án Số hóa Hải Phòng 7', 'CN06-DA07', '2022-01-07', '2026-05-15', 312, N'Mô tả Dự án Số hóa Hải Phòng 7', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA068', 'PB068', 'CN06', N'Dự án Phát triển Hải Phòng 8', 'CN06-DA08', '2023-06-27', '2026-02-17', 627, N'Mô tả Dự án Phát triển Hải Phòng 8', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA069', 'PB069', 'CN06', N'Dự án Nâng cấp Hải Phòng 9', 'CN06-DA09', '2022-12-01', '2026-03-11', 577, N'Mô tả Dự án Nâng cấp Hải Phòng 9', N'Đang thực hiện');
INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)
VALUES ('DA070', 'PB070', 'CN06', N'Dự án Mở rộng Hải Phòng 10', 'CN06-DA10', '2022-06-08', '2026-05-28', 643, N'Mô tả Dự án Mở rộng Hải Phòng 10', N'Đang thực hiện');
GO

-- 7. NHÂN VIÊN (280 nhân viên - 40/chi nhánh)
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0001', 'CN00', 'PB001', 'CV09', 'DA001', N'Hồ Tuấn n', 'CN00-NV001', '1983-08-18', N'Nam', N'Kinh', '948273035831', '0949539803', 'n.hồ@company.vn', N'230 Trần Phú, Hà Nội', '2018-06-09', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0002', 'CN00', 'PB002', 'CV07', 'DA002', N'Ngô Minh n', 'CN00-NV002', '1986-04-10', N'Nữ', N'Nùng', '588439026006', '0997695940', 'n.ngô@company.vn', N'348 Lê Lợi, Hà Nội', '2023-01-24', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0003', 'CN00', 'PB003', 'CV10', 'DA003', N'Huỳnh Tuấn h', 'CN00-NV003', '1983-01-04', N'Nam', N'Mường', '669907666045', '0956837939', 'h.huỳnh@company.vn', N'75 Lê Lợi, Hà Nội', '2019-06-02', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0004', 'CN00', 'PB004', 'CV10', 'DA004', N'Phan Thành ò', 'CN00-NV004', '1991-04-30', N'Nam', N'Kinh', '528363553289', '0924565567', 'ò.phan@company.vn', N'364 Lê Lợi, Hà Nội', '2022-05-21', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0005', 'CN00', 'PB005', 'CV10', 'DA005', N'Vũ Tuấn h', 'CN00-NV005', '1990-05-15', N'Nữ', N'Khmer', '417984841375', '0990149713', 'h.vũ@company.vn', N'71 Lê Lợi, Hà Nội', '2016-03-24', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0006', 'CN00', 'PB006', 'CV10', 'DA006', N'Phan Hữu P', 'CN00-NV006', '1980-02-06', N'Nam', N'Hoa', '359867582007', '0992703624', 'p.phan@company.vn', N'831 Trần Phú, Hà Nội', '2018-01-16', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0007', 'CN00', 'PB007', 'CV10', 'DA007', N'Đặng Hữu i', 'CN00-NV007', '1989-12-30', N'Nam', N'Thái', '566161175926', '0962587181', 'i.đặng@company.vn', N'41 Nguyễn Huệ, Hà Nội', '2020-12-21', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0008', 'CN00', 'PB008', 'CV07', 'DA008', N'Lê Đức g', 'CN00-NV008', '1994-02-04', N'Nữ', N'Khmer', '457199034501', '0911098840', 'g.lê@company.vn', N'589 Lê Lợi, Hà Nội', '2022-06-09', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0009', 'CN00', 'PB009', 'CV09', 'DA009', N'Phạm Hữu n', 'CN00-NV009', '1999-08-16', N'Nữ', N'Tày', '203765416173', '0935652120', 'n.phạm@company.vn', N'586 Lê Lợi, Hà Nội', '2015-04-06', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0010', 'CN00', 'PB010', 'CV10', 'DA010', N'Đỗ Thành P', 'CN00-NV010', '1997-02-15', N'Nữ', N'Hmông', '150708375999', '0964654273', 'p.đỗ@company.vn', N'509 Nguyễn Huệ, Hà Nội', '2021-11-30', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0011', 'CN00', 'PB001', 'CV06', 'DA001', N'Đặng Quốc  ', 'CN00-NV011', '1994-03-01', N'Nữ', N'Hoa', '130566611362', '0935298058', 'quốc.đặng@company.vn', N'800 Lê Lợi, Hà Nội', '2018-05-23', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0012', 'CN00', 'PB002', 'CV06', 'DA002', N'Bùi Thị h', 'CN00-NV012', '1980-07-02', N'Nữ', N'Hoa', '842741612138', '0929609478', 'h.bùi@company.vn', N'970 Trần Phú, Hà Nội', '2017-10-07', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0013', 'CN00', 'PB003', 'CV06', 'DA003', N'Hồ Anh á', 'CN00-NV013', '1984-07-06', N'Nữ', N'Kinh', '815813004796', '0996944731', 'á.hồ@company.vn', N'827 Nguyễn Huệ, Hà Nội', '2017-11-19', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0014', 'CN00', 'PB004', 'CV05', 'DA004', N'Nguyễn Đức  ', 'CN00-NV014', '1990-03-13', N'Nữ', N'Kinh', '700351254412', '0910306553', 'đức.nguyễn@company.vn', N'987 Nguyễn Huệ, Hà Nội', '2016-10-27', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0015', 'CN00', 'PB005', 'CV06', 'DA005', N'Đặng Anh C', 'CN00-NV015', '2000-04-24', N'Nam', N'Hoa', '188567980699', '0927233615', 'c.đặng@company.vn', N'915 Nguyễn Huệ, Hà Nội', '2016-04-08', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0016', 'CN00', 'PB006', 'CV05', 'DA006', N'Hồ Đức n', 'CN00-NV016', '1983-08-27', N'Nam', N'Thái', '188404230138', '0927451013', 'n.hồ@company.vn', N'158 Nguyễn Huệ, Hà Nội', '2016-09-23', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0017', 'CN00', 'PB007', 'CV07', 'DA007', N'Đặng Tuấn  ', 'CN00-NV017', '1998-03-20', N'Nam', N'Mường', '355953806065', '0956208612', 'tuấn.đặng@company.vn', N'547 Nguyễn Huệ, Hà Nội', '2023-10-07', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0018', 'CN00', 'PB008', 'CV04', 'DA008', N'Ngô Anh ò', 'CN00-NV018', '1982-08-07', N'Nam', N'Kinh', '685777886011', '0928069889', 'ò.ngô@company.vn', N'639 Lê Lợi, Hà Nội', '2016-06-26', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0019', 'CN00', 'PB009', 'CV07', 'DA009', N'Hồ Tuấn n', 'CN00-NV019', '1993-05-12', N'Nữ', N'Kinh', '220696982808', '0978387605', 'n.hồ@company.vn', N'846 Trần Phú, Hà Nội', '2016-06-04', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0020', 'CN00', 'PB010', 'CV05', 'DA010', N'Huỳnh Thành h', 'CN00-NV020', '1982-02-23', N'Nam', N'Hoa', '199581618884', '0927541806', 'h.huỳnh@company.vn', N'260 Nguyễn Huệ, Hà Nội', '2024-04-18', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0021', 'CN00', 'PB001', 'CV06', 'DA001', N'Dương Thành C', 'CN00-NV021', '1996-07-29', N'Nữ', N'Tày', '975560110301', '0974848375', 'c.dương@company.vn', N'125 Nguyễn Huệ, Hà Nội', '2017-01-01', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0022', 'CN00', 'PB002', 'CV10', 'DA002', N'Đỗ Quốc h', 'CN00-NV022', '1998-05-19', N'Nam', N'Tày', '466425029636', '0936914924', 'h.đỗ@company.vn', N'246 Lê Lợi, Hà Nội', '2024-07-04', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0023', 'CN00', 'PB003', 'CV06', 'DA003', N'Dương Hoàng  ', 'CN00-NV023', '2000-04-14', N'Nam', N'Mường', '422488623653', '0985390781', 'hoàng.dương@company.vn', N'687 Trần Phú, Hà Nội', '2017-01-27', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0024', 'CN00', 'PB004', 'CV06', 'DA004', N'Trần Thanh ả', 'CN00-NV024', '1990-10-14', N'Nam', N'Thái', '608537156962', '0965526512', 'ả.trần@company.vn', N'656 Nguyễn Huệ, Hà Nội', '2022-11-22', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0025', 'CN00', 'PB005', 'CV09', 'DA005', N'Bùi Tuấn n', 'CN00-NV025', '1999-01-14', N'Nữ', N'Thái', '382573549899', '0990120015', 'n.bùi@company.vn', N'217 Nguyễn Huệ, Hà Nội', '2016-06-07', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0026', 'CN00', 'PB006', 'CV04', 'DA006', N'Võ Công C', 'CN00-NV026', '1982-06-27', N'Nam', N'Kinh', '893126231783', '0930575156', 'c.võ@company.vn', N'744 Lê Lợi, Hà Nội', '2023-01-20', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0027', 'CN00', 'PB007', 'CV06', 'DA007', N'Phạm Thị h', 'CN00-NV027', '1980-02-03', N'Nữ', N'Kinh', '970901007703', '0968211101', 'h.phạm@company.vn', N'871 Trần Phú, Hà Nội', '2020-05-25', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0028', 'CN00', 'PB008', 'CV04', 'DA008', N'Dương Quốc i', 'CN00-NV028', '2000-12-05', N'Nữ', N'Nùng', '394574690393', '0961061610', 'i.dương@company.vn', N'117 Nguyễn Huệ, Hà Nội', '2018-06-14', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0029', 'CN00', 'PB009', 'CV10', 'DA009', N'Bùi Văn h', 'CN00-NV029', '1986-02-25', N'Nam', N'Hmông', '714581776272', '0916474087', 'h.bùi@company.vn', N'98 Trần Phú, Hà Nội', '2019-02-19', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0030', 'CN00', 'PB010', 'CV10', 'DA010', N'Đặng Hoàng h', 'CN00-NV030', '1985-08-23', N'Nam', N'Hoa', '436191586674', '0933739635', 'h.đặng@company.vn', N'497 Nguyễn Huệ, Hà Nội', '2024-05-15', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0031', 'CN00', 'PB001', 'CV06', 'DA001', N'Phan Anh h', 'CN00-NV031', '1986-03-17', N'Nữ', N'Mường', '629053865986', '0991370133', 'h.phan@company.vn', N'830 Nguyễn Huệ, Hà Nội', '2016-08-10', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0032', 'CN00', 'PB002', 'CV07', 'DA002', N'Võ Quốc i', 'CN00-NV032', '1982-08-21', N'Nữ', N'Kinh', '662151766350', '0977196713', 'i.võ@company.vn', N'588 Nguyễn Huệ, Hà Nội', '2023-10-25', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0033', 'CN00', 'PB003', 'CV05', 'DA003', N'Bùi Văn  ', 'CN00-NV033', '1996-01-31', N'Nữ', N'Hoa', '449483146528', '0997720428', 'văn.bùi@company.vn', N'746 Lê Lợi, Hà Nội', '2015-11-27', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0034', 'CN00', 'PB004', 'CV04', 'DA004', N'Bùi Hữu P', 'CN00-NV034', '1993-05-30', N'Nữ', N'Mường', '912416965219', '0927876878', 'p.bùi@company.vn', N'443 Lê Lợi, Hà Nội', '2020-06-13', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0035', 'CN00', 'PB005', 'CV07', 'DA005', N'Đỗ Thanh  ', 'CN00-NV035', '1982-08-11', N'Nam', N'Kinh', '812713256961', '0938636859', 'thanh.đỗ@company.vn', N'803 Nguyễn Huệ, Hà Nội', '2020-11-12', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0036', 'CN00', 'PB006', 'CV07', 'DA006', N'Vũ Thành  ', 'CN00-NV036', '1994-01-15', N'Nam', N'Hmông', '749303047896', '0943484830', 'thành.vũ@company.vn', N'766 Trần Phú, Hà Nội', '2018-02-01', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0037', 'CN00', 'PB007', 'CV08', 'DA007', N'Lê Thành h', 'CN00-NV037', '1994-01-17', N'Nam', N'Nùng', '906881329717', '0920461881', 'h.lê@company.vn', N'775 Lê Lợi, Hà Nội', '2023-03-04', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0038', 'CN00', 'PB008', 'CV04', 'DA008', N'Đặng Hoàng ả', 'CN00-NV038', '1995-11-28', N'Nữ', N'Kinh', '911590280674', '0928966623', 'ả.đặng@company.vn', N'315 Nguyễn Huệ, Hà Nội', '2024-06-28', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0039', 'CN00', 'PB009', 'CV05', 'DA009', N'Hồ Thị ò', 'CN00-NV039', '1982-09-05', N'Nữ', N'Hmông', '296872963855', '0958018464', 'ò.hồ@company.vn', N'301 Nguyễn Huệ, Hà Nội', '2018-04-28', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0040', 'CN00', 'PB010', 'CV07', 'DA010', N'Bùi Hoàng á', 'CN00-NV040', '1986-04-22', N'Nam', N'Hoa', '336209004697', '0937904052', 'á.bùi@company.vn', N'959 Nguyễn Huệ, Hà Nội', '2018-06-04', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0041', 'CN01', 'PB011', 'CV06', 'DA011', N'Vũ Quốc i', 'CN01-NV001', '1984-09-11', N'Nữ', N'Tày', '330097194932', '0934371182', 'i.vũ@company.vn', N'715 Nguyễn Huệ, Huế', '2021-07-26', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0042', 'CN01', 'PB012', 'CV10', 'DA012', N'Võ Thanh  ', 'CN01-NV002', '1993-08-06', N'Nam', N'Thái', '202036610269', '0985561375', 'thanh.võ@company.vn', N'547 Nguyễn Huệ, Huế', '2023-12-26', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0043', 'CN01', 'PB013', 'CV04', 'DA013', N'Lê Anh ò', 'CN01-NV003', '1981-08-13', N'Nam', N'Mường', '155755915669', '0966546245', 'ò.lê@company.vn', N'603 Trần Phú, Huế', '2023-06-21', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0044', 'CN01', 'PB014', 'CV06', 'DA014', N'Vũ Thị i', 'CN01-NV004', '1999-05-10', N'Nam', N'Hoa', '960130975785', '0934155269', 'i.vũ@company.vn', N'242 Lê Lợi, Huế', '2022-11-25', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0045', 'CN01', 'PB015', 'CV04', 'DA015', N'Đỗ Anh n', 'CN01-NV005', '1983-05-16', N'Nữ', N'Hmông', '667187971759', '0916413620', 'n.đỗ@company.vn', N'110 Lê Lợi, Huế', '2024-12-07', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0046', 'CN01', 'PB016', 'CV08', 'DA016', N'Đặng Thanh ò', 'CN01-NV006', '2000-04-09', N'Nam', N'Tày', '168411400615', '0999065213', 'ò.đặng@company.vn', N'327 Trần Phú, Huế', '2019-10-20', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0047', 'CN01', 'PB017', 'CV10', 'DA017', N'Đỗ Thanh n', 'CN01-NV007', '1995-02-13', N'Nữ', N'Thái', '249890211771', '0990125167', 'n.đỗ@company.vn', N'153 Trần Phú, Huế', '2018-09-25', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0048', 'CN01', 'PB018', 'CV05', 'DA018', N'Lê Thị ả', 'CN01-NV008', '1993-04-28', N'Nam', N'Tày', '554387604747', '0989995079', 'ả.lê@company.vn', N'353 Lê Lợi, Huế', '2017-06-09', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0049', 'CN01', 'PB019', 'CV08', 'DA019', N'Hồ Quốc H', 'CN01-NV009', '1983-06-15', N'Nữ', N'Tày', '326010981276', '0976980411', 'h.hồ@company.vn', N'823 Lê Lợi, Huế', '2024-12-06', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0050', 'CN01', 'PB020', 'CV10', 'DA020', N'Dương Thị h', 'CN01-NV010', '1983-12-06', N'Nam', N'Hmông', '898071105031', '0963598390', 'h.dương@company.vn', N'168 Lê Lợi, Huế', '2020-05-08', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0051', 'CN01', 'PB011', 'CV07', 'DA011', N'Bùi Đức ò', 'CN01-NV011', '1996-07-28', N'Nữ', N'Hoa', '713219775880', '0952715942', 'ò.bùi@company.vn', N'270 Lê Lợi, Huế', '2022-12-31', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0052', 'CN01', 'PB012', 'CV08', 'DA012', N'Hồ Hữu n', 'CN01-NV012', '1990-10-05', N'Nam', N'Khmer', '916326575736', '0998292049', 'n.hồ@company.vn', N'221 Lê Lợi, Huế', '2016-08-31', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0053', 'CN01', 'PB013', 'CV06', 'DA013', N'Hoàng Hoàng H', 'CN01-NV013', '1987-01-05', N'Nam', N'Mường', '677687561664', '0920951696', 'h.hoàng@company.vn', N'453 Trần Phú, Huế', '2016-11-02', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0054', 'CN01', 'PB014', 'CV05', 'DA014', N'Trần Đức h', 'CN01-NV014', '1993-12-16', N'Nữ', N'Tày', '673935766311', '0978353227', 'h.trần@company.vn', N'6 Trần Phú, Huế', '2022-12-12', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0055', 'CN01', 'PB015', 'CV08', 'DA015', N'Đỗ Tuấn h', 'CN01-NV015', '1997-03-17', N'Nam', N'Khmer', '425476415445', '0998349438', 'h.đỗ@company.vn', N'914 Nguyễn Huệ, Huế', '2023-10-20', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0056', 'CN01', 'PB016', 'CV10', 'DA016', N'Nguyễn Tuấn  ', 'CN01-NV016', '1982-11-06', N'Nữ', N'Nùng', '752005022975', '0970558778', 'tuấn.nguyễn@company.vn', N'44 Lê Lợi, Huế', '2015-07-05', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0057', 'CN01', 'PB017', 'CV04', 'DA017', N'Bùi Minh  ', 'CN01-NV017', '2000-02-03', N'Nam', N'Kinh', '549783783558', '0928352651', 'minh.bùi@company.vn', N'143 Nguyễn Huệ, Huế', '2019-10-17', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0058', 'CN01', 'PB018', 'CV05', 'DA018', N'Hoàng Đức P', 'CN01-NV018', '1985-03-27', N'Nam', N'Nùng', '160529671593', '0950460994', 'p.hoàng@company.vn', N'134 Trần Phú, Huế', '2018-12-09', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0059', 'CN01', 'PB019', 'CV05', 'DA019', N'Lê Anh n', 'CN01-NV019', '1996-01-31', N'Nữ', N'Mường', '916493774569', '0986596427', 'n.lê@company.vn', N'724 Lê Lợi, Huế', '2016-08-19', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0060', 'CN01', 'PB020', 'CV05', 'DA020', N'Võ Hữu P', 'CN01-NV020', '1997-07-14', N'Nữ', N'Hoa', '811453665813', '0999617355', 'p.võ@company.vn', N'325 Nguyễn Huệ, Huế', '2017-06-27', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0061', 'CN01', 'PB011', 'CV05', 'DA011', N'Hoàng Hữu  ', 'CN01-NV021', '1986-02-11', N'Nữ', N'Tày', '194870229440', '0999281655', 'hữu.hoàng@company.vn', N'652 Lê Lợi, Huế', '2021-08-10', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0062', 'CN01', 'PB012', 'CV07', 'DA012', N'Đặng Thanh ò', 'CN01-NV022', '1982-04-16', N'Nữ', N'Hoa', '430739887870', '0933466128', 'ò.đặng@company.vn', N'859 Trần Phú, Huế', '2016-01-18', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0063', 'CN01', 'PB013', 'CV07', 'DA013', N'Hoàng Thành á', 'CN01-NV023', '1982-03-01', N'Nữ', N'Mường', '369099867408', '0919851823', 'á.hoàng@company.vn', N'919 Nguyễn Huệ, Huế', '2018-07-27', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0064', 'CN01', 'PB014', 'CV06', 'DA014', N'Hồ Văn n', 'CN01-NV024', '1983-02-09', N'Nữ', N'Kinh', '167086358806', '0925351463', 'n.hồ@company.vn', N'322 Nguyễn Huệ, Huế', '2024-12-26', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0065', 'CN01', 'PB015', 'CV10', 'DA015', N'Dương Công á', 'CN01-NV025', '1997-04-26', N'Nam', N'Tày', '174984100164', '0997367395', 'á.dương@company.vn', N'211 Trần Phú, Huế', '2023-01-31', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0066', 'CN01', 'PB016', 'CV10', 'DA016', N'Dương Thành h', 'CN01-NV026', '1990-05-04', N'Nữ', N'Hmông', '313349961536', '0923950631', 'h.dương@company.vn', N'641 Nguyễn Huệ, Huế', '2023-10-06', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0067', 'CN01', 'PB017', 'CV07', 'DA017', N'Vũ Văn  ', 'CN01-NV027', '1983-08-10', N'Nam', N'Mường', '805037573347', '0944856671', 'văn.vũ@company.vn', N'322 Nguyễn Huệ, Huế', '2020-09-11', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0068', 'CN01', 'PB018', 'CV04', 'DA018', N'Dương Thành i', 'CN01-NV028', '1981-04-08', N'Nữ', N'Kinh', '891834379686', '0966296041', 'i.dương@company.vn', N'304 Lê Lợi, Huế', '2024-01-19', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0069', 'CN01', 'PB019', 'CV09', 'DA019', N'Bùi Thị h', 'CN01-NV029', '1991-06-21', N'Nữ', N'Thái', '210031662715', '0959919114', 'h.bùi@company.vn', N'502 Nguyễn Huệ, Huế', '2017-01-04', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0070', 'CN01', 'PB020', 'CV10', 'DA020', N'Ngô Hữu i', 'CN01-NV030', '1995-02-22', N'Nam', N'Thái', '151402050020', '0989078497', 'i.ngô@company.vn', N'893 Lê Lợi, Huế', '2024-06-21', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0071', 'CN01', 'PB011', 'CV10', 'DA011', N'Đặng Đức g', 'CN01-NV031', '1996-07-13', N'Nam', N'Hmông', '875086197204', '0913643213', 'g.đặng@company.vn', N'955 Nguyễn Huệ, Huế', '2015-04-30', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0072', 'CN01', 'PB012', 'CV04', 'DA012', N'Trần Tuấn P', 'CN01-NV032', '1980-10-03', N'Nữ', N'Khmer', '189517145681', '0915150497', 'p.trần@company.vn', N'229 Nguyễn Huệ, Huế', '2018-03-17', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0073', 'CN01', 'PB013', 'CV04', 'DA013', N'Đỗ Tuấn C', 'CN01-NV033', '1993-12-19', N'Nam', N'Hoa', '872308510936', '0920877698', 'c.đỗ@company.vn', N'269 Lê Lợi, Huế', '2015-07-02', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0074', 'CN01', 'PB014', 'CV06', 'DA014', N'Bùi Văn n', 'CN01-NV034', '1981-09-20', N'Nữ', N'Mường', '431481263453', '0910910576', 'n.bùi@company.vn', N'415 Trần Phú, Huế', '2023-09-22', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0075', 'CN01', 'PB015', 'CV08', 'DA015', N'Trần Minh ả', 'CN01-NV035', '1981-06-05', N'Nữ', N'Nùng', '198418839690', '0929798597', 'ả.trần@company.vn', N'54 Trần Phú, Huế', '2022-11-25', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0076', 'CN01', 'PB016', 'CV07', 'DA016', N'Hoàng Tuấn P', 'CN01-NV036', '1982-02-02', N'Nam', N'Nùng', '253641304549', '0959831930', 'p.hoàng@company.vn', N'915 Nguyễn Huệ, Huế', '2022-03-10', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0077', 'CN01', 'PB017', 'CV10', 'DA017', N'Dương Thị ả', 'CN01-NV037', '1993-04-22', N'Nữ', N'Khmer', '756262636710', '0990999920', 'ả.dương@company.vn', N'878 Trần Phú, Huế', '2015-06-26', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0078', 'CN01', 'PB018', 'CV10', 'DA018', N'Nguyễn Thành C', 'CN01-NV038', '1990-03-29', N'Nữ', N'Tày', '180529671557', '0923341018', 'c.nguyễn@company.vn', N'16 Lê Lợi, Huế', '2021-09-03', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0079', 'CN01', 'PB019', 'CV08', 'DA019', N'Đỗ Quốc g', 'CN01-NV039', '2000-04-30', N'Nữ', N'Mường', '480073028986', '0928515852', 'g.đỗ@company.vn', N'767 Nguyễn Huệ, Huế', '2024-07-18', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0080', 'CN01', 'PB020', 'CV07', 'DA020', N'Trần Công i', 'CN01-NV040', '1997-11-01', N'Nữ', N'Khmer', '872038303955', '0940909193', 'i.trần@company.vn', N'392 Trần Phú, Huế', '2019-08-23', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0081', 'CN02', 'PB021', 'CV05', 'DA021', N'Đặng Tuấn g', 'CN02-NV001', '1985-08-27', N'Nam', N'Tày', '486941087836', '0933041543', 'g.đặng@company.vn', N'543 Lê Lợi, Nam Định', '2016-11-11', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0082', 'CN02', 'PB022', 'CV06', 'DA022', N'Vũ Quốc g', 'CN02-NV002', '1988-07-15', N'Nam', N'Mường', '605596394598', '0953138641', 'g.vũ@company.vn', N'680 Lê Lợi, Nam Định', '2017-12-11', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0083', 'CN02', 'PB023', 'CV10', 'DA023', N'Võ Thị á', 'CN02-NV003', '1993-09-24', N'Nữ', N'Tày', '112203202969', '0967598559', 'á.võ@company.vn', N'253 Trần Phú, Nam Định', '2020-02-16', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0084', 'CN02', 'PB024', 'CV05', 'DA024', N'Phan Anh n', 'CN02-NV004', '1984-11-21', N'Nam', N'Mường', '816508374474', '0917449350', 'n.phan@company.vn', N'165 Trần Phú, Nam Định', '2019-06-25', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0085', 'CN02', 'PB025', 'CV06', 'DA025', N'Hoàng Tuấn  ', 'CN02-NV005', '1982-03-14', N'Nam', N'Nùng', '274353743305', '0974622755', 'tuấn.hoàng@company.vn', N'291 Nguyễn Huệ, Nam Định', '2021-06-14', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0086', 'CN02', 'PB026', 'CV09', 'DA026', N'Hồ Văn i', 'CN02-NV006', '1984-04-23', N'Nam', N'Mường', '454783761453', '0936948140', 'i.hồ@company.vn', N'239 Lê Lợi, Nam Định', '2020-11-03', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0087', 'CN02', 'PB027', 'CV04', 'DA027', N'Bùi Hoàng P', 'CN02-NV007', '1992-08-23', N'Nữ', N'Kinh', '954063866447', '0914704587', 'p.bùi@company.vn', N'694 Nguyễn Huệ, Nam Định', '2019-06-13', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0088', 'CN02', 'PB028', 'CV04', 'DA028', N'Hoàng Thị  ', 'CN02-NV008', '1997-03-14', N'Nam', N'Kinh', '509475558043', '0914519621', 'thị.hoàng@company.vn', N'662 Lê Lợi, Nam Định', '2021-05-02', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0089', 'CN02', 'PB029', 'CV04', 'DA029', N'Lê Văn C', 'CN02-NV009', '1985-11-04', N'Nam', N'Mường', '728967301134', '0980153295', 'c.lê@company.vn', N'841 Trần Phú, Nam Định', '2024-06-26', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0090', 'CN02', 'PB030', 'CV06', 'DA030', N'Hồ Tuấn á', 'CN02-NV010', '1981-09-23', N'Nữ', N'Thái', '734676510071', '0970154162', 'á.hồ@company.vn', N'863 Nguyễn Huệ, Nam Định', '2017-06-29', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0091', 'CN02', 'PB021', 'CV06', 'DA021', N'Dương Hữu  ', 'CN02-NV011', '1997-07-18', N'Nữ', N'Tày', '393162716947', '0999350546', 'hữu.dương@company.vn', N'320 Lê Lợi, Nam Định', '2018-06-11', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0092', 'CN02', 'PB022', 'CV10', 'DA022', N'Đỗ Văn i', 'CN02-NV012', '1997-03-10', N'Nam', N'Khmer', '361841362568', '0940981537', 'i.đỗ@company.vn', N'177 Trần Phú, Nam Định', '2015-03-19', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0093', 'CN02', 'PB023', 'CV05', 'DA023', N'Phạm Thành P', 'CN02-NV013', '1983-04-20', N'Nam', N'Tày', '127787069528', '0941425035', 'p.phạm@company.vn', N'763 Trần Phú, Nam Định', '2016-05-20', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0094', 'CN02', 'PB024', 'CV05', 'DA024', N'Hồ Thanh C', 'CN02-NV014', '1985-03-11', N'Nữ', N'Nùng', '842124838002', '0994562428', 'c.hồ@company.vn', N'657 Lê Lợi, Nam Định', '2022-11-26', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0095', 'CN02', 'PB025', 'CV07', 'DA025', N'Hồ Tuấn n', 'CN02-NV015', '1999-08-10', N'Nam', N'Khmer', '554119735307', '0920790804', 'n.hồ@company.vn', N'669 Trần Phú, Nam Định', '2022-03-12', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0096', 'CN02', 'PB026', 'CV08', 'DA026', N'Huỳnh Thị P', 'CN02-NV016', '1982-04-24', N'Nữ', N'Thái', '829352413766', '0915086885', 'p.huỳnh@company.vn', N'227 Lê Lợi, Nam Định', '2017-09-20', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0097', 'CN02', 'PB027', 'CV04', 'DA027', N'Huỳnh Đức n', 'CN02-NV017', '1994-07-30', N'Nữ', N'Nùng', '286137283573', '0911227693', 'n.huỳnh@company.vn', N'793 Trần Phú, Nam Định', '2020-02-15', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0098', 'CN02', 'PB028', 'CV06', 'DA028', N'Đỗ Hoàng n', 'CN02-NV018', '1986-01-22', N'Nam', N'Tày', '147053825879', '0982599765', 'n.đỗ@company.vn', N'155 Lê Lợi, Nam Định', '2024-07-07', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0099', 'CN02', 'PB029', 'CV10', 'DA029', N'Vũ Quốc P', 'CN02-NV019', '1987-10-03', N'Nam', N'Kinh', '135146249268', '0968336379', 'p.vũ@company.vn', N'608 Nguyễn Huệ, Nam Định', '2015-05-06', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0100', 'CN02', 'PB030', 'CV04', 'DA030', N'Vũ Thành h', 'CN02-NV020', '1982-09-04', N'Nữ', N'Mường', '127180893898', '0930619181', 'h.vũ@company.vn', N'436 Trần Phú, Nam Định', '2022-01-21', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0101', 'CN02', 'PB021', 'CV06', 'DA021', N'Đặng Văn  ', 'CN02-NV021', '1997-12-19', N'Nam', N'Nùng', '568072743066', '0963983642', 'văn.đặng@company.vn', N'129 Nguyễn Huệ, Nam Định', '2019-02-05', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0102', 'CN02', 'PB022', 'CV07', 'DA022', N'Lê Văn C', 'CN02-NV022', '1989-03-02', N'Nam', N'Kinh', '691142823575', '0989743833', 'c.lê@company.vn', N'272 Trần Phú, Nam Định', '2024-04-04', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0103', 'CN02', 'PB023', 'CV08', 'DA023', N'Lê Hoàng i', 'CN02-NV023', '1997-09-14', N'Nữ', N'Mường', '627390154637', '0968348149', 'i.lê@company.vn', N'405 Lê Lợi, Nam Định', '2015-11-06', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0104', 'CN02', 'PB024', 'CV04', 'DA024', N'Đỗ Công n', 'CN02-NV024', '1987-01-16', N'Nam', N'Hmông', '765715066737', '0977071976', 'n.đỗ@company.vn', N'28 Nguyễn Huệ, Nam Định', '2023-05-23', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0105', 'CN02', 'PB025', 'CV08', 'DA025', N'Nguyễn Hữu n', 'CN02-NV025', '1998-03-11', N'Nam', N'Tày', '456173386326', '0959621241', 'n.nguyễn@company.vn', N'355 Nguyễn Huệ, Nam Định', '2015-01-23', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0106', 'CN02', 'PB026', 'CV04', 'DA026', N'Dương Văn  ', 'CN02-NV026', '1989-05-21', N'Nữ', N'Nùng', '285402695178', '0961627208', 'văn.dương@company.vn', N'134 Nguyễn Huệ, Nam Định', '2017-03-19', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0107', 'CN02', 'PB027', 'CV09', 'DA027', N'Đỗ Tuấn n', 'CN02-NV027', '1998-04-01', N'Nữ', N'Tày', '193581165429', '0969774977', 'n.đỗ@company.vn', N'803 Trần Phú, Nam Định', '2017-07-13', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0108', 'CN02', 'PB028', 'CV10', 'DA028', N'Võ Đức  ', 'CN02-NV028', '1997-09-17', N'Nam', N'Kinh', '777408955057', '0927092145', 'đức.võ@company.vn', N'410 Trần Phú, Nam Định', '2021-10-11', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0109', 'CN02', 'PB029', 'CV06', 'DA029', N'Bùi Hoàng i', 'CN02-NV029', '1986-10-04', N'Nữ', N'Thái', '729388219315', '0991192017', 'i.bùi@company.vn', N'95 Trần Phú, Nam Định', '2024-12-08', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0110', 'CN02', 'PB030', 'CV08', 'DA030', N'Đặng Quốc n', 'CN02-NV030', '1982-01-19', N'Nam', N'Hoa', '622763094367', '0918978432', 'n.đặng@company.vn', N'407 Lê Lợi, Nam Định', '2022-03-15', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0111', 'CN02', 'PB021', 'CV06', 'DA021', N'Phạm Quốc C', 'CN02-NV031', '1986-09-08', N'Nữ', N'Thái', '400938578423', '0999893290', 'c.phạm@company.vn', N'802 Trần Phú, Nam Định', '2022-03-26', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0112', 'CN02', 'PB022', 'CV05', 'DA022', N'Phan Anh n', 'CN02-NV032', '1985-07-31', N'Nữ', N'Khmer', '353744424860', '0943090887', 'n.phan@company.vn', N'752 Nguyễn Huệ, Nam Định', '2019-03-13', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0113', 'CN02', 'PB023', 'CV04', 'DA023', N'Hồ Thanh ả', 'CN02-NV033', '1991-02-23', N'Nữ', N'Hmông', '420864769593', '0937755001', 'ả.hồ@company.vn', N'745 Nguyễn Huệ, Nam Định', '2016-10-31', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0114', 'CN02', 'PB024', 'CV08', 'DA024', N'Ngô Hữu g', 'CN02-NV034', '1982-08-12', N'Nữ', N'Thái', '905110665555', '0955032474', 'g.ngô@company.vn', N'818 Trần Phú, Nam Định', '2021-09-10', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0115', 'CN02', 'PB025', 'CV04', 'DA025', N'Nguyễn Văn g', 'CN02-NV035', '1999-12-15', N'Nữ', N'Nùng', '256225204246', '0971060110', 'g.nguyễn@company.vn', N'294 Nguyễn Huệ, Nam Định', '2017-01-24', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0116', 'CN02', 'PB026', 'CV08', 'DA026', N'Đặng Thành h', 'CN02-NV036', '1992-03-13', N'Nữ', N'Khmer', '369717718164', '0953168291', 'h.đặng@company.vn', N'155 Nguyễn Huệ, Nam Định', '2015-04-09', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0117', 'CN02', 'PB027', 'CV09', 'DA027', N'Bùi Thành ò', 'CN02-NV037', '1994-08-07', N'Nữ', N'Khmer', '655573117938', '0943168309', 'ò.bùi@company.vn', N'499 Nguyễn Huệ, Nam Định', '2016-04-11', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0118', 'CN02', 'PB028', 'CV05', 'DA028', N'Đỗ Hoàng h', 'CN02-NV038', '2000-11-15', N'Nữ', N'Kinh', '308770371946', '0995038875', 'h.đỗ@company.vn', N'717 Lê Lợi, Nam Định', '2019-02-02', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0119', 'CN02', 'PB029', 'CV07', 'DA029', N'Đặng Tuấn i', 'CN02-NV039', '1982-07-04', N'Nữ', N'Kinh', '315167747170', '0971629883', 'i.đặng@company.vn', N'246 Nguyễn Huệ, Nam Định', '2023-04-14', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0120', 'CN02', 'PB030', 'CV04', 'DA030', N'Đặng Hữu i', 'CN02-NV040', '1993-11-20', N'Nam', N'Hmông', '900935334419', '0970675697', 'i.đặng@company.vn', N'407 Lê Lợi, Nam Định', '2020-08-18', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0121', 'CN03', 'PB031', 'CV08', 'DA031', N'Dương Anh P', 'CN03-NV001', '1994-02-19', N'Nữ', N'Mường', '290638515598', '0986973766', 'p.dương@company.vn', N'42 Nguyễn Huệ, Vinh', '2018-02-17', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0122', 'CN03', 'PB032', 'CV08', 'DA032', N'Đỗ Hữu n', 'CN03-NV002', '1984-10-09', N'Nam', N'Hoa', '224494498801', '0924046781', 'n.đỗ@company.vn', N'367 Trần Phú, Vinh', '2015-03-02', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0123', 'CN03', 'PB033', 'CV07', 'DA033', N'Võ Minh  ', 'CN03-NV003', '1984-08-18', N'Nữ', N'Kinh', '903407309936', '0936209942', 'minh.võ@company.vn', N'894 Nguyễn Huệ, Vinh', '2023-07-03', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0124', 'CN03', 'PB034', 'CV06', 'DA034', N'Phạm Hoàng C', 'CN03-NV004', '1998-03-27', N'Nam', N'Hoa', '803049403932', '0959633525', 'c.phạm@company.vn', N'740 Nguyễn Huệ, Vinh', '2023-05-20', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0125', 'CN03', 'PB035', 'CV04', 'DA035', N'Đỗ Đức h', 'CN03-NV005', '1980-10-28', N'Nam', N'Tày', '469745822345', '0971688695', 'h.đỗ@company.vn', N'957 Nguyễn Huệ, Vinh', '2021-10-06', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0126', 'CN03', 'PB036', 'CV07', 'DA036', N'Ngô Thị h', 'CN03-NV006', '1983-07-14', N'Nữ', N'Hmông', '137444862544', '0946213719', 'h.ngô@company.vn', N'187 Lê Lợi, Vinh', '2015-03-13', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0127', 'CN03', 'PB037', 'CV06', 'DA037', N'Huỳnh Anh ò', 'CN03-NV007', '1991-03-05', N'Nữ', N'Hmông', '382833425531', '0946606377', 'ò.huỳnh@company.vn', N'453 Lê Lợi, Vinh', '2020-07-13', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0128', 'CN03', 'PB038', 'CV05', 'DA038', N'Dương Đức n', 'CN03-NV008', '1980-12-12', N'Nữ', N'Mường', '733746467751', '0937302791', 'n.dương@company.vn', N'666 Nguyễn Huệ, Vinh', '2020-08-18', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0129', 'CN03', 'PB039', 'CV04', 'DA039', N'Bùi Hoàng  ', 'CN03-NV009', '1991-08-05', N'Nam', N'Khmer', '949391114635', '0926516418', 'hoàng.bùi@company.vn', N'760 Trần Phú, Vinh', '2017-05-01', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0130', 'CN03', 'PB040', 'CV10', 'DA040', N'Dương Hữu ò', 'CN03-NV010', '1997-03-24', N'Nam', N'Khmer', '798473040634', '0968943575', 'ò.dương@company.vn', N'287 Trần Phú, Vinh', '2022-04-06', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0131', 'CN03', 'PB031', 'CV04', 'DA031', N'Võ Anh P', 'CN03-NV011', '1993-03-05', N'Nam', N'Hmông', '956943668614', '0943110727', 'p.võ@company.vn', N'991 Nguyễn Huệ, Vinh', '2024-02-08', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0132', 'CN03', 'PB032', 'CV10', 'DA032', N'Bùi Văn P', 'CN03-NV012', '1985-04-19', N'Nữ', N'Hoa', '507263492660', '0997744456', 'p.bùi@company.vn', N'337 Lê Lợi, Vinh', '2015-12-10', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0133', 'CN03', 'PB033', 'CV07', 'DA033', N'Bùi Hoàng n', 'CN03-NV013', '1998-06-28', N'Nam', N'Hmông', '546932970112', '0932782845', 'n.bùi@company.vn', N'149 Trần Phú, Vinh', '2020-03-18', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0134', 'CN03', 'PB034', 'CV09', 'DA034', N'Dương Văn i', 'CN03-NV014', '1982-11-21', N'Nữ', N'Khmer', '744960992676', '0934027662', 'i.dương@company.vn', N'452 Lê Lợi, Vinh', '2023-10-24', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0135', 'CN03', 'PB035', 'CV04', 'DA035', N'Đỗ Anh C', 'CN03-NV015', '1993-06-27', N'Nữ', N'Khmer', '486936969421', '0946702850', 'c.đỗ@company.vn', N'251 Trần Phú, Vinh', '2017-03-15', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0136', 'CN03', 'PB036', 'CV09', 'DA036', N'Nguyễn Quốc h', 'CN03-NV016', '1989-09-09', N'Nữ', N'Tày', '579901565876', '0913418350', 'h.nguyễn@company.vn', N'638 Lê Lợi, Vinh', '2024-05-17', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0137', 'CN03', 'PB037', 'CV09', 'DA037', N'Võ Công P', 'CN03-NV017', '1990-08-26', N'Nam', N'Mường', '458665050014', '0998026157', 'p.võ@company.vn', N'913 Lê Lợi, Vinh', '2023-09-14', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0138', 'CN03', 'PB038', 'CV04', 'DA038', N'Hoàng Thành P', 'CN03-NV018', '1998-11-24', N'Nam', N'Nùng', '467810521570', '0993295404', 'p.hoàng@company.vn', N'318 Trần Phú, Vinh', '2018-09-29', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0139', 'CN03', 'PB039', 'CV07', 'DA039', N'Phạm Hữu n', 'CN03-NV019', '2000-03-05', N'Nam', N'Thái', '430396142160', '0967098921', 'n.phạm@company.vn', N'721 Trần Phú, Vinh', '2015-01-16', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0140', 'CN03', 'PB040', 'CV04', 'DA040', N'Ngô Minh ả', 'CN03-NV020', '1990-10-01', N'Nam', N'Kinh', '568672963609', '0975992260', 'ả.ngô@company.vn', N'703 Trần Phú, Vinh', '2015-05-18', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0141', 'CN03', 'PB031', 'CV10', 'DA031', N'Huỳnh Hoàng  ', 'CN03-NV021', '1984-05-22', N'Nữ', N'Kinh', '866796362613', '0919562774', 'hoàng.huỳnh@company.vn', N'552 Nguyễn Huệ, Vinh', '2015-02-08', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0142', 'CN03', 'PB032', 'CV08', 'DA032', N'Phạm Công P', 'CN03-NV022', '1985-03-02', N'Nữ', N'Tày', '691406347234', '0953537061', 'p.phạm@company.vn', N'155 Nguyễn Huệ, Vinh', '2021-12-06', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0143', 'CN03', 'PB033', 'CV08', 'DA033', N'Đỗ Văn ò', 'CN03-NV023', '1981-09-13', N'Nam', N'Tày', '261309783458', '0978354138', 'ò.đỗ@company.vn', N'201 Lê Lợi, Vinh', '2021-04-15', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0144', 'CN03', 'PB034', 'CV07', 'DA034', N'Nguyễn Tuấn ò', 'CN03-NV024', '1988-02-24', N'Nam', N'Nùng', '437436324640', '0963902545', 'ò.nguyễn@company.vn', N'693 Nguyễn Huệ, Vinh', '2021-01-15', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0145', 'CN03', 'PB035', 'CV08', 'DA035', N'Hồ Anh n', 'CN03-NV025', '1992-06-03', N'Nữ', N'Mường', '938527966957', '0950154775', 'n.hồ@company.vn', N'153 Lê Lợi, Vinh', '2016-07-25', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0146', 'CN03', 'PB036', 'CV04', 'DA036', N'Đỗ Thanh h', 'CN03-NV026', '1997-08-16', N'Nữ', N'Tày', '239176554327', '0923340079', 'h.đỗ@company.vn', N'26 Lê Lợi, Vinh', '2018-02-10', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0147', 'CN03', 'PB037', 'CV05', 'DA037', N'Hoàng Quốc n', 'CN03-NV027', '1994-05-27', N'Nam', N'Thái', '507615106215', '0973419613', 'n.hoàng@company.vn', N'382 Lê Lợi, Vinh', '2015-06-15', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0148', 'CN03', 'PB038', 'CV04', 'DA038', N'Vũ Hữu h', 'CN03-NV028', '1983-09-06', N'Nữ', N'Thái', '868051644278', '0994601919', 'h.vũ@company.vn', N'874 Nguyễn Huệ, Vinh', '2017-04-04', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0149', 'CN03', 'PB039', 'CV06', 'DA039', N'Vũ Thành i', 'CN03-NV029', '1987-03-07', N'Nam', N'Mường', '647115941018', '0950892381', 'i.vũ@company.vn', N'663 Lê Lợi, Vinh', '2017-02-17', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0150', 'CN03', 'PB040', 'CV08', 'DA040', N'Bùi Thanh h', 'CN03-NV030', '1999-01-26', N'Nữ', N'Thái', '711733018342', '0959707955', 'h.bùi@company.vn', N'144 Trần Phú, Vinh', '2024-02-01', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0151', 'CN03', 'PB031', 'CV08', 'DA031', N'Hồ Thanh ò', 'CN03-NV031', '1981-11-09', N'Nam', N'Nùng', '234721333290', '0942399709', 'ò.hồ@company.vn', N'748 Lê Lợi, Vinh', '2020-08-28', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0152', 'CN03', 'PB032', 'CV07', 'DA032', N'Hoàng Thanh n', 'CN03-NV032', '1981-01-08', N'Nữ', N'Thái', '213337746796', '0981415096', 'n.hoàng@company.vn', N'290 Lê Lợi, Vinh', '2024-06-17', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0153', 'CN03', 'PB033', 'CV07', 'DA033', N'Lê Thanh H', 'CN03-NV033', '2000-01-10', N'Nữ', N'Tày', '238975474342', '0966945391', 'h.lê@company.vn', N'771 Lê Lợi, Vinh', '2015-08-19', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0154', 'CN03', 'PB034', 'CV06', 'DA034', N'Huỳnh Quốc  ', 'CN03-NV034', '1987-03-01', N'Nữ', N'Kinh', '322434659403', '0951366959', 'quốc.huỳnh@company.vn', N'725 Lê Lợi, Vinh', '2023-09-21', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0155', 'CN03', 'PB035', 'CV10', 'DA035', N'Phạm Minh h', 'CN03-NV035', '1981-10-03', N'Nữ', N'Thái', '945749387253', '0931300637', 'h.phạm@company.vn', N'537 Trần Phú, Vinh', '2019-09-26', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0156', 'CN03', 'PB036', 'CV04', 'DA036', N'Nguyễn Thị á', 'CN03-NV036', '1987-09-13', N'Nữ', N'Thái', '245844706682', '0967750894', 'á.nguyễn@company.vn', N'48 Trần Phú, Vinh', '2022-02-14', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0157', 'CN03', 'PB037', 'CV08', 'DA037', N'Ngô Tuấn i', 'CN03-NV037', '1981-07-24', N'Nam', N'Mường', '507378257889', '0950254465', 'i.ngô@company.vn', N'591 Trần Phú, Vinh', '2021-06-21', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0158', 'CN03', 'PB038', 'CV06', 'DA038', N'Nguyễn Văn h', 'CN03-NV038', '1993-04-26', N'Nam', N'Kinh', '679469726111', '0998426552', 'h.nguyễn@company.vn', N'874 Nguyễn Huệ, Vinh', '2020-10-03', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0159', 'CN03', 'PB039', 'CV04', 'DA039', N'Huỳnh Thanh  ', 'CN03-NV039', '1993-03-06', N'Nữ', N'Hoa', '347082317811', '0986487170', 'thanh.huỳnh@company.vn', N'196 Lê Lợi, Vinh', '2015-02-24', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0160', 'CN03', 'PB040', 'CV08', 'DA040', N'Ngô Công i', 'CN03-NV040', '1989-06-10', N'Nam', N'Thái', '925442744150', '0943172141', 'i.ngô@company.vn', N'880 Lê Lợi, Vinh', '2018-11-27', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0161', 'CN04', 'PB041', 'CV06', 'DA041', N'Huỳnh Thành  ', 'CN04-NV001', '1991-12-22', N'Nữ', N'Nùng', '681976556769', '0970323355', 'thành.huỳnh@company.vn', N'620 Lê Lợi, Nha Trang', '2017-03-13', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0162', 'CN04', 'PB042', 'CV08', 'DA042', N'Võ Đức n', 'CN04-NV002', '1993-09-19', N'Nam', N'Mường', '264758559268', '0994286414', 'n.võ@company.vn', N'98 Nguyễn Huệ, Nha Trang', '2020-04-05', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0163', 'CN04', 'PB043', 'CV04', 'DA043', N'Phan Minh  ', 'CN04-NV003', '1985-02-28', N'Nam', N'Hmông', '540220138097', '0943371958', 'minh.phan@company.vn', N'761 Lê Lợi, Nha Trang', '2016-01-31', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0164', 'CN04', 'PB044', 'CV04', 'DA044', N'Lê Hữu á', 'CN04-NV004', '1987-08-21', N'Nữ', N'Tày', '970741242614', '0923841856', 'á.lê@company.vn', N'961 Nguyễn Huệ, Nha Trang', '2022-10-23', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0165', 'CN04', 'PB045', 'CV08', 'DA045', N'Hoàng Công h', 'CN04-NV005', '1985-03-01', N'Nam', N'Tày', '322439233314', '0991993035', 'h.hoàng@company.vn', N'171 Nguyễn Huệ, Nha Trang', '2024-07-23', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0166', 'CN04', 'PB046', 'CV05', 'DA046', N'Nguyễn Quốc i', 'CN04-NV006', '1988-11-28', N'Nữ', N'Khmer', '230835803339', '0917075052', 'i.nguyễn@company.vn', N'49 Nguyễn Huệ, Nha Trang', '2019-05-10', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0167', 'CN04', 'PB047', 'CV07', 'DA047', N'Huỳnh Minh n', 'CN04-NV007', '1984-04-06', N'Nữ', N'Tày', '879124594526', '0979615640', 'n.huỳnh@company.vn', N'641 Trần Phú, Nha Trang', '2021-08-04', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0168', 'CN04', 'PB048', 'CV08', 'DA048', N'Lê Minh  ', 'CN04-NV008', '1990-09-28', N'Nam', N'Hmông', '353333921953', '0912129123', 'minh.lê@company.vn', N'356 Trần Phú, Nha Trang', '2019-05-25', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0169', 'CN04', 'PB049', 'CV07', 'DA049', N'Võ Văn h', 'CN04-NV009', '1989-10-16', N'Nam', N'Khmer', '226311979414', '0913086442', 'h.võ@company.vn', N'127 Trần Phú, Nha Trang', '2022-03-15', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0170', 'CN04', 'PB050', 'CV05', 'DA050', N'Đỗ Công á', 'CN04-NV010', '1997-05-09', N'Nữ', N'Tày', '610011956119', '0931255377', 'á.đỗ@company.vn', N'98 Lê Lợi, Nha Trang', '2015-09-23', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0171', 'CN04', 'PB041', 'CV06', 'DA041', N'Trần Anh h', 'CN04-NV011', '1997-04-19', N'Nữ', N'Tày', '854300223060', '0927879253', 'h.trần@company.vn', N'248 Trần Phú, Nha Trang', '2022-10-06', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0172', 'CN04', 'PB042', 'CV06', 'DA042', N'Bùi Thanh h', 'CN04-NV012', '1980-09-12', N'Nam', N'Nùng', '843499268002', '0915439331', 'h.bùi@company.vn', N'155 Lê Lợi, Nha Trang', '2020-03-16', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0173', 'CN04', 'PB043', 'CV06', 'DA043', N'Nguyễn Quốc ả', 'CN04-NV013', '1993-05-03', N'Nữ', N'Khmer', '482511023092', '0966065909', 'ả.nguyễn@company.vn', N'904 Nguyễn Huệ, Nha Trang', '2024-05-11', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0174', 'CN04', 'PB044', 'CV06', 'DA044', N'Huỳnh Quốc  ', 'CN04-NV014', '1992-09-22', N'Nam', N'Kinh', '865694104807', '0956562519', 'quốc.huỳnh@company.vn', N'336 Trần Phú, Nha Trang', '2020-03-21', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0175', 'CN04', 'PB045', 'CV07', 'DA045', N'Võ Công n', 'CN04-NV015', '1992-04-06', N'Nam', N'Kinh', '525609538318', '0993159576', 'n.võ@company.vn', N'495 Nguyễn Huệ, Nha Trang', '2021-09-16', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0176', 'CN04', 'PB046', 'CV06', 'DA046', N'Trần Quốc ả', 'CN04-NV016', '1992-10-15', N'Nam', N'Nùng', '997925944448', '0972929989', 'ả.trần@company.vn', N'554 Lê Lợi, Nha Trang', '2022-11-29', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0177', 'CN04', 'PB047', 'CV04', 'DA047', N'Huỳnh Văn  ', 'CN04-NV017', '1997-12-18', N'Nữ', N'Mường', '225559075761', '0977757863', 'văn.huỳnh@company.vn', N'79 Trần Phú, Nha Trang', '2021-11-27', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0178', 'CN04', 'PB048', 'CV08', 'DA048', N'Dương Thị i', 'CN04-NV018', '1989-05-03', N'Nam', N'Kinh', '819883758335', '0979173599', 'i.dương@company.vn', N'720 Trần Phú, Nha Trang', '2019-04-20', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0179', 'CN04', 'PB049', 'CV09', 'DA049', N'Huỳnh Thành n', 'CN04-NV019', '1981-02-10', N'Nữ', N'Nùng', '804825688305', '0986929275', 'n.huỳnh@company.vn', N'233 Nguyễn Huệ, Nha Trang', '2021-07-15', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0180', 'CN04', 'PB050', 'CV09', 'DA050', N'Dương Công g', 'CN04-NV020', '1981-12-15', N'Nam', N'Khmer', '805406223725', '0919965095', 'g.dương@company.vn', N'965 Nguyễn Huệ, Nha Trang', '2020-08-16', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0181', 'CN04', 'PB041', 'CV06', 'DA041', N'Bùi Thanh h', 'CN04-NV021', '1984-11-03', N'Nữ', N'Hmông', '714411344049', '0982763959', 'h.bùi@company.vn', N'973 Trần Phú, Nha Trang', '2016-09-23', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0182', 'CN04', 'PB042', 'CV10', 'DA042', N'Nguyễn Minh h', 'CN04-NV022', '1994-05-19', N'Nam', N'Nùng', '977148967334', '0954802435', 'h.nguyễn@company.vn', N'502 Trần Phú, Nha Trang', '2016-03-28', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0183', 'CN04', 'PB043', 'CV04', 'DA043', N'Nguyễn Tuấn  ', 'CN04-NV023', '1980-06-26', N'Nam', N'Hmông', '225595502228', '0999127223', 'tuấn.nguyễn@company.vn', N'217 Lê Lợi, Nha Trang', '2015-02-20', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0184', 'CN04', 'PB044', 'CV08', 'DA044', N'Dương Công h', 'CN04-NV024', '1983-07-10', N'Nam', N'Hoa', '461569051131', '0942144530', 'h.dương@company.vn', N'511 Trần Phú, Nha Trang', '2021-05-14', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0185', 'CN04', 'PB045', 'CV05', 'DA045', N'Trần Anh n', 'CN04-NV025', '1999-01-24', N'Nữ', N'Thái', '674862968748', '0915077951', 'n.trần@company.vn', N'59 Nguyễn Huệ, Nha Trang', '2021-02-05', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0186', 'CN04', 'PB046', 'CV05', 'DA046', N'Võ Quốc C', 'CN04-NV026', '1985-10-04', N'Nữ', N'Mường', '648516797791', '0989875450', 'c.võ@company.vn', N'245 Lê Lợi, Nha Trang', '2022-01-23', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0187', 'CN04', 'PB047', 'CV10', 'DA047', N'Huỳnh Minh n', 'CN04-NV027', '1992-06-24', N'Nữ', N'Thái', '563875979736', '0966935048', 'n.huỳnh@company.vn', N'534 Trần Phú, Nha Trang', '2017-10-11', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0188', 'CN04', 'PB048', 'CV08', 'DA048', N'Đỗ Văn P', 'CN04-NV028', '1999-08-08', N'Nam', N'Nùng', '479233647860', '0976108887', 'p.đỗ@company.vn', N'689 Lê Lợi, Nha Trang', '2024-12-25', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0189', 'CN04', 'PB049', 'CV09', 'DA049', N'Hồ Thị g', 'CN04-NV029', '2000-04-24', N'Nam', N'Hmông', '246826649083', '0947508853', 'g.hồ@company.vn', N'414 Lê Lợi, Nha Trang', '2024-07-06', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0190', 'CN04', 'PB050', 'CV04', 'DA050', N'Hồ Công h', 'CN04-NV030', '1999-07-22', N'Nữ', N'Hoa', '928006233145', '0973650973', 'h.hồ@company.vn', N'274 Nguyễn Huệ, Nha Trang', '2018-09-07', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0191', 'CN04', 'PB041', 'CV05', 'DA041', N'Trần Thanh i', 'CN04-NV031', '1999-04-28', N'Nam', N'Mường', '605061120643', '0943047306', 'i.trần@company.vn', N'543 Lê Lợi, Nha Trang', '2015-05-11', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0192', 'CN04', 'PB042', 'CV08', 'DA042', N'Hồ Tuấn h', 'CN04-NV032', '2000-11-13', N'Nữ', N'Tày', '559945866589', '0980948193', 'h.hồ@company.vn', N'326 Lê Lợi, Nha Trang', '2022-02-20', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0193', 'CN04', 'PB043', 'CV07', 'DA043', N'Trần Thị H', 'CN04-NV033', '2000-03-07', N'Nam', N'Tày', '588259290033', '0970560755', 'h.trần@company.vn', N'531 Lê Lợi, Nha Trang', '2022-02-06', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0194', 'CN04', 'PB044', 'CV09', 'DA044', N'Phạm Hoàng h', 'CN04-NV034', '1981-11-12', N'Nam', N'Hmông', '411313463460', '0910348793', 'h.phạm@company.vn', N'233 Lê Lợi, Nha Trang', '2021-05-02', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0195', 'CN04', 'PB045', 'CV10', 'DA045', N'Lê Thành ò', 'CN04-NV035', '1984-02-21', N'Nữ', N'Tày', '754344237387', '0912883363', 'ò.lê@company.vn', N'292 Trần Phú, Nha Trang', '2018-10-07', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0196', 'CN04', 'PB046', 'CV10', 'DA046', N'Phan Hoàng C', 'CN04-NV036', '1997-05-16', N'Nữ', N'Kinh', '697599830496', '0931358766', 'c.phan@company.vn', N'823 Nguyễn Huệ, Nha Trang', '2015-04-23', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0197', 'CN04', 'PB047', 'CV07', 'DA047', N'Hoàng Thị h', 'CN04-NV037', '1998-05-26', N'Nam', N'Khmer', '399962797861', '0957919966', 'h.hoàng@company.vn', N'984 Lê Lợi, Nha Trang', '2022-11-17', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0198', 'CN04', 'PB048', 'CV06', 'DA048', N'Võ Thành n', 'CN04-NV038', '1985-12-25', N'Nữ', N'Thái', '629980446297', '0949321101', 'n.võ@company.vn', N'671 Nguyễn Huệ, Nha Trang', '2020-10-19', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0199', 'CN04', 'PB049', 'CV09', 'DA049', N'Ngô Quốc n', 'CN04-NV039', '1995-07-29', N'Nữ', N'Khmer', '836414100555', '0990874094', 'n.ngô@company.vn', N'66 Lê Lợi, Nha Trang', '2016-12-20', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0200', 'CN04', 'PB050', 'CV10', 'DA050', N'Phan Thị h', 'CN04-NV040', '1982-01-14', N'Nam', N'Hmông', '233715537139', '0930648807', 'h.phan@company.vn', N'467 Trần Phú, Nha Trang', '2022-02-02', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0201', 'CN05', 'PB051', 'CV09', 'DA051', N'Võ Anh h', 'CN05-NV001', '1987-12-16', N'Nam', N'Kinh', '323715428947', '0969474270', 'h.võ@company.vn', N'742 Nguyễn Huệ, Thái Bình', '2022-05-05', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0202', 'CN05', 'PB052', 'CV06', 'DA052', N'Dương Hữu i', 'CN05-NV002', '1994-08-31', N'Nữ', N'Kinh', '752625518441', '0994515302', 'i.dương@company.vn', N'736 Nguyễn Huệ, Thái Bình', '2022-10-06', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0203', 'CN05', 'PB053', 'CV09', 'DA053', N'Đỗ Hoàng á', 'CN05-NV003', '1991-09-27', N'Nữ', N'Khmer', '714321229866', '0955749819', 'á.đỗ@company.vn', N'387 Nguyễn Huệ, Thái Bình', '2024-11-23', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0204', 'CN05', 'PB054', 'CV05', 'DA054', N'Huỳnh Hữu i', 'CN05-NV004', '1980-04-07', N'Nữ', N'Thái', '247271703818', '0955829742', 'i.huỳnh@company.vn', N'464 Nguyễn Huệ, Thái Bình', '2020-06-25', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0205', 'CN05', 'PB055', 'CV05', 'DA055', N'Ngô Thanh g', 'CN05-NV005', '1998-09-26', N'Nam', N'Tày', '401161585827', '0926173684', 'g.ngô@company.vn', N'769 Lê Lợi, Thái Bình', '2022-03-17', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0206', 'CN05', 'PB056', 'CV04', 'DA056', N'Bùi Tuấn i', 'CN05-NV006', '1999-05-09', N'Nữ', N'Thái', '641904798520', '0948358064', 'i.bùi@company.vn', N'152 Trần Phú, Thái Bình', '2023-02-11', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0207', 'CN05', 'PB057', 'CV04', 'DA057', N'Phan Anh  ', 'CN05-NV007', '1986-10-23', N'Nữ', N'Khmer', '252067543524', '0953087360', 'anh.phan@company.vn', N'236 Lê Lợi, Thái Bình', '2016-02-26', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0208', 'CN05', 'PB058', 'CV08', 'DA058', N'Võ Hữu n', 'CN05-NV008', '1988-05-03', N'Nam', N'Hoa', '169215338506', '0925470498', 'n.võ@company.vn', N'338 Trần Phú, Thái Bình', '2023-02-05', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0209', 'CN05', 'PB059', 'CV06', 'DA059', N'Bùi Thành  ', 'CN05-NV009', '1998-02-09', N'Nam', N'Hoa', '180571400624', '0931139315', 'thành.bùi@company.vn', N'676 Nguyễn Huệ, Thái Bình', '2016-07-23', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0210', 'CN05', 'PB060', 'CV08', 'DA060', N'Ngô Tuấn H', 'CN05-NV010', '1990-03-07', N'Nam', N'Nùng', '205396621969', '0982598819', 'h.ngô@company.vn', N'28 Lê Lợi, Thái Bình', '2023-04-12', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0211', 'CN05', 'PB051', 'CV05', 'DA051', N'Bùi Thành H', 'CN05-NV011', '1995-06-10', N'Nam', N'Nùng', '457887299184', '0954696212', 'h.bùi@company.vn', N'306 Trần Phú, Thái Bình', '2019-12-01', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0212', 'CN05', 'PB052', 'CV07', 'DA052', N'Đỗ Hoàng g', 'CN05-NV012', '1993-01-02', N'Nam', N'Kinh', '106779157534', '0922529388', 'g.đỗ@company.vn', N'124 Trần Phú, Thái Bình', '2021-03-20', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0213', 'CN05', 'PB053', 'CV08', 'DA053', N'Nguyễn Anh P', 'CN05-NV013', '1989-04-18', N'Nữ', N'Hmông', '993947176207', '0941199737', 'p.nguyễn@company.vn', N'584 Trần Phú, Thái Bình', '2023-05-10', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0214', 'CN05', 'PB054', 'CV07', 'DA054', N'Vũ Thị  ', 'CN05-NV014', '1982-12-21', N'Nữ', N'Hmông', '194675321824', '0982426458', 'thị.vũ@company.vn', N'704 Trần Phú, Thái Bình', '2017-07-15', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0215', 'CN05', 'PB055', 'CV08', 'DA055', N'Vũ Công h', 'CN05-NV015', '1988-01-08', N'Nữ', N'Khmer', '498211583260', '0999574136', 'h.vũ@company.vn', N'31 Trần Phú, Thái Bình', '2022-02-24', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0216', 'CN05', 'PB056', 'CV10', 'DA056', N'Lê Quốc P', 'CN05-NV016', '1981-11-18', N'Nam', N'Nùng', '809642803565', '0945132880', 'p.lê@company.vn', N'801 Nguyễn Huệ, Thái Bình', '2018-04-14', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0217', 'CN05', 'PB057', 'CV05', 'DA057', N'Bùi Anh n', 'CN05-NV017', '1998-06-25', N'Nữ', N'Nùng', '694793745433', '0926175805', 'n.bùi@company.vn', N'131 Lê Lợi, Thái Bình', '2018-05-16', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0218', 'CN05', 'PB058', 'CV04', 'DA058', N'Đỗ Minh ò', 'CN05-NV018', '1985-02-22', N'Nam', N'Kinh', '295283236492', '0994770347', 'ò.đỗ@company.vn', N'983 Lê Lợi, Thái Bình', '2023-06-15', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0219', 'CN05', 'PB059', 'CV04', 'DA059', N'Võ Thành  ', 'CN05-NV019', '1996-08-12', N'Nam', N'Mường', '474156790176', '0960493345', 'thành.võ@company.vn', N'356 Lê Lợi, Thái Bình', '2019-06-28', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0220', 'CN05', 'PB060', 'CV08', 'DA060', N'Dương Công ò', 'CN05-NV020', '1982-06-04', N'Nam', N'Mường', '336643465754', '0960036457', 'ò.dương@company.vn', N'840 Trần Phú, Thái Bình', '2019-02-12', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0221', 'CN05', 'PB051', 'CV05', 'DA051', N'Dương Anh  ', 'CN05-NV021', '1996-03-29', N'Nam', N'Kinh', '114019077420', '0982443305', 'anh.dương@company.vn', N'51 Lê Lợi, Thái Bình', '2021-05-01', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0222', 'CN05', 'PB052', 'CV08', 'DA052', N'Đặng Công á', 'CN05-NV022', '1995-06-29', N'Nữ', N'Hmông', '443413485358', '0997428947', 'á.đặng@company.vn', N'293 Lê Lợi, Thái Bình', '2018-09-08', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0223', 'CN05', 'PB053', 'CV10', 'DA053', N'Võ Tuấn ò', 'CN05-NV023', '1983-01-23', N'Nữ', N'Hmông', '737367646060', '0969057530', 'ò.võ@company.vn', N'803 Lê Lợi, Thái Bình', '2018-08-19', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0224', 'CN05', 'PB054', 'CV05', 'DA054', N'Phan Thành  ', 'CN05-NV024', '1999-01-11', N'Nam', N'Mường', '999806731509', '0977252802', 'thành.phan@company.vn', N'921 Nguyễn Huệ, Thái Bình', '2017-08-04', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0225', 'CN05', 'PB055', 'CV05', 'DA055', N'Đỗ Hữu i', 'CN05-NV025', '1994-08-15', N'Nữ', N'Hoa', '731161513636', '0916365618', 'i.đỗ@company.vn', N'341 Trần Phú, Thái Bình', '2018-02-23', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0226', 'CN05', 'PB056', 'CV10', 'DA056', N'Đặng Đức g', 'CN05-NV026', '1993-10-20', N'Nam', N'Thái', '542140091309', '0997739475', 'g.đặng@company.vn', N'251 Lê Lợi, Thái Bình', '2017-07-01', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0227', 'CN05', 'PB057', 'CV07', 'DA057', N'Ngô Thanh n', 'CN05-NV027', '1984-12-12', N'Nữ', N'Hmông', '137718641060', '0925457018', 'n.ngô@company.vn', N'895 Trần Phú, Thái Bình', '2018-08-27', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0228', 'CN05', 'PB058', 'CV09', 'DA058', N'Nguyễn Anh  ', 'CN05-NV028', '1998-09-29', N'Nữ', N'Khmer', '821158060301', '0986680060', 'anh.nguyễn@company.vn', N'663 Lê Lợi, Thái Bình', '2020-08-02', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0229', 'CN05', 'PB059', 'CV07', 'DA059', N'Phan Hữu  ', 'CN05-NV029', '1985-11-22', N'Nữ', N'Hoa', '239676682872', '0971149199', 'hữu.phan@company.vn', N'724 Lê Lợi, Thái Bình', '2021-02-12', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0230', 'CN05', 'PB060', 'CV10', 'DA060', N'Bùi Thị ò', 'CN05-NV030', '1981-03-16', N'Nam', N'Tày', '895444569587', '0976747316', 'ò.bùi@company.vn', N'554 Trần Phú, Thái Bình', '2019-01-14', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0231', 'CN05', 'PB051', 'CV10', 'DA051', N'Võ Tuấn á', 'CN05-NV031', '1992-12-25', N'Nam', N'Hmông', '991445520539', '0916360044', 'á.võ@company.vn', N'304 Lê Lợi, Thái Bình', '2019-06-05', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0232', 'CN05', 'PB052', 'CV09', 'DA052', N'Hồ Đức h', 'CN05-NV032', '1993-03-02', N'Nam', N'Kinh', '366893170347', '0925797845', 'h.hồ@company.vn', N'313 Lê Lợi, Thái Bình', '2023-12-12', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0233', 'CN05', 'PB053', 'CV04', 'DA053', N'Phan Công  ', 'CN05-NV033', '1998-05-05', N'Nam', N'Tày', '728390338884', '0999591329', 'công.phan@company.vn', N'723 Nguyễn Huệ, Thái Bình', '2020-11-28', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0234', 'CN05', 'PB054', 'CV06', 'DA054', N'Ngô Công ò', 'CN05-NV034', '1986-02-12', N'Nữ', N'Thái', '717113287589', '0945961038', 'ò.ngô@company.vn', N'699 Lê Lợi, Thái Bình', '2021-08-08', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0235', 'CN05', 'PB055', 'CV07', 'DA055', N'Huỳnh Văn g', 'CN05-NV035', '1984-01-03', N'Nữ', N'Mường', '313048521370', '0950822134', 'g.huỳnh@company.vn', N'454 Trần Phú, Thái Bình', '2021-09-16', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0236', 'CN05', 'PB056', 'CV08', 'DA056', N'Hoàng Thị n', 'CN05-NV036', '1986-06-21', N'Nam', N'Khmer', '894532451751', '0953925797', 'n.hoàng@company.vn', N'760 Nguyễn Huệ, Thái Bình', '2015-06-27', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0237', 'CN05', 'PB057', 'CV09', 'DA057', N'Nguyễn Quốc h', 'CN05-NV037', '1982-10-23', N'Nam', N'Thái', '456171732851', '0990779446', 'h.nguyễn@company.vn', N'30 Nguyễn Huệ, Thái Bình', '2020-08-10', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0238', 'CN05', 'PB058', 'CV09', 'DA058', N'Lê Đức H', 'CN05-NV038', '1991-03-25', N'Nữ', N'Mường', '176739155987', '0991523092', 'h.lê@company.vn', N'755 Lê Lợi, Thái Bình', '2015-10-13', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0239', 'CN05', 'PB059', 'CV06', 'DA059', N'Ngô Thị P', 'CN05-NV039', '1991-06-16', N'Nam', N'Tày', '775060035458', '0944827471', 'p.ngô@company.vn', N'98 Nguyễn Huệ, Thái Bình', '2023-10-27', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0240', 'CN05', 'PB060', 'CV10', 'DA060', N'Dương Minh i', 'CN05-NV040', '1980-09-06', N'Nam', N'Tày', '454949975163', '0957552656', 'i.dương@company.vn', N'67 Trần Phú, Thái Bình', '2020-09-10', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0241', 'CN06', 'PB061', 'CV06', 'DA061', N'Bùi Tuấn i', 'CN06-NV001', '1982-12-06', N'Nữ', N'Thái', '595650438989', '0946745931', 'i.bùi@company.vn', N'522 Nguyễn Huệ, Hải Phòng', '2018-04-14', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0242', 'CN06', 'PB062', 'CV08', 'DA062', N'Đỗ Minh  ', 'CN06-NV002', '1986-12-04', N'Nữ', N'Hoa', '502216805688', '0987807675', 'minh.đỗ@company.vn', N'200 Nguyễn Huệ, Hải Phòng', '2021-10-29', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0243', 'CN06', 'PB063', 'CV09', 'DA063', N'Đặng Văn C', 'CN06-NV003', '1989-09-17', N'Nam', N'Thái', '556025646388', '0920103738', 'c.đặng@company.vn', N'60 Lê Lợi, Hải Phòng', '2021-05-25', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0244', 'CN06', 'PB064', 'CV09', 'DA064', N'Trần Minh n', 'CN06-NV004', '1992-05-25', N'Nam', N'Hoa', '857281244029', '0947891125', 'n.trần@company.vn', N'246 Lê Lợi, Hải Phòng', '2020-04-12', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0245', 'CN06', 'PB065', 'CV06', 'DA065', N'Vũ Tuấn ả', 'CN06-NV005', '1995-03-18', N'Nam', N'Mường', '842788009499', '0958101314', 'ả.vũ@company.vn', N'515 Nguyễn Huệ, Hải Phòng', '2017-08-10', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0246', 'CN06', 'PB066', 'CV05', 'DA066', N'Lê Thanh n', 'CN06-NV006', '1996-02-20', N'Nữ', N'Kinh', '689874376609', '0992493361', 'n.lê@company.vn', N'314 Lê Lợi, Hải Phòng', '2021-08-21', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0247', 'CN06', 'PB067', 'CV04', 'DA067', N'Vũ Hoàng i', 'CN06-NV007', '1986-05-23', N'Nữ', N'Hmông', '345961634579', '0981626052', 'i.vũ@company.vn', N'365 Lê Lợi, Hải Phòng', '2021-02-04', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0248', 'CN06', 'PB068', 'CV10', 'DA068', N'Bùi Thanh h', 'CN06-NV008', '1998-05-02', N'Nữ', N'Kinh', '108774812198', '0935214757', 'h.bùi@company.vn', N'727 Trần Phú, Hải Phòng', '2020-02-22', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0249', 'CN06', 'PB069', 'CV06', 'DA069', N'Bùi Thành n', 'CN06-NV009', '1997-12-13', N'Nam', N'Hmông', '822813368781', '0942064289', 'n.bùi@company.vn', N'261 Nguyễn Huệ, Hải Phòng', '2022-11-13', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0250', 'CN06', 'PB070', 'CV08', 'DA070', N'Hồ Minh H', 'CN06-NV010', '1980-03-08', N'Nữ', N'Thái', '870381259314', '0983984777', 'h.hồ@company.vn', N'817 Nguyễn Huệ, Hải Phòng', '2016-06-14', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0251', 'CN06', 'PB061', 'CV07', 'DA061', N'Ngô Anh á', 'CN06-NV011', '1987-05-24', N'Nam', N'Khmer', '245740619276', '0991603153', 'á.ngô@company.vn', N'231 Trần Phú, Hải Phòng', '2024-09-09', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0252', 'CN06', 'PB062', 'CV05', 'DA062', N'Phan Thị á', 'CN06-NV012', '1982-07-24', N'Nữ', N'Hmông', '386678078048', '0967512982', 'á.phan@company.vn', N'794 Nguyễn Huệ, Hải Phòng', '2021-05-10', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0253', 'CN06', 'PB063', 'CV05', 'DA063', N'Lê Quốc h', 'CN06-NV013', '1998-04-29', N'Nam', N'Nùng', '521684503497', '0919545028', 'h.lê@company.vn', N'742 Nguyễn Huệ, Hải Phòng', '2022-11-25', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0254', 'CN06', 'PB064', 'CV06', 'DA064', N'Hoàng Thanh ả', 'CN06-NV014', '1983-12-29', N'Nam', N'Thái', '691479967727', '0961828330', 'ả.hoàng@company.vn', N'503 Lê Lợi, Hải Phòng', '2024-05-30', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0255', 'CN06', 'PB065', 'CV09', 'DA065', N'Phạm Hữu ả', 'CN06-NV015', '1994-06-24', N'Nam', N'Khmer', '294752799858', '0966036829', 'ả.phạm@company.vn', N'537 Trần Phú, Hải Phòng', '2021-11-16', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0256', 'CN06', 'PB066', 'CV10', 'DA066', N'Võ Hữu C', 'CN06-NV016', '1999-04-30', N'Nữ', N'Khmer', '811259200366', '0933470594', 'c.võ@company.vn', N'408 Nguyễn Huệ, Hải Phòng', '2016-01-02', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0257', 'CN06', 'PB067', 'CV10', 'DA067', N'Dương Hữu h', 'CN06-NV017', '1987-06-12', N'Nữ', N'Mường', '759283961516', '0919085527', 'h.dương@company.vn', N'549 Trần Phú, Hải Phòng', '2018-05-05', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0258', 'CN06', 'PB068', 'CV06', 'DA068', N'Lê Hoàng  ', 'CN06-NV018', '1999-07-14', N'Nam', N'Khmer', '788881893667', '0960628181', 'hoàng.lê@company.vn', N'375 Lê Lợi, Hải Phòng', '2017-07-27', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0259', 'CN06', 'PB069', 'CV09', 'DA069', N'Đỗ Đức C', 'CN06-NV019', '2000-04-30', N'Nữ', N'Nùng', '122820461154', '0946886948', 'c.đỗ@company.vn', N'542 Trần Phú, Hải Phòng', '2020-12-14', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0260', 'CN06', 'PB070', 'CV06', 'DA070', N'Trần Đức á', 'CN06-NV020', '1993-10-20', N'Nữ', N'Thái', '795704536558', '0956682086', 'á.trần@company.vn', N'326 Nguyễn Huệ, Hải Phòng', '2022-12-25', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0261', 'CN06', 'PB061', 'CV05', 'DA061', N'Phạm Thị  ', 'CN06-NV021', '1987-05-06', N'Nữ', N'Kinh', '184732916125', '0925208064', 'thị.phạm@company.vn', N'255 Nguyễn Huệ, Hải Phòng', '2019-03-30', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0262', 'CN06', 'PB062', 'CV09', 'DA062', N'Phạm Minh n', 'CN06-NV022', '1999-09-03', N'Nữ', N'Tày', '396767431661', '0948295274', 'n.phạm@company.vn', N'390 Trần Phú, Hải Phòng', '2016-05-08', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0263', 'CN06', 'PB063', 'CV04', 'DA063', N'Hoàng Thanh h', 'CN06-NV023', '1985-01-16', N'Nữ', N'Nùng', '937279592111', '0914164451', 'h.hoàng@company.vn', N'745 Trần Phú, Hải Phòng', '2024-09-23', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0264', 'CN06', 'PB064', 'CV05', 'DA064', N'Lê Thị h', 'CN06-NV024', '1997-06-27', N'Nữ', N'Kinh', '886671766344', '0945239268', 'h.lê@company.vn', N'113 Nguyễn Huệ, Hải Phòng', '2018-01-04', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0265', 'CN06', 'PB065', 'CV09', 'DA065', N'Lê Thanh ò', 'CN06-NV025', '1992-05-25', N'Nam', N'Hoa', '105875574291', '0972803088', 'ò.lê@company.vn', N'146 Lê Lợi, Hải Phòng', '2024-05-02', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0266', 'CN06', 'PB066', 'CV06', 'DA066', N'Võ Minh i', 'CN06-NV026', '1984-12-22', N'Nữ', N'Tày', '563040180589', '0920738042', 'i.võ@company.vn', N'436 Lê Lợi, Hải Phòng', '2017-03-15', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0267', 'CN06', 'PB067', 'CV08', 'DA067', N'Hoàng Thị  ', 'CN06-NV027', '1995-02-13', N'Nữ', N'Hoa', '278841772162', '0988067314', 'thị.hoàng@company.vn', N'321 Nguyễn Huệ, Hải Phòng', '2015-04-24', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0268', 'CN06', 'PB068', 'CV04', 'DA068', N'Hoàng Hữu H', 'CN06-NV028', '1992-06-19', N'Nữ', N'Kinh', '809060900585', '0958224344', 'h.hoàng@company.vn', N'292 Nguyễn Huệ, Hải Phòng', '2016-09-25', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0269', 'CN06', 'PB069', 'CV10', 'DA069', N'Phan Thanh n', 'CN06-NV029', '1990-05-21', N'Nữ', N'Mường', '816871224197', '0914971574', 'n.phan@company.vn', N'141 Trần Phú, Hải Phòng', '2016-04-11', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0270', 'CN06', 'PB070', 'CV08', 'DA070', N'Dương Anh P', 'CN06-NV030', '2000-04-05', N'Nữ', N'Hoa', '329547447798', '0938387635', 'p.dương@company.vn', N'679 Trần Phú, Hải Phòng', '2019-09-06', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0271', 'CN06', 'PB061', 'CV05', 'DA061', N'Đặng Tuấn ả', 'CN06-NV031', '1989-10-24', N'Nữ', N'Nùng', '323847878415', '0944646100', 'ả.đặng@company.vn', N'434 Trần Phú, Hải Phòng', '2016-05-04', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0272', 'CN06', 'PB062', 'CV09', 'DA062', N'Võ Thanh C', 'CN06-NV032', '1993-09-06', N'Nữ', N'Kinh', '314093542910', '0951390336', 'c.võ@company.vn', N'602 Nguyễn Huệ, Hải Phòng', '2015-06-24', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0273', 'CN06', 'PB063', 'CV09', 'DA063', N'Trần Quốc ò', 'CN06-NV033', '1991-03-29', N'Nam', N'Mường', '488967226272', '0946795150', 'ò.trần@company.vn', N'682 Trần Phú, Hải Phòng', '2016-12-01', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0274', 'CN06', 'PB064', 'CV10', 'DA064', N'Phạm Tuấn  ', 'CN06-NV034', '1981-05-25', N'Nữ', N'Khmer', '751922042846', '0980264742', 'tuấn.phạm@company.vn', N'841 Nguyễn Huệ, Hải Phòng', '2015-05-18', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0275', 'CN06', 'PB065', 'CV09', 'DA065', N'Vũ Quốc n', 'CN06-NV035', '1981-11-14', N'Nữ', N'Tày', '944944106085', '0930728523', 'n.vũ@company.vn', N'692 Nguyễn Huệ, Hải Phòng', '2023-01-23', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0276', 'CN06', 'PB066', 'CV06', 'DA066', N'Hoàng Anh  ', 'CN06-NV036', '1983-06-12', N'Nam', N'Khmer', '211304095428', '0966899793', 'anh.hoàng@company.vn', N'971 Lê Lợi, Hải Phòng', '2023-05-14', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0277', 'CN06', 'PB067', 'CV05', 'DA067', N'Phan Văn h', 'CN06-NV037', '1980-12-02', N'Nam', N'Mường', '782669855229', '0918572697', 'h.phan@company.vn', N'470 Lê Lợi, Hải Phòng', '2021-10-24', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0278', 'CN06', 'PB068', 'CV04', 'DA068', N'Phạm Minh h', 'CN06-NV038', '1983-07-09', N'Nam', N'Khmer', '839593409685', '0967436801', 'h.phạm@company.vn', N'337 Nguyễn Huệ, Hải Phòng', '2016-12-01', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0279', 'CN06', 'PB069', 'CV09', 'DA069', N'Hồ Thành g', 'CN06-NV039', '1998-08-09', N'Nữ', N'Hoa', '292328367428', '0958922228', 'g.hồ@company.vn', N'478 Lê Lợi, Hải Phòng', '2021-09-26', 1);
INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)
VALUES ('NV0280', 'CN06', 'PB070', 'CV08', 'DA070', N'Ngô Minh h', 'CN06-NV040', '1993-06-12', N'Nam', N'Mường', '210867127048', '0991717258', 'h.ngô@company.vn', N'748 Trần Phú, Hải Phòng', '2023-01-12', 1);
GO

-- 8. LƯƠNG (280 bản ghi)
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0001', 'NV0001', 35285007, 4007887, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0002', 'NV0002', 18120445, 3441472, 8070791, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0003', 'NV0003', 40744345, 4478789, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0004', 'NV0004', 13504765, 2293639, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0005', 'NV0005', 14216161, 3218460, 9084918, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0006', 'NV0006', 33263005, 3263107, 7356645, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0007', 'NV0007', 27843262, 3645621, 4641921, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0008', 'NV0008', 31556824, 2720034, 2034218, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0009', 'NV0009', 48553336, 2209403, 4430573, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0010', 'NV0010', 40620087, 4715851, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0011', 'NV0011', 9686831, 1227979, 1651432, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0012', 'NV0012', 25004063, 2398113, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0013', 'NV0013', 32354226, 1043539, 5133412, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0014', 'NV0014', 37994731, 4293341, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0015', 'NV0015', 35673963, 2640280, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0016', 'NV0016', 9735140, 1925281, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0017', 'NV0017', 29608088, 4915010, 5473309, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0018', 'NV0018', 34930758, 1979823, 7512245, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0019', 'NV0019', 18485820, 3323965, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0020', 'NV0020', 49021586, 4911652, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0021', 'NV0021', 23780809, 4744015, 3262163, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0022', 'NV0022', 34468605, 2401762, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0023', 'NV0023', 17691937, 3580586, 2625890, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0024', 'NV0024', 9288749, 1672361, 2764894, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0025', 'NV0025', 44716829, 2746692, 5856735, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0026', 'NV0026', 20768382, 2278299, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0027', 'NV0027', 22486358, 1762849, 6553615, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0028', 'NV0028', 19823108, 2790041, 8594905, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0029', 'NV0029', 25777023, 3877966, 4779022, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0030', 'NV0030', 36394535, 3290674, 1998258, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0031', 'NV0031', 37408647, 1914623, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0032', 'NV0032', 41563131, 1116301, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0033', 'NV0033', 38961146, 4105872, 5412965, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0034', 'NV0034', 39700602, 4230830, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0035', 'NV0035', 22161004, 3719049, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0036', 'NV0036', 30333530, 2965676, 7828333, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0037', 'NV0037', 36949057, 2085895, 9078915, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0038', 'NV0038', 8608667, 4160066, 7647194, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0039', 'NV0039', 11619566, 3054153, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0040', 'NV0040', 45586714, 4316290, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0041', 'NV0041', 32834424, 4510844, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0042', 'NV0042', 42139501, 4808311, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0043', 'NV0043', 40255077, 3944933, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0044', 'NV0044', 40052161, 3230547, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0045', 'NV0045', 47239468, 2171629, 3489426, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0046', 'NV0046', 17372823, 4118628, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0047', 'NV0047', 8562146, 2600307, 5353092, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0048', 'NV0048', 23918763, 1402905, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0049', 'NV0049', 16848416, 1492902, 9199574, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0050', 'NV0050', 23944911, 1807672, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0051', 'NV0051', 48506669, 4887304, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0052', 'NV0052', 16123405, 4490944, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0053', 'NV0053', 48895553, 2681767, 5074559, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0054', 'NV0054', 42340963, 1133347, 6010789, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0055', 'NV0055', 43958521, 3598201, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0056', 'NV0056', 38393973, 1700442, 1699131, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0057', 'NV0057', 45959488, 2874988, 8959403, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0058', 'NV0058', 10931282, 1798207, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0059', 'NV0059', 31597612, 1169441, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0060', 'NV0060', 16212564, 3390553, 3441342, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0061', 'NV0061', 17419145, 1268918, 7398882, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0062', 'NV0062', 34867792, 3141080, 4577116, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0063', 'NV0063', 43913529, 2502957, 858366, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0064', 'NV0064', 19494370, 4481228, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0065', 'NV0065', 36035187, 3014777, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0066', 'NV0066', 47390433, 1621796, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0067', 'NV0067', 20249508, 2184378, 3149808, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0068', 'NV0068', 46103243, 3926532, 9696362, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0069', 'NV0069', 23104313, 1301416, 6231182, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0070', 'NV0070', 13018525, 1144246, 7655275, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0071', 'NV0071', 27732026, 4729925, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0072', 'NV0072', 11945479, 1746750, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0073', 'NV0073', 31688455, 3940902, 9139561, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0074', 'NV0074', 28939962, 4717542, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0075', 'NV0075', 24519473, 1031590, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0076', 'NV0076', 17284001, 3775984, 43293, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0077', 'NV0077', 10613951, 3698295, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0078', 'NV0078', 8400020, 1690064, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0079', 'NV0079', 18800422, 2885866, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0080', 'NV0080', 47871929, 3985555, 2182017, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0081', 'NV0081', 45674354, 4274210, 2385246, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0082', 'NV0082', 34301057, 3131355, 108715, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0083', 'NV0083', 16533787, 3374092, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0084', 'NV0084', 37922168, 2246397, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0085', 'NV0085', 40543822, 1436711, 5847383, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0086', 'NV0086', 9409753, 2112997, 586689, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0087', 'NV0087', 36322778, 3083971, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0088', 'NV0088', 46163752, 3938718, 5721374, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0089', 'NV0089', 35674440, 4209647, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0090', 'NV0090', 9195621, 3644755, 6771788, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0091', 'NV0091', 46914964, 1770155, 6686643, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0092', 'NV0092', 39646058, 4864595, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0093', 'NV0093', 9165702, 3424081, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0094', 'NV0094', 16450643, 1663310, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0095', 'NV0095', 8998875, 2954748, 9392023, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0096', 'NV0096', 17660392, 1156754, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0097', 'NV0097', 18423819, 1297137, 2052424, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0098', 'NV0098', 15532186, 3545215, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0099', 'NV0099', 44127994, 4221456, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0100', 'NV0100', 34258102, 4442482, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0101', 'NV0101', 48742389, 1399627, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0102', 'NV0102', 36864340, 3943733, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0103', 'NV0103', 29799679, 4792391, 8338070, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0104', 'NV0104', 11045922, 4721704, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0105', 'NV0105', 25941234, 3388416, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0106', 'NV0106', 30551907, 3858391, 8056924, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0107', 'NV0107', 8193307, 4564054, 6004219, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0108', 'NV0108', 35847968, 2364959, 2606510, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0109', 'NV0109', 13974334, 1334694, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0110', 'NV0110', 39400215, 3708252, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0111', 'NV0111', 18907103, 3800655, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0112', 'NV0112', 13731088, 2427847, 1659971, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0113', 'NV0113', 32843441, 1937194, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0114', 'NV0114', 47806146, 3267921, 7004778, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0115', 'NV0115', 29551488, 2877165, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0116', 'NV0116', 48527047, 1124927, 3280226, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0117', 'NV0117', 46040410, 2661903, 8398021, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0118', 'NV0118', 39829164, 1806301, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0119', 'NV0119', 11541565, 1726024, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0120', 'NV0120', 29666454, 4407128, 2158408, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0121', 'NV0121', 28122126, 2374187, 2998021, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0122', 'NV0122', 8133738, 4946945, 7524904, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0123', 'NV0123', 23430290, 3549338, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0124', 'NV0124', 30224275, 3601155, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0125', 'NV0125', 33568210, 1069600, 5495703, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0126', 'NV0126', 19507492, 1036630, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0127', 'NV0127', 44269599, 4436978, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0128', 'NV0128', 28053283, 2467719, 2836667, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0129', 'NV0129', 11985939, 3953387, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0130', 'NV0130', 10636018, 2808555, 9794179, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0131', 'NV0131', 21815314, 4847537, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0132', 'NV0132', 48950826, 3353146, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0133', 'NV0133', 12956852, 3812413, 3951896, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0134', 'NV0134', 41158877, 1490000, 309456, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0135', 'NV0135', 17662159, 3590040, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0136', 'NV0136', 38929181, 1278767, 6793056, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0137', 'NV0137', 33529756, 4559513, 9223696, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0138', 'NV0138', 25519490, 2301280, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0139', 'NV0139', 17076462, 3166966, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0140', 'NV0140', 8005402, 3746171, 9476921, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0141', 'NV0141', 13633243, 2223976, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0142', 'NV0142', 26645400, 4824057, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0143', 'NV0143', 32612489, 2325993, 4199669, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0144', 'NV0144', 19291679, 4367916, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0145', 'NV0145', 15261191, 1727778, 105746, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0146', 'NV0146', 27366227, 2941190, 7152705, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0147', 'NV0147', 30267990, 4247288, 9283590, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0148', 'NV0148', 47174819, 2770443, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0149', 'NV0149', 37122104, 3625871, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0150', 'NV0150', 27172716, 3190037, 3568238, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0151', 'NV0151', 27220789, 1741183, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0152', 'NV0152', 29905728, 3497370, 9374929, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0153', 'NV0153', 19818745, 2593420, 3335008, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0154', 'NV0154', 48765350, 3912241, 7176442, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0155', 'NV0155', 20964816, 2842196, 5822643, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0156', 'NV0156', 43209121, 2399598, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0157', 'NV0157', 35919347, 2363699, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0158', 'NV0158', 37017703, 3355138, 2265137, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0159', 'NV0159', 46558007, 3477984, 9581490, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0160', 'NV0160', 47651082, 3830547, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0161', 'NV0161', 49458530, 2083703, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0162', 'NV0162', 47372416, 4701352, 320471, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0163', 'NV0163', 11844604, 2926858, 2308639, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0164', 'NV0164', 45065502, 2218096, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0165', 'NV0165', 23314421, 4432143, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0166', 'NV0166', 32571229, 3451944, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0167', 'NV0167', 44766623, 1113512, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0168', 'NV0168', 21513382, 2746661, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0169', 'NV0169', 35344133, 1934352, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0170', 'NV0170', 24469223, 1433898, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0171', 'NV0171', 46734085, 4172205, 3916219, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0172', 'NV0172', 28089126, 4404468, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0173', 'NV0173', 34515029, 2586586, 461126, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0174', 'NV0174', 31299460, 2562535, 7339915, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0175', 'NV0175', 11964345, 4885787, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0176', 'NV0176', 13236628, 3101139, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0177', 'NV0177', 23095421, 1634287, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0178', 'NV0178', 8304340, 2756192, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0179', 'NV0179', 32267859, 2603588, 895899, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0180', 'NV0180', 21056350, 4369315, 3117062, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0181', 'NV0181', 21988530, 3783118, 6813941, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0182', 'NV0182', 15849862, 2981880, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0183', 'NV0183', 26825417, 3072397, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0184', 'NV0184', 33164885, 2614848, 6602728, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0185', 'NV0185', 38490674, 3082852, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0186', 'NV0186', 32817708, 4966122, 7117931, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0187', 'NV0187', 45849871, 4163061, 2350066, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0188', 'NV0188', 43519862, 1717468, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0189', 'NV0189', 12437080, 3948596, 1284315, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0190', 'NV0190', 25722975, 1537101, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0191', 'NV0191', 19802842, 1582726, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0192', 'NV0192', 13343967, 4447811, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0193', 'NV0193', 37209650, 4021475, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0194', 'NV0194', 10265653, 1664963, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0195', 'NV0195', 24158292, 4544708, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0196', 'NV0196', 19333291, 3162015, 9500261, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0197', 'NV0197', 14074488, 2994925, 2791407, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0198', 'NV0198', 8672847, 1042920, 6041996, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0199', 'NV0199', 30538054, 1538564, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0200', 'NV0200', 37737338, 4052158, 5383709, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0201', 'NV0201', 16987748, 4495955, 7690808, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0202', 'NV0202', 31055324, 4863350, 3699405, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0203', 'NV0203', 36754878, 4584006, 7347594, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0204', 'NV0204', 23694767, 1293511, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0205', 'NV0205', 17696588, 4639082, 5382159, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0206', 'NV0206', 8765850, 4820979, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0207', 'NV0207', 19336643, 1132741, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0208', 'NV0208', 25945812, 2804629, 7911828, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0209', 'NV0209', 41562670, 4527612, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0210', 'NV0210', 47105510, 4797994, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0211', 'NV0211', 31785771, 1485075, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0212', 'NV0212', 28881478, 3258553, 4730893, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0213', 'NV0213', 37115055, 3517716, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0214', 'NV0214', 34640743, 3022759, 5520139, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0215', 'NV0215', 43780344, 1165795, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0216', 'NV0216', 46374343, 4561250, 4989067, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0217', 'NV0217', 16195360, 4945254, 3309557, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0218', 'NV0218', 45363747, 2971941, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0219', 'NV0219', 45266983, 4491874, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0220', 'NV0220', 27843846, 1931377, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0221', 'NV0221', 32483631, 4830511, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0222', 'NV0222', 40987927, 3758938, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0223', 'NV0223', 11592557, 2257257, 7581853, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0224', 'NV0224', 15415473, 4498765, 6856830, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0225', 'NV0225', 48512618, 1698342, 6560698, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0226', 'NV0226', 23669098, 1782311, 5338553, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0227', 'NV0227', 15049823, 1016857, 6656858, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0228', 'NV0228', 48246003, 1310993, 1394883, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0229', 'NV0229', 10068748, 4525381, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0230', 'NV0230', 35621505, 4159137, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0231', 'NV0231', 14434944, 4228028, 7516497, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0232', 'NV0232', 20579804, 4444415, 7732646, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0233', 'NV0233', 40577320, 3325079, 8835301, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0234', 'NV0234', 12326922, 3958098, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0235', 'NV0235', 34593530, 2595734, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0236', 'NV0236', 10359072, 1923502, 7276497, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0237', 'NV0237', 13290040, 3310805, 3775359, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0238', 'NV0238', 18921893, 3146180, 5813972, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0239', 'NV0239', 46988731, 3427612, 8381030, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0240', 'NV0240', 12073695, 4786361, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0241', 'NV0241', 23805535, 3458625, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0242', 'NV0242', 21285218, 3575824, 2865235, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0243', 'NV0243', 44131803, 1581109, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0244', 'NV0244', 44091061, 1428488, 1918764, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0245', 'NV0245', 47533956, 1154826, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0246', 'NV0246', 16226729, 2767693, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0247', 'NV0247', 15438216, 2372288, 8477860, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0248', 'NV0248', 28132121, 4731717, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0249', 'NV0249', 20741907, 3359084, 2397057, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0250', 'NV0250', 39760121, 2666109, 6448336, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0251', 'NV0251', 23544403, 3241023, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0252', 'NV0252', 40168307, 4744133, 3949085, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0253', 'NV0253', 18366534, 1880752, 6710147, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0254', 'NV0254', 39807827, 1962764, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0255', 'NV0255', 18484149, 2650739, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0256', 'NV0256', 39660366, 1618598, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0257', 'NV0257', 20415837, 3894241, 5607600, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0258', 'NV0258', 33993695, 2664592, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0259', 'NV0259', 38452823, 4306075, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0260', 'NV0260', 11835772, 3837040, 5382349, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0261', 'NV0261', 37774843, 2396267, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0262', 'NV0262', 31125152, 2494828, 1413112, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0263', 'NV0263', 11361431, 1560668, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0264', 'NV0264', 42806834, 3185326, 6402905, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0265', 'NV0265', 22268557, 2891388, 592575, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0266', 'NV0266', 14573982, 1118043, 3391108, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0267', 'NV0267', 9370528, 4851223, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0268', 'NV0268', 44494614, 1112232, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0269', 'NV0269', 38822948, 1063633, 1726526, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0270', 'NV0270', 41408150, 3237459, 2773780, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0271', 'NV0271', 30075382, 3989031, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0272', 'NV0272', 23663647, 1751087, 7224429, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0273', 'NV0273', 34721014, 4987128, 5786511, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0274', 'NV0274', 20660856, 3992884, 5566530, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0275', 'NV0275', 43035148, 1209003, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0276', 'NV0276', 45282442, 1712608, 6373047, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0277', 'NV0277', 28066702, 1504834, 2568238, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0278', 'NV0278', 49502546, 4441613, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0279', 'NV0279', 49197421, 4921312, 0, '2025-11-01');
INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)
VALUES ('L0280', 'NV0280', 13142948, 4330327, 6449753, '2025-11-01');
GO

PRINT '';
PRINT '✅ ĐÃ TẠO XONG DATA CHO TRỤ SỞ CHÍNH!';
PRINT 'Database: QuanLyNhanSu_TruSo';
PRINT '- 1 Trụ sở chính';
PRINT '- 7 Chi nhánh';
PRINT '- 70 Phòng ban (10/chi nhánh)';
PRINT '- 70 Dự án (10/chi nhánh)';
PRINT '- 10 Chức vụ';
PRINT '- 280 Nhân viên (40/chi nhánh)';
PRINT '- 280 Bản ghi lương';
GO