# HƯỚNG DẪN CHỤP SCREENSHOTS CHO BÁO CÁO

## 🎯 MỤC ĐÍCH
Tạo 40-50 screenshots chất lượng cao để đính kèm trong báo cáo Word/PowerPoint.

---

## 📋 CÔNG CỤ CHỤP ẢNH

### Ubuntu (Máy Tiến):
```bash
# Cài Flameshot (khuyến nghị)
sudo apt install -y flameshot

# Hoặc dùng Shutter
sudo apt install -y shutter

# Chụp: Nhấn PrtScn, chọn vùng, Ctrl+S lưu
```

### Windows (5 bạn):
- **Snipping Tool:** Win + Shift + S
- **ShareX:** https://getsharex.com/ (tự động đánh số ảnh)

---

## 📁 CẤU TRÚC THỨ MỤC SCREENSHOTS

```bash
mkdir -p ~/CSDLPT/screenshots/{vpn,database,triggers,procedures,replication,demo}
cd ~/CSDLPT/screenshots
```

**Cấu trúc:**
```
screenshots/
├── vpn/                    # 5 ảnh VPN
├── database/               # 10 ảnh Database schema
├── triggers/               # 7 ảnh Triggers
├── procedures/             # 10 ảnh Procedures
├── replication/            # 15 ảnh Replication
└── demo/                   # 5 ảnh Demo trước cô
```

---

## 📸 DANH SÁCH SCREENSHOTS CHI TIẾT

### 1️⃣ VPN & KẾT NỐI (5 ảnh)

#### Screenshot 1.1: Tailscale trên Ubuntu (Tiến)
```bash
tailscale status
```
**Chụp:** Terminal hiển thị 6 máy với IP VPN

**Filename:** `vpn/01_tailscale_ubuntu.png`

---

#### Screenshot 1.2: Tailscale trên Windows (1 bạn)
**Hướng dẫn bạn chụp:**
- Mở Command Prompt
- Gõ: `tailscale status`
- Chụp màn hình
- Gửi cho Tiến

**Filename:** `vpn/02_tailscale_windows.png`

---

#### Screenshot 1.3: Ping từ Windows → Ubuntu
**Hướng dẫn bạn chụp:**
```cmd
ping -n 5 100.64.0.1
```
**Chụp:** Kết quả ping thành công (0% loss)

**Filename:** `vpn/03_ping_windows_to_ubuntu.png`

---

#### Screenshot 1.4: Kết nối SSMS từ Windows → Ubuntu
**Hướng dẫn bạn chụp:**
- Mở SSMS
- Server name: `100.64.0.1`
- Login: `sa` / `Tt12345@`
- Chụp Object Explorer hiển thị database `QuanLyNhanSu`

**Filename:** `vpn/04_ssms_connect_ubuntu.png`

---

#### Screenshot 1.5: Tailscale Admin Panel
**Truy cập:** https://login.tailscale.com/admin/machines

**Chụp:** Danh sách 6 máy (tên máy, IP, trạng thái Online)

**Filename:** `vpn/05_tailscale_admin.png`

---

### 2️⃣ DATABASE SCHEMA (10 ảnh)

#### Screenshot 2.1: Danh sách 8 bảng
```sql
USE QuanLyNhanSu;
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE';
```

**Filename:** `database/01_tables_list.png`

---

#### Screenshot 2.2: Schema bảng NhanVien
```sql
EXEC sp_help 'NhanVien';
```

**Filename:** `database/02_schema_nhanvien.png`

---

#### Screenshot 2.3: Foreign Keys
```sql
SELECT 
    fk.name AS ForeignKey,
    tp.name AS ParentTable,
    cp.name AS ParentColumn,
    tr.name AS ReferencedTable,
    cr.name AS ReferencedColumn
FROM sys.foreign_keys fk
INNER JOIN sys.tables tp ON fk.parent_object_id = tp.object_id
INNER JOIN sys.tables tr ON fk.referenced_object_id = tr.object_id
INNER JOIN sys.foreign_key_columns fkc ON fk.object_id = fkc.constraint_object_id
INNER JOIN sys.columns cp ON fkc.parent_column_id = cp.column_id AND fkc.parent_object_id = cp.object_id
INNER JOIN sys.columns cr ON fkc.referenced_column_id = cr.column_id AND fkc.referenced_object_id = cr.object_id;
```

**Filename:** `database/03_foreign_keys.png`

---

