USE [master]
GO
/****** Object:  Database [PS18293_NguyenHoangDuy_NhaTro]    Script Date: 15/06/2021 16:38:14 ******/
CREATE DATABASE [PS18293_NguyenHoangDuy_NhaTro]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PS18293_NguyenHoangDuy_NhaTro', FILENAME = N'E:\HocTap\Microsoft SQL Server 2019\MSSQL15.DUYPLUS\MSSQL\DATA\PS18293_NguyenHoangDuy_NhaTro.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PS18293_NguyenHoangDuy_NhaTro_log', FILENAME = N'E:\HocTap\Microsoft SQL Server 2019\MSSQL15.DUYPLUS\MSSQL\DATA\PS18293_NguyenHoangDuy_NhaTro_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PS18293_NguyenHoangDuy_NhaTro] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PS18293_NguyenHoangDuy_NhaTro].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PS18293_NguyenHoangDuy_NhaTro] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PS18293_NguyenHoangDuy_NhaTro] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PS18293_NguyenHoangDuy_NhaTro] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PS18293_NguyenHoangDuy_NhaTro] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PS18293_NguyenHoangDuy_NhaTro] SET ARITHABORT OFF 
GO
ALTER DATABASE [PS18293_NguyenHoangDuy_NhaTro] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PS18293_NguyenHoangDuy_NhaTro] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PS18293_NguyenHoangDuy_NhaTro] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PS18293_NguyenHoangDuy_NhaTro] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PS18293_NguyenHoangDuy_NhaTro] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PS18293_NguyenHoangDuy_NhaTro] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PS18293_NguyenHoangDuy_NhaTro] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PS18293_NguyenHoangDuy_NhaTro] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PS18293_NguyenHoangDuy_NhaTro] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PS18293_NguyenHoangDuy_NhaTro] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PS18293_NguyenHoangDuy_NhaTro] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PS18293_NguyenHoangDuy_NhaTro] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PS18293_NguyenHoangDuy_NhaTro] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PS18293_NguyenHoangDuy_NhaTro] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PS18293_NguyenHoangDuy_NhaTro] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PS18293_NguyenHoangDuy_NhaTro] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PS18293_NguyenHoangDuy_NhaTro] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PS18293_NguyenHoangDuy_NhaTro] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PS18293_NguyenHoangDuy_NhaTro] SET  MULTI_USER 
GO
ALTER DATABASE [PS18293_NguyenHoangDuy_NhaTro] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PS18293_NguyenHoangDuy_NhaTro] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PS18293_NguyenHoangDuy_NhaTro] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PS18293_NguyenHoangDuy_NhaTro] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PS18293_NguyenHoangDuy_NhaTro] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PS18293_NguyenHoangDuy_NhaTro] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PS18293_NguyenHoangDuy_NhaTro] SET QUERY_STORE = OFF
GO
USE [PS18293_NguyenHoangDuy_NhaTro]
GO
/****** Object:  User [duyplus]    Script Date: 15/06/2021 16:38:14 ******/
CREATE USER [duyplus] FOR LOGIN [duyplus] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_TongDislike]    Script Date: 15/06/2021 16:38:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fn_TongDislike](@MaNhaTro int)
returns int
as
begin
	return (select count(DanhGia) from DANHGIA
		where MaNhaTro = @MaNhaTro
		and DanhGia = 0)
