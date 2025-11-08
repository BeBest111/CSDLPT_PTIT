# PHÂN CÔNG NHIỆM VỤ NHÓM 5 - DỰ ÁN CSDLPT

## 👥 THÀNH VIÊN NHÓM

| STT | Họ tên | Vai trò | Máy | OS | SQL Version | IP VPN |
|-----|--------|---------|-----|----|-----------| -------|
| 1 | **Nguyễn Minh Tiến** | **Leader + Publisher** | Laptop | Ubuntu 22.04 | SQL Server 2022 | 100.64.0.1 |
| 2 | (Tên bạn 2) | Subscriber | Desktop/Laptop | Windows 10/11 | SQL Server 2019 | 100.64.0.2 |
| 3 | (Tên bạn 3) | Subscriber | Desktop/Laptop | Windows 10/11 | SQL Server 2019 | 100.64.0.3 |
| 4 | (Tên bạn 4) | Subscriber | Desktop/Laptop | Windows 10/11 | SQL Server 2019 | 100.64.0.4 |
| 5 | (Tên bạn 5) | Subscriber | Desktop/Laptop | Windows 10/11 | SQL Server 2019 | 100.64.0.5 |
| 6 | (Tên bạn 6) | Subscriber | Desktop/Laptop | Windows 10/11 | SQL Server 2019 | 100.64.0.6 |

**Ghi chú:** Điền tên thật và IP VPN sau khi setup Tailscale.

---

## 📅 LỊCH TRÌNH THỰC HIỆN

### Tuần 1 (08/11 - 14/11): Setup cơ bản

| Ngày | Công việc | Người phụ trách |
|------|-----------|-----------------|
| **08/11** | Họp nhóm kick-off, phân công nhiệm vụ | Cả nhóm |
| **09-10/11** | Cài đặt SQL Server 2019 trên 5 máy Windows | Bạn 2-6 |
| **09-10/11** | Cài Tailscale VPN (6 máy) | Cả nhóm |
| **11/11** | Test kết nối VPN, mở port 1433 | Cả nhóm |
| **12/11** | Tiến: Setup Distributor & Publisher | Tiến |
| **13/11** | Tiến: Tạo 5 Subscriptions | Tiến |
| **14/11** | Test đồng bộ Replication | Cả nhóm |

### Tuần 2 (15/11 - 21/11): Hoàn thiện và báo cáo

| Ngày | Công việc | Người phụ trách |
|------|-----------|-----------------|
| **15-16/11** | Chụp screenshots (VPN, Database, Triggers, Procedures, Replication) | Cả nhóm |
| **17-18/11** | Viết báo cáo Word, chèn hình ảnh | Bạn 2-4 |
| **19/11** | Chuẩn bị slide PowerPoint | Bạn 5-6 |
| **20/11** | Tổng duyệt, test demo | Cả nhóm |
| **21/11** | Nộp báo cáo | Tiến |

### Tuần 3 (22/11+): Bảo vệ

| Ngày | Công việc | Người phụ trách |
|------|-----------|-----------------|
| **TBA** | Bảo vệ trước cô | Cả nhóm |

---

## 🎯 PHÂN CÔNG CHI TIẾT

### 1️⃣ TIẾN (Leader + Publisher)

**Trách nhiệm chính:**
- ✅ Setup toàn bộ database trên Ubuntu
- ✅ Cấu hình Distributor & Publisher
- ✅ Tạo 5 Subscriptions cho 5 máy Windows
- ✅ Viết tất cả SQL scripts (Triggers, Procedures, Views, Indexes)
- ✅ Troubleshooting khi có lỗi
- ✅ Hướng dẫn 5 bạn setup máy
- ✅ Review code và báo cáo

**Deliverables:**
- [ ] Database QuanLyNhanSu hoạt động 100%
- [ ] 7 Triggers hoạt động
- [ ] 9 Procedures hoạt động
- [ ] Publication `Pub_ChinhSach` đang chạy
- [ ] 5 Subscriptions đồng bộ thành công
- [ ] File hướng dẫn: HUONG_DAN_VPN.md, HUONG_DAN_REPLICATION.md
- [ ] Chụp 20 screenshots (database, triggers, procedures, replication)