#### Screenshot 2.4: Indexes
```sql
SELECT 
    t.name AS TableName,
    i.name AS IndexName,
    i.type_desc AS IndexType
FROM sys.indexes i
INNER JOIN sys.tables t ON i.object_id = t.object_id
WHERE t.name IN ('NhanVien', 'Luong', 'PhongBan')
ORDER BY t.name;
```

**Filename:** `database/04_indexes.png`

---

#### Screenshot 2.5: Views
```sql
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.VIEWS;
```

**Filename:** `database/05_views.png`

---

#### Screenshot 2.6: Stored Procedures
```sql
SELECT name FROM sys.procedures ORDER BY name;
```

**Filename:** `database/06_procedures_list.png`

---

#### Screenshot 2.7: Triggers
```sql
SELECT 
    t.name AS TriggerName,
    tbl.name AS TableName,
    t.is_instead_of_trigger AS IsInsteadOf
FROM sys.triggers t
INNER JOIN sys.tables tbl ON t.parent_id = tbl.object_id;
```

**Filename:** `database/07_triggers_list.png`

---

#### Screenshot 2.8: Dữ liệu mẫu - ChiNhanh
```sql
SELECT * FROM ChiNhanh;
```

**Filename:** `database/08_data_chinhanh.png`

---

#### Screenshot 2.9: Dữ liệu mẫu - NhanVien (10 dòng đầu)
```sql
SELECT TOP 10 * FROM NhanVien;
```

**Filename:** `database/09_data_nhanvien.png`

---

#### Screenshot 2.10: Tổng quan hệ thống
```sql
EXEC sp_BaoCaoTongQuan;
```

**Filename:** `database/10_bao_cao_tong_quan.png`

---

### 3️⃣ TRIGGERS (7 ảnh - mỗi trigger 1 test)

#### Screenshot 3.1: Trigger - Chặn nhân viên dưới 18 tuổi
```sql
BEGIN TRY
    INSERT INTO NhanVien (ID_NhanVien, ID_DuAn, ID_ChucVu, ID_ChiNhanh, ID_PhongBan, HoTen, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi)
    VALUES ('TEST01', 'DA001', 'CV01', 'CN01', 'PB001', 'Nguyễn Văn Test', '2015-01-01', 'Nam', 'Kinh', '099999999999', '0999999999', 'test@test.com', 'HN');
END TRY
BEGIN CATCH
    PRINT 'Lỗi: ' + ERROR_MESSAGE();
END CATCH
```

**Chụp:** Thông báo lỗi "Nhân viên phải từ 18 tuổi trở lên"

**Filename:** `triggers/01_reject_under_18.png`

---

#### Screenshot 3.2: Trigger - Chặn CCCD trùng
```sql
BEGIN TRY
    INSERT INTO NhanVien (ID_NhanVien, ID_DuAn, ID_ChucVu, ID_ChiNhanh, ID_PhongBan, HoTen, NgaySinh, GioiTinh, DanToc, CCCD, SoDienThoai, Email, DiaChi)
    VALUES ('TEST02', 'DA001', 'CV01', 'CN01', 'PB001', 'Test Trùng CCCD', '1990-01-01', 'Nam', 'Kinh', '001099123456', '0999999998', 'test2@test.com', 'HN');
END TRY
BEGIN CATCH
    PRINT 'Lỗi: ' + ERROR_MESSAGE();
END CATCH
```

**Chụp:** Thông báo lỗi "CCCD đã tồn tại"

**Filename:** `triggers/02_reject_duplicate_cccd.png`

---

#### Screenshot 3.3: Trigger - Chặn lương thấp hơn 3.25M
```sql
BEGIN TRY
    INSERT INTO Luong (ID_Luong, ID_NhanVien, MucLuong)
    VALUES ('LTEST', 'NV0001', 2000000);
END TRY
BEGIN CATCH
    PRINT 'Lỗi: ' + ERROR_MESSAGE();
END CATCH
```

**Chụp:** Thông báo lỗi "Mức lương phải >= 3,250,000 VNĐ"

**Filename:** `triggers/03_reject_low_salary.png`

---

#### Screenshot 3.4: Trigger - Ngăn giảm lương
```sql
-- Xem lương hiện tại của NV0001
SELECT MucLuong FROM Luong WHERE ID_NhanVien = 'NV0001';

-- Thử giảm lương
BEGIN TRY
    UPDATE Luong SET MucLuong = 10000000 WHERE ID_NhanVien = 'NV0001';
END TRY
BEGIN CATCH
    PRINT 'Lỗi: ' + ERROR_MESSAGE();
END CATCH
```

