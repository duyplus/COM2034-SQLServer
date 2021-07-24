USE master
GO
DROP DATABASE PS18293_NguyenHoangDuy_NhaTro
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
GO
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
	Quan nvarchar(50),
	Email varchar(50)
)
GO
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
(N'Hưng','1','0853127141',N'191 Quang Trung, Phường Hiệp Phú',N'Quận 9','hung@gmail.com'),
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
GO
INSERT INTO NHATRO VALUES
(2,25.5,1000000,N'Thống Nhất, Phường 16',N'Gò Vấp',N'Cho thuê','02-12-2021',1),
(3,30,5000000,N'4 Trần Khắc Chân, Tân Định',N'Quận 1',N'Mặt bằng đẹp','10-02-2021',2),
(1,40,2000000,N'27B Hoa Sứ, Phường 7',N'Phú Nhuận',N'Ngõ rộng','05-01-2021',3),
(5,100,3500000,N'Lê Tự Tài, Phường 4',N'Phú Nhuận',N'Cho thuê nguyên căn','08-25-2021',4),
(2,50,1700000,N'793 Trần Xuân Soạn, Tân Hưng',N'Quận 7',N'Cho thuê dài hạn','11-23-2021',7),
(4,60,6000000,N'215 Nguyễn Văn Hưởng, Thảo Điền',N'Quận 2',N'Lối đi thông thoáng','03-01-2021',6),
(5,35,4300000,N'930 Nguyễn Thị Định, Thạnh Mỹ Lợi',N'Quận 2',N'Cho thuê','10-18-2021',5),
(3,45,4700000,N'31 Bình Phú, Phường 10',N'Quận 6',N'Cho thuê dài hạn','09-14-2021',8),
(4,70,7200000,N'21 Đỗ Thúc Tịnh, Phường 12',N'Gò Vấp',N'Giá cả phải chăng','05-29-2021',10),
(2,65,2500000,N'Bùi Đình Túy, Phường 24',N'Bình Thạnh',N'Cho thuê','11-26-2021',9),
(4,40,4600000,N'174 Tân Hòa Đông, Phường 14',N'Quận 6',N'Cho thuê','03-06-2021',11),
(1,85,8800000,N'Nguyễn Thị Thập, Bình Thuận',N'Quận 7',N'Ngõ rộng','07-12-2021',12),
(1,70,2800000,N'243 Chu Văn An, Phường 12',N'Bình Thạnh',N'Giá cả phải chăng','04-22-2021',13),
(3,50,3100000,N'Nguyễn Trãi, Nguyễn Cư Trinh',N'Quận 1',N'Ngõ rộng','01-12-2021',14),
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
GO
INSERT INTO DANHGIA VALUES
(1,2,'1',N'Nhà trọ tốt'),
(2,5,'0',N'Giá cao'),
(3,3,'1',N'Nhà trọ tốt'),
(4,1,'1',N'Cổng cao'),
(5,4,'0',N'Xuống cấp'),
(6,6,'0',N'Giá cao'),
(7,3,'0',N'Đường xấu'),
(8,7,'1',N'Nhà đẹp'),
(9,9,'0',N'Mạng kém'),
(10,5,'1',N'Ngõ rộng'),
(11,5,'1',N'Giá cao'),
(12,9,'1',N'Nhà đẹp'),
(13,8,'1',N'Giá tốt'),
(14,2,'0',N'Cổng thấp'),
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


--Y3.2.a
-- Viết một SP với các tham số đầu vào phù hợp. SP thực hiện tìm kiếm thông tin các
-- phòng trọ thỏa mãn điều kiện tìm kiếm theo: Quận, phạm vi diện tích, phạm vi ngày đăng
-- tin, khoảng giá tiền, loại hình nhà trọ.
if OBJECT_ID('sp_NhaTro_select') is not null
DROP PROC sp_NhaTro_select
go
CREATE PROC sp_NhaTro_select
	@Quan nvarchar(50) = N'%',
	@LoaiNhaTro nvarchar(50) = N'%',
	@DienTichMax real = null,
	@DienTichMin real = null,
	@NgayDangMax date = null,
	@NgayDangMin date = null,
	@GiaPhongMax money = null,
	@GiaPhongMin money = null
