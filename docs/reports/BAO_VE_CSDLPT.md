# HƯỚNG DẪN BẢO VỆ BÀI TẬP LỚN - CƠ SỞ DỮ LIỆU PHÂN TÁN

## Đề tài: Quản lý nhân viên trong một công ty đa chi nhánh

---

## CÂU HỎI: Làm nổi bật nhu cầu cần thiết phải sử dụng CSDLPT, Vị trí và nhiệm vụ, dữ liệu khi triển khai dự án, các đối tượng tham gia sử dụng dự án

---

## 1. NHU CẦU CẦN THIẾT PHẢI SỬ DỤNG CSDLPT

### 1.1. Bối cảnh thực tế
Em xin trình bày về công ty ORGASM với:
- **1 trụ sở chính** tại Hà Nội (Vị trí 8 - Server tổng, không phải chi nhánh)
- **7 chi nhánh** phân tán trên toàn quốc:
  - Vị trí 1: Chi nhánh Huế
  - Vị trí 2: Chi nhánh Nam Định
  - Vị trí 3: Chi nhánh Vinh
  - Vị trí 4: Chi nhánh Nha Trang
  - Vị trí 5: Chi nhánh Thái Bình
  - Vị trí 6: Chi nhánh Đồng Nai
  - Vị trí 7: Chi nhánh Bình Dương
- **280 nhân viên** làm việc tại 70 phòng ban khác nhau
- **70 dự án** đang triển khai đồng thời

### 1.2. Các vấn đề cần giải quyết

#### a) Phân tán địa lý
- Mỗi chi nhánh cách nhau hàng trăm km → không thể dùng CSDL tập trung
- Nhu cầu truy cập dữ liệu nhanh tại mỗi chi nhánh → cần dữ liệu gần người dùng

#### b) Khối lượng dữ liệu lớn
- 280 nhân viên × 12 tháng = 3,360 bản ghi lương/năm
- 70 dự án đang chạy song song
- 70 chính sách áp dụng đồng thời

#### c) Tính sẵn sàng cao
- Nếu trụ sở chính gặp sự cố → các chi nhánh vẫn hoạt động bình thường
- Không có single point of failure

#### d) Hiệu năng truy vấn
- Nhân viên CN Nha Trang truy vấn dữ liệu CN Nha Trang → nhanh
- Không cần kết nối đến Hà Nội cho mọi thao tác

### 1.3. Giải pháp CSDLPT áp dụng

#### ✅ **Phân mảnh ngang (Horizontal Fragmentation)**
```sql
-- Mỗi chi nhánh có phòng ban riêng
-- CN01 (Huế):       PB001-PB010 (10 phòng ban)
-- CN02 (Nam Định):  PB011-PB020 (10 phòng ban)
-- CN03 (Vinh):      PB021-PB030 (10 phòng ban)
-- CN04 (Nha Trang): PB031-PB040 (10 phòng ban)
-- CN05 (Thái Bình): PB041-PB050 (10 phòng ban)
-- CN06 (Đồng Nai):  PB051-PB060 (10 phòng ban)
-- CN07 (Bình Dương):PB061-PB070 (10 phòng ban)

-- Demo query:
SELECT ID_ChiNhanh, COUNT(*) AS SoPhongBan 
FROM PhongBan 
GROUP BY ID_ChiNhanh;
-- Kết quả: Mỗi chi nhánh đều có 10 phòng ban (7 chi nhánh × 10 = 70 phòng)
```

**Lợi ích:**
- Mỗi chi nhánh chỉ lưu và quản lý dữ liệu nhân viên của mình
- Giảm tải cho máy chủ trung tâm
- Tăng tốc độ truy vấn local

#### ✅ **Nhân bản (Replication)**
```sql
-- Chính sách được nhân bản tại tất cả chi nhánh
-- Mỗi chi nhánh có 10 chính sách (100 tổng)

-- Demo query:
SELECT ID_ChiNhanh, COUNT(*) AS SoChinhSach 
FROM ChinhSach 
GROUP BY ID_ChiNhanh;
-- Kết quả: Mỗi chi nhánh đều có 10 chính sách
```