**Chụp:** Thông báo lỗi "Không được giảm lương"

**Filename:** `triggers/04_prevent_salary_reduction.png`

---

#### Screenshot 3.5: Trigger - Cho phép tăng lương
```sql
-- Lấy lương hiện tại
DECLARE @OldSalary INT;
SELECT @OldSalary = MucLuong FROM Luong WHERE ID_NhanVien = 'NV0001';

-- Tăng lương
UPDATE Luong SET MucLuong = @OldSalary + 5000000 WHERE ID_NhanVien = 'NV0001';

-- Kiểm tra
SELECT ID_NhanVien, MucLuong FROM Luong WHERE ID_NhanVien = 'NV0001';
```

**Chụp:** Lương tăng thành công

**Filename:** `triggers/05_allow_salary_increase.png`

---

#### Screenshot 3.6: Trigger - Validate ngày bắt đầu dự án
```sql
BEGIN TRY
    INSERT INTO DuAn (ID_DuAn, ID_PhongBan, TenDuAn, NgayBatDau, ThoiHan)
    VALUES ('DA999', 'PB001', 'Dự án test', '2020-01-01', 12);
END TRY
BEGIN CATCH
    PRINT 'Lỗi: ' + ERROR_MESSAGE();
END CATCH
```

**Chụp:** Thông báo lỗi "Ngày bắt đầu phải sau ngày hiện tại"

**Filename:** `triggers/06_validate_project_date.png`

---

#### Screenshot 3.7: Audit Log
```sql
-- Xem 10 bản ghi audit gần nhất
SELECT TOP 10 * FROM AuditLog ORDER BY ChangedAt DESC;
```

**Chụp:** Lịch sử thay đổi (INSERT, UPDATE, DELETE)

**Filename:** `triggers/07_audit_log.png`

---

### 4️⃣ STORED PROCEDURES (10 ảnh)

#### Screenshot 4.1: sp_ThongKeTheoChiNhanh
```sql
EXEC sp_ThongKeTheoChiNhanh;
```

**Chụp:** Thống kê 7 chi nhánh (40 NV/chi nhánh)

**Filename:** `procedures/01_thongke_chinhanh.png`

---

#### Screenshot 4.2: sp_BaoCaoTongQuan
```sql
EXEC sp_BaoCaoTongQuan;
```

**Chụp:** Tổng quan hệ thống (280 NV, ~13.2B VNĐ)

**Filename:** `procedures/02_bao_cao_tong_quan.png`

---

#### Screenshot 4.3: sp_TopNhanVienLuongCao
```sql
EXEC sp_TopNhanVienLuongCao @TopN=10;
```

**Chụp:** 10 nhân viên lương cao nhất

**Filename:** `procedures/03_top_nhan_vien_luong_cao.png`

---

#### Screenshot 4.4: sp_TongLuongTheoPhongBan
```sql
EXEC sp_TongLuongTheoPhongBan;
```

**Chụp:** Tổng lương từng phòng ban

**Filename:** `procedures/04_tong_luong_phongban.png`

---

#### Screenshot 4.5: sp_ThongKeNhanVienTheoPhongBan
```sql
EXEC sp_ThongKeNhanVienTheoPhongBan;
```

**Chụp:** Số lượng nhân viên mỗi phòng

**Filename:** `procedures/05_thongke_nhanvien_phongban.png`

---

#### Screenshot 4.6: sp_ThongKeNhanVienTheoDoTuoi
```sql
EXEC sp_ThongKeNhanVienTheoDoTuoi;
```

**Chụp:** Thống kê theo độ tuổi (18-25, 26-35, ...)

**Filename:** `procedures/06_thongke_do_tuoi.png`

---

#### Screenshot 4.7: sp_ThongKeDuAnTheoPhongBan
```sql
EXEC sp_ThongKeDuAnTheoPhongBan;
```

**Chụp:** Số dự án mỗi phòng ban

**Filename:** `procedures/07_thongke_duan.png`

---

#### Screenshot 4.8: sp_TimKiemNhanVien
```sql
EXEC sp_TimKiemNhanVien @TuKhoa='Nguyen';
```

**Chụp:** Kết quả tìm kiếm nhân viên

**Filename:** `procedures/08_tim_kiem_nhanvien.png`

