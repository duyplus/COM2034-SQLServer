USE master
GO
CREATE DATABASE PS18293_NguyenHoangDuy_NhaTro
GO
USE PS18293_NguyenHoangDuy_NhaTro
GO
-- 1. Tạo bảng loainha
CREATE TABLE LOAINHA(
	MaLoaiNha int identity(1,1) PRIMARY KEY,
	TenLoaiNha nvarchar(50) NOT NULL
)
INSERT INTO LOAINHA VALUES
(N'Nhà trọ chung chủ'),
(N'Nhà trọ tự quản lý'),
(N'Chung cư'),
(N'Homestay'),
(N'Ký túc xá')
GO

-- 2. Tạo bảng nguoidung
CREATE TABLE NGUOIDUNG(
	MaNguoiDung int identity(1,1) PRIMARY KEY,
	TenNguoiDung nvarchar(50) NOT NULL,
	GioiTinh bit NOT NULL,
	DienThoai varchar(15) NOT NULL,
	DiaChi nvarchar(50) NOT NULL,
	Quan nvarchar(20),
	Email varchar(30)
)
INSERT INTO NGUOIDUNG VALUES
(N'Duy','1','0919993715',N'140 Huỳnh Văn Bánh, Phường 12',N'Phú Nhuận','duy@gmail.com'),
(N'Dũng','1','0123456789',N'370 Lê Văn Lương, Phường Tân Hưng',N'Quận 7','dung@gmail.com'),
(N'Đạt','1','0164846138',N'113 Cộng Hoà, Phường 12',N'Tân Bình','dat@gmail.com'),
(N'Hương','0','0894153484',N'150 Trường Chinh, Phường 12',N'Tân Bình','huong@gmail.com'),
(N'Tiến','1','0345451245',N'233 Đinh Bộ Lĩnh, Phường 26',N'Bình Thạnh','tien@gmail.com'),
(N'Kiệt','1','0324444517',N'379 Huỳnh Tấn Phát, Phường Tân Thuận Đông',N'Quận 7','kiet@gmail.com'),
(N'Thu','0','0789114256',N'29 Nguyễn Trung Ngạn, Phường Bến Nghé',N'Quận 1','thu@gmail.com'),
(N'Kiên','1','0412454359',N'496 Nguyễn Đình Chiểu, Phường 4',N'Quận 3','kien@gmail.com'),
(N'Oanh','0','0178811561',N'124 Nam Kỳ Khởi Nghĩa, Phường Bến Thành',N'Quận 1','oanh@gmail.com'),
(N'Hiền','0','0365841258',N'01 Lương Định Của, Phường An phú',N'Quận 2','hien@gmail.com'),
(N'Đức','1','0685596317',N'139 Dương Bá Trạc, Phường 1',N'Quận 8','duc@gmail.com'),
(N'Hưng','1','0853127141',N'	191 Quang Trung, Phường Hiệp Phú',N'Quận 9','hung@gmail.com'),
(N'Nhung','0','0252347855',N'61 đường 5, KP2, Phường Cát Lái',N'Quận 2','nhung@gmail.com'),
(N'Anh','1','0354124778',N'85 Trần Đình Xu, Phường Nguyễn Cư Trinh,',N'Quận 1','anh@gmail.com'),
(N'Kiều','0','0235878912',N'968 Quốc lộ 1A, Phường Linh Trung',N'Thủ Đức','kieu@gmail.com')
GO

-- 3. Tạo bảng nhatro
CREATE TABLE NHATRO(
	MaNhaTro int identity(1,1) PRIMARY KEY,
	MaLoaiNha int references LOAINHA(MaLoaiNha),
	DienTich float check(DienTich > 0) NOT NULL,
	GiaPhong int check(GiaPhong > 0) NOT NULL,
	DiaChi nvarchar(50) NOT NULL,
	Quan nvarchar(20),
	MoTa nvarchar(20) NOT NULL,
	NgayDangTin date NOT NULL,
	MaNguoiDung int references NGUOIDUNG(MaNguoiDung)
)
INSERT INTO NHATRO VALUES
(2,25.5,1000000,N'Thống Nhất, Phường 16',N'Gò Vấp',N'Cho thuê','02-12-2021',1),
(3,30,5000000,N'4 Trần Khắc Chân, Phường Tân Định',N'Quận 1',N'Mặt bằng đẹp','10-02-2021',2),
(1,40,2000000,N'27B Hoa Sứ, Phường 7',N'Phú Nhuận',N'Ngõ rộng','05-01-2021',3),
(5,100,3500000,N'Lê Tự Tài, Phường 4',N'Phú Nhuận',N'Cho thuê nguyên căn','08-25-2021',4),
(2,50,1700000,N'793 Trần Xuân Soạn, Phường Tân Hưng',N'Quận 7',N'Cho thuê dài hạn','11-23-2021',7),
(4,60,6000000,N'215 Nguyễn Văn Hưởng, Phường Thảo Điền',N'Quận 2',N'Lối đi thông thoáng','03-01-2021',6),
(5,35,4300000,N'930 Nguyễn Thị Định, Phường Thạnh Mỹ Lợi',N'Quận 2',N'Cho thuê','10-18-2021',5),
(3,45,4700000,N'31 Bình Phú, Phường 10',N'Quận 6',N'Cho thuê dài hạn','09-14-2021',8),
(4,70,7200000,N'21 Đỗ Thúc Tịnh, Phường 12',N'Gò Vấp',N'Giá cả phải chăng','05-29-2021',10),
(2,65,2500000,N'Bùi Đình Túy, Phường 24',N'Bình Thạnh',N'Cho thuê','11-26-2021',9),
(4,40,4600000,N'174 Tân Hòa Đông, Phường 14',N'Quận 6',N'Cho thuê','03-06-2021',11),
(1,85,8800000,N'Nguyễn Thị Thập, Phường Bình Thuận',N'Quận 7',N'Ngõ rộng','07-12-2021',12),
(1,70,2800000,N'243 Chu Văn An, Phường 12',N'Bình Thạnh',N'Giá cả phải chăng','04-22-2021',13),
(3,50,3100000,N'Nguyễn Trãi, Phường Nguyễn Cư Trinh',N'Quận 1',N'Ngõ rộng','01-12-2021',14),
(2,20,6500000,N'63/39 Lê Văn Sỹ, Phường 11',N'Phú Nhuận',N'Cho thuê dài hạn','06-07-2021',15)
GO