as
if (@DienTichMax is null)
BEGIN
	SELECT @DienTichMax = MAX(DienTich) from NHATRO
END
if (@DienTichMin is null)
BEGIN
	SELECT @DienTichMin = Min(Dientich) from NHATRO
END
if (@NgayDangMax is null)
BEGIN
	SELECT @NgayDangMax = MAX(NHATRO.NgayDangTin) from NHATRO
END
if (@NgayDangMin is null)
BEGIN
	SELECT @NgayDangMin = MIN(NHATRO.NgayDangTin) from NHATRO
END
if (@GiaPhongMax is null)
BEGIN
	SELECT @GiaPhongMax = MAX(NHATRO.GiaPhong) from NHATRO
END
if (@GiaPhongMin is null)
BEGIN
	SELECT @GiaPhongMin = MIN(NHATRO.GiaPhong) from NHATRO
END

SELECT (N'Cho thuê phòng tại '+NhaTro.DiaChi+', '+NhaTro.Quan) as 'Địa Chỉ',
	(REPLACE(CONVERT(varchar, DienTich,103),'.',',') + ' m2') as 'Diện Tích',
	(REPLACE(LEFT(CONVERT(varchar,GiaPhong,1),LEN(CONVERT(varchar,GiaPhong,1))-3),',','.') + N' VNĐ') as 'Giá Phòng',
	NhaTro.MoTa as 'Thông Tin Nhà Trọ',
	CONVERT(varchar,NgayDangTin,105) as 'Ngày Đăng',
	CASE NGUOIDUNG.GioiTinh
	when 1 then 'A. ' + NGUOIDUNG.TenNguoiDung
	when 0 then 'C. ' + NGUOIDUNG.TenNguoiDung
	END as N'Người đăng',
	DienThoai as N'Điện thoại liên hệ', (NGUOIDUNG.DiaChi + ', ' + NGUOIDUNG.Quan) as N'Địa chỉ liên hệ'
	FROM NHATRO
	JOIN LOAINHA on NhaTro.MaLoaiNha = LoaiNha.MaLoaiNha
	JOIN NGUOIDUNG on NhaTro.MaNguoiDung = NGUOIDUNG.MaNguoiDung
WHERE (DienTich <= @DienTichMax)
	AND (DienTich >= @DienTichMin)
	AND (NgayDangTin <= @NgayDangMax)
	AND (NgayDangTin >= @NgayDangMin)
	AND (GiaPhong <= @GiaPhongMax)
	AND (GiaPhong >= @GiaPhongMin)
	AND (NHATRO.Quan LIKE @Quan)
	AND (LOAINHA.TenLoaiNha LIKE @LoaiNhaTro)
ORDER BY NgayDangTin

--Truy vấn
EXEC sp_NhaTro_select
EXEC sp_NhaTro_select @LoaiNhaTro = N'%nguyên cân%'
EXEC sp_NhaTro_select @Quan = N'%Quận l%', @DienTichMax = 60, @GiaPhongMax = 4000000
EXEC sp_NhaTro_select @NgayDangMax = '7/30/2013', @NgayDangMin = 'l/1/2013'


--Y3.2.b
--Hàm trả về mã người dùng
if OBJECT_ID('fn_MaNguoiDung') is not null
drop function fn_MaNguoiDung
go
create function fn_MaNguoiDung(
	@TenNguoiDung nvarchar(50) = N'%',
	@Dienthoai nvarchar(50) = N'%',
	@DiaChi nvarchar(50) = N'%',
	@Quan nvarchar(50) = N'%')
returns table
return (select MaNguoiDung
		from NguoiDung
		where (TenNguoiDung like @TenNguoiDung)
		and (Diachi like @Diachi)
		and (Quan like @Quan)
		and (Dienthoai like @Dienthoai) )
---Truy vấn
select * from dbo.fn_MaNguoiDung(N'%Nguyễn%', default, default, default)

