# 📚 DỰ ÁN CSDLPT - QUẢN LÝ NHÂN SỰ ĐA CHI NHÁNH

## 👥 THÔNG TIN NHÓM

**Nhóm:** 5  
**Đề tài:** Hệ thống quản lý nhân sự công ty đa chi nhánh sử dụng CSDLPT  
**Công ty:** ORGASM (tự nghĩ)  
**Quy mô:** 280 nhân viên, 7 chi nhánh, 70 phòng ban

---

## 📂 CẤU TRÚC DỰ ÁN

```
CSDLPT/
│
├── 📄 README.md                        # File này - Hướng dẫn tổng quan
│
├── � database/                        # Database scripts
│   ├── schemas/                        # Schema & Business Logic
│   │   ├── HR.sql                      # Schema database (8 bảng)
│   │   ├── HR-Data.sql                 # Dữ liệu mẫu (280 NV, 7 CN)
│   │   ├── Triggers.sql                # 7 triggers (validation, cascade, audit)
│   │   ├── Procedures.sql              # 9 procedures (báo cáo, thống kê)
│   │   ├── Views.sql                   # 3 views
│   │   ├── Indexes.sql                 # 6 indexes
│   │   └── Users.sql                   # 4 loại user + phân quyền
│   └── tests/                          # Test scripts
│       └── Test_Triggers_Procedures.sql
│
├── 📁 replication/                     # Replication scripts
│   ├── 01_Setup_Distributor.sql        # Cấu hình Distributor
│   ├── 02_Create_Publication.sql       # Tạo Publication
│   ├── 03_Create_Snapshot.sql          # Tạo Snapshot Agent
│   ├── Subscriber_Setup.sql            # Setup cho Subscribers (5 bạn)
│   └── Test_Replication.sql            # Test đồng bộ dữ liệu
│
├── 📁 scripts/                         # Utility scripts
│   └── python/
│       └── generate_data.py            # Generate dữ liệu mẫu
│
├── 📁 docs/                            # Tài liệu dự án
│   ├── guides/                         # Hướng dẫn thực hiện
│   │   ├── BAT_DAU_NGAY.md             # ⭐ Bắt đầu ngay hôm nay
│   │   ├── PHAN_CONG_NHOM.md           # Phân công 6 thành viên
│   │   ├── HUONG_DAN_VPN.md            # Setup Tailscale VPN
│   │   ├── HUONG_DAN_REPLICATION.md    # Cấu hình Replication
│   │   ├── HUONG_DAN_SCREENSHOTS.md    # Chụp screenshots
│   │   ├── HUONG_DAN_LAM_TIEP.md       # Công việc solo (Tiến)
│   │   └── HUONG_DAN_CAI_DAT.md        # Cài đặt SQL Server
│   └── reports/                        # Báo cáo & tài liệu bảo vệ
│       ├── BAO_VE_CSDLPT.md            # Câu hỏi/trả lời bảo vệ
│       ├── TOM_TAT_7_CHI_NHANH.md      # Tóm tắt 7 chi nhánh
│       └── TIEN_DO_DU_AN.md            # Tiến độ dự án
│
└── � .archive/                        # File cũ/yêu cầu gốc (không commit)
    ├── bai_lam.txt
    ├── yeu_cau.txt
    └── *.docx
```

---

## 🚀 HƯỚNG DẪN SỬ DỤNG NHANH

### 📌 CHO TIẾN (Leader - Ubuntu)

**Bước 1: Setup Database**
```bash
cd ~/CSDLPT/database/schemas
sqlcmd -S localhost -U sa -P 'Tt12345@' -C -i HR.sql
sqlcmd -S localhost -U sa -P 'Tt12345@' -C -i HR-Data.sql
sqlcmd -S localhost -U sa -P 'Tt12345@' -C -i Triggers.sql
sqlcmd -S localhost -U sa -P 'Tt12345@' -C -i Procedures.sql
sqlcmd -S localhost -U sa -P 'Tt12345@' -C -i Views.sql
sqlcmd -S localhost -U sa -P 'Tt12345@' -C -i Indexes.sql
sqlcmd -S localhost -U sa -P 'Tt12345@' -C -i Users.sql
```

**Bước 2: Setup Replication**
```bash
# 1. Cài Tailscale
curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up

# 2. Lấy IP VPN
tailscale ip -4  # VD: 100.64.0.1

# 3. Sửa IP trong các file replication (thay 100.64.0.1 bằng IP thực tế)
cd ~/CSDLPT/replication
nano 01_Setup_Distributor.sql

# 4. Chạy replication scripts
sqlcmd -S localhost -U sa -P 'Tt12345@' -C -i 01_Setup_Distributor.sql
sqlcmd -S localhost -U sa -P 'Tt12345@' -C -i 02_Create_Publication.sql
sqlcmd -S localhost -U sa -P 'Tt12345@' -C -i 03_Create_Snapshot.sql

# 5. Đợi 5 bạn setup xong máy Windows (xem docs/guides/PHAN_CONG_NHOM.md)

# 6. Test replication
sqlcmd -S localhost -U sa -P 'Tt12345@' -C -i Test_Replication.sql
```

---

### 📌 CHO 5 BẠN (Subscribers - Windows)

