# HƯỚNG DẪN KẾT NỐI VPN - SQL SERVER REPLICATION

## 🎯 MỤC TIÊU
Kết nối 6 máy tính (1 Ubuntu + 5 Windows) qua VPN để các máy có thể giao tiếp với nhau qua port 1433 (SQL Server).

---

## 📋 THÔNG TIN NHÓM

### Cấu trúc hệ thống:
```
Máy 1 (Tiến - Ubuntu 22.04)    → PUBLISHER (Trụ sở Hà Nội)
   ↓ VPN Network (10.x.x.x)
   ├─ Máy 2 (Windows)           → SUBSCRIBER (Chi nhánh Huế - CN01)
   ├─ Máy 3 (Windows)           → SUBSCRIBER (Chi nhánh Nam Định - CN02)
   ├─ Máy 4 (Windows)           → SUBSCRIBER (Chi nhánh Vinh - CN03)
   ├─ Máy 5 (Windows)           → SUBSCRIBER (Chi nhánh Nha Trang - CN04)
   └─ Máy 6 (Windows)           → SUBSCRIBER (Chi nhánh Thái Bình - CN05)
```

**Lưu ý:** Chỉ setup 6 máy thay vì 8 máy (vì chỉ có 6 thành viên). Các chi nhánh CN06, CN07 sẽ tạo ảo trên máy Tiến để demo.

---

## 🚀 PHƯƠNG ÁN 1: TAILSCALE (KHUYẾN NGHỊ)

### Ưu điểm:
✅ **Miễn phí** cho tối đa 100 thiết bị  
✅ **Cài đặt cực kỳ đơn giản** (5 phút/máy)  
✅ **Tự động NAT traversal** (không cần port forwarding)  
✅ **Cross-platform:** Ubuntu, Windows, macOS, Android  
✅ **Có GUI** trên Windows, dễ dùng cho người không rành  
✅ **IP tĩnh:** Mỗi máy có IP VPN cố định (vd: 100.64.0.1)

### Nhược điểm:
⚠️ Cần tài khoản Google/Microsoft/GitHub (1 tài khoản dùng chung cho nhóm)

---

## 📦 BƯỚC 1: CÀI ĐẶT TAILSCALE

### 1.1. Trên máy Tiến (Ubuntu 22.04)

```bash
# Cài Tailscale
curl -fsSL https://tailscale.com/install.sh | sh

# Khởi động Tailscale
sudo tailscale up

# Lệnh này sẽ hiện ra link kiểu:
# https://login.tailscale.com/a/abc123xyz
# Copy link này, mở trên trình duyệt, đăng nhập bằng Google
```

**Sau khi đăng nhập:**
```bash
# Kiểm tra IP VPN của máy mình
tailscale ip -4
# VD: 100.64.0.1

# Kiểm tra trạng thái
tailscale status
```

---

### 1.2. Trên 5 máy Windows (SSMS)

**Gửi link này cho 5 bạn:**  
👉 https://tailscale.com/download/windows

**Các bạn làm theo:**

1. **Download Tailscale for Windows**  
   - Chạy file `tailscale-setup-xxx.exe`
   - Next → Next → Install

2. **Đăng nhập Tailscale**  
   - Sau khi cài xong, mở Tailscale từ System Tray
   - Click "Log in"
   - Chọn tài khoản **CÙNG TÀI KHOẢN** mà Tiến đã dùng (Google/Microsoft)
   - Authorize

3. **Kiểm tra kết nối**  
   - Mở Command Prompt (Win+R → cmd)
   - Gõ:
     ```cmd
     tailscale status
     ```
   - Sẽ thấy danh sách tất cả 6 máy với IP VPN

4. **Test ping**  
   ```cmd
   ping 100.64.0.1
   ```
   (Thay `100.64.0.1` bằng IP VPN của máy Tiến)

---

## 🔓 BƯỚC 2: MỞ PORT SQL SERVER

### 2.1. Trên máy Tiến (Ubuntu - Publisher)