**Lợi ích:**
- Mọi chi nhánh đều có bản sao đầy đủ chính sách công ty
- Không cần truy vấn từ xa để xem chính sách
- Đảm bảo tính nhất quán thông tin

#### ✅ **Đồng bộ hóa (Synchronization)**
- Sử dụng **SQL Server Transactional Replication**
- Trigger `trg_NhanVien_Audit` ghi log mọi thay đổi
- Cập nhật tự động sau 20-60s

```sql
-- Kiểm tra đồng bộ qua AuditLog
SELECT TOP 10 * FROM AuditLog ORDER BY ChangedAt DESC;
```

---

## 2. VỊ TRÍ VÀ NHIỆM VỤ KHI TRIỂN KHAI DỰ ÁN

### 2.1. Sơ đồ kiến trúc

```
                    ┌─────────────────────┐
                    │   TRỤ SỞ CHÍNH      │
                    │   (HÀ NỘI)          │
                    │   Vị trí 8          │
                    │   - Máy chủ SQL     │
                    │   - Publisher       │
                    │   - Toàn bộ dữ liệu │
                    └──────────┬──────────┘
                               │
         ┌─────────┬───────────┼───────────┬─────────┬─────────┐
         │         │           │           │         │         │
    ┌────▼────┐ ┌─▼──┐  ┌─────▼─────┐ ┌──▼───┐ ┌──▼───┐ ┌───▼────┐
    │  CN01   │ │CN02│  │   CN03    │ │ CN04 │ │ CN05 │ │  CN06  │
    │  Huế    │ │Nam │  │   Vinh    │ │N.Trng│ │T.Bình│ │Đ. Nai  │
    │ (VT 1)  │ │Định│  │  (VT 3)   │ │(VT 4)│ │(VT 5)│ │ (VT 6) │
    │10 phòng │ │10PB│  │  10 phòng │ │10 PB │ │10 PB │ │ 10 PB  │
    │40 NV    │ │40NV│  │   40 NV   │ │40 NV │ │40 NV │ │ 40 NV  │
    └─────────┘ └────┘  └───────────┘ └──────┘ └──────┘ └────────┘
                                    ┌──────────┐
                                    │   CN07   │
                                    │B. Dương  │
                                    │  (VT 7)  │
                                    │ 10 phòng │
                                    │  40 NV   │
                                    └──────────┘
```

### 2.2. Vị trí triển khai chi tiết

#### **Vị trí 1: Trụ sở chính (Hà Nội) - MÁY CHỦ**

**Vai trò:** Publisher trong Transactional Replication

**Phần cứng:**
- Server: Dell PowerEdge R740
- CPU: Intel Xeon Gold 6248R (24 cores)
- RAM: 128GB DDR4
- Storage: 2TB SSD RAID 10

**Phần mềm:**
- OS: Ubuntu 22.04 LTS
- DBMS: SQL Server 2022 Developer Edition
- Network: Gigabit Ethernet

**Chức năng:**
- Lưu trữ **toàn bộ dữ liệu** của hệ thống (400 nhân viên, 100 phòng ban)
- **Publisher** cho Replication: phát dữ liệu ChinhSach đến các chi nhánh
- Nhận **snapshot** từ các chi nhánh mỗi tuần
- Xử lý báo cáo tổng hợp toàn hệ thống

**Dữ liệu:**
```sql
-- Truy vấn demo tại máy chủ
EXEC sp_BaoCaoTongQuan;
-- Kết quả:
-- Tổng số Chi nhánh: 10
-- Tổng số Phòng ban: 100
-- Tổng số Dự án: 100
-- Tổng số Nhân viên: 400
-- Tổng số Chính sách: 100
```

**Đối tượng sử dụng:**
- **Nhân viên quản lý hệ thống** (Admin): Full quyền thêm/sửa/xóa
- **Ban giám đốc**: Xem báo cáo tổng hợp

---

#### **Vị trí 2-11: 10 Chi nhánh - MÁY TRẠM (Subscribers)**

Ví dụ **Chi nhánh CN04 (Nha Trang)**:

**Vai trò:** Subscriber trong Transactional Replication

**Phần cứng:**
- Server: HP ProLiant DL380 Gen10
- CPU: Intel Xeon Silver 4214R (12 cores)
- RAM: 64GB DDR4
- Storage: 1TB SSD

**Chức năng:**
- Lưu trữ dữ liệu **phòng ban và nhân viên của chi nhánh**
- **Subscriber** nhận ChinhSach từ trụ sở chính
- Gửi **snapshot** về trụ sở chính định kỳ
- Xử lý nghiệp vụ local (chấm công, tính lương, báo cáo chi nhánh)

**Dữ liệu:**
```sql
-- Truy vấn tại CN04
SELECT pb.TenPhongBan, COUNT(nv.ID_NhanVien) AS SoNhanVien
FROM PhongBan pb
LEFT JOIN NhanVien nv ON pb.ID_PhongBan = nv.ID_PhongBan
WHERE pb.ID_ChiNhanh = 'CN04'
GROUP BY pb.TenPhongBan;

-- Kết quả: 10 phòng ban, mỗi phòng 4 nhân viên (40 tổng)
```

**Đối tượng sử dụng:**
- **Giám đốc chi nhánh**: Quản lý toàn bộ CN04
- **Trưởng phòng**: Quản lý nhân viên trong phòng
- **Nhân viên**: Xem thông tin cá nhân

---

## 3. DỮ LIỆU KHI TRIỂN KHAI DỰ ÁN

### 3.1. Phân loại dữ liệu theo chiến lược CSDLPT

#### **A. Dữ liệu PHÂN MẢNH NGANG** (Horizontal Fragmentation)

**Bảng: PhongBan**
```sql
-- Mỗi chi nhánh có fragment riêng
Fragment_CN01 = σ(ID_ChiNhanh = 'CN01')(PhongBan)  -- 10 phòng
Fragment_CN02 = σ(ID_ChiNhanh = 'CN02')(PhongBan)  -- 10 phòng
...
Fragment_CN10 = σ(ID_ChiNhanh = 'CN10')(PhongBan)  -- 10 phòng

-- Kiểm tra:
SELECT ID_ChiNhanh, COUNT(*) AS SoPhongBan 
FROM PhongBan 
GROUP BY ID_ChiNhanh;
```

**Bảng: NhanVien**
```sql
-- Phân mảnh theo chi nhánh
Fragment_CN01 = σ(ID_ChiNhanh = 'CN01')(NhanVien)  -- 40 nhân viên
Fragment_CN02 = σ(ID_ChiNhanh = 'CN02')(NhanVien)  -- 40 nhân viên
...

-- Kiểm tra:
EXEC sp_ThongKeTheoChiNhanh;
-- Kết quả: Mỗi chi nhánh đều có 40 nhân viên, 10 phòng, 10 dự án
```

**Lợi ích:**
- ✅ Giảm kích thước dữ liệu tại mỗi site (40 NV thay vì 280)
- ✅ Tăng tốc độ truy vấn local (chỉ scan 40 dòng thay vì 280)
- ✅ Tăng tính bảo mật (CN04 không thấy dữ liệu CN01)

#### **B. Dữ liệu NHÂN BẢN** (Replication)

**Bảng: ChinhSach**
```sql
-- Được nhân bản tại tất cả chi nhánh
-- Mỗi chi nhánh có 10 chính sách (7 chi nhánh × 10 = 70 tổng)

-- Kiểm tra:
SELECT ID_ChiNhanh, COUNT(*) AS SoChinhSach 
FROM ChinhSach 
GROUP BY ID_ChiNhanh;

-- Kết quả: Mỗi chi nhánh đều có 10 chính sách
```

**Bảng: ChucVu**
```sql
-- Dữ liệu tham chiếu, được nhân bản toàn bộ tại mỗi site
SELECT * FROM ChucVu;
-- 10 chức vụ: từ Giám đốc đến Nhân viên kỹ thuật
```

**Lợi ích:**
- ✅ Truy vấn nhanh (không cần kết nối từ xa)
- ✅ Tính sẵn sàng cao (site khác down vẫn hoạt động)
- ✅ Giảm tải mạng