end
GO
/****** Object:  UserDefinedFunction [dbo].[fn_TongLike]    Script Date: 15/06/2021 16:38:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fn_TongLike](@MaNhaTro int)
returns int
as
begin
	return (select count(DanhGia) from DANHGIA
		where MaNhaTro = @Manhatro
		and DanhGia = 1)
end
GO
/****** Object:  Table [dbo].[NGUOIDUNG]    Script Date: 15/06/2021 16:38:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NGUOIDUNG](
	[MaNguoiDung] [int] IDENTITY(1,1) NOT NULL,
	[TenNguoiDung] [nvarchar](50) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[DienThoai] [varchar](15) NOT NULL,
	[DiaChi] [nvarchar](50) NOT NULL,
	[Quan] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_MaNguoiDung]    Script Date: 15/06/2021 16:38:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fn_MaNguoiDung](
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
GO
/****** Object:  Table [dbo].[LOAINHA]    Script Date: 15/06/2021 16:38:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAINHA](
	[MaLoaiNha] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiNha] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoaiNha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHATRO]    Script Date: 15/06/2021 16:38:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHATRO](
	[MaNhaTro] [int] IDENTITY(1,1) NOT NULL,
	[MaLoaiNha] [int] NULL,
	[DienTich] [float] NOT NULL,
	[GiaPhong] [int] NOT NULL,
	[DiaChi] [nvarchar](50) NOT NULL,
	[Quan] [nvarchar](20) NULL,
	[MoTa] [nvarchar](20) NOT NULL,
	[NgayDangTin] [date] NOT NULL,
	[MaNguoiDung] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNhaTro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Top5]    Script Date: 15/06/2021 16:38:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Top5]
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
GO
/****** Object:  Table [dbo].[DANHGIA]    Script Date: 15/06/2021 16:38:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANHGIA](
	[MaNguoiDung] [int] NOT NULL,
	[MaNhaTro] [int] NOT NULL,
	[DanhGia] [bit] NOT NULL,
	[NoiDungDanhGia] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNguoiDung] ASC,
	[MaNhaTro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[DANHGIA] ([MaNguoiDung], [MaNhaTro], [DanhGia], [NoiDungDanhGia]) VALUES (1, 2, 1, N'Nhà trọ tốt')
INSERT [dbo].[DANHGIA] ([MaNguoiDung], [MaNhaTro], [DanhGia], [NoiDungDanhGia]) VALUES (2, 5, 0, N'Giá cao')
INSERT [dbo].[DANHGIA] ([MaNguoiDung], [MaNhaTro], [DanhGia], [NoiDungDanhGia]) VALUES (3, 3, 1, N'Nhà trọ tốt')
INSERT [dbo].[DANHGIA] ([MaNguoiDung], [MaNhaTro], [DanhGia], [NoiDungDanhGia]) VALUES (4, 1, 1, N'Cổng cao')
INSERT [dbo].[DANHGIA] ([MaNguoiDung], [MaNhaTro], [DanhGia], [NoiDungDanhGia]) VALUES (4, 7, 1, N'Giá hợp lí')
INSERT [dbo].[DANHGIA] ([MaNguoiDung], [MaNhaTro], [DanhGia], [NoiDungDanhGia]) VALUES (5, 4, 0, N'Xuống cấp')
INSERT [dbo].[DANHGIA] ([MaNguoiDung], [MaNhaTro], [DanhGia], [NoiDungDanhGia]) VALUES (6, 6, 0, N'Giá cao')
INSERT [dbo].[DANHGIA] ([MaNguoiDung], [MaNhaTro], [DanhGia], [NoiDungDanhGia]) VALUES (7, 3, 0, N'Đường xấu')
INSERT [dbo].[DANHGIA] ([MaNguoiDung], [MaNhaTro], [DanhGia], [NoiDungDanhGia]) VALUES (8, 7, 1, N'Nhà đẹp')
INSERT [dbo].[DANHGIA] ([MaNguoiDung], [MaNhaTro], [DanhGia], [NoiDungDanhGia]) VALUES (9, 9, 0, N'Mạng kém')
INSERT [dbo].[DANHGIA] ([MaNguoiDung], [MaNhaTro], [DanhGia], [NoiDungDanhGia]) VALUES (10, 5, 1, N'Ngõ rộng')
INSERT [dbo].[DANHGIA] ([MaNguoiDung], [MaNhaTro], [DanhGia], [NoiDungDanhGia]) VALUES (11, 5, 1, N'Giá cao')
INSERT [dbo].[DANHGIA] ([MaNguoiDung], [MaNhaTro], [DanhGia], [NoiDungDanhGia]) VALUES (12, 9, 1, N'Nhà đẹp')
INSERT [dbo].[DANHGIA] ([MaNguoiDung], [MaNhaTro], [DanhGia], [NoiDungDanhGia]) VALUES (13, 8, 1, N'Giá tốt')
INSERT [dbo].[DANHGIA] ([MaNguoiDung], [MaNhaTro], [DanhGia], [NoiDungDanhGia]) VALUES (14, 2, 0, N'Cổng thấp')
INSERT [dbo].[DANHGIA] ([MaNguoiDung], [MaNhaTro], [DanhGia], [NoiDungDanhGia]) VALUES (15, 4, 1, N'Thoáng mát')
GO
SET IDENTITY_INSERT [dbo].[LOAINHA] ON 

INSERT [dbo].[LOAINHA] ([MaLoaiNha], [TenLoaiNha]) VALUES (1, N'Nhà trọ chung chủ')
INSERT [dbo].[LOAINHA] ([MaLoaiNha], [TenLoaiNha]) VALUES (2, N'Nhà trọ tự quản lý')
INSERT [dbo].[LOAINHA] ([MaLoaiNha], [TenLoaiNha]) VALUES (3, N'Chung cư')
INSERT [dbo].[LOAINHA] ([MaLoaiNha], [TenLoaiNha]) VALUES (4, N'Homestay')
INSERT [dbo].[LOAINHA] ([MaLoaiNha], [TenLoaiNha]) VALUES (5, N'Ký túc xá')
SET IDENTITY_INSERT [dbo].[LOAINHA] OFF
GO
SET IDENTITY_INSERT [dbo].[NGUOIDUNG] ON 

INSERT [dbo].[NGUOIDUNG] ([MaNguoiDung], [TenNguoiDung], [GioiTinh], [DienThoai], [DiaChi], [Quan], [Email]) VALUES (1, N'Nguyễn Hoàng Duy', 1, N'0919993715', N'140 Huỳnh Văn Bánh, Phường 12', N'Phú Nhuận', N'duy@gmail.com')
INSERT [dbo].[NGUOIDUNG] ([MaNguoiDung], [TenNguoiDung], [GioiTinh], [DienThoai], [DiaChi], [Quan], [Email]) VALUES (2, N'Nguyễn Hoàng Dũng', 1, N'0123456789', N'370 Lê Văn Lương, Phường Tân Hưng', N'Quận 7', N'dung@gmail.com')
INSERT [dbo].[NGUOIDUNG] ([MaNguoiDung], [TenNguoiDung], [GioiTinh], [DienThoai], [DiaChi], [Quan], [Email]) VALUES (3, N'Đinh Tiến Đạt', 1, N'0164846138', N'113 Cộng Hoà, Phường 12', N'Tân Bình', N'dat@gmail.com')
INSERT [dbo].[NGUOIDUNG] ([MaNguoiDung], [TenNguoiDung], [GioiTinh], [DienThoai], [DiaChi], [Quan], [Email]) VALUES (4, N'Hồ Hoài Hương', 0, N'0894153484', N'150 Trường Chinh, Phường 12', N'Tân Bình', N'huong@gmail.com')
INSERT [dbo].[NGUOIDUNG] ([MaNguoiDung], [TenNguoiDung], [GioiTinh], [DienThoai], [DiaChi], [Quan], [Email]) VALUES (5, N'Thạch Nhật Tiến', 1, N'0345451245', N'233 Đinh Bộ Lĩnh, Phường 26', N'Bình Thạnh', N'tien@gmail.com')
INSERT [dbo].[NGUOIDUNG] ([MaNguoiDung], [TenNguoiDung], [GioiTinh], [DienThoai], [DiaChi], [Quan], [Email]) VALUES (6, N'Trần Nam Kiệt', 1, N'0324444517', N'379 Huỳnh Tấn Phát, Phường Tân Thuận Đông', N'Quận 7', N'kiet@gmail.com')
INSERT [dbo].[NGUOIDUNG] ([MaNguoiDung], [TenNguoiDung], [GioiTinh], [DienThoai], [DiaChi], [Quan], [Email]) VALUES (7, N'Ngyễn Thị Thu', 0, N'0789114256', N'29 Nguyễn Trung Ngạn, Phường Bến Nghé', N'Quận 1', N'thu@gmail.com')
INSERT [dbo].[NGUOIDUNG] ([MaNguoiDung], [TenNguoiDung], [GioiTinh], [DienThoai], [DiaChi], [Quan], [Email]) VALUES (8, N'Ngô Minh Kiên', 1, N'0412454359', N'496 Nguyễn Đình Chiểu, Phường 4', N'Quận 3', N'kien@gmail.com')
INSERT [dbo].[NGUOIDUNG] ([MaNguoiDung], [TenNguoiDung], [GioiTinh], [DienThoai], [DiaChi], [Quan], [Email]) VALUES (9, N'Võ Thuỳ Oanh', 0, N'0178811561', N'124 Nam Kỳ Khởi Nghĩa, Phường Bến Thành', N'Quận 1', N'oanh@gmail.com')
INSERT [dbo].[NGUOIDUNG] ([MaNguoiDung], [TenNguoiDung], [GioiTinh], [DienThoai], [DiaChi], [Quan], [Email]) VALUES (10, N'Trần Thu Hiền', 0, N'0365841258', N'01 Lương Định Của, Phường An phú', N'Quận 2', N'hien@gmail.com')
INSERT [dbo].[NGUOIDUNG] ([MaNguoiDung], [TenNguoiDung], [GioiTinh], [DienThoai], [DiaChi], [Quan], [Email]) VALUES (11, N'Nguyễn Văn Đức', 1, N'0685596317', N'139 Dương Bá Trạc, Phường 1', N'Quận 8', N'duc@gmail.com')
INSERT [dbo].[NGUOIDUNG] ([MaNguoiDung], [TenNguoiDung], [GioiTinh], [DienThoai], [DiaChi], [Quan], [Email]) VALUES (12, N'Lê Văn Hưng', 1, N'0853127141', N'191 Quang Trung, Phường Hiệp Phú', N'Quận 9', N'hung@gmail.com')
INSERT [dbo].[NGUOIDUNG] ([MaNguoiDung], [TenNguoiDung], [GioiTinh], [DienThoai], [DiaChi], [Quan], [Email]) VALUES (13, N'Nguyễn Thị Nhung', 0, N'0252347855', N'61 đường 5, KP2, Phường Cát Lái', N'Quận 2', N'nhung@gmail.com')
INSERT [dbo].[NGUOIDUNG] ([MaNguoiDung], [TenNguoiDung], [GioiTinh], [DienThoai], [DiaChi], [Quan], [Email]) VALUES (14, N'Trần Ngọc Anh', 1, N'0354124778', N'85 Trần Đình Xu, Phường Nguyễn Cư Trinh,', N'Quận 1', N'anh@gmail.com')
INSERT [dbo].[NGUOIDUNG] ([MaNguoiDung], [TenNguoiDung], [GioiTinh], [DienThoai], [DiaChi], [Quan], [Email]) VALUES (15, N'Lê Thuý Kiều', 0, N'0235878912', N'968 Quốc lộ 1A, Phường Linh Trung', N'Thủ Đức', N'kieu@gmail.com')
INSERT [dbo].[NGUOIDUNG] ([MaNguoiDung], [TenNguoiDung], [GioiTinh], [DienThoai], [DiaChi], [Quan], [Email]) VALUES (16, N'CAO HOÀNG PHÚC', 0, N'0362555485', N'Nguyễn Thị Minh Khai, Bến Thành', N'Quận 7', N'thanhpho@fpt.edu.vn')
INSERT [dbo].[NGUOIDUNG] ([MaNguoiDung], [TenNguoiDung], [GioiTinh], [DienThoai], [DiaChi], [Quan], [Email]) VALUES (17, N'CAO HOÀNG PHÚC', 0, N'0362555485', N'Nguyễn Thị Minh Khai, Bến Thành', N'Quận 7', N'thanhpho@fpt.edu.vn')
SET IDENTITY_INSERT [dbo].[NGUOIDUNG] OFF
GO
SET IDENTITY_INSERT [dbo].[NHATRO] ON 

INSERT [dbo].[NHATRO] ([MaNhaTro], [MaLoaiNha], [DienTich], [GiaPhong], [DiaChi], [Quan], [MoTa], [NgayDangTin], [MaNguoiDung]) VALUES (1, 2, 25.5, 1000000, N'Thống Nhất, Phường 16', N'Gò Vấp', N'Cho thuê', CAST(N'2021-02-12' AS Date), 1)
INSERT [dbo].[NHATRO] ([MaNhaTro], [MaLoaiNha], [DienTich], [GiaPhong], [DiaChi], [Quan], [MoTa], [NgayDangTin], [MaNguoiDung]) VALUES (2, 3, 30, 5000000, N'4 Trần Khắc Chân, Tân Định', N'Quận 1', N'Mặt bằng đẹp', CAST(N'2021-10-02' AS Date), 2)
INSERT [dbo].[NHATRO] ([MaNhaTro], [MaLoaiNha], [DienTich], [GiaPhong], [DiaChi], [Quan], [MoTa], [NgayDangTin], [MaNguoiDung]) VALUES (3, 1, 40, 2000000, N'27B Hoa Sứ, Phường 7', N'Phú Nhuận', N'Ngõ rộng', CAST(N'2021-05-01' AS Date), 3)
INSERT [dbo].[NHATRO] ([MaNhaTro], [MaLoaiNha], [DienTich], [GiaPhong], [DiaChi], [Quan], [MoTa], [NgayDangTin], [MaNguoiDung]) VALUES (4, 5, 100, 3500000, N'Lê Tự Tài, Phường 4', N'Phú Nhuận', N'Cho thuê nguyên căn', CAST(N'2021-08-25' AS Date), 4)
INSERT [dbo].[NHATRO] ([MaNhaTro], [MaLoaiNha], [DienTich], [GiaPhong], [DiaChi], [Quan], [MoTa], [NgayDangTin], [MaNguoiDung]) VALUES (5, 2, 50, 1700000, N'793 Trần Xuân Soạn, Tân Hưng', N'Quận 7', N'Cho thuê dài hạn', CAST(N'2021-11-23' AS Date), 7)
INSERT [dbo].[NHATRO] ([MaNhaTro], [MaLoaiNha], [DienTich], [GiaPhong], [DiaChi], [Quan], [MoTa], [NgayDangTin], [MaNguoiDung]) VALUES (6, 4, 60, 6000000, N'215 Nguyễn Văn Hưởng, Thảo Điền', N'Quận 2', N'Lối đi thông thoáng', CAST(N'2021-03-01' AS Date), 6)
INSERT [dbo].[NHATRO] ([MaNhaTro], [MaLoaiNha], [DienTich], [GiaPhong], [DiaChi], [Quan], [MoTa], [NgayDangTin], [MaNguoiDung]) VALUES (7, 5, 35, 4300000, N'930 Nguyễn Thị Định, Thạnh Mỹ Lợi', N'Quận 2', N'Cho thuê', CAST(N'2021-10-18' AS Date), 5)
INSERT [dbo].[NHATRO] ([MaNhaTro], [MaLoaiNha], [DienTich], [GiaPhong], [DiaChi], [Quan], [MoTa], [NgayDangTin], [MaNguoiDung]) VALUES (8, 3, 45, 4700000, N'31 Bình Phú, Phường 10', N'Quận 6', N'Cho thuê dài hạn', CAST(N'2021-09-14' AS Date), 8)
INSERT [dbo].[NHATRO] ([MaNhaTro], [MaLoaiNha], [DienTich], [GiaPhong], [DiaChi], [Quan], [MoTa], [NgayDangTin], [MaNguoiDung]) VALUES (9, 4, 70, 7200000, N'21 Đỗ Thúc Tịnh, Phường 12', N'Gò Vấp', N'Giá cả phải chăng', CAST(N'2021-05-29' AS Date), 10)
INSERT [dbo].[NHATRO] ([MaNhaTro], [MaLoaiNha], [DienTich], [GiaPhong], [DiaChi], [Quan], [MoTa], [NgayDangTin], [MaNguoiDung]) VALUES (10, 2, 65, 2500000, N'Bùi Đình Túy, Phường 24', N'Bình Thạnh', N'Cho thuê', CAST(N'2021-11-26' AS Date), 9)
INSERT [dbo].[NHATRO] ([MaNhaTro], [MaLoaiNha], [DienTich], [GiaPhong], [DiaChi], [Quan], [MoTa], [NgayDangTin], [MaNguoiDung]) VALUES (11, 4, 40, 4600000, N'174 Tân Hòa Đông, Phường 14', N'Quận 6', N'Cho thuê', CAST(N'2021-03-06' AS Date), 11)
INSERT [dbo].[NHATRO] ([MaNhaTro], [MaLoaiNha], [DienTich], [GiaPhong], [DiaChi], [Quan], [MoTa], [NgayDangTin], [MaNguoiDung]) VALUES (12, 1, 85, 8800000, N'Nguyễn Thị Thập, Bình Thuận', N'Quận 7', N'Ngõ rộng', CAST(N'2021-07-12' AS Date), 12)
INSERT [dbo].[NHATRO] ([MaNhaTro], [MaLoaiNha], [DienTich], [GiaPhong], [DiaChi], [Quan], [MoTa], [NgayDangTin], [MaNguoiDung]) VALUES (13, 1, 70, 2800000, N'243 Chu Văn An, Phường 12', N'Bình Thạnh', N'Giá cả phải chăng', CAST(N'2021-04-22' AS Date), 13)
INSERT [dbo].[NHATRO] ([MaNhaTro], [MaLoaiNha], [DienTich], [GiaPhong], [DiaChi], [Quan], [MoTa], [NgayDangTin], [MaNguoiDung]) VALUES (14, 3, 50, 3100000, N'Nguyễn Trãi, Nguyễn Cư Trinh', N'Quận 1', N'Ngõ rộng', CAST(N'2021-01-12' AS Date), 14)
INSERT [dbo].[NHATRO] ([MaNhaTro], [MaLoaiNha], [DienTich], [GiaPhong], [DiaChi], [Quan], [MoTa], [NgayDangTin], [MaNguoiDung]) VALUES (15, 2, 20, 6500000, N'63/39 Lê Văn Sỹ, Phường 11', N'Phú Nhuận', N'Cho thuê dài hạn', CAST(N'2021-06-07' AS Date), 15)
SET IDENTITY_INSERT [dbo].[NHATRO] OFF
GO
ALTER TABLE [dbo].[DANHGIA]  WITH CHECK ADD FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[NGUOIDUNG] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[DANHGIA]  WITH CHECK ADD FOREIGN KEY([MaNhaTro])
REFERENCES [dbo].[NHATRO] ([MaNhaTro])
GO
ALTER TABLE [dbo].[NHATRO]  WITH CHECK ADD FOREIGN KEY([MaLoaiNha])
REFERENCES [dbo].[LOAINHA] ([MaLoaiNha])
GO
ALTER TABLE [dbo].[NHATRO]  WITH CHECK ADD FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[NGUOIDUNG] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[NHATRO]  WITH CHECK ADD CHECK  (([DienTich]>(0)))
GO
ALTER TABLE [dbo].[NHATRO]  WITH CHECK ADD CHECK  (([GiaPhong]>(0)))
GO
/****** Object:  StoredProcedure [dbo].[sp_DanhGia_insert]    Script Date: 15/06/2021 16:38:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_DanhGia_insert] 
	@MaNhaTro int,
	@MaNguoiDung int,
	@DanhGia bit,
	@ThongTinDanhGia nvarchar(50)
AS
BEGIN
	INSERT INTO DANHGIA VALUES(@MaNhaTro,@MaNguoiDung ,@DanhGia ,@ThongTinDanhGia)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DanhGiaNhatro_select]    Script Date: 15/06/2021 16:38:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DanhGiaNhatro_select]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_NguoiDung_insert]    Script Date: 15/06/2021 16:38:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_NguoiDung_insert]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_NhaTro_Dislike_delete]    Script Date: 15/06/2021 16:38:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_NhaTro_Dislike_delete]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_NhaTro_NgayDang_delete]    Script Date: 15/06/2021 16:38:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_NhaTro_NgayDang_delete]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_NhaTro_select]    Script Date: 15/06/2021 16:38:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_NhaTro_select]
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
GO
USE [master]
GO
ALTER DATABASE [PS18293_NguyenHoangDuy_NhaTro] SET  READ_WRITE 
GO
