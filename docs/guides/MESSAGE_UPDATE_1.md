# 📢 CẬP NHẬT - Các Bạn Đang Ở Survey Screen

## ✅ Bước Tiếp Theo:

**BỎ QUA** màn hình survey đó! Không cần điền form.

**Làm thế nào:**
- Click nút **"Next"** hoặc **"Skip"** ở góc dưới
- Hoặc đóng cửa sổ survey lại
- Chỉ cần **đăng nhập thành công** là được

---

## 📋 Sau Khi Bỏ Qua Survey:

### 1. Kiểm Tra VPN IP
Mở **Command Prompt (CMD)** gõ:
```cmd
tailscale status
```

**Kết quả mong đợi:**
- Thấy IP dạng `100.x.x.x` (ví dụ: `100.74.240.106`)
- **COPY IP này gửi vào group ngay!**

---

### 2. Mở Port 1433 Trên Windows Firewall

**Bước 1: Mở Windows Firewall**
- Nhấn `Windows + R`
- Gõ: `wf.msc`
- Enter

**Bước 2: Tạo Inbound Rule**
1. Click **"Inbound Rules"** (bên trái)
2. Click **"New Rule..."** (bên phải)
3. Chọn **"Port"** → Next
4. Chọn **"TCP"**, gõ port: `1433` → Next
5. Chọn **"Allow the connection"** → Next
6. Check tất cả: Domain, Private, Public → Next
7. Name: `SQL Server 1433` → Finish

**Screenshot 1:** Chụp màn hình Firewall rules (sau khi tạo xong)

---

### 3. Enable SQL Authentication

**Mở SSMS → Kết nối vào máy local:**
- Server: `localhost`
- Authentication: **Windows Authentication**
- Click Connect

**Chạy các lệnh này:**
```sql
-- Enable SQL Server Authentication mode
USE master;
GO

ALTER LOGIN sa ENABLE;
GO

ALTER LOGIN sa WITH PASSWORD = 'Tt12345@';
GO

-- Check xem đã enable chưa
SELECT name, is_disabled FROM sys.sql_logins WHERE name = 'sa';
GO
```

**Kết quả:** `is_disabled` phải = `0`

---

### 4. Restart SQL Server Service

**Cách 1: Qua Services**
- Nhấn `Windows + R`
- Gõ: `services.msc`
- Tìm **"SQL Server (MSSQLSERVER)"**
- Right-click → **Restart**

**Cách 2: Qua CMD (Admin)**
```cmd
net stop MSSQLSERVER
net start MSSQLSERVER
```

---

### 5. Test Kết Nối Tới Publisher (Máy Tiến)

**Mở SSMS → New Connection:**
- Server: `100.74.240.106` (IP VPN của Tiến)
- Authentication: **SQL Server Authentication**
- Login: `sa`
- Password: `Tt12345@`
- Click **"Options..."** → Connection Properties
- ✅ Check **"Trust server certificate"**
- Click Connect

**Sau khi kết nối thành công, chạy:**
```sql
USE QuanLyNhanSu;
GO

SELECT * FROM ChiNhanh;
GO
```

**Kết quả:** Phải thấy 7 chi nhánh

**Screenshot 2:** Chụp SSMS connected tới `100.74.240.106`  
**Screenshot 3:** Chụp kết quả query `SELECT * FROM ChiNhanh`

---

## 📸 Tổng Kết Screenshots Cần Gửi:

1. **CMD:** `tailscale status` (có IP)
2. **Windows Firewall:** Inbound Rules (có rule 1433)
3. **SSMS:** Connected tới `100.74.240.106`
4. **SSMS:** Kết quả query 7 chi nhánh

---

## ⏰ Deadline: 21:00 Tối Nay

Gửi vào group:
- ✅ VPN IP của bạn
- ✅ 4 screenshots
- ✅ Confirm "Done!" khi xong hết

---

## 🆘 Nếu Gặp Lỗi:

### "Cannot connect to 100.74.240.106"
→ Check:
1. Tailscale có đang chạy không? (icon tray phải màu xanh)
2. Ping thử: `ping 100.74.240.106` trong CMD
3. Port 1433 đã mở chưa? (check lại Firewall)

### "Login failed for user 'sa'"
→ Check:
1. Đã restart SQL Server chưa?
2. Password đúng `Tt12345@` chưa?
3. Đã ENABLE sa login chưa?

---

**Chúc các bạn setup thành công! 🎉**
