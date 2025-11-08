# TIẾN ĐỘ DỰ ÁN - NHÓM 5 CSDLPT

## 📊 TỔNG QUAN DỰ ÁN

**Đề tài:** Quản lý nhân viên công ty đa chi nhánh  
**Nhóm:** 6 thành viên  
**Hệ điều hành:**
- 1 Ubuntu (Nguyễn Minh Tiến - Nhóm trưởng)
- 5 Windows (các thành viên còn lại)

---

## ✅ ĐÃ HOÀN THÀNH (45% - LÀM MỘT MÌNH ĐƯỢC)

### 1. Database Schema & Data ✅
- [x] Tạo 8 bảng: TruSoChinh, ChiNhanh, PhongBan, DuAn, ChucVu, NhanVien, Luong, ChinhSach
- [x] Foreign keys đầy đủ
- [x] Dữ liệu mẫu: **7 chi nhánh, 280 nhân viên, 70 phòng ban, 70 dự án**
- [x] Phân mảnh ngang: Mỗi chi nhánh 40 nhân viên, 10 phòng ban
- [x] Nhân bản: Mỗi chi nhánh 10 chính sách

**Files:**
- `HR.sql` - Schema
- `HR-Data.sql` - 280 nhân viên, 70 phòng ban
- `generate_data.py` - Script tự động tạo dữ liệu

---

### 2. Triggers (7 triggers) ✅
- [x] `trg_NhanVien_InsertUpdate` - Validate tuổi ≥18, CCCD/Email/SĐT unique
- [x] `trg_NhanVien_Delete` - Cascade delete Luong
- [x] `trg_Luong_ValidateMinSalary` - Lương ≥3,250,000 VNĐ
- [x] `trg_Luong_PreventSalaryReduction` - Ngăn giảm lương
- [x] `trg_DuAn_ValidateStartDate` - Validate thời hạn dự án 1-1825 ngày
- [x] `trg_ChiNhanh_UniqueEmail` - Email chi nhánh unique
- [x] `trg_NhanVien_Audit` - Ghi log INSERT/UPDATE/DELETE vào AuditLog

**Files:**
- `Triggers.sql` - Đã test thành công

---

### 3. Stored Procedures (9 procedures) ✅
- [x] `sp_BaoCaoTongQuan` - Tổng quan hệ thống (7 CN, 280 NV, ~13.2 tỷ lương)
- [x] `sp_ThongKeNhanVienTheoPhongBan` - Thống kê nhân viên/phòng ban
- [x] `sp_ThongKeNhanVienTheoDoTuoi` - Thống kê theo độ tuổi (18-25, 26-35,...)
- [x] `sp_TongLuongTheoPhongBan` - Tổng/trung bình/min/max lương
- [x] `sp_TopNhanVienLuongCao` - Top N nhân viên lương cao
- [x] `sp_ThongKeDuAnTheoPhongBan` - Thống kê dự án
- [x] `sp_TimKiemNhanVien` - Tìm kiếm theo tên/email/CCCD/SĐT
- [x] `sp_XemChiTietNhanVien` - Chi tiết nhân viên (thông tin + lương + dự án)
- [x] `sp_ThongKeTheoChiNhanh` - Thống kê per chi nhánh (QUAN TRỌNG cho demo)

**Files:**
- `Procedures.sql` - Đã fix overflow BIGINT
- `Test_Triggers_Procedures.sql` - Test suite đầy đủ

---

### 4. Documentation ✅
- [x] `BAO_VE_CSDLPT.md` - File bảo vệ chi tiết (nhu cầu, vị trí, dữ liệu, đối tượng)
- [x] `TOM_TAT_7_CHI_NHANH.md` - Tóm tắt cập nhật 7 chi nhánh
- [x] `bai_lam.txt` - Bài làm đầy đủ phần 1-2

---

## ⏳ ĐANG CHỜ NHÓM (55% - CẦN 6 MÁY THẬT)

### 5. VPN - Kết nối các máy (15%) ⏳
**Cần:**
- 6 máy (1 Ubuntu + 5 Windows) kết nối mạng ảo
- Mỗi máy có IP private riêng
- Test ping thành công giữa các máy
- Mở port 1433 (SQL Server)

