use master
go

drop database  masv_hoten_NHATRO2
go

create database  masv_hoten_NHATRO2
go
use  masv_hoten_NHATRO2
go
create table  LOAINHA
(
	MaLoaiNha int IDENTITY(1,1) primary key,
	TenLoaiNha nvarchar(50) not null,
	ThongTinLoaiNha nvarchar(50) not null
)
go
drop table  NGUOIDUNG
go
create table  NGUOIDUNG
(
		MaNguoiDung int IDENTITY(1,1) primary key,
		TenNguoiDung nvarchar(50) not null,
		GioiTinh bit not null,
		DienThoai varchar(15) not null,
		DiaChi nvarchar(50) not null,
		Quan nvarchar(50) not null,
		Email varchar(50)
	
)
go

create table  NHATRO
(
	MaNhaTro int IDENTITY(1,1) primary key,
	MaLoaiNha int not null,
	DienTich real not null,
	GiaPhong money not null,
	Quan nvarchar(50) not null,
	ThongTinNhaTro nvarchar(50),
	NgayDang date not null,
	CONSTRAINT fk_loainha_nhatro foreign key(MaLoaiNha) references  LOAINHA(MaLoaiNha)
)
go
create table  DanhGia
(
		MaNhaTro int not null,
		MaNguoiDung int not null,
		DanhGia bit not null,
		ThongTinDanhGia nvarchar(50)
	primary key(MaNhaTro,MaNguoiDung)
	CONSTRAINT fk_nhatro_danhgia foreign key(MaNhaTro) references  NHATRO(MaNhaTro),
	CONSTRAINT fk_nguoidung_danhgia foreign key(MaNguoiDung) references  NGUOIDUNG(MaNguoiDung)
)
go

insert into  LOAINHA(TenLoaiNha,ThongTinLoaiNha) values(N'Nhà trọ bình dân',N'Nhà trọ giá rẻ cho sinh viên, học sinh')
insert into  LOAINHA(TenLoaiNha,ThongTinLoaiNha) values(N'Cho thuê phòng',N'Nhà trọ dành cho người đi làm,sv')
insert into  LOAINHA(TenLoaiNha,ThongTinLoaiNha) values(N'Cho thuê nguyên căn',N'Dành cho kinh doanh hộ GD')
insert into  LOAINHA(TenLoaiNha,ThongTinLoaiNha) values(N'Cho thuê căn hộ',N'căn hộ')
go
insert into  NGUOIDUNG values(N'Đỗ Bùi Quý',1,'0933622633',N'41 Tôn thất tùng , Phạm ngũ Lão',N'Quận 1','quygsvsf@fpt.edu.vn')
go
insert into  NGUOIDUNG values(N'Bùi Thị Kim Hà',0,'0964521381',N'170 Nguyễn Duy Trinh, Bình Trưng Tây',N'Quận 2','kimhavchvcg@fpt.edu.vn')
go
insert into  NGUOIDUNG values(N'Đỗ Huyền Trân',1,'0315896412',N'70 Nguyễn kim, phường 10',N'Quận 5','huyentrancvjhcvsh@fpt.edu.vn')
go
insert into  NGUOIDUNG values(N'Đỗ Văn Phú',1,'0164785215',N'Gò Vấp , phường 10',N'Quận Gò Vấp','vanphucbsjchv@fpt.edu.vn')
go
insert into  NGUOIDUNG values(N'Bùi Thị Kim Hoa',0,'0961547852',N'Trần Hưng Đạo, phường 3',N'Quận 5','kimhoavshvshc@fpt.edu.vn')
go
insert into  NGUOIDUNG values(N'Bùi Vân Mây',0,'0965847521',N'Trần nhân tông,phường 7',N'Quận 3','vanmay@fpt.edu.vn')
go
insert into  NGUOIDUNG values(N'Nguyễn Chí Dũng',1,N'Nguyễn Thái Học , phường 1',N'Quận 5','chidung@fpt.edu.vn')
go
insert into  NGUOIDUNG values(N'Nguyễn Việt Cường',1,'0369854123',N'Sương Nguyệt Ánh, P.Bến Thành',N'Quận 1','vietcuong@fpt.edu.vn')
go
insert into  NGUOIDUNG values(N'Nguyễn Thanh Trúc',0,'03699554857',N'Bùi Thị Xuân, P.Bến Thành',N'Quận 1','Thanhtruc@fpt.edu.vn')
go
insert into  NGUOIDUNG values(N'Nguyễn Thanh Thùy',0,'0362555485',N'Nguyễn Thị Minh Khai, P.Bến Nghé',N'Quận 1','Thanhthuy@fpt.edu.vn')
go
select * from  NGUOIDUNG
go

