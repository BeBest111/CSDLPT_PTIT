# ⚡ BẮTĐẦU NGAY - SETUP VPN & REPLICATION

## 🎯 MỤC TIÊU HÔM NAY (8/11/2025)

Kết nối 6 máy tính qua VPN và test kết nối SQL Server.

---

## 📋 CHUẨN BỊ

### Thông tin cần lấy từ 5 bạn:
- [ ] Họ tên
- [ ] Số điện thoại (để tạo group Zalo/Telegram)
- [ ] Hệ điều hành (Windows 10/11?)
- [ ] Đã cài SQL Server 2019 chưa?

---

## ✅ BƯỚC 1: TIẾN - CÀI TAILSCALE (5 PHÚT)

```bash
# Cài Tailscale
curl -fsSL https://tailscale.com/install.sh | sh

# Khởi động
sudo tailscale up

# Lệnh này sẽ hiện link, mở trình duyệt đăng nhập Google
# VD: https://login.tailscale.com/a/abc123xyz

# Sau khi đăng nhập, lấy IP VPN
tailscale ip -4
# VD: 100.64.0.1

# Lưu IP này lại!
```

**Chụp screenshot:**
```bash
tailscale status
```

---

## ✅ BƯỚC 2: TIẾN - MỞ PORT 1433 (2 PHÚT)

```bash
# Mở firewall
sudo ufw allow 1433/tcp

# Kiểm tra SQL Server đang lắng nghe 0.0.0.0
sudo netstat -tuln | grep 1433

# Nếu chỉ thấy 127.0.0.1:1433, chạy:
sudo /opt/mssql/bin/mssql-conf set network.ipaddress 0.0.0.0
sudo systemctl restart mssql-server

# Kiểm tra lại
sudo netstat -tuln | grep 1433
# Phải thấy: 0.0.0.0:1433
```

---

## ✅ BƯỚC 3: GỬI HƯỚNG DẪN CHO 5 BẠN

**Gửi vào group chat:**

```
Chào mọi người! 👋

Mình (Tiến) đã setup xong database trên máy Ubuntu.
Bây giờ cần mọi người làm 4 việc:

📌 VIỆC 1: Cài SQL Server 2019 Developer (miễn phí)
Link: https://www.microsoft.com/en-us/sql-server/sql-server-downloads
- Chọn "Developer" → Basic → Install

📌 VIỆC 2: Cài SSMS
Link: https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms

📌 VIỆC 3: Cài Tailscale VPN
Link: https://tailscale.com/download/windows
- Install → Log in
- ⚠️ QUAN TRỌNG: Đăng nhập bằng tài khoản Google: [EMAIL CỦA TIẾN]
  (Mình sẽ gửi email/password riêng)

📌 VIỆC 4: Mở Port 1433
- Win+R → wf.msc
- Inbound Rules → New Rule → Port → TCP 1433 → Allow

📌 VIỆC 5: Enable SQL Authentication
- Mở SSMS → Connect to localhost
- Chạy query:
  ALTER LOGIN sa ENABLE;
  ALTER LOGIN sa WITH PASSWORD = 'Tt12345@';

⏰ Deadline: Tối nay (8/11) trước 21h

Làm xong chụp screenshot gửi vào group:
1. Tailscale status (Command Prompt: tailscale status)
2. SSMS đã connect được vào localhost

Nếu gặp lỗi, hỏi ngay nhé! 💪
```

---

## ✅ BƯỚC 4: TIẾN - TẠO DANH SÁCH IP (SAU KHI 5 BẠN CÀI XONG)

**File: `DANH_SACH_IP.md`**

| Máy | Họ tên | IP VPN | Trạng thái |
|-----|--------|--------|-----------|
| 1 | Nguyễn Minh Tiến | 100.64.0.1 | ✅ Online |
| 2 | (Tên bạn 2) | (Đợi bạn gửi) | ⏳ Chưa setup |
| 3 | (Tên bạn 3) | (Đợi bạn gửi) | ⏳ Chưa setup |
| 4 | (Tên bạn 4) | (Đợi bạn gửi) | ⏳ Chưa setup |
| 5 | (Tên bạn 5) | (Đợi bạn gửi) | ⏳ Chưa setup |
| 6 | (Tên bạn 6) | (Đợi bạn gửi) | ⏳ Chưa setup |

---

## ✅ BƯỚC 5: TEST KẾT NỐI (SAU KHI CÓ IP CỦA 5 BẠN)

**Hướng dẫn 5 bạn test kết nối đến máy Tiến:**

```
Mọi người mở SSMS:
1. File → Connect Object Explorer
2. Server name: 100.64.0.1 (IP VPN của Tiến)
3. Authentication: SQL Server Authentication
4. Login: sa
5. Password: Tt12345@
6. Click Connect

Nếu kết nối thành công:
- Sẽ thấy database QuanLyNhanSu
- Query thử: SELECT * FROM ChiNhanh;

Chụp screenshot gửi vào group! ✅
```

