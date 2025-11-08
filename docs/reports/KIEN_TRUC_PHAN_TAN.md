# 🏢 KIẾN TRÚC PHÂN TÁN DATABASE

## 📊 TỔNG QUAN HỆ THỐNG:

```
                    ┌─────────────────────────────────┐
                    │   TRỤ SỞ CHÍNH - HÀ NỘI        │
                    │   Database: QuanLyNhanSu_TruSo │
                    │   IP: 100.71.73.74             │
                    │   Role: PUBLISHER              │
                    │   - 280 nhân viên (tất cả)     │
                    │   - 70 phòng ban (tất cả)      │
                    │   - 70 dự án (tất cả)          │
                    └──────────────┬──────────────────┘
                                   │
                    ┌──────────────┴──────────────┐
                    │    REPLICATION (2-way)      │
                    │                              │
      ┌─────────────┼─────────────┬───────────────┼──────────────┬─────────────┐
      │             │             │               │              │             │
┌─────▼─────┐ ┌────▼─────┐ ┌─────▼─────┐  ┌──────▼──────┐ ┌────▼─────┐ ┌────▼─────┐
│  CN01     │ │  CN02    │ │  CN03     │  │   CN04      │ │  CN05    │ │  CN06    │
│  Huế      │ │Nam Định  │ │  Vinh     │  │ Nha Trang   │ │Thái Bình │ │Hải Phòng │
│ DB: _CN01 │ │ DB: _CN02│ │ DB: _CN03 │  │  DB: _CN04  │ │ DB: _CN05│ │ DB: _CN06│
│40 NV      │ │40 NV     │ │40 NV      │  │ 40 NV       │ │40 NV     │ │40 NV     │
│SUBSCRIBER │ │SUBSCRIBER│ │SUBSCRIBER │  │ SUBSCRIBER  │ │SUBSCRIBER│ │SUBSCRIBER│
└───────────┘ └──────────┘ └───────────┘  └─────────────┘ └──────────┘ └──────────┘
```

---

## 🗄️ CẤU TRÚC DATABASE:

### 1. TRỤ SỞ CHÍNH (Publisher - Ubuntu)

**Database:** `QuanLyNhanSu_TruSo`

**Chức năng:**
- Quản lý TOÀN BỘ 280 nhân viên từ 7 địa điểm
- Tổng hợp dữ liệu từ tất cả chi nhánh
- Tạo báo cáo tổng thể
- Quản lý chính sách chung

**Bảng dữ liệu:**
| Bảng | Số dòng | Mô tả |
|------|---------|-------|
| TruSoChinh | 1 | Thông tin trụ sở HN |
| ChiNhanh | 7 | 7 chi nhánh (CN01-CN06 + HN) |
| ChinhSach | ~20 | Chính sách toàn công ty |
| PhongBan | 70 | 10 phòng × 7 chi nhánh |
| DuAn | 70 | 10 dự án × 7 chi nhánh |
| ChucVu | 10 | Các chức vụ chung |
| NhanVien | 280 | 40 NV × 7 chi nhánh |
| Luong | 280 | Lương tất cả nhân viên |

---

### 2. CHI NHÁNH (Subscribers - 6 máy Windows)

**Databases:** `QuanLyNhanSu_CN01` đến `QuanLyNhanSu_CN06`

**Chức năng:**
- Quản lý CHỈ nhân viên chi nhánh mình (40 người)
- Nhận chính sách, chức vụ từ Trụ sở (READ-ONLY)
- Tự quản lý phòng ban, dự án nội bộ
- Gửi cập nhật về Trụ sở

**Bảng dữ liệu (mỗi chi nhánh):**
| Bảng | Số dòng | Mô tả |
|------|---------|-------|
| ChiNhanh_Info | 1 | Thông tin chi nhánh này |
| ChinhSach | ~20 | REPLICATE từ Trụ sở (READ) |
| ChucVu | 10 | REPLICATE từ Trụ sở (READ) |
| PhongBan | 10 | Tự quản lý |
| DuAn | 10 | Tự quản lý |
| NhanVien | 40 | CHỈ nhân viên chi nhánh |
| Luong | 40 | CHỈ lương chi nhánh |

---

## 🔄 REPLICATION STRATEGY:

