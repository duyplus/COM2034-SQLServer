USE master
GO
CREATE DATABASE PS18293_NguyenHoangDuy_QLBV
GO
USE PS18293_NguyenHoangDuy_QLBV
GO
CREATE TABLE KHOA(
	MaKhoa varchar(10) PRIMARY KEY,
	TenKhoa nvarchar(50) NOT NULL,
	NamThanhLap date NOT NULL
)
GO
CREATE TABLE NHANVIEN(
	MaNV varchar(10) PRIMARY KEY,
	TenNV nvarchar(50) NOT NULL,
	NgaySinh date,
	MaKhoa varchar(10) references KHOA(MaKhoa)
)
GO
CREATE TABLE BENHNHAN(
	MaBN varchar(10) PRIMARY KEY,
	TenBN nvarchar(50) NOT NULL,
	NgaySinh date,
	Benh nvarchar(50),
	MaKhoa varchar(10) references KHOA(MaKhoa),
	NgayNhap date NOT NULL,
	NgayXuat date NOT NULL
)
GO
insert into KHOA values ('K01', N'Khoa Nội', '03-23-1989');
insert into KHOA values ('K02', N'Khoa Ngoại', '03-23-1989');
insert into KHOA values ('K03', N'Khoa Nhi', '03-23-1989');
insert into KHOA values ('K04', N'Khoa Thần Kinh', '06-15-1993');
GO
insert into NHANVIEN values ('N001', N'Tôn Thất Tùng','02-03-1939','K01');
insert into NHANVIEN values ('N002', N'Trần Quán Anh','06-20-1945','K01'); 
insert into NHANVIEN values ('N003', N'Phạm Thị Tươi','06-24-1966','K02'); 
insert into NHANVIEN values ('N004', N'Phạm Thanh Thảo','10-20-1975','K02'); 
insert into NHANVIEN values ('N005', N'Nguyễn Hà Thanh','11-01-1977','K02'); 
insert into NHANVIEN values ('N006', N'Trần Văn Trà','01-23-1982','K02'); 
insert into NHANVIEN values ('N007', N'Nguyễn Văn An','12-23-1980','K03'); 
insert into NHANVIEN values ('N008', N'Tô Huy Rứa','02-13-1950','K03'); 
insert into NHANVIEN values ('N009', N'Vũ Thái Hà','03-15-1960','K03'); 
insert into NHANVIEN values ('N010', N'Phạm Văn Hùng','12-13-1970','K04'); 
insert into NHANVIEN values ('N011', N'Nguyễn Vũ Trường Sơn','03-15-1965','K04');
GO
insert into BENHNHAN values ('B0001', N'Nguyễn Quang A','1945-4-5',N'Đau ruột thừa', 'K01','3-12-2009','3-18-2009');
insert into BENHNHAN values ('B0002', N'Trần Văn Tuất','1946-4-15',N'Đau đầu', 'K04','3-12-2009','3-23-2009');
insert into BENHNHAN values ('B0003', N'Phạm Tuấn Tú','2003-9-15',N'Viêm họng', 'K03','3-15-2009','3-20-2009');
insert into BENHNHAN values ('B0004', N'Phạm Bình Minh','2006-9-25',N'Viêm họng', 'K03','3-16-2009','3-17-2009');
insert into BENHNHAN values ('B0005', N'Vũ Văn Minh','1980-5-25',N'Gãy chân', 'K02','3-17-2009','3-27-2009');
insert into BENHNHAN values ('B0006', N'Phạm Thị Mùi','2008-3-5',N'Đau dại dày', 'K03','3-19-2009','4-20-2009');
insert into BENHNHAN values ('B0007', N'Tô Hương Linh','1995-2-15',N'Viêm dạ dày', 'K01','4-01-2009','4-21-2009');
insert into BENHNHAN values ('B0008', N'Trường Giang','1992-2-15',N'Đau chân', 'K02','4-05-2009','4-12-2009');
insert into BENHNHAN values ('B0009', N'Tô Hiến Thành','1954-6-11',N'Viêm dây thần kinh tim', 'K04','4-10-2009','4-15-2009');
insert into BENHNHAN values ('B0010', N'Tăng Thanh Hà','1987-10-15',N'Viêm họng', 'K01','4-12-2009','4-12-2009');

-- TRUY VẤN TSQL
--a) Liệt kê các nhân viên khoa Nội và tuổi lớn hơn 50.
SELECT MaNV, TenNV, NgaySinh, YEAR(GETDATE()) - YEAR(NgaySinh) as 'Tuoi' FROM NHANVIEN
INNER JOIN KHOA ON KHOA.MaKhoa = NHANVIEN.MaKhoa
WHERE KHOA.MaKhoa = 'K01'


--b) Hãy thống kê số lượng nhân viên theo khoa
SELECT KHOA.MaKhoa, COUNT(*) as 'So Luong NV' FROM NHANVIEN
INNER JOIN KHOA ON KHOA.MaKhoa = NHANVIEN.MaKhoa
GROUP BY KHOA.MaKhoa


--c) Hãy thống kê số bệnh nhân theo khoa
SELECT KHOA.MaKhoa, COUNT(*) as 'So Luong BN' FROM BENHNHAN
INNER JOIN KHOA ON KHOA.MaKhoa = BENHNHAN.MaKhoa
GROUP BY KHOA.MaKhoa


--d) Hãy sắp xếp các khoa có tỷ lệ số bệnh nhân trên số cán bộ theo chiều tăng dần.
--(chú ý: câu này có thể khó đối với bạn, nên làm sau cùng)
SELECT TenKhoa, count(*) as N'Số lượng NV' FROM BENHNHAN
INNER JOIN KHOA ON khoa.makhoa = benhnhan.makhoa
GROUP BY TenKhoa


