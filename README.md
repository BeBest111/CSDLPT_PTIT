# 🏢 HỆ THỐNG QUẢN LÝ NHÂN SỰ PHÂN TÁN

**Đồ án:** Cơ sở dữ liệu phân tán  
**Nhóm:** 5  
**Môn học:** Cơ sở dữ liệu phân tán - PTIT

---

## 📊 TỔNG QUAN HỆ THỐNG

### Kiến trúc:
- **1 Trụ sở chính** (Hà Nội) - Publisher
- **6 Chi nhánh** - Subscribers
- **7 Databases độc lập**
- **280 Nhân viên** (40 NV × 7 địa điểm)

### Công nghệ:
- SQL Server 2022 (Ubuntu) - Publisher
- SQL Server 2019 (Windows) - Subscribers  
- Transactional Replication
- Tailscale VPN

---

## 📁 CẤU TRÚC DỰ ÁN

```
CSDLPT/
├── database/
│   ├── schemas/
│   │   ├── TruSoChinh_Schema.sql          # Schema Trụ sở chính
│   │   └── ChiNhanh_Schema_Template.sql   # Template cho 6 chi nhánh
│   ├── procedures/                         # Stored procedures
│   └── exports/                            # Backup files
│
├── replication/
│   ├── 01_Setup_Distributor.sql           # Cấu hình Distributor
│   ├── 02_Create_Publication.sql          # Tạo Publication
│   ├── 03_Create_Snapshot.sql             # Tạo Snapshot
│   ├── Subscriber_Setup.sql               # Setup Subscribers
│   └── Test_Replication.sql               # Test đồng bộ
│
├── scripts/
│   └── python/
│       └── generate_trusochinh_data.py    # Generate 280 nhân viên
│
├── docs/
│   ├── guides/                            # Hướng dẫn từng bước
│   └── reports/
│       ├── KIEN_TRUC_PHAN_TAN.md         # Kiến trúc chi tiết
│       └── ...
│
└── TINH_HINH_HIEN_TAI.md                 # Trạng thái dự án
```

---

## 🚀 HƯỚNG DẪN TRIỂN KHAI

### 1. Trụ sở chính (Ubuntu - Tiến)

```bash
# Tạo database
sqlcmd -S localhost -U sa -P 'Tt12345@' -C \
  -i database/schemas/TruSoChinh_Schema.sql

# Generate data
python3 scripts/python/generate_trusochinh_data.py

# Setup Distributor & Publication
cd replication
sqlcmd -S localhost -U sa -P 'Tt12345@' -C -i 01_Setup_Distributor.sql
sqlcmd -S localhost -U sa -P 'Tt12345@' -C -i 02_Create_Publication.sql
sqlcmd -S localhost -U sa -P 'Tt12345@' -C -i 03_Create_Snapshot.sql
```

### 2. Chi nhánh (Windows - 6 bạn)

Mỗi bạn tạo database riêng:
- CN01 (Huế): `QuanLyNhanSu_CN01`
- CN02 (Nam Định): `QuanLyNhanSu_CN02`
- CN03 (Vinh): `QuanLyNhanSu_CN03`
- CN04 (Nha Trang): `QuanLyNhanSu_CN04`
- CN05 (Thái Bình): `QuanLyNhanSu_CN05`
- CN06 (Hải Phòng): `QuanLyNhanSu_CN06`

```sql
-- Sửa ChiNhanh_Schema_Template.sql cho đúng mã chi nhánh
-- Rồi chạy trong SSMS
```

### 3. Setup Replication

Mỗi chi nhánh chạy `Subscriber_Setup.sql`

---

## 📊 DATABASE SCHEMA

### Trụ sở chính (QuanLyNhanSu_TruSo):
- TruSoChinh (1)
- ChiNhanh (7)
- ChinhSach (~20)
- PhongBan (70)
- DuAn (70)
- ChucVu (10)
- **NhanVien (280)** ← Tất cả nhân viên
- Luong (280)

### Chi nhánh (QuanLyNhanSu_CNxx):
- ChiNhanh_Info (1)
- ChinhSach (replicated - READ)
- ChucVu (replicated - READ)
- PhongBan (10)
- DuAn (10)
- **NhanVien (40)** ← Chỉ nhân viên chi nhánh
- Luong (40)

---

## �� REPLICATION

**Chiều:** Trụ sở → Chi nhánh (Push)

**Dữ liệu replicate:**
- ChinhSach (chính sách chung)
- ChucVu (chức vụ, bậc lương)

**Loại:** Transactional Replication  
**Tần suất:** Realtime

---

## 👥 THÀNH VIÊN NHÓM

| STT | Họ tên | Vai trò | Chi nhánh |
|-----|--------|---------|-----------|
| 1 | Nguyễn Minh Tiến | Leader | Trụ sở (Publisher) |
| 2 | ... | Member | CN01 Huế |
| 3 | ... | Member | CN02 Nam Định |
| 4 | ... | Member | CN03 Vinh |
| 5 | ... | Member | CN04 Nha Trang |
| 6 | ... | Member | CN05 Thái Bình |
| 7 | ... | Member | CN06 Hải Phòng |

---

## 📖 TÀI LIỆU THAM KHẢO

- [Kiến trúc phân tán](docs/reports/KIEN_TRUC_PHAN_TAN.md)
- [Hướng dẫn Replication](docs/guides/HUONG_DAN_REPLICATION.md)
- [Hướng dẫn VPN](docs/guides/HUONG_DAN_VPN.md)

---

**Cập nhật:** 08/11/2025  
**Trạng thái:** Đang triển khai (80%)
