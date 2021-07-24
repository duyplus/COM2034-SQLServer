USE master
GO
CREATE DATABASE QLBH
GO
USE QLBH
GO
-- Tạo bảng hàng hoá
CREATE TABLE HANGHOA(
	MaHG VARCHAR(10) PRIMARY KEY,
	TenHG NVARCHAR(50) NULL,
	DVT NVARCHAR(20) NULL,
	DonGia VARCHAR(20) NULL,
	CoHang BIT NULL
)
GO
insert into HANGHOA values('H001',N'Bút chì',N'Cây','3000',1)
insert into HANGHOA values('H002',N'Bút chì',N'Hộp','30000',0)
insert into HANGHOA values('H003',N'Bút bi',N'Cây','7000',1)
insert into HANGHOA values('H004',N'Tập 100 giấy mỏng',N'Quyển','15000',0)
insert into HANGHOA values('H005',N'Tập 100 giấy tốt',N'Quyển','20000',1)
insert into HANGHOA values('H006',N'Bút lông',N'Cây','11000',0)
insert into HANGHOA values('H007',N'Màu sáp',N'Hộp','32000',1)
GO
-- Tạo bảng khách hàng
CREATE TABLE KHACHHANG(
	MaKH VARCHAR(10) PRIMARY KEY,
	HoTen NVARCHAR(50) NULL,
	DiaChi NVARCHAR(100) NULL,
	DaiLy BIT NULL
)
GO
insert into KHACHHANG values('KH01',N'Huỳnh Thị Quyên',N'Sài Gòn',1)
insert into KHACHHANG values('KH02',N'Nguyễn Hoàng Duy',N'Bình Thuận',0)
insert into KHACHHANG values('KH03',N'Đinh Danh Lợi',N'Đồng Tháp',0)
insert into KHACHHANG values('KH04',N'Trần Quốc Đạt',N'Đà Nẵng',1)
insert into KHACHHANG values('KH05',N'Bùi Cẩm Tú',N'Trà Vinh',0)
GO
-- Tạo bảng hoá đơn
CREATE TABLE HOADON(
	SoHD VARCHAR(10) PRIMARY KEY,
	NgayLap DATE NULL,
	NgayGiao DATE NULL,
	TriGia INT NULL,
	MaKH VARCHAR(10) REFERENCES KHACHHANG(MaKH)
)
GO
insert into HOADON values('HD01','2017-05-12','2017-07-23',1000,'KH01')
insert into HOADON values('HD02','2016-12-15','2017-07-23',5000,'KH02')
insert into HOADON values('HD03','2017-01-15','2017-07-23',7200,'KH01')
insert into HOADON values('HD04','2017-07-11','2017-07-23',1200,'KH03')
insert into HOADON values('HD05','2017-05-12','2017-07-23',2400,'KH05')
insert into HOADON values('HD06','2017-05-25','2017-07-23',560,'KH04')
insert into HOADON values('HD07','2017-01-15','2017-07-23',3400,'KH02')
insert into HOADON values('HD08','2016-12-15','2017-07-23',750,'KH03')
insert into HOADON values('HD09','2017-09-10','2017-07-23',4100,'KH04')
insert into HOADON values('HD10','2017-05-12','2017-07-23',630,'KH01')
GO
-- Tạo bảng chi tiết hoá đơn
CREATE TABLE CHITIET_HD(
	PRIMARY KEY(SoHD,MaHG),
	SoHD VARCHAR(10) REFERENCES HOADON(SoHD),
	MaHG VARCHAR(10) REFERENCES HANGHOA(MaHG),
	SoLuong INT NULL,
	GiaBan INT NULL
)
GO
insert into CHITIET_HD values('HD01','H005',30,20000)
insert into CHITIET_HD values('HD02','H004',50,30000)
insert into CHITIET_HD values('HD03','H001',70,7000)
insert into CHITIET_HD values('HD04','H001',5,15000)
insert into CHITIET_HD values('HD05','H002',10,20000)
insert into CHITIET_HD values('HD06','H004',20,15000)
insert into CHITIET_HD values('HD07','H003',30,7000)
insert into CHITIET_HD values('HD08','H005',40,20000)
insert into CHITIET_HD values('HD09','H002',30,30000)
insert into CHITIET_HD values('HD10','H003',20,7000)


--- TRUY VẤN DỮ LIỆU
--a. Cho biết Mã số và tên của các mặt hàng còn trong kho
SELECT MaHG, TenHG FROM HANGHOA
WHERE CoHang = 1

--b. Cho biết họ tên và địa chỉ của các khách hàng là đại lý
SELECT HoTen, DiaChi FROM KHACHHANG
WHERE DaiLy = 1

--c. Cho biết trị giá của những hóa đơn lập vào ngày 12/05/2017
SELECT SoHD, TriGia FROM HOADON
WHERE NgayLap = '2017-05-12'

--d. Cho biết họ tên, địa chỉ của các khách hàng lẻ mua hàng vào ngày 15/01/2017
SELECT HoTen, DiaChi FROM HOADON
INNER JOIN KHACHHANG ON KHACHHANG.MaKH = HOADON.MaKH
WHERE NgayLap = '2017-01-15'

--e. In ra thông tin gồm mã số, tên hàng và đơn vị tính của các mặt hàng được các khách
--hàng ở Đồng Tháp mua vào ngày 15/12/2016
SELECT HANGHOA.MaHG, TenHG, DVT FROM KHACHHANG
INNER JOIN HOADON ON HOADON.MaKH = KHACHHANG.MaKH
INNER JOIN CHITIET_HD ON CHITIET_HD.SoHD = HOADON.SoHD
INNER JOIN HANGHOA ON HANGHOA.MaHG = CHITIET_HD.MaHG
WHERE NgayLap = '2016-12-15'
AND DiaChi = N'Đồng Tháp'

--f. In ra mã số, tên của các mặt hàng thuộc các hóa đơn có trị giá lớn hơn 1000
SELECT HANGHOA.MaHG, HANGHOA.TenHG FROM HANGHOA
INNER JOIN CHITIET_HD ON CHITIET_HD.MaHG = HANGHOA.MaHG
INNER JOIN HOADON ON HOADON.SoHD = CHITIET_HD.SoHD
WHERE TriGia > '1000'
GROUP BY HANGHOA.MaHG, HANGHOA.TenHG

--g. Cho biết tên của những mặt hàng chưa từng được bán
SELECT MaHG, TenHG FROM HANGHOA
WHERE MaHG NOT IN (SELECT MaHG FROM CHITIET_HD)

--h. Cho biết mã số, tên của những đại lý không mua hai mặt hàng "H001" và "H002"
-- xem xét lại
SELECT KHACHHANG.MaKH, KHACHHANG.HoTen FROM KHACHHANG
INNER JOIN HOADON ON HOADON.MaKH = KHACHHANG.MaKH
INNER JOIN CHITIET_HD ON CHITIET_HD.SoHD = HOADON.SoHD
INNER JOIN HANGHOA ON HANGHOA.MaHG = CHITIET_HD.MaHG
WHERE DaiLy = 1
AND CHITIET_HD.MaHG NOT IN ('H001','H002')
GROUP BY KHACHHANG.MaKH, KHACHHANG.HoTen

--i. Tìm tên của những mặt hàng vừa được mua bởi các đại lý ở Vĩnh Long vừa được mua
--bởi các khách hàng lẻ ở Trà Vinh.


--j. Tìm địa chỉ và tên của những khách hàng đã mua tất cả các mặt hàng.