**Deadline:** 14/11/2025

---

### 2️⃣ BẠN 2-6 (Subscribers)

**Trách nhiệm chung:**
- [ ] Cài SQL Server 2019 Developer (miễn phí) trên Windows
- [ ] Cài Tailscale VPN, kết nối vào mạng nhóm
- [ ] Mở port 1433 trên Windows Firewall
- [ ] Enable SQL Server Authentication (sa/Tt12345@)
- [ ] Chạy script `Subscriber_Setup.sql` (do Tiến cung cấp)
- [ ] Test kết nối đến Publisher (máy Tiến)
- [ ] Chụp screenshots (SSMS, Tailscale, Replication)

**Deliverables mỗi người:**
- [ ] SQL Server 2019 cài đặt xong
- [ ] Kết nối VPN thành công (ping được 100.64.0.1)
- [ ] SSMS connect được vào Publisher
- [ ] Database QuanLyNhanSu nhận được dữ liệu từ Replication
- [ ] 5 screenshots (xem PHAN_CONG_SCREENSHOTS bên dưới)

**Deadline:** 14/11/2025

---

### 3️⃣ PHÂN CÔNG VIẾT BÁO CÁO

#### Bạn 2 (Subscriber CN01 Huế):
**Phần viết:**
- PHẦN 1: Đặt vấn đề (1 trang)
  - Giới thiệu công ty (tự nghĩ: Công ty TNHH ORGASM, 280 nhân viên, 7 chi nhánh)
  - Lý do cần CSDLPT (dữ liệu phân tán, nhiều chi nhánh)
- PHẦN 2.1: Phân tích chức năng (1 trang)
  - Các chức năng hệ thống (quản lý nhân viên, lương, phòng ban, dự án, chính sách)

**Deadline:** 17/11/2025

---

#### Bạn 3 (Subscriber CN02 Nam Định):
**Phần viết:**
- PHẦN 2.2: Thiết kế CSDL (2 trang)
  - ER Diagram (vẽ bằng draw.io hoặc dbdiagram.io)
  - Danh sách 8 bảng với mô tả
  - Quan hệ giữa các bảng (Foreign Keys)

**Deadline:** 17/11/2025

---

#### Bạn 4 (Subscriber CN03 Vinh):
**Phần viết:**
- PHẦN 2.3: Phân mảnh và nhân bản (2 trang)
  - Giải thích phân mảnh ngang (PhongBan, NhanVien theo ID_ChiNhanh)
  - Giải thích nhân bản (ChinhSach)
  - Lý do chọn phân mảnh/nhân bản cho từng bảng

**Deadline:** 17/11/2025

---

#### Bạn 5 (Subscriber CN04 Nha Trang):
**Phần viết:**
- PHẦN 2.4-2.5: Triggers & Procedures (2 trang)
  - Mô tả 7 triggers (copy code + giải thích)
  - Mô tả 9 procedures (copy code + giải thích)

**Deliverable khác:**
- Tạo slide PowerPoint (10-15 slides) cho buổi bảo vệ

**Deadline:** 18/11/2025 (báo cáo), 19/11/2025 (slide)

---

#### Bạn 6 (Subscriber CN05 Thái Bình):
**Phần viết:**
- PHẦN 3: Cài đặt vật lý (2 trang)
  - Hướng dẫn cài SQL Server trên Ubuntu (Tiến) và Windows (5 bạn)
  - Cấu hình VPN (Tailscale)
  - Cấu hình Replication (Publisher, Distributor, Subscribers)
- PHẦN 4: Kết quả và đánh giá (1 trang)
  - Kết quả đạt được
  - Khó khăn gặp phải
  - Hướng phát triển

**Deliverable khác:**
- Thiết kế bìa báo cáo, mục lục

**Deadline:** 18/11/2025

---

### 4️⃣ PHÂN CÔNG CHỤP SCREENSHOTS