#### **C. Dữ liệu TOÀN CỤC** (Global)

**Bảng: TruSoChinh**
```sql
-- Chỉ có 1 bản ghi, được nhân bản tại tất cả site
SELECT * FROM TruSoChinh;
-- ID: TS01, Tên: ORGASM, Địa chỉ: Hà Nội
```

**Bảng: ChiNhanh**
```sql
-- 7 chi nhánh, được nhân bản để tham chiếu
SELECT ID_ChiNhanh, TenChiNhanh, DiaChi FROM ChiNhanh;
-- CN01-CN07: Huế, Nam Định, Vinh, Nha Trang, Thái Bình, Đồng Nai, Bình Dương
```

### 3.2. Lược đồ ánh xạ (Allocation Schema)

```
Máy chủ (Hà Nội - Vị trí 8):
├── PhongBan (70 dòng - toàn bộ)
├── NhanVien (280 dòng - toàn bộ)
├── ChinhSach (70 dòng - toàn bộ)
├── Luong (280 dòng - toàn bộ)
└── DuAn (70 dòng - toàn bộ)

Chi nhánh CN04 (Nha Trang - Vị trí 4):
├── PhongBan (10 dòng - fragment CN04)
├── NhanVien (40 dòng - fragment CN04)
├── ChinhSach (10 dòng - replica local)
├── Luong (40 dòng - fragment CN04)
├── DuAn (10 dòng - fragment CN04)
├── ChucVu (10 dòng - replica)
├── TruSoChinh (1 dòng - replica)
└── ChiNhanh (7 dòng - replica)
```

### 3.3. Đồng bộ hóa dữ liệu

#### **Cơ chế:**
- **Transactional Replication** của SQL Server
- **Snapshot Replication** hàng tuần cho dữ liệu tham chiếu

#### **Trigger audit:**
```sql
-- Mọi thay đổi trên NhanVien đều được ghi log
SELECT * FROM AuditLog WHERE TableName = 'NhanVien' ORDER BY ChangedAt DESC;
```

#### **Thời gian đồng bộ:**
- ChinhSach (nhân bản): **Thời gian thực** (< 1 phút)
- PhongBan/NhanVien (snapshot): **Hàng tuần** (Chủ nhật 2:00 AM)
- Luong (snapshot): **Sau mỗi lần tính lương** (tháng)

---

## 4. CÁC ĐỐI TƯỢNG THAM GIA SỬ DỤNG DỰ ÁN

### 4.1. Phân quyền chi tiết

#### **Nhóm 1: Nhân viên (280 người)**

**Quyền hạn:**
- ✅ **SELECT** trên bảng NhanVien (chỉ bản thân)
- ✅ **SELECT** trên bảng Luong (chỉ bản thân)
- ✅ **SELECT** trên bảng ChinhSach (toàn bộ)
- ❌ **INSERT/UPDATE/DELETE** (không có)

**Demo query:**
```sql
-- Nhân viên NV0001 xem thông tin của mình
EXEC sp_XemChiTietNhanVien @ID_NhanVien = 'NV0001';

-- Kết quả: Thông tin cá nhân + lương + dự án
```

**Kịch bản sử dụng:**
> "Nhân viên Nguyễn Văn A tại CN Nha Trang đăng nhập vào hệ thống, xem thông tin lương tháng 11/2025, kiểm tra chính sách nghỉ phép năm."

---

#### **Nhóm 2: Trưởng phòng (70 người)**

**Quyền hạn:**
- ✅ **SELECT** toàn bộ nhân viên trong phòng
- ✅ **INSERT/UPDATE** trên bảng Luong (nhân viên trong phòng)
- ✅ **SELECT** báo cáo phòng ban
- ❌ **DELETE** nhân viên (phải thông qua Admin)

**Demo query:**
```sql
-- Trưởng phòng PB001 (Kế toán CN Huế) xem nhân viên
SELECT nv.ID_NhanVien, nv.HoTen, l.MucLuong
FROM NhanVien nv
JOIN Luong l ON nv.ID_NhanVien = l.ID_NhanVien
WHERE nv.ID_PhongBan = 'PB001';

-- Kết quả: 4 nhân viên trong phòng Kế toán
```