insert into  NHATRO values(1,39,1000000,N'Quận 1',N'Giá cả phải chăng','2-10-2013')

insert into  NHATRO values(2,60.7,5000000,N'Quận 2',N'Cho thuê làm cửa hàng','8-01-2013')

insert into  NHATRO values(3,50,7000000,N'Quận 5',N'Cho thuê nguyên căn','6-12-2013')

insert into  NHATRO values(4,100,1000000,N'Quận Gò Vấp',N'Cho Thuê dài hạn','12-2-2014')

insert into  NHATRO values(2,40,8000000,N'Quận 5',N'Cho Thuê ','8-22-2014')

insert into  NHATRO values(1,50.6,4000000,N'Quận 7',N'Cho Thuê','11-22-2014')

insert into  NHATRO values(3,66.2,4500000,N'Quận 8',N'Cho Thuê dài hạn','4-22-2015')

insert into  NHATRO values(4,120,14000000,N'Quận 1',N'Cho Thuê làm cửa hàng','7-14-2014')

insert into  NHATRO values(3,55,7000000,N'Quận 3',N'Cho Thuê dài hạn','7-22-2014')

insert into  NHATRO values(2,50.6,4000000,N'Quận 7',N'Cho Thuê','11-22-2014')

-------bảng đánh giá anh em nhập sau nhé --------------

--Tạo thêm 1 bảng TaiKhoan
create table TaiKhoan
(
	TenNguoiDung varchar(30) primary key,
	MatKhau varchar(30),
	Tuoi int
)
go
insert into TaiKhoan values('phuc','123',20)
go
select * from TaiKhoan
go
--Anh em viết store tên là sp_TaiKhoan_insert để nhập thêm 1 tài khoản mới
create proc sp_TaiKhoan_insert
	@TenNguoiDung varchar(30),
	@MatKhau varchar(30),
	@Tuoi int
AS
BEGIN
	insert into TaiKhoan values(@TenNguoiDung, @MatKhau, @Tuoi)
END
go
--thực thi store vừa ở trên
exec sp_TaiKhoan_insert  'teo','123',22      --Gọi store thêm đã viết ở trên
go
exec sp_TaiKhoan_insert  'ti','123',22
go
exec sp_TaiKhoan_insert  'Lan','123',22
go
select * from TaiKhoan
go
---------Tạo proc xóa tài khoản --------------------
--1. Xóa Tài khoản tên teo khỏi bảng taikhoan
	delete from TaiKhoan 
	where TenNguoiDung = 'teo'
	go
--2. truy vấn lại bảng
	select *
	from TaiKhoan
	go
--3. Tạo store tên sp_TaiKhoan_delete xóa 1 tài khoản với tham số vào là @tennguoidung
create proc sp_TaiKhoan_delete
@TenNguoiDung varchar(50)
AS
BEGIN
	delete from TaiKhoan 
	where TenNguoiDung = @TenNguoiDung
END
go
--Thực thi
exec sp_TaiKhoan_delete 'ti'
go
	select *
	from TaiKhoan
	go
----4. Tạo store tên sp_TaiKhoan_update sửa 1 tài khoản
create proc sp_TaiKhoan_update
	@TenNguoiDung varchar(30),
	@MatKhau varchar(30),
	@Tuoi int
AS
BEGIN
	update TaiKhoan
	set MatKhau = @MatKhau,
		Tuoi = @Tuoi
	where TenNguoiDung  = @TenNguoiDung
END
go
--Thực thi
exec sp_TaiKhoan_update 'phuc','12345',50
go
--truy vấn
	select *
	from TaiKhoan
	go
--------------------------------------
create proc sp_LoaiNha_insert----- Mã loại nhà tăng tự động , không cần thêm
	@TenLoaiNha nvarchar(50) ,
	@ThongTinLoaiNha nvarchar(50)
	as
begin
	insert into  LOAINHA values(@TenLoaiNha,@ThongTinLoaiNha)
end
	go
exec sp_LoaiNha_insert N'Nhà Ga',N'Dành cho người vô gia cư'
	go
	---- viết proc Nguoi Dung
create proc sp_NguoiDung_insert	
	@TenNguoiDung nvarchar(50),
	@GioiTinh bit ,
	@DienThoai char(10),
	@DiaChi nvarchar(50),
	@Quan nvarchar(50),
	@Email varchar(50)
	as