--Y3.2.c
--Hàm trả về tổng số Like
if OBJECT_ID ('fn_TongLike') is not null
drop function fn_TongLike
go
create function fn_TongLike(@MaNhaTro int)
returns int
as
begin
	return (select count(DanhGia) from DANHGIA
		where MaNhaTro = @Manhatro
		and DanhGia = 1)
end
---Truy vấn
--select dbo.fn_TongLike (3)

--Hàm trả về tổng số Dislike
if OBJECT_ID ('fn_TongDislike') is not null
drop function fn_TongDislike
go
create function fn_TongDislike(@MaNhaTro int)
returns int
as
begin
	return (select count(DanhGia) from DANHGIA
		where MaNhaTro = @MaNhaTro
		and DanhGia = 0)
end
---Truy vấn
select MaNhaTro,TenLoaiNha,
	(REPLACE(CONVERT(varchar,DienTich,103),'.',',') + ' m2') as 'Diện Tích',
	(REPLACE(LEFT(CONVERT(varchar,GiaPhong,1),LEN(CONVERT(varchar,GiaPhong,1))-3),',','.') + N' VNĐ') as N'Giá Phòng',
	(NHATRO.DiaChi+', '+NHATRO.Quan) as N'Địa Chỉ',
	dbo.fn_TongLike(MaNhaTro) as N'Tổng Like',
	dbo.fn_TongDislike(MaNhaTro) as N'Tổng Dislike',
	MoTa as N'Thông Tin Nhà Trọ',
	NgayDangTin as N'Ngày Đăng',
	NGUOIDUNG.TenNguoiDung as 'Người Đăng'
from NHATRO
join NGUOIDUNG on NHATRO.MaNguoiDung = NGUOIDUNG.MaNguoiDung
join LOAINHA on NHATRO.MaLoaiNha = LOAINHA.MaLoaiNha

--Y3.3.d
--View top 5 nhà trọ được like nhiều nhất
if OBJECT_ID ('Top5') is not null
drop view Top5
go
create view Top5
as
select TOP 5 NHATRO.MaNhaTro as 'Mã nhà trọ',
	(REPLACE(CONVERT(varchar,DienTich,103),',',',') +' m2') as 'Diện Tích',
	(REPLACE(LEFT(CONVERT (varchar,GiaPhong,1),LEN(CONVERT(varchar,GiaPhong,1))-3),',','.') + N' VNĐ') as 'Giá Phòng',
	MoTa as 'Thông Tin Nhà Trọ',
	(NHATRO.DiaChi +', '+ NHATRO.Quan) as 'Địa chỉ nhà trọ',
	dbo.fn_TongLike(MaNhaTro) as 'Tổng Like',
	NgayDangTin as 'Ngày Đăng',
	NGUOIDUNG.TenNguoiDung as 'Người Đăng',
	(NGUOIDUNG.DiaChi +', '+ NGUOIDUNG.Quan) as 'Địa chỉ liên hệ',
	NGUOIDUNG.DienThoai as 'Điện thoại',
	NGUOIDUNG.Email as "Email"
from NHATRO
join NGUOIDUNG on NHATRO.MaNguoiDung = NGUOIDUNG.MaNguoiDung
join LOAINHA on NHATRO.MaLoaiNha = LOAINHA.MaLoaiNha
order by N'Tổng Like' DESC
---Truy vấn
select * from Top5

--Y3.3.e
--Truy vấn thông tin đánh giá nhà trọ
if OBJECT_ID ('sp_DanhGiaNhatro_select') is not null
drop proc sp_DanhGiaNhatro_select
go
create proc sp_DanhGiaNhatro_select
@MaNhaTro int
as
if not exists (select * from NHATRO where MaNhaTro = @Manhatro)
	begin
		print N'Nhà trọ này không tồn tại'
	end