---

#### Screenshot 4.9: sp_XemChiTietNhanVien
```sql
EXEC sp_XemChiTietNhanVien @ID_NhanVien='NV0001';
```

**Chụp:** 3 result sets (thông tin cá nhân, công việc, lương)

**Filename:** `procedures/09_chi_tiet_nhanvien.png`

---

#### Screenshot 4.10: Test BIGINT overflow fix
```sql
-- Chứng minh không còn overflow
SELECT 
    'Tổng lương' AS Loai,
    SUM(CAST(MucLuong AS BIGINT)) AS GiaTri,
    'VNĐ' AS DonVi
FROM Luong;
```

**Chụp:** Tổng lương 13,183,290,609 VNĐ (không overflow)

**Filename:** `procedures/10_bigint_fix.png`

---

### 5️⃣ REPLICATION (15 ảnh)

#### Screenshot 5.1: Distributor configuration
```sql
SELECT * FROM sys.servers WHERE is_distributor = 1;
```

**Filename:** `replication/01_distributor_config.png`

---

#### Screenshot 5.2: Publications
```sql
USE QuanLyNhanSu;
SELECT name, description FROM syspublications;
```

**Filename:** `replication/02_publications.png`

---

#### Screenshot 5.3: Publication articles
```sql
SELECT publication_id, article, destination_object 
FROM sysarticles 
WHERE publication_id = (SELECT pubid FROM syspublications WHERE name = 'Pub_ChinhSach');
```

**Filename:** `replication/03_articles.png`

---

#### Screenshot 5.4: Subscriptions
```sql
SELECT 
    p.publication,
    s.subscriber_server,
    s.subscriber_db,
    s.status
FROM syspublications p
INNER JOIN syssubscriptions s ON p.pubid = s.pubid;
```

**Filename:** `replication/04_subscriptions.png`

---

#### Screenshot 5.5: Snapshot Agent job
```sql
SELECT 
    name AS JobName,
    enabled,
    date_created
FROM msdb.dbo.sysjobs
WHERE name LIKE '%Pub_ChinhSach%Snapshot%';
```

**Filename:** `replication/05_snapshot_agent.png`

---

#### Screenshot 5.6: Distribution Agents
```sql
SELECT 
    name AS JobName,
    enabled,
    date_created
FROM msdb.dbo.sysjobs
WHERE name LIKE '%Pub_ChinhSach%' AND name LIKE '%Distribution%';
```

**Filename:** `replication/06_distribution_agents.png`

---

#### Screenshot 5.7: Snapshot folder (Ubuntu)
```bash
ls -lh /var/opt/mssql/data/ReplData/
```

**Filename:** `replication/07_snapshot_folder.png`

---

#### Screenshot 5.8: Publisher - Số lượng chính sách
```sql
USE QuanLyNhanSu;
SELECT COUNT(*) AS TongChinhSach FROM ChinhSach;
```

**Chụp:** 70 chính sách

**Filename:** `replication/08_publisher_count.png`

---

#### Screenshot 5.9: Subscriber 1 - Số lượng chính sách (Windows)
**Hướng dẫn bạn chụp trên SSMS:**
```sql
USE QuanLyNhanSu;
SELECT COUNT(*) AS TongChinhSach FROM ChinhSach;
```

**Chụp:** Cũng 70 chính sách (đồng bộ thành công)

**Filename:** `replication/09_subscriber1_count.png`

---

#### Screenshot 5.10: Test INSERT trên Publisher
```sql
USE QuanLyNhanSu;

INSERT INTO ChinhSach (ID_ChinhSach, ID_ChiNhanh, TenChinhSach, NoiDung, NgayApDung)
VALUES ('CS999', 'CN01', 'Test Replication', 'Kiểm tra đồng bộ', GETDATE());

SELECT * FROM ChinhSach WHERE ID_ChinhSach = 'CS999';
```

**Chụp:** Record mới được INSERT

**Filename:** `replication/10_publisher_insert.png`

---

#### Screenshot 5.11: Verify trên Subscriber (sau 5 phút)
**Hướng dẫn bạn chụp:**
```sql
USE QuanLyNhanSu;
SELECT * FROM ChinhSach WHERE ID_ChinhSach = 'CS999';
```

**Chụp:** Record CS999 đã được đồng bộ

**Filename:** `replication/11_subscriber_synced.png`

---