```bash
# Mở port 1433 trên firewall
sudo ufw allow 1433/tcp

# Kiểm tra firewall
sudo ufw status

# Kiểm tra SQL Server đang lắng nghe port nào
sudo netstat -tuln | grep 1433
# Phải thấy: 0.0.0.0:1433 hoặc :::1433
```

**Nếu SQL Server chỉ lắng nghe 127.0.0.1:**
```bash
# Sửa file cấu hình
sudo /opt/mssql/bin/mssql-conf set network.ipaddress 0.0.0.0
sudo systemctl restart mssql-server

# Kiểm tra lại
sudo netstat -tuln | grep 1433
```

---

### 2.2. Trên 5 máy Windows (Subscribers)

**Mở Windows Firewall:**

1. **Start Menu** → Gõ "Windows Defender Firewall with Advanced Security"

2. **Inbound Rules** → **New Rule...**
   - Rule Type: **Port**
   - Protocol: **TCP**
   - Specific local ports: **1433**
   - Action: **Allow the connection**
   - Profile: **Domain, Private, Public** (tick cả 3)
   - Name: **SQL Server Port 1433**

3. **Click Finish**

---

## 🧪 BƯỚC 3: TEST KẾT NỐI SQL SERVER

### 3.1. Từ máy Windows → máy Tiến (Ubuntu)

**Mở SSMS trên Windows:**

1. **File → Connect Object Explorer**
2. **Server name:** `100.64.0.1` (IP VPN của máy Tiến)
3. **Authentication:** SQL Server Authentication
4. **Login:** `sa`
5. **Password:** `Tt12345@`
6. **Click Connect**

**Nếu kết nối thành công:**
- Sẽ thấy database `QuanLyNhanSu` trong Object Explorer
- Query thử:
  ```sql
  SELECT @@VERSION;
  SELECT * FROM ChiNhanh;
  ```

**Nếu lỗi:**
- **"Login failed":** Kiểm tra password `Tt12345@`
- **"Cannot connect":** Kiểm tra firewall, VPN, SQL Server có chạy không
- **"SQL Server does not exist":** Kiểm tra IP VPN đúng chưa

---

### 3.2. Từ máy Tiến (Ubuntu) → máy Windows

**Trên máy Windows, các bạn cần:**

1. **Enable SQL Server Authentication:**
   - SSMS → Connect to local SQL Server
   - Right-click server name → **Properties**
   - **Security** → Server authentication: **SQL Server and Windows Authentication mode**
   - Restart SQL Server

2. **Tạo user `sa` hoặc user mới:**
   ```sql
   -- Nếu chưa có user sa
   ALTER LOGIN sa ENABLE;
   ALTER LOGIN sa WITH PASSWORD = 'Tt12345@';
   
   -- Hoặc tạo user mới
   CREATE LOGIN repl_admin WITH PASSWORD = 'Tt12345@';
   ALTER SERVER ROLE sysadmin ADD MEMBER repl_admin;
   ```

3. **Tạo database QuanLyNhanSu (để nhận replication):**
   ```sql
   CREATE DATABASE QuanLyNhanSu;
   ```

**Từ máy Tiến, test kết nối:**
```bash
# Cài sqlcmd for Linux (nếu chưa có)
# (Đã cài rồi)

# Test kết nối đến máy Windows
sqlcmd -S 100.64.0.2 -U sa -P 'Tt12345@' -C -Q "SELECT @@VERSION;"
```
(Thay `100.64.0.2` bằng IP VPN của máy Windows)

---

## 📊 BƯỚC 4: LẬP BẢNG IP VPN

**Tạo file:** `DANH_SACH_MAY.md`

