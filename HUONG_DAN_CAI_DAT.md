# HƯỚNG DẪN CÀI ĐẶT VÀ THỰC HIỆN BÀI TẬP LỚN CSDL PHÂN TÁN

## 📋 THÔNG TIN HỆ THỐNG ĐÃ CÀI ĐẶT

- **Hệ điều hành**: Ubuntu 22.04 LTS
- **SQL Server**: Version 2022 (RTM-CU21) Developer Edition
- **Username**: sa
- **Password**: Tt12345@
- **Port**: 1433

---

## ✅ BƯỚC 1: CÀI ĐẶT SQL SERVER (ĐÃ HOÀN THÀNH)

### 1.1. Thêm Repository Microsoft
```bash
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo curl https://packages.microsoft.com/config/ubuntu/22.04/mssql-server-2022.list -o /etc/apt/sources.list.d/mssql-server-2022.list
sudo apt update
```

### 1.2. Cài đặt SQL Server
```bash
sudo apt install -y mssql-server
```

### 1.3. Cấu hình SQL Server
```bash
sudo MSSQL_SA_PASSWORD='Tt12345@' MSSQL_PID='Developer' /opt/mssql/bin/mssql-conf -n setup accept-eula
```

### 1.4. Kiểm tra trạng thái
```bash
sudo systemctl status mssql-server
```

---

## ✅ BƯỚC 2: CÀI ĐẶT SQL TOOLS (ĐÃ HOÀN THÀNH)

### 2.1. Thêm Repository
```bash
curl https://packages.microsoft.com/config/ubuntu/22.04/prod.list | sudo tee /etc/apt/sources.list.d/mssql-release.list
sudo apt update
```

### 2.2. Cài đặt mssql-tools18
```bash
sudo ACCEPT_EULA=Y apt install -y mssql-tools18 unixodbc-dev
```

### 2.3. Thêm vào PATH
```bash
echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bashrc
source ~/.bashrc
```

### 2.4. Test kết nối
```bash
sqlcmd -S localhost -U sa -P 'Tt12345@' -C -Q "SELECT @@VERSION"
```

---

## ✅ BƯỚC 3: TẠO DATABASE VÀ IMPORT DỮ LIỆU (ĐÃ HOÀN THÀNH)

### 3.1. Tạo Database và Schema
```bash
sqlcmd -S localhost -U sa -P 'Tt12345@' -C -i /home/tien/CSDLPT/HR.sql
```

**Kết quả**: Đã tạo 8 bảng:
- TruSoChinh
- ChiNhanh
- ChinhSach
- PhongBan
- DuAn
- ChucVu
- NhanVien
- Luong

### 3.2. Import Dữ liệu
```bash
sqlcmd -S localhost -U sa -P 'Tt12345@' -C -d QuanLyNhanSu -i /home/tien/CSDLPT/HR-Data.sql
```

**Kết quả**: Đã import:
- 1 Trụ sở chính
- 10 Chi nhánh
- 10 Chính sách
- 10 Phòng ban
- 10 Dự án
- 10 Chức vụ
- 40 Nhân viên
- 40 Bảng lương

---

## 🔄 BƯỚC 4: CẤU HÌNH SQL SERVER AGENT (TIẾP THEO)

SQL Server Agent cần thiết cho Replication. Trên Linux, cần enable thủ công:

```bash
# Kiểm tra trạng thái
sudo /opt/mssql/bin/mssql-conf get sqlagent

# Enable SQL Server Agent
sudo /opt/mssql/bin/mssql-conf set sqlagent.enabled true

# Restart SQL Server
sudo systemctl restart mssql-server

# Kiểm tra lại
sqlcmd -S localhost -U sa -P 'Tt12345@' -C -Q "SELECT @@SERVICENAME, SERVERPROPERTY('IsAgentEnabled')"
```

---

## 🌐 BƯỚC 5: THIẾT LẬP VPN CHO NHIỀU MÁY (CHỜ CÁC THÀNH VIÊN NHÓM)

### Phương án A: Tailscale (Khuyên dùng - Đơn giản nhất)

**Trên máy chủ (máy bạn):**
```bash
# Cài đặt Tailscale
curl -fsSL https://tailscale.com/install.sh | sh

# Khởi động Tailscale
sudo tailscale up

# Lấy IP Tailscale
tailscale ip -4
```

**Trên các máy trạm (máy bạn bè):**
- Cài đặt Tailscale tương tự
- Join vào cùng mạng Tailscale
- Mỗi máy sẽ có 1 IP riêng trong dải 100.x.x.x

**Ưu điểm:**
- ✅ Dễ cài đặt nhất
- ✅ Tự động NAT traversal
- ✅ Miễn phí cho 100 devices
- ✅ Hoạt động qua internet

### Phương án B: WireGuard (Phức tạp hơn)

**Chỉ dùng nếu muốn control hoàn toàn:**
```bash
sudo apt install wireguard
# Cấu hình phức tạp - sẽ hướng dẫn chi tiết nếu cần
```

---

## 🔗 BƯỚC 6: CẤU HÌNH FIREWALL

Mở port 1433 để các máy khác kết nối:

```bash
# Kiểm tra firewall
sudo ufw status

# Nếu đang active, mở port 1433
sudo ufw allow 1433/tcp

# Hoặc tắt firewall tạm thời (chỉ dùng trong lab)
sudo ufw disable
```

---

## 📊 BƯỚC 7: CẤU HÌNH REPLICATION

### 7.1. Configure Distribution (Trên máy chủ)