#### Screenshot 5.12: Replication Monitor (nếu có SSMS trên Windows)
**Hướng dẫn:**
- Connect SSMS đến Publisher (100.64.0.1)
- Replication → Launch Replication Monitor
- Chụp overview của Pub_ChinhSach

**Filename:** `replication/12_replication_monitor.png`

---

#### Screenshot 5.13: Agent history
```sql
USE distribution;

SELECT TOP 5
    agent_id,
    runstatus,
    comments,
    time
FROM MSdistribution_history
ORDER BY time DESC;
```

**Filename:** `replication/13_agent_history.png`

---

#### Screenshot 5.14: Test UPDATE trên Publisher
```sql
UPDATE ChinhSach 
SET NoiDung = 'Đã update để test replication'
WHERE ID_ChinhSach = 'CS999';

SELECT * FROM ChinhSach WHERE ID_ChinhSach = 'CS999';
```

**Filename:** `replication/14_publisher_update.png`

---

#### Screenshot 5.15: Verify UPDATE trên Subscriber
**Hướng dẫn bạn chụp:**
```sql
SELECT * FROM ChinhSach WHERE ID_ChinhSach = 'CS999';
```

**Chụp:** NoiDung đã được update

**Filename:** `replication/15_subscriber_update_synced.png`

---

### 6️⃣ DEMO TRƯỚC CÔ (5 ảnh)

#### Screenshot 6.1: Script demo chạy tự động
**File:** `Demo_Presentation.sql` (đã tạo trong HUONG_DAN_LAM_TIEP.md)

**Chụp:** Output của script demo

**Filename:** `demo/01_demo_script_output.png`

---

#### Screenshot 6.2: Fragmentation - Nhân viên theo chi nhánh
```sql
SELECT 
    cn.TenChiNhanh,
    COUNT(nv.ID_NhanVien) AS SoNhanVien
FROM ChiNhanh cn
LEFT JOIN NhanVien nv ON cn.ID_ChiNhanh = nv.ID_ChiNhanh
GROUP BY cn.TenChiNhanh
ORDER BY cn.TenChiNhanh;
```

**Chụp:** Mỗi chi nhánh đều có 40 nhân viên

**Filename:** `demo/02_fragmentation_proof.png`

---

#### Screenshot 6.3: Replication - Chính sách được nhân bản
```sql
SELECT 
    cn.TenChiNhanh,
    COUNT(cs.ID_ChinhSach) AS SoChinhSach
FROM ChiNhanh cn
LEFT JOIN ChinhSach cs ON cn.ID_ChiNhanh = cs.ID_ChiNhanh
GROUP BY cn.TenChiNhanh;
```

**Chụp:** Mỗi chi nhánh có 10 chính sách

**Filename:** `demo/03_replication_proof.png`

---

#### Screenshot 6.4: ER Diagram (vẽ tay hoặc dùng tool)
**Tool khuyến nghị:**
- DBeaver (Ubuntu): Connect vào SQL Server, Generate ER Diagram
- dbdiagram.io (Web): Vẽ online

**Filename:** `demo/04_er_diagram.png`

---

#### Screenshot 6.5: Architecture diagram
**Vẽ:**
- 1 máy Ubuntu (Publisher)
- 5 máy Windows (Subscribers)
- Mũi tên từ Publisher → Subscribers
- VPN network (Tailscale)

**Tool:** draw.io, PowerPoint, hoặc vẽ tay chụp lại

**Filename:** `demo/05_architecture.png`

---

## 🎨 TIÊU CHUẨN CHẤT LƯỢNG SCREENSHOTS

### ✅ Nên:
- Độ phân giải cao (ít nhất 1920x1080)
- Font size lớn, dễ đọc
- Highlight/khoanh vùng thông tin quan trọng
- Đặt tên file theo quy tắc (01_xxx.png, 02_xxx.png)
- Lưu định dạng PNG (không JPEG vì mờ chữ)

### ❌ Không nên:
- Chụp bằng điện thoại (chụp màn hình máy tính)
- Để thông tin nhạy cảm (password, IP công khai)
- Chụp nhiễu, mờ, nhòe
- Chụp cả desktop (chỉ chụp terminal/SSMS window)

---

## 📦 SCRIPT TỰ ĐỘNG CHẠY QUERY VÀ LƯU KẾT QUẢ

**File:** `Auto_Screenshots.sql`