| Người | Số lượng | Danh mục | Ghi chú |
|-------|----------|----------|---------|
| **Tiến** | 20 ảnh | Database (10), Procedures (10) | Chụp trên Ubuntu |
| **Bạn 2** | 8 ảnh | VPN (3), Replication Subscriber (5) | Chụp trên Windows |
| **Bạn 3** | 7 ảnh | Triggers (7) | Chạy test triggers, chụp kết quả |
| **Bạn 4** | 5 ảnh | Replication (5) | Publisher side, Snapshot, Agents |
| **Bạn 5** | 5 ảnh | Demo (5) | ER Diagram, Architecture, Demo script |
| **Bạn 6** | 2 ảnh | VPN Admin Panel, Tailscale Windows | Tổng quan VPN |

**Tổng:** 47 ảnh (xem chi tiết trong `HUONG_DAN_SCREENSHOTS.md`)

---

## 🛠️ HƯỚNG DẪN CHO 5 BẠN WINDOWS

### Bước 1: Cài SQL Server 2019 Developer (Miễn phí)

**Link download:**  
👉 https://www.microsoft.com/en-us/sql-server/sql-server-downloads

**Các bước:**
1. Download "Developer" edition (free, full features)
2. Chạy installer
3. Chọn "Basic" installation
4. Accept license → Install
5. Sau khi cài xong, nhớ lấy instance name (mặc định: `MSSQLSERVER`)

**Cài SSMS (SQL Server Management Studio):**  
👉 https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms

---

### Bước 2: Enable SQL Authentication

**Mở SSMS:**
1. Connect to `localhost` (Windows Authentication)
2. Right-click server name → **Properties**
3. **Security** → Server authentication: **SQL Server and Windows Authentication mode**
4. Click OK
5. **Restart SQL Server service:**
   - Win+R → `services.msc`
   - Tìm "SQL Server (MSSQLSERVER)"
   - Right-click → Restart

**Enable user `sa`:**
```sql
USE master;
GO

ALTER LOGIN sa ENABLE;
ALTER LOGIN sa WITH PASSWORD = 'Tt12345@';
GO
```

---

### Bước 3: Cài Tailscale VPN

**Link download:**  
👉 https://tailscale.com/download/windows

**Các bước:**
1. Download `tailscale-setup-xxx.exe`
2. Chạy installer → Next → Install
3. Sau khi cài xong, Tailscale icon xuất hiện ở System Tray (góc dưới bên phải)
4. Click icon → "Log in"
5. **QUAN TRỌNG:** Đăng nhập bằng **CÙNG TÀI KHOẢN** với Tiến (hỏi Tiến tài khoản Google/Microsoft nào)
6. Authorize
7. Kiểm tra: `tailscale status` trong Command Prompt

---

### Bước 4: Mở Port 1433

**Mở Windows Defender Firewall:**

1. Win+R → `wf.msc` (Windows Firewall with Advanced Security)
2. **Inbound Rules** → **New Rule...**
3. Rule Type: **Port**
4. Protocol: **TCP**, Specific local ports: **1433**
5. Action: **Allow the connection**
6. Profile: Tick **Domain, Private, Public**
7. Name: `SQL Server Replication Port`
8. Finish

---

### Bước 5: Test kết nối đến Publisher

**Mở SSMS:**
1. File → Connect Object Explorer
2. Server name: `100.64.0.1` (IP VPN của máy Tiến - check lại với Tiến)
3. Authentication: **SQL Server Authentication**
4. Login: `sa`
5. Password: `Tt12345@`
6. Click **Connect**

**Nếu kết nối thành công:**
- Sẽ thấy database `QuanLyNhanSu`
- Query thử:
  ```sql
  SELECT * FROM ChiNhanh;
  ```

**Nếu lỗi:**
- Chụp screenshot lỗi, gửi vào group chat
- Tiến sẽ hỗ trợ

---

### Bước 6: Chạy script Subscriber_Setup.sql

**Tiến sẽ gửi file `Subscriber_Setup.sql` vào group.**