| Máy | Họ tên | OS | SQL Version | IP VPN | Vai trò | Chi nhánh |
|-----|--------|-----|-------------|--------|---------|-----------|
| 1 | Nguyễn Minh Tiến | Ubuntu 22.04 | SQL Server 2022 | 100.64.0.1 | **PUBLISHER** | Trụ sở HN |
| 2 | (Tên bạn 2) | Windows 10/11 | SQL Server 2019 | 100.64.0.2 | Subscriber | CN01 Huế |
| 3 | (Tên bạn 3) | Windows 10/11 | SQL Server 2019 | 100.64.0.3 | Subscriber | CN02 Nam Định |
| 4 | (Tên bạn 4) | Windows 10/11 | SQL Server 2019 | 100.64.0.4 | Subscriber | CN03 Vinh |
| 5 | (Tên bạn 5) | Windows 10/11 | SQL Server 2019 | 100.64.0.5 | Subscriber | CN04 Nha Trang |
| 6 | (Tên bạn 6) | Windows 10/11 | SQL Server 2019 | 100.64.0.6 | Subscriber | CN05 Thái Bình |

**Cách lấy IP VPN:**
- Ubuntu: `tailscale ip -4`
- Windows: `tailscale status` hoặc mở Tailscale app, xem IP

---

## 🔍 BƯỚC 5: TROUBLESHOOTING

### Lỗi 1: Không ping được giữa các máy
```bash
# Kiểm tra Tailscale có chạy không
tailscale status

# Nếu offline, khởi động lại
sudo tailscale up  # Ubuntu
# Hoặc Windows: restart Tailscale app
```

### Lỗi 2: Ping được nhưng không connect SQL Server
```bash
# Kiểm tra port 1433 có mở không
telnet 100.64.0.1 1433
# Hoặc trên Windows:
# Test-NetConnection -ComputerName 100.64.0.1 -Port 1433
```

### Lỗi 3: Login failed for user 'sa'
```sql
-- Trên máy Publisher (Tiến), enable remote connections
EXEC sys.sp_configure N'remote access', N'1';
RECONFIGURE WITH OVERRIDE;
GO

-- Enable sa login
ALTER LOGIN sa ENABLE;
ALTER LOGIN sa WITH PASSWORD = 'Tt12345@';
GO
```

### Lỗi 4: SQL Server không lắng nghe 0.0.0.0
```bash
# Ubuntu
sudo /opt/mssql/bin/mssql-conf set network.ipaddress 0.0.0.0
sudo systemctl restart mssql-server

# Windows: SQL Server Configuration Manager
# → SQL Server Network Configuration → Protocols for MSSQLSERVER
# → TCP/IP → Properties → IP Addresses
# → IPAll: TCP Port = 1433, TCP Dynamic Ports = (để trống)
# → Restart SQL Server service
```

---

## 📸 CHECKLIST SCREENSHOTS (Để chụp cho báo cáo)

- [ ] Tailscale status trên máy Tiến (Ubuntu)
- [ ] Tailscale status trên 1 máy Windows (của bạn trong nhóm)
- [ ] Ping từ máy Windows → máy Tiến (Ubuntu) thành công
- [ ] SSMS trên Windows connect được vào Ubuntu Publisher
- [ ] sqlcmd từ Ubuntu connect được vào Windows Subscriber
- [ ] Danh sách 6 máy trong Tailscale Admin Panel (https://login.tailscale.com/admin/machines)

---

## 🚀 BƯỚC TIẾP THEO

Sau khi VPN setup xong, chuyển sang:  
👉 **HUONG_DAN_REPLICATION.md** - Cấu hình Publisher và Subscriber

---

## 📞 HỖ TRỢ

**Nếu bạn trong nhóm gặp khó khăn:**
1. Chụp screenshot lỗi
2. Gửi vào group chat
3. Tiến sẽ remote hỗ trợ (qua Tailscale SSH hoặc TeamViewer)

**Thời gian ước tính:**
- Cài Tailscale: 5 phút/máy
- Test kết nối: 10 phút
- Troubleshooting: 15-30 phút
- **Tổng:** 1-2 giờ cho cả nhóm

---

**Người tạo:** Nguyễn Minh Tiến  
**Cập nhật:** 08/11/2025  
**Trạng thái:** Ready for deployment