else
	begin
		if not exists (select * from DanhGia where Manhatro = @Manhatro)
			begin
				print N'Nhà trọ này chưa được đánh giá'
			end
		else
			begin
				select DANHGIA.MaNhaTro as 'Mã nhà trọ',
				NGUOIDUNG.TenNguoiDung as 'Người đánh giá',
				case DANHGIA.DanhGia
					when 1 then 'Like'
					when 0 then 'Dislike'
				end as N'Đánh giá',
				DANHGIA.NoiDungDanhGia as 'Nội dung đánh giá'
				from DANHGIA
				join NGUOIDUNG on DANHGIA.MaNguoiDung = NGUOIDUNG.MaNguoiDung
				where DANHGIA.MaNhaTro = @Manhatro
			end
	end
--Truy vấn
exec sp_DanhGiaNhatro_select @MaNhaTro = 1
exec sp_DanhGiaNhatro_select @MaNhaTro = 2
exec sp_DanhGiaNhatro_select @ManhaTro = 3
exec sp_DanhGiaNhatro_select @MaNhaTro = 4
exec sp_DanhGiaNhatro_select @MaNhaTro = 5
exec sp_DanhGiaNhatro_select @ManhaTro = 6
exec sp_DanhGiaNhatro_select @MaNhaTro = 7
exec sp_DanhGiaNhatro_select @MaNhaTro = 8
exec sp_DanhGiaNhatro_select @MaNhaTro = 9
exec sp_DanhGiaNhatro_select @MaNhaTro = 10
--truy vấn nhà trọ chưa có đánh giá
exec sp_DanhGiaNhatro_select @ManhaTro = 14
--truy vấn nhà trọ không tồn tại
exec sp_DanhGiaNhatro_select @MaNhaTro = 16



--Y3.3.1
--Xóa thông tin nhà trọ theo số lượng Dislike
if OBJECT_ID ('sp_delete_NhaTro_Dislike') is not null
drop proc sp_NhaTro_Dislike_delete
go
CREATE PROC sp_NhaTro_Dislike_delete
@Dislike int
as
begin try
	begin tran
		--save tran A
			declare @Manhatro table (MaNhaTro int)
				insert @Manhatro
				select NHATRO.MaNhaTro from NHATRO where dbo.fn_TongDislike (NHATRO.MaNhaTro) > @Dislike
			delete from DANHGIA
				where DANHGIA.MaNhaTro in (select MaNhaTro from @Manhatro)
			delete from Nhatro
				where NHATRO.MaNhaTro in (select MaNhaTro from @Manhatro)
			print N'Thao tác thành công!'
		--rollback tran A
	commit tran
end try
begin catch
	rollback tran
	print N'Thao tác không thành công!'
end catch
-----
EXEC sp_NhaTro_Dislike_delete @Dislike = 2

--Y3.3.2
if OBJECT_ID ('sp_NhaTro_NgayDang_delete') is not null
DROP PROC sp_NhaTro_NgayDang_delete
go
CREATE PROC sp_NhaTro_NgayDang_delete
@NgayDangMin date = null,
@NgayDangMax date = null
as
begin try
	begin tran
		--save tran A
			if (@NgayDangMax is null)
				select @NgayDangMax = MAX (NHATRO.NgayDangTin) from NHATRO
			if (@NgayDangMin is null)
				select @NgayDangMin = Min (NHATRO.NgayDangTin) from NHATRO
			declare @Manhatro table (MaNhaTro int)
				insert @MaNhatro
				select NHATRO.MaNhaTro from NHATRO
			where (NgayDangTin <= @NgayDangMax) and (NgayDangTin >= @NgayDangMin)
			--exec sp_select_NhaTro
			delete from DanhGia
				where DanhGia.MaNhaTro in (select MaNhaTro from @Manhatro)
			delete from NhaTro
				where NHATRO.MaNhaTro in (select Manhatro from @Manhatro)
			--exec sp_select_NhaTro
			print N'Thao tác thành công!'
		--rollback tran A
	commit tran
end try
begin catch
	rollback tran
	print N'Thao tác không thành công!'
end catch
-----
EXEC sp_NhaTro_NgayDang_delete @NgayDangMin='1/1/2013',@NgayDangMax='12/31/2013'