**Bước 1: Cài SQL Server 2019 Developer**
- Download: https://www.microsoft.com/en-us/sql-server/sql-server-downloads
- Chọn "Developer" → Basic → Install

**Bước 2: Cài SSMS**
- Download: https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms

**Bước 3: Cài Tailscale VPN**
- Download: https://tailscale.com/download/windows
- Install → Log in (dùng tài khoản chung với Tiến)

**Bước 4: Mở Port 1433**
- Win+R → `wf.msc`
- Inbound Rules → New Rule → Port → TCP 1433 → Allow

**Bước 5: Enable SQL Authentication**
```sql
-- Trong SSMS
ALTER LOGIN sa ENABLE;
ALTER LOGIN sa WITH PASSWORD = 'Tt12345@';
```

**Bước 6: Chạy Subscriber_Setup.sql**
- File → Open → `Subscriber_Setup.sql` (Tiến gửi)
- Execute (F5)

**Bước 7: Đợi Replication**
- Sau 5-10 phút, chạy:
```sql
USE QuanLyNhanSu;
SELECT COUNT(*) FROM ChinhSach;  -- Phải thấy 70
```

---

## 📊 KIẾN TRÚC HỆ THỐNG

### Phân mảnh dữ liệu:
- **Horizontal Fragmentation:** `PhongBan`, `NhanVien` (chia theo `ID_ChiNhanh`)
- **Replication:** `ChinhSach` (nhân bản đến tất cả chi nhánh)

### Sơ đồ:
```
                Publisher (Ubuntu - Tiến)
                      100.64.0.1
                      QuanLyNhanSu
                          │
        ┌─────────────────┼─────────────────┐
        │                 │                 │
   Subscriber 1      Subscriber 2      Subscriber 3
   100.64.0.2        100.64.0.3        100.64.0.4
   CN01 Huế          CN02 Nam Định     CN03 Vinh
   Windows           Windows           Windows
        │                 │                 │
   Subscriber 4      Subscriber 5
   100.64.0.5        100.64.0.6
   CN04 Nha Trang    CN05 Thái Bình
   Windows           Windows
```

---

## 📝 CHECKLIST HOÀN THÀNH

### ✅ ĐÃ XONG (70%)
- [x] Schema database (8 bảng)
- [x] Dữ liệu mẫu (280 nhân viên, 7 chi nhánh)
- [x] 7 Triggers
- [x] 9 Procedures (đã fix overflow BIGINT)
- [x] 3 Views
- [x] 6 Indexes
- [x] 4 Users + phân quyền
- [x] SQL Server Agent enabled
- [x] Test suite (Triggers + Procedures)
- [x] Hướng dẫn VPN
- [x] Hướng dẫn Replication
- [x] Hướng dẫn Screenshots
- [x] Phân công nhóm
- [x] Tài liệu bảo vệ

### ⏳ ĐANG LÀM (30%)
- [ ] Setup VPN (6 máy) - 15%
- [ ] Cấu hình Replication (Publisher + 5 Subscribers) - 30%
- [ ] Chụp 47 screenshots - 10%
- [ ] Viết báo cáo Word - 20%
- [ ] Tạo slide PowerPoint - 15%
- [ ] Test đồng bộ Replication - 10%

---

## 📅 LỊCH TRÌNH

| Tuần | Công việc | Deadline |
|------|-----------|----------|
| **Tuần 1** | Setup VPN + Replication | 14/11/2025 |
| **Tuần 2** | Screenshots + Báo cáo | 21/11/2025 |
| **Tuần 3** | Bảo vệ trước cô | TBA |

---

## 🎯 KẾT QUẢ MONG ĐỢI

### Khi nộp báo cáo (21/11):
- Báo cáo Word hoàn chỉnh (15-20 trang)
- PowerPoint (10-15 slides)
- 47 screenshots chất lượng cao
- Source code đầy đủ

### Khi bảo vệ:
- Demo database hoạt động
- Demo Replication đồng bộ real-time
- Giải thích kiến trúc CSDLPT
- Trả lời câu hỏi cô

---

## 📞 LIÊN HỆ

**Leader:** Nguyễn Minh Tiến  
**Role:** Publisher (Ubuntu)  
**IP VPN:** 100.64.0.1  
**Hỗ trợ:** 24/7 trong group chat

---

## 🔗 LINKS QUAN TRỌNG

- **Tailscale:** https://tailscale.com
- **SQL Server 2019:** https://www.microsoft.com/en-us/sql-server/sql-server-downloads
- **SSMS:** https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms
- **dbdiagram.io:** https://dbdiagram.io (vẽ ER Diagram)

---

## 📖 TÀI LIỆU THAM KHẢO

1. **docs/guides/BAT_DAU_NGAY.md** - ⭐ Bắt đầu ngay hôm nay
2. **docs/guides/HUONG_DAN_VPN.md** - Setup Tailscale
3. **docs/guides/HUONG_DAN_REPLICATION.md** - Cấu hình Replication
4. **docs/guides/PHAN_CONG_NHOM.md** - Phân công nhiệm vụ
5. **docs/reports/BAO_VE_CSDLPT.md** - Câu hỏi bảo vệ

---

**Cập nhật:** 08/11/2025  
**Trạng thái:** 70% hoàn thành - Ready for VPN & Replication phase  
**Next step:** Setup Tailscale VPN trên 6 máy