**Công cụ đề xuất:** Tailscale (miễn phí, dễ setup)

**Chưa làm vì:** Cần 5 bạn trong nhóm online cùng lúc

---

### 6. SQL Server Replication (30%) ⏳
**Cần:**
- Cài SQL Server trên 6 máy
- Máy Ubuntu (Nguyễn Minh Tiến): Publisher (Hà Nội)
- 5 máy Windows: Subscribers (7 chi nhánh)
- Cấu hình:
  - Distributor tại máy Ubuntu
  - Publication: ChinhSach (nhân bản)
  - 5 Subscriptions: push đến 5 máy

**Chưa làm vì:** Cần VPN hoàn thành trước

---

### 7. Test & Screenshots (10%) ⏳
**Cần chụp:**
- VPN: ping giữa các máy
- Replication: Publication/Subscription status
- Test đồng bộ: INSERT tại Publisher → tự động xuất hiện ở Subscriber
- Triggers: Chặn CCCD trùng, lương < 3.25M
- Procedures: Báo cáo theo chi nhánh
- Audit log: Lịch sử thay đổi

**Chưa làm vì:** Cần VPN + Replication hoàn thành

---

## 🎯 ĐÁNH GIÁ THEO YÊU CẦU CỦA CÔ

### Phần đã làm (theo yeu_cau.txt):

#### A. Bài tập thực hành
1. ✅ **Viết tài liệu**
   - ✅ Đặt vấn đề (nhu cầu, sơ lược, vị trí, đối tượng)
   - ✅ Phân tích (chức năng, phân quyền, tần suất truy cập)
   - ✅ Thiết kế CSDL (diagram, phân mảnh, nhân bản, đồng bộ)
   
2. ⏳ **Cài đặt vật lý**
   - ✅ 3.3. Cài SQL Server (đã cài trên Ubuntu)
   - ✅ 3.4. Kiểm tra Agent (đã test tạo job thành công)
   - ⏳ 3.1. VPN (chưa - cần nhóm)
   - ⏳ 3.2. Link Server (chưa - cần VPN)
   - ⏳ 3.5. Tạo Publication (chưa - cần VPN)
   - ⏳ 3.6. Test giao dịch (chưa - cần Replication)

3. ✅ **Triggers & Procedures**
   - ✅ Viết 7 triggers bảo vệ dữ liệu
   - ✅ Viết 9 procedures thống kê
   - ✅ Test đầy đủ

---

## 💡 KẾT LUẬN

### Công việc đã làm tốt:
- ✅ Database design chuẩn (phân mảnh ngang, nhân bản)
- ✅ Triggers đầy đủ (validation, cascade, audit)
- ✅ Procedures đa dạng (CRUD, report, search)
- ✅ Documentation chi tiết (sẵn sàng bảo vệ)
- ✅ Test script hoàn chỉnh

### Điểm yếu:
- ⏳ Chưa có VPN → chưa test multi-machine
- ⏳ Chưa có Replication → chưa demo đồng bộ thực tế
- ⏳ Chưa có screenshots → báo cáo chưa đầy đủ hình ảnh

### Rủi ro:
- ⚠️ Nếu không setup VPN + Replication, chỉ demo được trên 1 máy
- ⚠️ Cô có thể hỏi: "Làm sao biết dữ liệu đồng bộ giữa các máy?"
- ⚠️ Thiếu screenshots thực tế về replication

### Giải pháp:
1. **Ngắn hạn (1-2 ngày):**
   - Làm theo file `HUONG_DAN_LAM_TIEP.md` (chỉ cần 1 máy)
   - Tạo thêm views, indexes, phân quyền user
   - Chụp screenshots procedures/triggers

2. **Trung hạn (3-5 ngày):**
   - Họp nhóm, setup VPN (Tailscale)
   - Mỗi người cài SQL Server
   - Test kết nối giữa các máy

3. **Dài hạn (1 tuần):**
   - Setup Replication đầy đủ
   - Test đồng bộ
   - Chụp screenshots cho báo cáo

---

**Cập nhật:** 06/11/2025  
**Người đánh giá:** Nguyễn Minh Tiến - Nhóm trưởng