begin
	insert into  NGUOIDUNG values				(@TenNguoiDung,@GioiTinh,@DienThoai,@DiaChi,@Quan,@Email)
end
	go
exec sp_NguoiDung_insert N'Nguyễn Thanh Phó',0,'0362555485',N'Nguyễn Thị Minh Khai, P.BếnThành',N'Quận 7','thanhpho@fpt.edu.vn'
	go
select * from  NGUOIDUNG
go
	---- viết store NhaTro 
create proc sp_NhaTro_insert
	@MaLoaiNha int,
	@DienTich real ,
	@GiaPhong money ,
	@Quan nvarchar(50),
	@ThongTinNhaTro nvarchar(50),
	@NgayDang date 
	as
begin 
	insert into  NHATRO values(@MaLoaiNha,@DienTich,@GiaPhong,@Quan,@ThongTinNhaTro,@NgayDang)
end
go
exec sp_NhaTro_insert 5,50.6,4000000,N'Quận 2',N'Cho Thuê','11-22-2015'
go
select * from  NHATRO
go
---- viết store insert value danhGia
create proc sp_DanhGia_insert 
	@MaNhaTro int ,
	@MaNguoiDung int ,
	@DanhGia bit ,
	@ThongTinDanhGia nvarchar(50)
	as
begin
	insert into  DanhGia values(@MaNhaTro,@MaNguoiDung ,@DanhGia ,@ThongTinDanhGia)
end
go


-----------------------------------4 store DELETE-------------------------
drop proc sp_LoaiNha_delete 
go
create proc sp_LoaiNha_delete 
@MaLoaiNha int
AS
BEGIN
    delete from  LOAINHA where MaLoaiNha = @MaLoaiNha
END
go
--Thực thi 
exec sp_LoaiNha_delete 1
go
------------
create proc sp_NguoiDung_delete 
@MaNguoiDung int
as
begin
	delete from  NGUOIDUNG where MaNguoiDung = @MaNguoiDung
end
go

exec sp_NguoiDung_delete 1
go
----------
create proc sp_NhaTro_delete
@MaNhaTro int
as
begin
	delete from  NHATRO where MaNhaTro = @MaNhaTro
end
go
------------
create proc sp_DanhGia_delete
@MaNhatro int, 
@MaNguoiDung int
as
begin
	delete from  DanhGia 
	where MaNhaTro = @MaNhatro
		and MaNguoiDung = @MaNguoiDung
end
go
-----------------------------------4 store UPDATE-------------------------
create proc sp_LoaiNha_update 
	@MaLoaiNha int,
	@TenLoaiNha nvarchar(50),
	@ThongTinLoaiNha nvarchar(50)
	as
begin
	update  LOAINHA
	set TenLoaiNha = @TenLoaiNha,
		ThongTinLoaiNha  = @ThongTinLoaiNha
	where MaLoaiNha  = @MaLoaiNha
end
go
----------------
create proc sp_NguoiDung_update
@MaNguoiDung int,
@TenNguoiDung nvarchar(50),
@GioiTinh bit,
@DienThoai char(10),
@DiaChi nvarchar(50) ,
@Quan nvarchar(50) ,
@Email varchar(50)
as
begin
	update  NGUOIDUNG
	set TenNguoiDung = @TenNguoiDung,
	GioiTinh = @GioiTinh,
	DienThoai = @DienThoai,
	DiaChi = @DiaChi,
	Quan = @Quan,
	Email = @Email
	where MaNguoiDung = @MaNguoiDung
end
go
----------------
create proc sp_NhaTro_update
@MaNhaTro int ,
@MaLoaiNha int,
@DienTich real,
@GiaPhong money,
@Quan nvarchar(50),
@ThongTinNhaTro nvarchar(50),
@NgayDang date
as
begin
	update  NHATRO
	set MaLoaiNha = @MaLoaiNha,
	DienTich = @DienTich,
	GiaPhong = @GiaPhong,
	Quan = @Quan,
	ThongTinNhaTro = @ThongTinNhaTro,
	NgayDang = @NgayDang
	where MaNhaTro = @MaNhaTro
end
go
-------------------
create proc sp_DanhGia_update
@MaNhaTro int,
@MaNguoiDung int,
@DanhGia bit,
@ThongTinDanhGia nvarchar(50)
as
begin
	update  DanhGia
	set DanhGia = @DanhGia,
	ThongTinDanhGia = @ThongTinDanhGia
	where MaNhaTro = @MaNhaTro
		and MaNguoiDung = @MaNguoiDung
end
go
----------------