--e) Tạo mới một bảng ảo tên là canbokhoanhi gồm đầy đủ thông tin của các nhân viên khoa Nhi.
DECLARE @CanBoKhoaNhi TABLE (
	MaBN varchar(10),
	TenBN nvarchar(50),
	NgaySinh date,
	MaKhoa varchar(10)
)
INSERT INTO @CanBoKhoaNhi
select MaNV,TenNV,NgaySinh,NHANVIEN.MaKhoa FROM NHANVIEN
INNER JOIN KHOA ON KHOA.MaKhoa = NHANVIEN.MaKhoa
where TenKhoa like N'%Khoa Nhi%'
--Kiểm tra
SELECT * FROM CanBoKhoaNhi


--f) Tạo mới một thủ tục tên là sp_nhanvien_them thêm một nhân viên mới
--với tham số đầu vàolà các thong tin về nhân viên
CREATE PROC sp_nhanvien_them
	@MaNV varchar(10),
	@TenNV nvarchar(50),
	@NgaySinh date,
	@MaKhoa varchar(10)
AS
BEGIN
	INSERT INTO NHANVIEN VALUES (@MaNV,@TenNV,@NgaySinh,@MaKhoa)
END
--Thực thi
exec sp_nhanvien_them 'N020',N'Nguyễn Hoàng Duy','01-01-1991','K01'
go
--Truy vấn lại xem có dữ liệu không
SELECT * FROM NHANVIEN


--g) Tạo mới một thủ tục tên là sp_nhanvien_sua sửa thông tin của một nhân viên
--với tham số đầu vào là các thông tin về nhân viên
-- drop PROC sp_nhanvien_sua
CREATE PROC sp_nhanvien_sua
	@MaNV varchar(10),
	@TenNV nvarchar(50),
	@NgaySinh date,
	@MaKhoa varchar(10)
AS
BEGIN
	UPDATE NHANVIEN SET
	MaNV = 'N013'
	WHERE MaNV = @MaNV
	AND TenNV = @TenNV
	AND NgaySinh = @NgaySinh
	AND MaKhoa = @MaKhoa
END
--Thực thi
exec sp_nhanvien_sua 'N011',N'Nguyễn Vũ Trường Sơn','1965/03/15','K04'
go
--Truy vấn lại bảng
SELECT * FROM NHANVIEN


--h) Tạo mới một thủ tục tên là sp_nhanvien_xoa xóa một nhân viên với tham số đầu vào là mã nhân viên
-- drop PROC sp_nhanvien_xoa
CREATE PROC sp_nhanvien_xoa
	@MaNV varchar(10)
AS
BEGIN
	DELETE FROM NHANVIEN
	WHERE MaNV = @MaNV
END
--Thực thi
exec sp_nhanvien_xoa 'N020'
go
--Truy vấn lại bảng
SELECT * FROM NHANVIEN


--i) Tạo mới một thủ tục tên là sp_nhanvien_timtheoMaso tìm kiếm một nhân viên với tham số đầu vào là mã nhân viên
-- drop PROC sp_nhanvien_timtheomaso
CREATE PROC sp_nhanvien_timtheomaso
	@MaNV varchar(10)
AS
BEGIN
	SELECT * FROM NHANVIEN
	WHERE MaNV = @MaNV
END
--Chay thu
exec sp_nhanvien_timtheomaso 'N009'
go


--j) Tạo mới một thủ tục tên là sp_nhanvien_timtheoTen tìm kiếm nhân viên
--với tham số đầu vào là tên  nhân viên, tìm kiếm tương đối theo tên nhân viên
--drop PROC sp_nhanvien_timtheoTen
CREATE PROC sp_nhanvien_timtheoTen
	@TenNV nvarchar(50)
AS
BEGIN
	SELECT * FROM NHANVIEN
	WHERE TenNV = @TenNV
END
--Chay thu
exec sp_nhanvien_timtheoTen N'Tôn Thất Tùng'
go


--k) Tạo mới một thủ tục tên là sp_DSBN liệt kê đầy đủ thông tin về các bệnh nhân của một khoa nào đó.
--Thủ tục này có tham số truyền vào là tên một khoa.
--Sau đó viết lệnh để gọi thủ tục này để đưa ra danh sách bệnh nhân khoa Nhi.
-- drop PROC sp_dsbn
CREATE PROC sp_dsbn
	@TenKhoa nvarchar(50)
AS
BEGIN
	SELECT BENHNHAN.* FROM BENHNHAN
	INNER JOIN khoa ON BENHNHAN.MaKhoa = KHOA.MaKhoa
	WHERE TenKhoa = @TenKhoa
END
--Chay thu
exec sp_dsbn N'Khoa Nhi'
go


--l) Tạo mới một hàm có tên là SLBN đếm số lượng bệnh nhân của một khoa nào đó.
--Hàm này có tham số truyền vào là tên một khoa và trả ra số lượng bệnh nhân của khoa đó.
--Hãy viết lệnh gọi hàm này để tìm số lượng bệnh nhân của khoa Ngoại.
-- DROP FUNCTION SLBN
CREATE FUNCTION SLBN (@TenKhoa nvarchar(50))
returns int
BEGIN
	return(SELECT COUNT(*) as N'Số bệnh nhân' FROM BENHNHAN 
		INNER JOIN khoa ON BENHNHAN.MaKhoa = KHOA.MaKhoa
		WHERE TenKhoa = @TenKhoa)
END
go
--Chay thu
print cast(dbo.SLBN(N'Khoa Ngoại') as varchar(10))