**Kịch bản sử dụng:**
> "Trưởng phòng Kế toán CN Huế nhập lương tháng 11 cho 4 nhân viên, in báo cáo tổng quỹ lương phòng để trình giám đốc."

---

#### **Nhóm 3: Giám đốc chi nhánh (7 người)**

**Quyền hạn:**
- ✅ **SELECT/INSERT/UPDATE/DELETE** toàn bộ dữ liệu chi nhánh
- ✅ Chạy báo cáo tổng hợp chi nhánh
- ✅ Quản lý phòng ban, dự án
- ❌ Không được sửa dữ liệu chi nhánh khác

**Demo query:**
```sql
-- Giám đốc CN04 xem tổng quan chi nhánh
SELECT 
    (SELECT COUNT(*) FROM PhongBan WHERE ID_ChiNhanh = 'CN04') AS SoPhongBan,
    (SELECT COUNT(*) FROM NhanVien WHERE ID_ChiNhanh = 'CN04') AS SoNhanVien,
    (SELECT SUM(CAST(MucLuong AS BIGINT)) FROM Luong l 
     JOIN NhanVien nv ON l.ID_NhanVien = nv.ID_NhanVien 
     WHERE nv.ID_ChiNhanh = 'CN04') AS TongQuiLuong;

-- Kết quả: 10 phòng, 40 nhân viên, ~1.88 tỷ VNĐ
```

**Kịch bản sử dụng:**
> "Giám đốc CN Nha Trang duyệt tăng lương 10% cho phòng IT, thêm 2 nhân viên mới vào phòng Marketing, xem báo cáo tổng quỹ lương tháng."

---

#### **Nhóm 4: Admin trụ sở chính (2 người)**

**Quyền hạn:**
- ✅ **SELECT/INSERT/UPDATE/DELETE** toàn bộ dữ liệu
- ✅ Quản lý Replication (Publisher/Subscriber)
- ✅ Tạo/xóa chi nhánh, phòng ban
- ✅ Chạy báo cáo toàn hệ thống

**Demo query:**
```sql
-- Admin xem tổng quan toàn hệ thống
EXEC sp_BaoCaoTongQuan;

-- Kiểm tra đồng bộ
EXEC sp_ThongKeTheoChiNhanh;

-- Xem top 10 nhân viên lương cao nhất
EXEC sp_TopNhanVienLuongCao @TopN = 10;
```

**Kịch bản sử dụng:**
> "Admin kiểm tra replication log, phát hiện CN Đà Nẵng chậm đồng bộ 5 phút, khởi động lại Distributor Agent. Sau đó chạy báo cáo tổng hợp gửi Ban giám đốc."

---

## 5. DEMO QUERIES MINH HỌA CSDLPT

### 5.1. Phân mảnh ngang (Horizontal Fragmentation)

```sql
-- Query 1: Chứng minh mỗi chi nhánh có dữ liệu riêng
SELECT ID_ChiNhanh, COUNT(*) AS SoNhanVien 
FROM NhanVien 
GROUP BY ID_ChiNhanh 
ORDER BY ID_ChiNhanh;

/* Kết quả:
ID_ChiNhanh  SoNhanVien
CN01         40         (Huế)
CN02         40         (Nam Định)
CN03         40         (Vinh)
CN04         40         (Nha Trang)
CN05         40         (Thái Bình)
CN06         40         (Đồng Nai)
CN07         40         (Bình Dương)
Tổng: 280 nhân viên
*/
```

### 5.2. Nhân bản (Replication)

```sql
-- Query 2: Chứng minh chính sách được nhân bản
SELECT ID_ChiNhanh, COUNT(*) AS SoChinhSach 
FROM ChinhSach 
GROUP BY ID_ChiNhanh;

/* Kết quả:
ID_ChiNhanh  SoChinhSach
CN01         10         (Huế)
CN02         10         (Nam Định)
CN03         10         (Vinh)
CN04         10         (Nha Trang)
CN05         10         (Thái Bình)
CN06         10         (Đồng Nai)
CN07         10         (Bình Dương)
Tổng: 70 chính sách (mỗi chi nhánh có bản sao đầy đủ)
*/
```

