use master
go
drop database masv_hoten_NHATRO
go
create database masv_hoten_NHATRO
GO
use masv_hoten_NHATRO
go

create table LOAINHATRO
(
	MaLoaiNha int identity(1,1) primary key,
	TenLoaiNha nvarchar(50) not null
)
go
create table NGUOIDUNG
(
	MaNguoiDung int identity(1,1) primary key,
	TenNguoiDung nvarchar(50) not null,
	GioiTinh bit not null,
	DienThoai varchar(15) not null,
	DiaChi nvarchar(50) not null,
	Email varchar(50) not null
)
go
create table NHATRO
(
	MaNhaTro int identity(1,1) primary key,
	MaLoaiNha int references LOAINHATRO(MaLoaiNha),
	DienTich float check(DienTich>0) not null,
	GiaPhong int check(GiaPhong>0) not null,
	DiaChi nvarchar(50) not null,
	ThongTinNhaTro nvarchar(50) not null,
	NgayDang date not null,
	MaNguoiDung int references NGUOIDUNG(MaNguoiDung)
)
go

Create table DANHGIA
(
	MaNhaTro int references NHATRO(MaNhaTro),
	MaNguoiDung int references NGUOIDUNG(MaNguoiDung),
	DanhGia bit,
	NoiDungDanhGia nvarchar(50),
	primary key (MaNhaTro, MaNguoiDung)
)
go