```sql
-- Tạo thư mục output
:!! mkdir -p /home/tien/CSDLPT/screenshots/auto_output

-- Query 1: Bảng danh sách
:OUT /home/tien/CSDLPT/screenshots/auto_output/01_tables.txt
USE QuanLyNhanSu;
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE';
GO

-- Query 2: Báo cáo tổng quan
:OUT /home/tien/CSDLPT/screenshots/auto_output/02_bao_cao.txt
EXEC sp_BaoCaoTongQuan;
GO

-- Query 3: Thống kê chi nhánh
:OUT /home/tien/CSDLPT/screenshots/auto_output/03_chinhanh.txt
EXEC sp_ThongKeTheoChiNhanh;
GO

-- ... (thêm các query khác)

:OUT stdout
PRINT 'Hoàn thành! Xem kết quả trong screenshots/auto_output/';
GO
```

**Chạy:**
```bash
sqlcmd -S localhost -U sa -P 'Tt12345@' -C -i Auto_Screenshots.sql
```

**Sau đó chụp các file .txt này.**

---

## 📋 CHECKLIST TỔNG HỢP

### VPN (5 ảnh):
- [ ] vpn/01_tailscale_ubuntu.png
- [ ] vpn/02_tailscale_windows.png
- [ ] vpn/03_ping_windows_to_ubuntu.png
- [ ] vpn/04_ssms_connect_ubuntu.png
- [ ] vpn/05_tailscale_admin.png

### Database (10 ảnh):
- [ ] database/01_tables_list.png
- [ ] database/02_schema_nhanvien.png
- [ ] database/03_foreign_keys.png
- [ ] database/04_indexes.png
- [ ] database/05_views.png
- [ ] database/06_procedures_list.png
- [ ] database/07_triggers_list.png
- [ ] database/08_data_chinhanh.png
- [ ] database/09_data_nhanvien.png
- [ ] database/10_bao_cao_tong_quan.png

### Triggers (7 ảnh):
- [ ] triggers/01_reject_under_18.png
- [ ] triggers/02_reject_duplicate_cccd.png
- [ ] triggers/03_reject_low_salary.png
- [ ] triggers/04_prevent_salary_reduction.png
- [ ] triggers/05_allow_salary_increase.png
- [ ] triggers/06_validate_project_date.png
- [ ] triggers/07_audit_log.png

### Procedures (10 ảnh):
- [ ] procedures/01_thongke_chinhanh.png
- [ ] procedures/02_bao_cao_tong_quan.png
- [ ] procedures/03_top_nhan_vien_luong_cao.png
- [ ] procedures/04_tong_luong_phongban.png
- [ ] procedures/05_thongke_nhanvien_phongban.png
- [ ] procedures/06_thongke_do_tuoi.png
- [ ] procedures/07_thongke_duan.png
- [ ] procedures/08_tim_kiem_nhanvien.png
- [ ] procedures/09_chi_tiet_nhanvien.png
- [ ] procedures/10_bigint_fix.png

### Replication (15 ảnh):
- [ ] replication/01_distributor_config.png
- [ ] replication/02_publications.png
- [ ] replication/03_articles.png
- [ ] replication/04_subscriptions.png
- [ ] replication/05_snapshot_agent.png
- [ ] replication/06_distribution_agents.png
- [ ] replication/07_snapshot_folder.png
- [ ] replication/08_publisher_count.png
- [ ] replication/09_subscriber1_count.png
- [ ] replication/10_publisher_insert.png
- [ ] replication/11_subscriber_synced.png
- [ ] replication/12_replication_monitor.png
- [ ] replication/13_agent_history.png
- [ ] replication/14_publisher_update.png
- [ ] replication/15_subscriber_update_synced.png

### Demo (5 ảnh):
- [ ] demo/01_demo_script_output.png
- [ ] demo/02_fragmentation_proof.png
- [ ] demo/03_replication_proof.png
- [ ] demo/04_er_diagram.png
- [ ] demo/05_architecture.png

**TỔNG: 47 screenshots**

---

## 🚀 BƯỚC TIẾP THEO

1. **Chụp screenshots:** 2-3 giờ
2. **Chỉnh sửa ảnh:** Add text, highlight, crop → 1 giờ
3. **Chèn vào báo cáo Word:** 1 giờ
4. **Review và hoàn thiện:** 30 phút

**Tổng thời gian:** 4-5 giờ

---

**Người tạo:** Nguyễn Minh Tiến  
**Cập nhật:** 08/11/2025  
**Trạng thái:** Ready for capture