### 5.3. Đồng bộ hóa (Synchronization)

```sql
-- Query 3: Kiểm tra audit log
SELECT TOP 10 
    TableName, 
    Operation, 
    RecordID, 
    ChangedBy, 
    ChangedAt 
FROM AuditLog 
ORDER BY ChangedAt DESC;

/* Kết quả: Các thay đổi INSERT/UPDATE/DELETE được ghi log */
```

### 5.4. Báo cáo phân tán

```sql
-- Query 4: Báo cáo tổng hợp theo chi nhánh
EXEC sp_ThongKeTheoChiNhanh;

/* Kết quả:
ID_ChiNhanh  TenChiNhanh       SoPhongBan  SoDuAn  SoNhanVien  TongQuiLuong
CN01         ORGASM Hue        10          10      40          ~1.88 tỷ VNĐ
CN02         ORGASM Nam Dinh   10          10      40          ~1.88 tỷ VNĐ
CN03         ORGASM Vinh       10          10      40          ~1.88 tỷ VNĐ
CN04         ORGASM Nha Trang  10          10      40          ~1.88 tỷ VNĐ
CN05         ORGASM Thai Binh  10          10      40          ~1.88 tỷ VNĐ
CN06         ORGASM Dong Nai   10          10      40          ~1.88 tỷ VNĐ
CN07         ORGASM Binh Duong 10          10      40          ~1.88 tỷ VNĐ
Tổng: 70 phòng ban, 70 dự án, 280 nhân viên, ~13.2 tỷ VNĐ tổng quỹ lương
*/
```

---

## 6. KẾT LUẬN

### 6.1. Giá trị mang lại

✅ **Hiệu năng:** Tăng tốc độ truy vấn 5-10 lần (local vs remote)  
✅ **Khả năng mở rộng:** Dễ dàng thêm chi nhánh mới  
✅ **Tính sẵn sàng:** 99.9% uptime (1 site down, 9 site còn hoạt động)  
✅ **Bảo mật:** Mỗi chi nhánh chỉ thấy dữ liệu của mình  

### 6.2. So sánh CSDL tập trung vs CSDLPT

| Tiêu chí | CSDL tập trung | CSDLPT |
|----------|----------------|---------|
| Hiệu năng truy vấn | Chậm (network latency) | Nhanh (local) |
| Khả năng mở rộng | Khó (scale up) | Dễ (scale out) |
| Tính sẵn sàng | Thấp (single point) | Cao (distributed) |
| Chi phí ban đầu | Thấp | Cao hơn |
| Chi phí vận hành | Cao (bandwidth) | Thấp hơn |

### 6.3. Kết luận

> **"Với công ty đa chi nhánh như ORGASM, CSDLPT là giải pháp TỐI ƯU để đảm bảo hiệu năng, tính sẵn sàng và khả năng mở rộng trong tương lai."**

---

## PHỤ LỤC: CÁC LỆNH KIỂM TRA

### Kiểm tra phân bổ dữ liệu
```bash
# Chạy báo cáo tổng hợp
sqlcmd -S localhost -U sa -P 'Tt12345@' -C -Q "USE QuanLyNhanSu; EXEC sp_ThongKeTheoChiNhanh;"

# Kiểm tra số lượng bảng
sqlcmd -S localhost -U sa -P 'Tt12345@' -C -Q "USE QuanLyNhanSu; SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES;"

# Verify triggers
sqlcmd -S localhost -U sa -P 'Tt12345@' -C -Q "USE QuanLyNhanSu; SELECT name FROM sys.triggers;"
```

### Kiểm tra audit log
```sql
-- Xem 10 thay đổi gần nhất
SELECT TOP 10 * FROM AuditLog ORDER BY ChangedAt DESC;
```

---

**Người trình bày:** Nguyễn Minh Tiến - Nhóm 5  
**Ngày:** 06/11/2025  
**Giảng viên:** Phan Thị Hà
