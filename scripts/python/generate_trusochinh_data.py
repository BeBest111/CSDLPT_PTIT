#!/usr/bin/env python3
"""
Generate data for TruSoChinh Database
- 1 Trụ sở chính
- 7 Chi nhánh (bao gồm cả HN)
- 280 Nhân viên (40/chi nhánh)
"""

import random
from datetime import datetime, timedelta

# Danh sách
ho_lot = ['Nguyễn', 'Trần', 'Lê', 'Phạm', 'Hoàng', 'Huỳnh', 'Phan', 'Vũ', 'Võ', 'Đặng', 'Bùi', 'Đỗ', 'Hồ', 'Ngô', 'Dương']
ten_dem = ['Văn', 'Thị', 'Đức', 'Minh', 'Hoàng', 'Anh', 'Quốc', 'Hữu', 'Công', 'Thanh', 'Tuấn', 'Thành']
ten = ['An', 'Bình', 'Cường', 'Dũng', 'Hùng', 'Khoa', 'Long', 'Nam', 'Phong', 'Quân', 'Sơn', 'Tài', 'Tâm', 'Thắng', 'Tiến', 'Trung', 'Tùng', 'Việt', 'Linh', 'Mai', 'Nga', 'Nhung', 'Phương', 'Thu', 'Trang', 'Yến']

dan_toc = ['Kinh', 'Tày', 'Thái', 'Mường', 'Khmer', 'Hoa', 'Nùng', 'Hmông']
gioi_tinh = ['Nam', 'Nữ']

chi_nhanh = [
    ('CN00', 'Trụ sở chính Hà Nội', 'Hà Nội', '123 Trần Hưng Đạo, Hoàn Kiếm, Hà Nội', 'hanoi@company.vn', '0243123456'),
    ('CN01', 'Chi nhánh Huế', 'Huế', '456 Lê Lợi, Thành phố Huế', 'hue@company.vn', '0234123456'),
    ('CN02', 'Chi nhánh Nam Định', 'Nam Định', '789 Trần Phú, Thành phố Nam Định', 'namdinh@company.vn', '0228123456'),
    ('CN03', 'Chi nhánh Vinh', 'Vinh', '321 Quang Trung, Thành phố Vinh', 'vinh@company.vn', '0238123456'),
    ('CN04', 'Chi nhánh Nha Trang', 'Nha Trang', '654 Trần Phú, Thành phố Nha Trang', 'nhatrang@company.vn', '0258123456'),
    ('CN05', 'Chi nhánh Thái Bình', 'Thái Bình', '987 Lý Bôn, Thành phố Thái Bình', 'thaibinh@company.vn', '0227123456'),
    ('CN06', 'Chi nhánh Hải Phòng', 'Hải Phòng', '147 Điện Biên Phủ, Hải Phòng', 'haiphong@company.vn', '0225123456'),
]

phong_ban_names = ['Nhân sự', 'Kế toán', 'Kinh doanh', 'Marketing', 'IT', 'Hành chính', 'Sản xuất', 'Kỹ thuật', 'Nghiên cứu', 'Chăm sóc KH']
chuc_vu_list = [
    ('CV01', 'Giám đốc', 'GD', 10, 50000000),
    ('CV02', 'Phó giám đốc', 'PGD', 9, 40000000),
    ('CV03', 'Trưởng phòng', 'TP', 8, 30000000),
    ('CV04', 'Phó phòng', 'PP', 7, 25000000),
    ('CV05', 'Trưởng nhóm', 'TN', 6, 20000000),
    ('CV06', 'Chuyên viên chính', 'CVC', 5, 15000000),
    ('CV07', 'Chuyên viên', 'CV', 4, 12000000),
    ('CV08', 'Nhân viên', 'NV', 3, 10000000),
    ('CV09', 'Thực tập sinh', 'TTS', 2, 5000000),
    ('CV10', 'Cộng tác viên', 'CTV', 1, 4000000),
]

def generate_name():
    return f"{random.choice(ho_lot)} {random.choice(ten_dem)} {random.choice(ten)}"

def generate_date(start_year, end_year):
    start = datetime(start_year, 1, 1)
    end = datetime(end_year, 12, 31)
    delta = end - start
    return (start + timedelta(days=random.randint(0, delta.days))).strftime('%Y-%m-%d')

def generate_phone():
    return f"09{random.randint(10000000, 99999999)}"

def generate_email(name):
    name_parts = name.lower().split()
    return f"{name_parts[-1]}.{name_parts[0]}@company.vn"

sql = []

# Header
sql.append("USE QuanLyNhanSu_TruSo;")
sql.append("GO")
sql.append("")
sql.append("-- ============================================")
sql.append("-- DATA GENERATION - TRỤ SỞ CHÍNH")
sql.append("-- Generated: " + datetime.now().strftime('%Y-%m-%d %H:%M:%S'))
sql.append("-- ============================================")
sql.append("")

