# 📋 DANH SÁCH IP VPN - NHÓM 5

**Cập nhật:** 08/11/2025

---

## 🌐 THÔNG TIN MẠNG VPN

| Máy | Họ tên | Vai trò | IP VPN | Trạng thái | Ghi chú |
|-----|--------|---------|--------|-----------|---------|
| **1** | **Nguyễn Minh Tiến** | **PUBLISHER** (Trụ sở HN) | **100.71.73.74** | ✅ **Online** | Ubuntu 22.04, SQL Server 2022 |
| 2 | desktop-171avqp | SUBSCRIBER (CN01 Huế) | **100.74.133.70** | ✅ **Online** | Windows, SQL Server (checking...) |
| 3 | msi | SUBSCRIBER (CN02 Nam Định) | **100.100.210.39** | ✅ **Online** | Windows, SQL Server (checking...) |
| 4 | (Tên bạn 4) | SUBSCRIBER (CN03 Vinh) | (Đợi bạn gửi) | ⏳ Chưa setup | Windows, SQL Server 2019 |
| 5 | (Tên bạn 5) | SUBSCRIBER (CN04 Nha Trang) | (Đợi bạn gửi) | ⏳ Chưa setup | Windows, SQL Server 2019 |
| 6 | (Tên bạn 6) | SUBSCRIBER (CN05 Thái Bình) | (Đợi bạn gửi) | ⏳ Chưa setup | Windows, SQL Server 2019 |

---

## ✅ CHECKLIST SETUP

### Máy Tiến (Publisher):
- [x] Cài Tailscale ✅
- [x] IP VPN: **100.71.73.74** ✅
- [x] SQL Server running ✅
- [x] Port 1433 mở ✅
- [x] Database QuanLyNhanSu có 7 chi nhánh, 280 nhân viên ✅
- [x] **3/6 máy đã online!** ✅
- [ ] Đợi 3 bạn còn lại setup

### 5 bạn (Subscribers):
- [ ] Cài SQL Server 2019 Developer
- [ ] Cài SSMS
- [ ] Cài Tailscale (đăng nhập **CÙNG TÀI KHOẢN** với Tiến)
- [ ] Mở port 1433
- [ ] Enable SQL Authentication (sa/Tt12345@)
- [ ] Test connect vào 100.74.240.106

---

## 🔗 HƯỚNG DẪN CHO 5 BẠN

### Bước 1: Cài Tailscale
1. Download: https://tailscale.com/download/windows
2. Install → Log in
3. **⚠️ QUAN TRỌNG:** Đăng nhập tài khoản **BeBest111@** (hỏi Tiến tài khoản)
4. Sau khi đăng nhập, chạy `tailscale status` để lấy IP VPN
5. Gửi IP VPN cho Tiến

### Bước 2: Test kết nối
Mở SSMS:
- Server name: **100.71.73.74**
- Authentication: SQL Server Authentication
- Login: **sa**
- Password: **Tt12345@**
- Click Connect

Nếu thành công → Sẽ thấy database `QuanLyNhanSu` ✅

---

## 📸 YÊU CẦU SCREENSHOTS

Mỗi người chụp và gửi vào group:
1. **Tailscale status** (Command Prompt: `tailscale status`)
2. **SSMS connect thành công** vào 100.74.240.106
3. **Query test:** `USE QuanLyNhanSu; SELECT * FROM ChiNhanh;`

---

## 🚨 TROUBLESHOOTING

### Lỗi: "Cannot connect to 100.71.73.74"
**Giải pháp:**
1. Kiểm tra Tailscale đang chạy (cả 2 máy)
2. Ping test: `ping 100.71.73.74`
3. Test port: `Test-NetConnection -ComputerName 100.71.73.74 -Port 1433`

### Lỗi: "Login failed for user 'sa'"
**Giải pháp:**
1. Kiểm tra password: `Tt12345@` (có @ ở cuối)
2. Enable sa login trên máy Windows:
   ```sql
   ALTER LOGIN sa ENABLE;
   ALTER LOGIN sa WITH PASSWORD = 'Tt12345@';
   ```

---

**Cập nhật lần cuối:** 08/11/2025 - Tiến  
**Trạng thái:** Đang chờ 5 bạn setup (deadline: 21h hôm nay)