```sql
-- Kết nối vào SQL Server
sqlcmd -S localhost -U sa -P 'Tt12345@' -C

-- Chạy các lệnh sau:
USE master;
GO

-- Enable Distribution
EXEC sp_adddistributor @distributor = N'localhost', @password = N'Tt12345@';
GO

-- Create Distribution Database
EXEC sp_adddistributiondb 
    @database = N'distribution',
    @data_folder = N'/var/opt/mssql/data',
    @log_folder = N'/var/opt/mssql/data',
    @security_mode = 1;
GO

-- Add Distribution Publisher
EXEC sp_adddistpublisher 
    @publisher = N'localhost',
    @distribution_db = N'distribution',
    @security_mode = 1,
    @working_directory = N'/var/opt/mssql/ReplData';
GO
```

### 7.2. Tạo thư mục cho Replication

```bash
sudo mkdir -p /var/opt/mssql/ReplData
sudo chown mssql:mssql /var/opt/mssql/ReplData
sudo chmod 755 /var/opt/mssql/ReplData
```

### 7.3. Tạo Publication

```sql
USE QuanLyNhanSu;
GO

-- Tạo Publication cho Transactional Replication
EXEC sp_replicationdboption 
    @dbname = N'QuanLyNhanSu',
    @optname = N'publish',
    @value = N'true';
GO

-- Thêm Transactional Publication
EXEC sp_addpublication 
    @publication = N'PubQuanLyNhanSu',
    @description = N'Publication cho database Quan Ly Nhan Su',
    @sync_method = N'concurrent',
    @retention = 0,
    @allow_push = N'true',
    @allow_pull = N'true',
    @allow_anonymous = N'false',
    @enabled_for_internet = N'false',
    @snapshot_in_defaultfolder = N'true',
    @compress_snapshot = N'false',
    @replicate_ddl = 1;
GO

-- Thêm các bảng vào Publication
EXEC sp_addarticle 
    @publication = N'PubQuanLyNhanSu',
    @article = N'NhanVien',
    @source_owner = N'dbo',
    @source_object = N'NhanVien',
    @type = N'logbased',
    @description = N'',
    @creation_script = N'',
    @pre_creation_cmd = N'drop',
    @schema_option = 0x000000000803509F;
GO

-- Lặp lại cho các bảng khác: ChiNhanh, PhongBan, DuAn, ChucVu, Luong
```

---

## 📝 BƯỚC 8: TẠO TRIGGERS VÀ PROCEDURES (TIẾP THEO)

Các triggers và procedures đã có trong file bài làm. Sẽ chạy sau khi setup xong replication.

---

## 🧪 BƯỚC 9: TEST HỆ THỐNG

### 9.1. Kiểm tra kết nối từ xa

Từ máy bạn bè:
```bash
sqlcmd -S <IP_MÁY_BẠN> -U sa -P 'Tt12345@' -C -Q "SELECT @@VERSION"
```

### 9.2. Test Insert Data

```sql
-- Insert test
INSERT INTO NhanVien VALUES (...);

-- Kiểm tra đồng bộ trên máy subscriber
```

### 9.3. Test Triggers

```sql
-- Thử update nhân viên
UPDATE NhanVien SET HoTen = 'Test' WHERE ID_NhanVien = 'NTNV01';

-- Kiểm tra trigger có chặn không
```

---

## 📸 BƯỚC 10: CHỤP SCREENSHOTS CHO BÁO CÁO

Cần chụp các màn hình sau:

1. ✅ SQL Server version
2. ✅ Database và tables đã tạo
3. ✅ Dữ liệu đã import
4. ⏳ SQL Server Agent enabled
5. ⏳ VPN configuration
6. ⏳ Distribution configuration
7. ⏳ Publication created
8. ⏳ Subscription setup
9. ⏳ Test replication
10. ⏳ Triggers working

---

## 📌 GHI CHÚ QUAN TRỌNG

### Sự khác biệt giữa Windows và Linux:

| Tính năng | Windows | Linux (Hiện tại) |
|-----------|---------|------------------|
| GUI Management | SSMS có giao diện | Chỉ có command line |
| Radmin VPN | Có | Thay bằng Tailscale |
| SQL Server Agent | Tự động | Cần enable thủ công |
| Replication | GUI wizard | Chỉ có T-SQL |
| Firewall | Windows Defender | UFW |

### Điểm mạnh của phương án Linux:

- ✅ Giống môi trường production thực tế
- ✅ Hiểu sâu hơn về cách hoạt động của SQL Server
- ✅ Học được cả Linux administration
- ✅ Có thể giải thích cho cô về sự khác biệt

---

## 🆘 TROUBLESHOOTING

### Lỗi: Cannot connect to SQL Server
```bash
# Kiểm tra SQL Server đang chạy
sudo systemctl status mssql-server

# Restart nếu cần
sudo systemctl restart mssql-server

# Kiểm tra log
sudo tail -100 /var/opt/mssql/log/errorlog
```

### Lỗi: Port 1433 already in use
```bash
# Tìm process đang dùng
sudo ss -tlnp | grep 1433

# Kill Docker containers nếu cần
docker stop $(docker ps -q)
```

### Lỗi: Permission denied
```bash
# Check ownership
ls -la /var/opt/mssql/

# Fix ownership
sudo chown -R mssql:mssql /var/opt/mssql/
```

---

## 📚 TÀI LIỆU THAM KHẢO

- [SQL Server on Linux Documentation](https://docs.microsoft.com/en-us/sql/linux/)
- [SQL Server Replication](https://docs.microsoft.com/en-us/sql/relational-databases/replication/)
- [Tailscale Documentation](https://tailscale.com/kb/)

---

**Cập nhật lần cuối**: 5/11/2025  
**Người thực hiện**: Nguyễn Minh Tiến  
**Nhóm**: Nhóm 5 - D22VHCN04-B