# 1. TruSoChinh
sql.append("-- 1. TRỤ SỞ CHÍNH")
sql.append("INSERT INTO TruSoChinh (ID_TruSoChinh, TenTruSoChinh, DiaChi, Email, SoDienThoai, NgayThanhLap, TrangThai)")
sql.append("VALUES ('TSC01', N'Công ty TNHH Quản lý Nhân sự Việt Nam', N'123 Trần Hưng Đạo, Hoàn Kiếm, Hà Nội', 'contact@company.vn', '0243123456', '2010-01-15', 1);")
sql.append("GO")
sql.append("")

# 2. ChiNhanh
sql.append("-- 2. CHI NHÁNH (7 chi nhánh)")
for ma, ten, tinh, dia_chi, email, sdt in chi_nhanh:
    vpn_ip = f"100.{random.randint(70,100)}.{random.randint(1,255)}.{random.randint(1,255)}" if ma != 'CN00' else '100.71.73.74'
    sql.append(f"INSERT INTO ChiNhanh (ID_ChiNhanh, ID_TruSoChinh, TenChiNhanh, MaChiNhanh, DiaChi, Email, SoDienThoai, VPN_IP, NgayThanhLap, TrangThai)")
    sql.append(f"VALUES ('{ma}', 'TSC01', N'{ten}', '{ma}', N'{dia_chi}', '{email}', '{sdt}', '{vpn_ip}', '{generate_date(2010, 2020)}', 1);")
sql.append("GO")
sql.append("")

# 3. ChucVu
sql.append("-- 3. CHỨC VỤ")
for cv_id, ten_cv, ma_cv, bac, luong in chuc_vu_list:
    sql.append(f"INSERT INTO ChucVu (ID_ChucVu, TenChucVu, MaChucVu, BacLuong, MucLuongCoBan)")
    sql.append(f"VALUES ('{cv_id}', N'{ten_cv}', '{ma_cv}', {bac}, {luong});")
sql.append("GO")
sql.append("")

# 4. ChinhSach
sql.append("-- 4. CHÍNH SÁCH")
chinh_sach_data = [
    (None, "Chính sách bảo hiểm xã hội", "Áp dụng cho tất cả nhân viên chính thức"),
    (None, "Chính sách nghỉ phép năm", "15 ngày phép/năm cho nhân viên"),
    (None, "Chính sách thưởng tết", "Thưởng tết dựa trên kết quả làm việc"),
    (None, "Chính sách đào tạo", "Hỗ trợ 100% học phí các khóa đào tạo"),
]

cs_id = 1
for cn_id, ten_cs, mo_ta in chinh_sach_data:
    cn_filter = f"'{cn_id}'" if cn_id else "NULL"
    sql.append(f"INSERT INTO ChinhSach (ID_ChinhSach, ID_ChiNhanh, TenChinhSach, MoTa, NgayBatDau, NgayKetThuc, TrangThai)")
    sql.append(f"VALUES ('CS{cs_id:03d}', {cn_filter}, N'{ten_cs}', N'{mo_ta}', '{generate_date(2020, 2023)}', '{generate_date(2024, 2026)}', 1);")
    cs_id += 1

# Thêm chính sách riêng cho từng chi nhánh
for ma, ten, tinh, _, _, _ in chi_nhanh:
    sql.append(f"INSERT INTO ChinhSach (ID_ChinhSach, ID_ChiNhanh, TenChinhSach, MoTa, NgayBatDau, NgayKetThuc, TrangThai)")
    sql.append(f"VALUES ('CS{cs_id:03d}', '{ma}', N'Chính sách đặc thù {tinh}', N'Chính sách riêng cho {tinh}', '{generate_date(2021, 2023)}', '{generate_date(2025, 2027)}', 1);")
    cs_id += 1

sql.append("GO")
sql.append("")

# 5. PhongBan
sql.append("-- 5. PHÒNG BAN (70 phòng - 10/chi nhánh)")
pb_id = 1
for ma_cn, ten_cn, tinh, _, _, _ in chi_nhanh:
    for i, pb_name in enumerate(phong_ban_names, 1):
        sql.append(f"INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, MaPhongBan, Email, SoDienThoai)")
        sql.append(f"VALUES ('PB{pb_id:03d}', '{ma_cn}', N'{pb_name}', '{ma_cn}-PB{i:02d}', '{pb_name.lower().replace(" ", "")}@{ma_cn.lower()}.vn', '{generate_phone()}');")
        pb_id += 1
sql.append("GO")
sql.append("")