---

## ✅ BƯỚC 6: TIẾN - SỬA IP TRONG SCRIPTS

**Sau khi có IP của 5 bạn, sửa file:**

```bash
cd ~/CSDLPT

# Sửa IP trong Distributor
nano 01_Setup_Distributor.sql
# Thay 100.64.0.1 bằng IP VPN thực tế của máy Tiến

# Sửa IP trong Subscriptions
nano 04_Create_Subscriptions.sql
# Thay 100.64.0.2, .3, .4, .5, .6 bằng IP thực tế của 5 bạn
```

---

## ✅ BƯỚC 7: TIẾN - CHẠY REPLICATION SCRIPTS (NGÀY MAI 9/11)

**Chỉ chạy sau khi 5 bạn đã:**
- ✅ Cài SQL Server 2019
- ✅ Cài Tailscale
- ✅ Connect được vào 100.64.0.1

```bash
cd ~/CSDLPT

# 1. Setup Distributor
sqlcmd -S localhost -U sa -P 'Tt12345@' -C -i 01_Setup_Distributor.sql

# 2. Create Publication
sqlcmd -S localhost -U sa -P 'Tt12345@' -C -i 02_Create_Publication.sql

# 3. Create Snapshot
sqlcmd -S localhost -U sa -P 'Tt12345@' -C -i 03_Create_Snapshot.sql

# 4. Đợi 5 bạn chạy Subscriber_Setup.sql

# 5. Create Subscriptions
sqlcmd -S localhost -U sa -P 'Tt12345@' -C -i 04_Create_Subscriptions.sql

# 6. Test Replication
sqlcmd -S localhost -U sa -P 'Tt12345@' -C -i Test_Replication.sql
```

---

## ✅ BƯỚC 8: 5 BẠN - CHẠY SUBSCRIBER_SETUP.SQL (NGÀY MAI 9/11)

**Gửi file `Subscriber_Setup.sql` cho 5 bạn:**

```
Mọi người mở SSMS:
1. Connect to localhost (máy mình)
2. File → Open → Subscriber_Setup.sql
3. Execute (F5)
4. Chụp screenshot kết quả
```

---

## 📸 SCREENSHOTS CẦN CHỤP HÔM NAY

### Tiến:
- [ ] Tailscale status (Ubuntu)
- [ ] netstat -tuln | grep 1433

### 5 bạn (mỗi người):
- [ ] Tailscale status (Windows)
- [ ] SSMS connect vào 100.64.0.1 thành công

---

## 🎯 KẾT QUẢ MONG ĐỢI CUỐI NGÀY (8/11)

- [ ] 6 máy đã cài Tailscale
- [ ] 6 máy ping được nhau
- [ ] 5 máy Windows connect được vào Ubuntu (100.64.0.1)
- [ ] Có danh sách IP VPN của 6 máy

---

## 🚨 TROUBLESHOOTING

### Lỗi 1: Bạn không connect được vào 100.64.0.1
**Kiểm tra:**
```bash
# Tiến: Test từ Ubuntu
telnet 100.64.0.1 1433
# Hoặc
nc -zv 100.64.0.1 1433

# Nếu lỗi, restart SQL Server
sudo systemctl restart mssql-server
```

### Lỗi 2: Login failed for user 'sa'
**Kiểm tra:**
```bash
# Tiến: Enable remote access
sqlcmd -S localhost -U sa -P 'Tt12345@' -C -Q "
EXEC sys.sp_configure N'remote access', N'1';
RECONFIGURE WITH OVERRIDE;
"
```

### Lỗi 3: Tailscale không thấy máy khác
**Kiểm tra:**
- Tất cả 6 người phải đăng nhập **CÙNG TÀI KHOẢN TAILSCALE**
- Kiểm tra trên web: https://login.tailscale.com/admin/machines

---

## 📞 LIÊN HỆ KHẨN CẤP

**Nếu gặp lỗi:**
1. Chụp screenshot lỗi
2. Gửi vào group chat
3. Tiến sẽ hỗ trợ ngay

**Thời gian online:** 8h-22h mỗi ngày

---

## ⏰ TIMELINE

| Thời gian | Công việc |
|-----------|-----------|
| **8/11 14h-15h** | Tiến: Cài Tailscale, gửi hướng dẫn cho 5 bạn |
| **8/11 15h-21h** | 5 bạn: Cài SQL Server + Tailscale + Test kết nối |
| **8/11 21h** | Họp online, kiểm tra tiến độ |
| **9/11 9h-12h** | Tiến: Setup Replication |
| **9/11 14h-17h** | 5 bạn: Chạy Subscriber_Setup.sql |
| **9/11 20h** | Test đồng bộ Replication |

---

**LET'S GO! 🚀**

Bắt đầu từ BƯỚC 1 ngay bây giờ!
