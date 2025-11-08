# 📨 TIN NHẮN GỬI CHO NHÓM

**Copy và gửi vào group Zalo/Telegram:**

---

Chào mọi người! 👋

Mình (Tiến) đã setup xong database trên máy Ubuntu.  
IP VPN của mình: **100.74.240.106**

Bây giờ cần mọi người làm **5 việc** sau (deadline: **tối nay 21h**):

---

## 📌 VIỆC 1: Cài SQL Server 2019 Developer (miễn phí)

**Link:** https://www.microsoft.com/en-us/sql-server/sql-server-downloads

**Các bước:**
1. Chọn "Developer" (miễn phí)
2. Click Download
3. Chạy installer → Chọn "Basic"
4. Accept license → Install
5. Đợi cài xong (~10-15 phút)

---

## 📌 VIỆC 2: Cài SSMS (SQL Server Management Studio)

**Link:** https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms

**Các bước:**
1. Download SSMS
2. Chạy installer
3. Install
4. Restart máy nếu cần

---

## 📌 VIỆC 3: Cài Tailscale VPN ⚠️ QUAN TRỌNG

**Link:** https://tailscale.com/download/windows

**Các bước:**
1. Download Tailscale for Windows
2. Chạy installer → Install
3. Sau khi cài xong, mở Tailscale (icon ở System Tray)
4. Click "Log in"
5. **⚠️ QUAN TRỌNG:** Đăng nhập bằng tài khoản:
   - Email: **BeBest111@gmail.com** (hoặc tài khoản GitHub: BeBest111)
   - (Mình sẽ gửi password riêng)
6. Sau khi đăng nhập, mở Command Prompt:
   ```
   tailscale status
   ```
7. Chụp screenshot và gửi cho mình IP VPN (dạng 100.x.x.x)

---

## 📌 VIỆC 4: Mở Port 1433 (Windows Firewall)

**Các bước:**
1. Nhấn **Win+R** → gõ `wf.msc` → Enter
2. Click **Inbound Rules** (bên trái)
3. Click **New Rule...** (bên phải)
4. Rule Type: chọn **Port** → Next
5. Protocol: **TCP**, Specific local ports: **1433** → Next
6. Action: **Allow the connection** → Next
7. Profile: Tick cả 3 ô (**Domain, Private, Public**) → Next
8. Name: `SQL Server Port 1433` → Finish

---

## 📌 VIỆC 5: Enable SQL Authentication

**Các bước:**
1. Mở **SSMS**
2. Connect to **localhost** (Windows Authentication)
3. Mở New Query
4. Chạy lệnh sau:
   ```sql
   ALTER LOGIN sa ENABLE;
   ALTER LOGIN sa WITH PASSWORD = 'Tt12345@';
   ```
5. Restart SQL Server service:
   - Win+R → `services.msc`
   - Tìm "SQL Server (MSSQLSERVER)"
   - Right-click → Restart

---

## 🧪 TEST KẾT NỐI ĐẾN MÁY TIẾN

**Sau khi làm xong 5 việc trên:**

1. Mở SSMS
2. File → Connect Object Explorer
3. Điền thông tin:
   - Server name: **100.74.240.106**
   - Authentication: **SQL Server Authentication**
   - Login: **sa**
   - Password: **Tt12345@**
4. Click **Connect**

**Nếu kết nối thành công:**
- Sẽ thấy database `QuanLyNhanSu`
- Query test: 
  ```sql
  USE QuanLyNhanSu;
  SELECT * FROM ChiNhanh;
  ```
- Sẽ thấy 7 chi nhánh: Huế, Nam Định, Vinh, Nha Trang, Thái Bình, Đồng Nai, Bình Dương

---

## 📸 CHỤP SCREENSHOTS

Mỗi người chụp **3 ảnh** và gửi vào group:

1. **Ảnh 1:** Tailscale status (Command Prompt: `tailscale status`)
2. **Ảnh 2:** SSMS đã connect thành công vào 100.74.240.106
3. **Ảnh 3:** Kết quả query `SELECT * FROM ChiNhanh;`

---

## ⏰ DEADLINE

**Tối nay (08/11) trước 21h**

Sau đó mình sẽ họp online (21h-21h30) để:
- Kiểm tra tiến độ
- Giải đáp thắc mắc
- Lên kế hoạch ngày mai (setup Replication)

---

## 🆘 NẾU GẶP LỖI

**Đừng ngại hỏi!**  
Chụp screenshot lỗi và gửi vào group ngay.  
Mình sẽ hỗ trợ (online 8h-22h).

---

**Let's go! 💪**

---

**P/S:** File hướng dẫn chi tiết đã push lên GitHub:  
https://github.com/BeBest111/CSDLPT_PTIT

Vào thư mục `docs/guides/` để xem thêm.