# 6. DuAn
sql.append("-- 6. DỰ ÁN (70 dự án - 10/chi nhánh)")
da_id = 1
pb_counter = 1
for ma_cn, ten_cn, tinh, _, _, _ in chi_nhanh:
    for i in range(10):
        ten_da = f"Dự án {random.choice(['Phát triển', 'Mở rộng', 'Nâng cấp', 'Số hóa'])} {tinh} {i+1}"
        pb_id_ref = f"PB{pb_counter:03d}"
        pb_counter += 1
        sql.append(f"INSERT INTO DuAn (ID_DuAn, ID_PhongBan, ID_ChiNhanh, TenDuAn, MaDuAn, NgayBatDau, NgayKetThuc, ThoiHan, MoTa, TrangThai)")
        sql.append(f"VALUES ('DA{da_id:03d}', '{pb_id_ref}', '{ma_cn}', N'{ten_da}', '{ma_cn}-DA{i+1:02d}', '{generate_date(2022, 2024)}', '{generate_date(2025, 2026)}', {random.randint(180, 720)}, N'Mô tả {ten_da}', N'Đang thực hiện');")
        da_id += 1
sql.append("GO")
sql.append("")

# 7. NhanVien
sql.append("-- 7. NHÂN VIÊN (280 nhân viên - 40/chi nhánh)")
nv_id = 1
for cn_idx, (ma_cn, ten_cn, tinh, _, _, _) in enumerate(chi_nhanh):
    for i in range(40):
        ho_ten = generate_name()
        gioi = random.choice(gioi_tinh)
        pb_id_ref = f"PB{cn_idx * 10 + (i % 10) + 1:03d}"
        da_id_ref = f"DA{cn_idx * 10 + (i % 10) + 1:03d}"
        cv_id_ref = random.choice([cv[0] for cv in chuc_vu_list[3:]]) # Chọn từ CV04 trở xuống
        
        sql.append(f"INSERT INTO NhanVien (ID_NhanVien, ID_ChiNhanh, ID_PhongBan, ID_ChucVu, ID_DuAn, HoTen, MaNhanVien, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi, NgayVaoLam, TrangThai)")
        sql.append(f"VALUES ('NV{nv_id:04d}', '{ma_cn}', '{pb_id_ref}', '{cv_id_ref}', '{da_id_ref}', N'{ho_ten}', '{ma_cn}-NV{i+1:03d}', '{generate_date(1980, 2000)}', N'{gioi}', N'{random.choice(dan_toc)}', '{random.randint(100000000000, 999999999999)}', '{generate_phone()}', '{generate_email(ho_ten)}', N'{random.randint(1, 999)} {random.choice(["Lê Lợi", "Trần Phú", "Nguyễn Huệ"])}, {tinh}', '{generate_date(2015, 2024)}', 1);")
        nv_id += 1
sql.append("GO")
sql.append("")

# 8. Luong
sql.append("-- 8. LƯƠNG (280 bản ghi)")
for i in range(1, 281):
    nv_ref = f"NV{i:04d}"
    muc_luong = random.randint(8000000, 50000000)
    phu_cap = random.randint(1000000, 5000000)
    thuong = random.randint(0, 10000000) if random.random() > 0.5 else 0
    sql.append(f"INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong, PhuCap, Thuong, ThangNam)")
    sql.append(f"VALUES ('L{i:04d}', '{nv_ref}', {muc_luong}, {phu_cap}, {thuong}, '2025-11-01');")
sql.append("GO")
sql.append("")

sql.append("PRINT '';")
sql.append("PRINT '✅ ĐÃ TẠO XONG DATA CHO TRỤ SỞ CHÍNH!';")
sql.append("PRINT 'Database: QuanLyNhanSu_TruSo';")
sql.append("PRINT '- 1 Trụ sở chính';")
sql.append("PRINT '- 7 Chi nhánh';")
sql.append("PRINT '- 70 Phòng ban (10/chi nhánh)';")
sql.append("PRINT '- 70 Dự án (10/chi nhánh)';")
sql.append("PRINT '- 10 Chức vụ';")
sql.append("PRINT '- 280 Nhân viên (40/chi nhánh)';")
sql.append("PRINT '- 280 Bản ghi lương';")
sql.append("GO")

# Write to file
output_file = '/home/tien/CSDLPT/database/schemas/TruSoChinh_Data.sql'
with open(output_file, 'w', encoding='utf-8') as f:
    f.write('\n'.join(sql))

print(f"✅ Đã tạo {output_file}")
print("📊 Nội dung:")
print("  - 1 Trụ sở chính")
print("  - 7 Chi nhánh")
print("  - 70 Phòng ban (10/chi nhánh)")
print("  - 70 Dự án (10/chi nhánh)")
print("  - 10 Chức vụ")
print("  - 280 Nhân viên (40/chi nhánh)")
print("  - 280 Bản ghi lương")
