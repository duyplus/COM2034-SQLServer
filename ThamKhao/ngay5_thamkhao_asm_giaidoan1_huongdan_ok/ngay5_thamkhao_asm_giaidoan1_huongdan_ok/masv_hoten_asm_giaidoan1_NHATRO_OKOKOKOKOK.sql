



use master
go
drop database MASV_HOTEN_NHATRO
go
create database MASV_HOTEN_NHATRO
GO
use MASV_HOTEN_NHATRO
go
--1 tạo bảng LOAINHA
create Table LOAINHA
(
	MaLoaiNha int identity(1,1) primary key,
	TenLoaiNha nvarchar(50) not null
)
go
--2. bảng NGUOIDUNG
create table NGUOIDUNG
(
	MaNguoiDung int identity(1,1) primary key,
	TenNguoiDung nvarchar(50) not null,
	GioiTinh bit not null,
	DienThoai varchar(15) not null,
	diachi nvarchar(50) not null,
	Quan nvarchar(20),
	Email varchar(30)
)
go
--3. bảng NHATRO
create table NHATRO
(
	MaNhaTro int identity(1,1) primary key,
	MaLoaiNha int references LOAINHA(MaLoaiNha),
	DienTich float check(DienTich>0) not null,
	GiaPhong int check(GiaPhong>0) not null,
	DiaChi nvarchar(50) not null,
	Quan nvarchar(20),
	MoTa nvarchar(100) not null,
	NgayDangTin date not null,
	MaNguoiDung int references NGUOIDUNG(MaNguoiDung)
)
go
--4. tạo bảng DANHGIA
create table DANHGIA
(
	MaNguoiDung int references NGUOIDUNG(MaNguoiDung),
	MaNhaTro int references NHATRO(MaNhaTro),
	DanhGia bit not null,
	NoiDungDanhGia nvarchar(100) not null
	primary key(MaNguoiDung, MaNhaTro)
)
go