-- 4. Tạo bảng danhgia
CREATE TABLE DANHGIA(
	MaNguoiDung int references NGUOIDUNG(MaNguoiDung),
	MaNhaTro int references NHATRO(MaNhaTro),
	DanhGia bit NOT NULL,
	NoiDungDanhGia nvarchar(100) NOT NULL,
	PRIMARY KEY(MaNguoiDung,MaNhaTro)
)
INSERT INTO DANHGIA VALUES
(1,2,'1',N'Nhà trọ tốt'),
(2,5,'0',N'Giá tốt'),
(3,3,'1',N'Nhà đẹp'),
(4,1,'1',N'Cổng cao'),
(5,4,'0',N'Xuống cấp'),
(6,6,'0',N'Giá cao'),
(7,3,'0',N'Đường xấu'),
(8,7,'1',N'Nhà đẹp'),
(9,9,'0',N'Mạng kém'),
(10,5,'1',N'Ngõ rộng'),
(11,5,'1',N'Giá cao'),
(12,9,'1',N'Ngõ hẹp'),
(13,8,'1',N'Giá tốt'),
(14,2,'0',N'Nhà trọ tốt'),
(15,4,'1',N'Thoáng mát')

USE PS18293_NguyenHoangDuy_NhaTro
GO
--TRUY VẤN DỮ LIỆU
--Y3.1.a
--SP thứ nhất thực hiện chèn dữ liệu vào bảng NGUOIDUNG
-- DROP PROC sp_NguoiDung_insert
CREATE PROC sp_NguoiDung_insert
	@TenNguoiDung nvarchar(50),
	@GioiTinh bit,
	@DienThoai varchar(15),
	@DiaChi nvarchar(50),
	@Quan nvarchar(50),
	@Email varchar(50)
AS
BEGIN
	INSERT INTO NGUOIDUNG VALUES (@TenNguoiDung,@GioiTinh,@DienThoai,@DiaChi,@Quan,@Email)
END
go
--3. thực thi
exec sp_NguoiDung_insert N'CAO HOÀNG PHÚC',0,'0362555485',N'Nguyễn Thị Minh Khai, Bến Thành',N'Quận 7','thanhpho@fpt.edu.vn'
go
--4. Truy vấn lại xem có dữ liệu không
SELECT * FROM NGUOIDUNG
go


--Y3.1.b
--SP thứ hai thực hiện chèn dữ liệu vào bảng NHATRO
-- DROP PROC sp_NhaTro_insert
CREATE PROC sp_NhaTro_insert
	@MaLoaiNha int,
	@DienTich real,
	@GiaPhong money,
	@Quan nvarchar(50),
	@ThongTinNhaTro nvarchar(50),
	@NgayDang date
AS
BEGIN
	INSERT INTO NHATRO VALUES(@MaLoaiNha,@DienTich,@GiaPhong,@Quan,@ThongTinNhaTro,@NgayDang)
END
go
-- thi hành
EXEC sp_NhaTro_insert 4,50.6,5000000,N'Quận 12',N'Cho Thuê','11-22-2020'
go
SELECT * FROM NHATRO
go

--Y3.1.c
--SP thứ ba thực hiện chèn dữ liệu vào bảng DANHGIA
---- viết store insert value danhGia
-- DROP PROC sp_DanhGia_insert 
CREATE PROC sp_DanhGia_insert 
	@MaNhaTro int,
	@MaNguoiDung int,
	@DanhGia bit,
	@ThongTinDanhGia nvarchar(50)
AS
BEGIN
	INSERT INTO DANHGIA VALUES(@MaNhaTro,@MaNguoiDung ,@DanhGia ,@ThongTinDanhGia)
END
go
-- thi hành
EXEC sp_DanhGia_insert 4,7,'1',N'Giá hợp lí'
go
SELECT * FROM DANHGIA
go