### Chiều 1: TRỤ SỞ → CHI NHÁNH (Push)

**Dữ liệu replicate:**
- ✅ ChinhSach (chính sách chung)
- ✅ ChucVu (chức vụ, bậc lương)

**Loại:** Transactional Replication (Snapshot + Updates)
**Tần suất:** Realtime

**Ý nghĩa:**
- Chi nhánh luôn có chính sách mới nhất
- Đồng bộ cấu trúc lương

---

### Chiều 2: CHI NHÁNH → TRỤ SỞ (Pull - Tương lai)

**Dữ liệu gửi về:**
- NhanVien (cập nhật thông tin nhân viên)
- Luong (báo cáo lương)
- Thống kê nội bộ

**Loại:** Merge Replication hoặc API sync
**Tần suất:** Hàng ngày/tuần

---

## 📋 PHÂN CÔNG DỮ LIỆU:

### Trụ sở chính (Hà Nội) - Publisher:
```sql
-- Có TẤT CẢ data
SELECT COUNT(*) FROM NhanVien; -- 280 (tất cả)
SELECT * FROM ChiNhanh;        -- 7 chi nhánh
```

### Chi nhánh Huế (CN01) - Subscriber:
```sql
-- CHỈ có 40 nhân viên Huế
SELECT COUNT(*) FROM NhanVien WHERE MaNhanVien LIKE 'CN01%'; -- 40
SELECT * FROM ChinhSach; -- Nhận từ Trụ sở (READ-ONLY)
```

### Chi nhánh Nam Định (CN02) - Subscriber:
```sql
-- CHỈ có 40 nhân viên Nam Định
SELECT COUNT(*) FROM NhanVien WHERE MaNhanVien LIKE 'CN02%'; -- 40
```

...Tương tự cho CN03-CN06

---

## 🎯 ƯU ĐIỂM KIẾN TRÚC NÀY:

✅ **Phân tán thực sự:**
- Mỗi chi nhánh tự chủ về data
- Giảm tải Trụ sở

✅ **Bảo mật:**
- Chi nhánh chỉ thấy nhân viên mình
- Không thấy data chi nhánh khác

✅ **Hiệu suất:**
- Query nhanh (40 NV thay vì 280)
- Giảm network traffic

✅ **Dự phòng:**
- Chi nhánh vẫn làm việc khi mất kết nối Trụ sở
- Data local luôn available

✅ **Mở rộng:**
- Dễ thêm chi nhánh mới (CN07, CN08...)
- Không ảnh hưởng hệ thống cũ

---

## 🚀 TRIỂN KHAI:

### Bước 1: Setup Trụ sở (✅ Đã xong)
```bash
# Đã tạo database QuanLyNhanSu_TruSo
# Đã setup Distributor + Publication
```

### Bước 2: Setup 6 Chi nhánh (⏳ Đang làm)
Mỗi chi nhánh chạy script riêng:
- `ChiNhanh_CN01_Setup.sql` → Database: QuanLyNhanSu_CN01
- `ChiNhanh_CN02_Setup.sql` → Database: QuanLyNhanSu_CN02
- ...

### Bước 3: Configure Replication
- Publication: `Pub_ChinhSach`, `Pub_ChucVu`
- Subscriptions: 6 subscribers (CN01-CN06)

### Bước 4: Test & Verify
```sql
-- Trên Trụ sở: INSERT chính sách mới
INSERT INTO ChinhSach VALUES (...);

-- Sau 10s, trên CN01: Phải thấy chính sách mới
SELECT * FROM ChinhSach;
```

---

## 📊 TỔNG KẾT:

**Hệ thống:**
- 1 Trụ sở chính (HN) - Publisher
- 6 Chi nhánh - Subscribers
- **7 databases độc lập**
- 280 nhân viên tổng

**Replication:**
- Transactional (ChinhSach, ChucVu)
- 1-way: Trụ sở → Chi nhánh
- Realtime sync

**File cần:**
- `TruSoChinh_Schema.sql` - Tạo DB Trụ sở ✅
- `ChiNhanh_Schema_Template.sql` - Template cho 6 CN ✅
- Data generation scripts (coming next)

---

**Cập nhật:** 08/11/2025  
**Kiến trúc:** Distributed Database with Replication
