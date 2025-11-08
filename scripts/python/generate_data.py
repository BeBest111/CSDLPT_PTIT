#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script tạo dữ liệu HR phân tán cho 10 chi nhánh
Minh họa: Phân mảnh ngang (PhongBan, NhanVien theo ChiNhanh), Nhân bản (ChinhSach)
"""

# Danh sách chi nhánh (7 chi nhánh theo yêu cầu đề bài)
branches = [
    ('CN01', 'Hue'),           # Vị trí 1
    ('CN02', 'Nam Dinh'),      # Vị trí 2
    ('CN03', 'Vinh'),          # Vị trí 3
    ('CN04', 'Nha Trang'),     # Vị trí 4
    ('CN05', 'Thai Binh'),     # Vị trí 5
    ('CN06', 'Dong Nai'),      # Vị trí 6
    ('CN07', 'Binh Duong')     # Vị trí 7
    # Vị trí 8: Trụ sở chính Hà Nội (không phải chi nhánh)
]

# Tên phòng ban
dept_names = ['Ke Toan', 'Nhan Su', 'Marketing', 'Kinh Doanh', 'Ky Thuat', 
              'Phat Trien San Pham', 'Hanh Chinh', 'Bao Tri', 'IT', 'Ban Hang']

# Tên chính sách
policy_names = [
    'Chinh sach ung ho',
    'Chinh sach moi truong',
    'Chinh sach dao tao',
    'Chinh sach ban hang',
    'Chinh sach nghi phep',
    'Chinh sach chat luong',
    'Chinh sach an ninh',
    'Chinh sach tuyen dung',
    'Chinh sach bao hiem',
    'Chinh sach cong nghe'
]

# Họ tên Việt Nam
ho_list = ['Nguyen', 'Tran', 'Le', 'Pham', 'Hoang', 'Vu', 'Vo', 'Dang', 'Bui', 'Do', 'Ngo', 'Duong']
ten_dem_list = ['Van', 'Thi', 'Minh', 'Duc', 'Hong', 'Thanh', 'Quoc', 'Cam', 'Tien', 'Huy']
ten_list = ['An', 'Binh', 'Cuong', 'Dung', 'Hoa', 'Khanh', 'Linh', 'Mai', 'Nam', 'Phong', 
            'Quan', 'Son', 'Tuan', 'Vinh', 'Yen', 'Hieu', 'Thanh', 'Bao', 'Khoa', 'Lan']

import random

def generate_name(idx):
    """Tạo tên ngẫu nhiên"""
    ho = random.choice(ho_list)
    ten_dem = random.choice(ten_dem_list)
    ten = random.choice(ten_list)
    return f"{ho} {ten_dem} {ten}"

def generate_phone(idx):
    """Tạo số điện thoại"""
    return f"09{random.randint(10000000, 99999999)}"

def generate_cccd(idx):
    """Tạo số CCCD"""
    return f"{idx:012d}"

def generate_email(name, idx):
    """Tạo email"""
    # Bỏ dấu và tạo email
    parts = name.lower().split()
    email_name = ''.join(parts)
    return f"{email_name}{idx}@gmail.com"

def generate_dob(idx):
    """Tạo ngày sinh (25-45 tuổi)"""
    year = random.randint(1980, 2000)
    month = random.randint(1, 12)
    day = random.randint(1, 28)
    return f"{year:04d}-{month:02d}-{day:02d}"

# Tạo INSERT statements
sql_parts = []

# Header
sql_parts.append("-- ============================================")
sql_parts.append("-- FILE: HR-Data.sql (PHÂN TÁN 10 CHI NHÁNH)")
sql_parts.append("-- MÔ TẢ: Dữ liệu minh họa CSDLPT")
sql_parts.append("--   - Phân mảnh ngang: PhongBan, NhanVien theo ChiNhanh")
sql_parts.append("--   - Nhân bản: ChinhSach (mỗi chi nhánh có bản sao)")
sql_parts.append("--   - Đồng bộ hóa: Triggers + Replication")
sql_parts.append("-- ============================================\n")

# TruSoChinh
sql_parts.append("INSERT INTO TruSoChinh (ID_TruSoChinh, TenTruSoChinh, DiaChi, Email, SoDienThoai) VALUES ")
sql_parts.append("('TS01', 'ORGASM', 'Ha Noi', 'contact_orgasm@gmail.com', '0350899999');")
sql_parts.append("")

# ChiNhanh
sql_parts.append("INSERT INTO ChiNhanh (ID_ChiNhanh, ID_TruSoChinh, TenChiNhanh, DiaChi, Email, SoDienThoai)")
sql_parts.append("VALUES")
branch_lines = []
for cn_id, cn_name in branches:
    email = f"orgasm{cn_name.lower().replace(' ', '')}@gmail.com"
    phone = generate_phone(int(cn_id[2:]))
    branch_lines.append(f"('{cn_id}', 'TS01', 'ORGASM {cn_name}', '{cn_name}', '{email}', '{phone}')")
sql_parts.append(",\n".join(branch_lines) + ";")
sql_parts.append("")

# ChinhSach - Nhân bản: mỗi chi nhánh có 10 chính sách
sql_parts.append("-- ChinhSach: Nhân bản - mỗi chi nhánh có bản sao đầy đủ")
sql_parts.append("INSERT INTO ChinhSach (ID_ChinhSach, ID_ChiNhanh, TenChinhSach, MoTa) VALUES")
policy_lines = []
cs_idx = 1
for cn_id, cn_name in branches:
    for i, policy_name in enumerate(policy_names, 1):
        cs_id = f"CS{cs_idx:03d}"
        mota = f"Ap dung tai chi nhanh {cn_name}"
        policy_lines.append(f"('{cs_id}', '{cn_id}', '{policy_name}', '{mota}')")
        cs_idx += 1
sql_parts.append(",\n".join(policy_lines) + ";")
sql_parts.append("")

# PhongBan - Phân mảnh ngang: mỗi chi nhánh 10 phòng
sql_parts.append("-- PhongBan: Phân mảnh ngang - mỗi chi nhánh có 10 phòng ban riêng")
sql_parts.append("INSERT INTO PhongBan (ID_PhongBan, ID_ChiNhanh, TenPhongBan, Email, SoDienThoai) VALUES")
pb_lines = []
pb_idx = 1
for cn_id, cn_name in branches:
    for i, dept_name in enumerate(dept_names, 1):
        pb_id = f"PB{pb_idx:03d}"
        email = f"{dept_name.lower().replace(' ', '')}{cn_id.lower()}@gmail.com"
        phone = generate_phone(pb_idx)
        pb_lines.append(f"('{pb_id}', '{cn_id}', '{dept_name}', '{email}', '{phone}')")
        pb_idx += 1
sql_parts.append(",\n".join(pb_lines) + ";")
sql_parts.append("")

# DuAn - 10 dự án mỗi chi nhánh
sql_parts.append("-- DuAn: 10 dự án mỗi chi nhánh (100 dự án)")
sql_parts.append("INSERT INTO DuAn (ID_DuAn, ID_PhongBan, TenDuAn, NgayBatDau, ThoiHan, MoTa) VALUES")
da_lines = []
da_idx = 1
project_names = [
    'Trien khai cong nghe moi',
    'Mo rong thi truong',
    'Cai tao he thong',
    'Dao tao nhan vien',
    'Cai tien chat luong',
    'Xay dung he thong moi',
    'Tang cuong truyen thong',
    'Phat trien chi nhanh',
    'Cap nhat he thong CRM',
    'Kiem soat chi phi'
]
for branch_idx, (cn_id, cn_name) in enumerate(branches):
    # Mỗi chi nhánh có 10 phòng ban, mỗi phòng 1 dự án
    for dept_idx in range(10):
        pb_id = f"PB{branch_idx * 10 + dept_idx + 1:03d}"
        da_id = f"DA{da_idx:03d}"
        project_name = project_names[dept_idx]
        year = 2024
        month = random.randint(1, 12)
        day = random.randint(1, 28)
        thoihan = random.randint(6, 24)
        da_lines.append(f"('{da_id}', '{pb_id}', '{project_name} tai {cn_name}', '{year}-{month:02d}-{day:02d}', {thoihan}, 'Du an tai {cn_name}')")
        da_idx += 1
sql_parts.append(",\n".join(da_lines) + ";")
sql_parts.append("")

# ChucVu
sql_parts.append("INSERT INTO ChucVu (ID_ChucVu, TenChucVu, BacLuong) VALUES")
chucvu_lines = [
    "('CV01', 'Giam doc', 1)",
    "('CV02', 'Pho Giam doc', 2)",
    "('CV03', 'Truong phong', 3)",
    "('CV04', 'Pho Truong phong', 4)",
    "('CV05', 'Chuyen vien cao cap', 5)",
    "('CV06', 'Chuyen vien chinh', 6)",
    "('CV07', 'Chuyen vien', 7)",
    "('CV08', 'Nhan vien kinh doanh', 8)",
    "('CV09', 'Nhan vien hanh chinh', 9)",
    "('CV10', 'Nhan vien ky thuat', 10)"
]
sql_parts.append(",\n".join(chucvu_lines) + ";")
sql_parts.append("")

# NhanVien - Phân mảnh ngang: 40 nhân viên/chi nhánh
sql_parts.append("-- NhanVien: Phân mảnh ngang - 40 nhân viên mỗi chi nhánh (400 nhân viên)")
sql_parts.append("INSERT INTO NhanVien (ID_NhanVien, ID_DuAn, ID_ChucVu, ID_ChiNhanh, ID_PhongBan, HoTen, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi) VALUES")
nv_lines = []
nv_idx = 1
for branch_idx, (cn_id, cn_name) in enumerate(branches):
    # 40 nhân viên/chi nhánh
    for emp_idx in range(40):
        nv_id = f"NV{nv_idx:04d}"
        # Phân bổ đều vào 10 phòng (4 nhân viên/phòng)
        pb_offset = branch_idx * 10 + (emp_idx % 10)
        pb_id = f"PB{pb_offset + 1:03d}"
        # Phân bổ đều vào 10 dự án
        da_offset = branch_idx * 10 + (emp_idx % 10)
        da_id = f"DA{da_offset + 1:03d}"
        # Chức vụ tuần hoàn
        cv_id = f"CV{(emp_idx % 10) + 1:02d}"
        
        hoten = generate_name(nv_idx)
        ngaysinh = generate_dob(nv_idx)
        gioitinh = 'Nam' if emp_idx % 2 == 0 else 'Nu'
        cccd = generate_cccd(nv_idx)
        phone = generate_phone(nv_idx)
        email = generate_email(hoten, nv_idx)
        
        nv_lines.append(f"('{nv_id}', '{da_id}', '{cv_id}', '{cn_id}', '{pb_id}', '{hoten}', '{ngaysinh}', '{gioitinh}', 'Kinh', '{cccd}', '{phone}', '{email}', '{cn_name}')")
        nv_idx += 1
sql_parts.append(",\n".join(nv_lines) + ";")
sql_parts.append("")

# Luong
num_employees_total = len(branches) * 40
sql_parts.append(f"-- Luong: 1:1 với NhanVien ({num_employees_total} bản ghi)")
sql_parts.append("INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong) VALUES")
luong_lines = []
for i in range(1, num_employees_total + 1):
    nv_id = f"NV{i:04d}"
    luong_id = f"L{i:04d}"
    # Lương từ 10M - 70M tùy chức vụ
    cv_num = ((i - 1) % 10) + 1
    mucluong = 80000000 - (cv_num * 6000000) + random.randint(-1000000, 1000000)
    luong_lines.append(f"('{luong_id}', '{nv_id}', {mucluong})")
sql_parts.append(",\n".join(luong_lines) + ";")
sql_parts.append("")

# Write to file
output = "\n".join(sql_parts)
with open('HR-Data.sql', 'w', encoding='utf-8') as f:
    f.write(output)

num_branches = len(branches)
num_depts = num_branches * 10
num_employees = num_branches * 40
print(f"✓ Đã tạo HR-Data.sql với {num_branches} chi nhánh phân tán:")
print(f"  - {num_depts} phòng ban (10/chi nhánh) - PHÂN MẢNH NGANG")
print(f"  - {num_depts} chính sách (10/chi nhánh) - NHÂN BẢN")
print(f"  - {num_employees} nhân viên (40/chi nhánh) - PHÂN MẢNH NGANG")
print(f"  - {num_depts} dự án (10/chi nhánh)")
print(f"  - {num_employees} bản ghi lương")
