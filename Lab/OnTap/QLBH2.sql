USE master
GO
CREATE DATABASE QLBH2
GO
USE QLBH2
GO
-- Tạo bảng hàng hoá
CREATE TABLE HANGHOA(
	MaHH VARCHAR(10) PRIMARY KEY,
	TenHH NVARCHAR(50) NULL,
	DonGia VARCHAR(20) NULL
)
GO
insert into HANGHOA values('H001',N'Chuột laptop','34000')
insert into HANGHOA values('H002',N'Bàn phím','20000')
insert into HANGHOA values('H003',N'Loa','15000')
insert into HANGHOA values('H004',N'Màn hình','230000')
insert into HANGHOA values('H005',N'Tai nghe','70000')
insert into HANGHOA values('H006',N'Tản nhiệt','3000')
insert into HANGHOA values('H007',N'Cục sạc','42000')
GO
-- Tạo bảng nhân viên
CREATE TABLE NHANVIEN(
	MaNV VARCHAR(10) PRIMARY KEY,
	TenNV NVARCHAR(50) NULL
)
GO
insert into NHANVIEN values('NV01',N'Huỳnh Quyên')
insert into NHANVIEN values('NV02',N'Hoàng Duy')
insert into NHANVIEN values('NV03',N'Tiến Phúc')
insert into NHANVIEN values('NV04',N'Quốc Đạt')
insert into NHANVIEN values('NV05',N'Thu Hà')
GO
-- Tạo bảng hoá đơn
CREATE TABLE HOADON(
	MaHD VARCHAR(10) PRIMARY KEY,
	NgayHD DATE NULL,
	MaNV VARCHAR(10) REFERENCES NHANVIEN(MaNV)
)
GO
insert into HOADON values('HD01','2016-05-12','NV04')
insert into HOADON values('HD02','2016-02-10','NV02')
insert into HOADON values('HD03','2016-12-15','NV01')
insert into HOADON values('HD04','2016-07-11','NV03')
insert into HOADON values('HD05','2016-10-12','NV05')
insert into HOADON values('HD06','2016-09-25','NV04')
insert into HOADON values('HD07','2016-03-10','NV05')
insert into HOADON values('HD08','2016-02-10','NV03')
insert into HOADON values('HD09','2016-03-10','NV05')
insert into HOADON values('HD10','2016-10-12','NV01')
GO
-- Tạo bảng chi tiết hoá đơn
CREATE TABLE CTHD(
	PRIMARY KEY(MaHD,MaHH),
	MaHD VARCHAR(10) REFERENCES HOADON(MaHD),
	MaHH VARCHAR(10) REFERENCES HANGHOA(MaHH),
	SoLuong INT NULL
)
GO
insert into CTHD values('HD01','H005',30)
insert into CTHD values('HD02','H004',50)
insert into CTHD values('HD03','H001',70)
insert into CTHD values('HD04','H001',5)
insert into CTHD values('HD05','H002',10)
insert into CTHD values('HD06','H004',20)
insert into CTHD values('HD07','H003',80)
insert into CTHD values('HD08','H005',40)
insert into CTHD values('HD09','H002',30)
insert into CTHD values('HD10','H003',20)

--- TRUY VẤN DỮ LIỆU
--a. Cho biết các loại hàng có đơn giá trên 40000
SELECT TenHH, DonGia FROM HANGHOA
WHERE DonGia > '40000'

--b. Cho biết các hóa đơn do nhân viên Thu Hà lập trong tháng 03/ 2016
SELECT TenNV, MaHD, NgayHD FROM HOADON
INNER JOIN NHANVIEN ON NHANVIEN.MaNV = HOADON.MaNV
WHERE NgayHD like '2016-03-%'

--c. Cho biết các hóa đơn được lập trong tháng 10 năm 2016 có số lượng lớn hơn 50.
SELECT CTHD.MaHD, NgayHD FROM HOADON
INNER JOIN CTHD ON CTHD.MaHD = HOADON.MaHD
WHERE NgayHD like '2016-10-%'
AND SoLuong > 50

--d. Cho biết mã số, tên của các nhân viên phụ trách các hóa đơn bán mặt hàng Sữa


--e. Cho biết mã số, tên của các hàng hóa bán trong ngày 10/02/2016.


--f. Cho biết các mặt hàng chưa từng được bán.


--g. Cho biết tổng số hóa đơn đã được lập theo từng nhân viên.


--h. Liệt kê đơn giá trung bình của tất cả các mặt hàng.


--i. Cho biết mã hóa đơn (MaHD) đã mua tất cả các mặt hàng.


--j. Thống kê tổng số hóa đơn đã được lập trong tháng 10/2016.