**Các bạn làm:**
1. Mở SSMS
2. Connect to **localhost** (máy mình)
3. File → Open → Chọn `Subscriber_Setup.sql`
4. Execute (F5)
5. Kiểm tra:
   ```sql
   SELECT COUNT(*) FROM ChinhSach;
   -- Phải thấy 70 records sau khi Replication chạy
   ```

---

### Bước 7: Chụp screenshots

**Mỗi người chụp theo phân công (xem bảng trên).**

**Gửi ảnh cho Tiến qua:**
- Google Drive (tạo folder chung)
- Hoặc Zalo/Telegram group

---

## 📞 LIÊN HỆ & HỖ TRỢ

### Kênh giao tiếp:
- **Zalo/Telegram group:** (Tạo group chat)
- **Google Drive:** (Chia sẻ file)
- **GitHub:** (Nếu muốn dùng Git)

### Người hỗ trợ:
- **Tiến (Leader):** Mọi vấn đề kỹ thuật
- **Bạn 5:** PowerPoint
- **Bạn 6:** Báo cáo Word

### Thời gian họp:
- **Tuần 1:** Họp online mỗi tối (30 phút) để sync tiến độ
- **Tuần 2:** Họp 1 buổi offline để tổng duyệt

---

## 🎯 MỤC TIÊU CUỐI CÙNG

### Khi nộp báo cáo (21/11):
- [ ] Báo cáo Word hoàn chỉnh (15-20 trang)
- [ ] PowerPoint (10-15 slides)
- [ ] 47 screenshots chất lượng cao
- [ ] Demo video (optional, 5-10 phút)
- [ ] Source code (HR.sql, Triggers.sql, Procedures.sql, ...)

### Khi bảo vệ trước cô:
- [ ] Tiến: Trình bày tổng quan (5 phút)
- [ ] Bạn 2-4: Giải thích từng phần (2 phút/người)
- [ ] Bạn 5-6: Demo trực tiếp (5 phút)
- [ ] Cả nhóm: Trả lời câu hỏi cô (10 phút)

**Tổng thời gian:** 20-25 phút

---

## ✅ CHECKLIST TIẾN ĐỘ

### Tuần 1 (Setup):
- [ ] Tiến: Database + Publisher setup xong (12/11)
- [ ] 5 bạn: SQL Server + Tailscale cài xong (11/11)
- [ ] 5 bạn: Test connect vào Publisher (11/11)
- [ ] Tiến: 5 Subscriptions tạo xong (13/11)
- [ ] Cả nhóm: Test replication thành công (14/11)

### Tuần 2 (Báo cáo):
- [ ] Bạn 2: Phần 1 xong (17/11)
- [ ] Bạn 3: Phần 2.2 xong (17/11)
- [ ] Bạn 4: Phần 2.3 xong (17/11)
- [ ] Bạn 5: Phần 2.4-2.5 + Slide xong (18/11, 19/11)
- [ ] Bạn 6: Phần 3-4 + Bìa xong (18/11)
- [ ] Tiến: Review toàn bộ báo cáo (19/11)
- [ ] Cả nhóm: Screenshots đủ 47 ảnh (18/11)
- [ ] Cả nhóm: Tổng duyệt (20/11)
- [ ] Tiến: Nộp báo cáo (21/11)

---

## 🚀 LỜI NHẮN TỪ TIẾN

**Các bạn ơi,**

Dự án này khá phức tạp vì có nhiều máy, nhưng nếu làm theo hướng dẫn từng bước thì sẽ ổn. Quan trọng nhất là:

1. **Đúng deadline:** Ai làm phần nào thì hoàn thành đúng hạn để mình review kịp.
2. **Thông báo sớm nếu gặp khó khăn:** Đừng chờ đến phút chót mới báo lỗi.
3. **Chụp screenshots đầy đủ:** Báo cáo không có hình ảnh sẽ rất khô khan.

Mình sẽ hỗ trợ tất cả các bạn 24/7. Nếu có gì không hiểu, cứ hỏi trong group!

**Let's ace this project! 🎉**

---

**Người tạo:** Nguyễn Minh Tiến  
**Cập nhật:** 08/11/2025  
**Trạng thái:** Ready for team review
