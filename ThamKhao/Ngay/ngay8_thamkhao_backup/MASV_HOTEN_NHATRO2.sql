USE [master]
GO
/****** Object:  Database [masv_hoten_NHATRO2]    Script Date: 6/10/2021 2:05:18 PM ******/
CREATE DATABASE [masv_hoten_NHATRO2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'masv_hoten_NHATRO2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\masv_hoten_NHATRO2.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'masv_hoten_NHATRO2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\masv_hoten_NHATRO2_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [masv_hoten_NHATRO2] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [masv_hoten_NHATRO2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [masv_hoten_NHATRO2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [masv_hoten_NHATRO2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [masv_hoten_NHATRO2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [masv_hoten_NHATRO2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [masv_hoten_NHATRO2] SET ARITHABORT OFF 
GO
ALTER DATABASE [masv_hoten_NHATRO2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [masv_hoten_NHATRO2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [masv_hoten_NHATRO2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [masv_hoten_NHATRO2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [masv_hoten_NHATRO2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [masv_hoten_NHATRO2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [masv_hoten_NHATRO2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [masv_hoten_NHATRO2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [masv_hoten_NHATRO2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [masv_hoten_NHATRO2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [masv_hoten_NHATRO2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [masv_hoten_NHATRO2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [masv_hoten_NHATRO2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [masv_hoten_NHATRO2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [masv_hoten_NHATRO2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [masv_hoten_NHATRO2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [masv_hoten_NHATRO2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [masv_hoten_NHATRO2] SET RECOVERY FULL 
GO
ALTER DATABASE [masv_hoten_NHATRO2] SET  MULTI_USER 
GO
ALTER DATABASE [masv_hoten_NHATRO2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [masv_hoten_NHATRO2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [masv_hoten_NHATRO2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [masv_hoten_NHATRO2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [masv_hoten_NHATRO2] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'masv_hoten_NHATRO2', N'ON'
GO
USE [masv_hoten_NHATRO2]
GO
/****** Object:  Table [dbo].[DanhGia]    Script Date: 6/10/2021 2:05:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhGia](
	[MaNhaTro] [int] NOT NULL,
	[MaNguoiDung] [int] NOT NULL,
	[DanhGia] [bit] NOT NULL,
	[ThongTinDanhGia] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNhaTro] ASC,
	[MaNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOAINHA]    Script Date: 6/10/2021 2:05:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAINHA](
	[MaLoaiNha] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiNha] [nvarchar](50) NOT NULL,
	[ThongTinLoaiNha] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoaiNha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NGUOIDUNG]    Script Date: 6/10/2021 2:05:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NGUOIDUNG](
	[MaNguoiDung] [int] IDENTITY(1,1) NOT NULL,
	[TenNguoiDung] [nvarchar](50) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[DienThoai] [varchar](15) NOT NULL,
	[DiaChi] [nvarchar](50) NOT NULL,
	[Quan] [nvarchar](50) NOT NULL,
	[Email] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NHATRO]    Script Date: 6/10/2021 2:05:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHATRO](
	[MaNhaTro] [int] IDENTITY(1,1) NOT NULL,
	[MaLoaiNha] [int] NOT NULL,
	[DienTich] [real] NOT NULL,
	[GiaPhong] [money] NOT NULL,
	[Quan] [nvarchar](50) NOT NULL,
	[ThongTinNhaTro] [nvarchar](50) NULL,
	[NgayDang] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNhaTro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TAIKHOAN]    Script Date: 6/10/2021 2:05:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TAIKHOAN](
	[TENNGUOIDUNG] [varchar](10) NOT NULL,
	[MATKHAU] [varchar](10) NULL,
	[TUOI] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TENNGUOIDUNG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[LOAINHA] ON 

INSERT [dbo].[LOAINHA] ([MaLoaiNha], [TenLoaiNha], [ThongTinLoaiNha]) VALUES (1, N'Nhà trọ bình dân', N'Nhà trọ giá rẻ cho sinh viên, học sinh')
INSERT [dbo].[LOAINHA] ([MaLoaiNha], [TenLoaiNha], [ThongTinLoaiNha]) VALUES (2, N'Cho thuê phòng', N'Nhà trọ dành cho người đi làm,sv')
INSERT [dbo].[LOAINHA] ([MaLoaiNha], [TenLoaiNha], [ThongTinLoaiNha]) VALUES (3, N'Cho thuê nguyên căn', N'Dành cho kinh doanh hộ GD')
INSERT [dbo].[LOAINHA] ([MaLoaiNha], [TenLoaiNha], [ThongTinLoaiNha]) VALUES (4, N'Cho thuê căn hộ', N'căn hộ')
SET IDENTITY_INSERT [dbo].[LOAINHA] OFF
SET IDENTITY_INSERT [dbo].[NGUOIDUNG] ON 

INSERT [dbo].[NGUOIDUNG] ([MaNguoiDung], [TenNguoiDung], [GioiTinh], [DienThoai], [DiaChi], [Quan], [Email]) VALUES (1, N'Đỗ Bùi Quý', 1, N'0933622633', N'41 Tôn thất tùng , Phạm ngũ Lão', N'Quận 1', N'quygsvsf@fpt.edu.vn')
INSERT [dbo].[NGUOIDUNG] ([MaNguoiDung], [TenNguoiDung], [GioiTinh], [DienThoai], [DiaChi], [Quan], [Email]) VALUES (2, N'Bùi Thị Kim Hà', 0, N'0964521381', N'170 Nguyễn Duy Trinh, Bình Trưng Tây', N'Quận 2', N'kimhavchvcg@fpt.edu.vn')
INSERT [dbo].[NGUOIDUNG] ([MaNguoiDung], [TenNguoiDung], [GioiTinh], [DienThoai], [DiaChi], [Quan], [Email]) VALUES (3, N'Đỗ Huyền Trân', 1, N'0315896412', N'70 Nguyễn kim, phường 10', N'Quận 5', N'huyentrancvjhcvsh@fpt.edu.vn')
INSERT [dbo].[NGUOIDUNG] ([MaNguoiDung], [TenNguoiDung], [GioiTinh], [DienThoai], [DiaChi], [Quan], [Email]) VALUES (4, N'Đỗ Văn Phú', 1, N'0164785215', N'Gò Vấp , phường 10', N'Quận Gò Vấp', N'vanphucbsjchv@fpt.edu.vn')
INSERT [dbo].[NGUOIDUNG] ([MaNguoiDung], [TenNguoiDung], [GioiTinh], [DienThoai], [DiaChi], [Quan], [Email]) VALUES (5, N'Bùi Thị Kim Hoa', 0, N'0961547852', N'Trần Hưng Đạo, phường 3', N'Quận 5', N'kimhoavshvshc@fpt.edu.vn')
INSERT [dbo].[NGUOIDUNG] ([MaNguoiDung], [TenNguoiDung], [GioiTinh], [DienThoai], [DiaChi], [Quan], [Email]) VALUES (6, N'Bùi Vân Mây', 0, N'0965847521', N'Trần nhân tông,phường 7', N'Quận 3', N'vanmay@fpt.edu.vn')
INSERT [dbo].[NGUOIDUNG] ([MaNguoiDung], [TenNguoiDung], [GioiTinh], [DienThoai], [DiaChi], [Quan], [Email]) VALUES (7, N'Nguyễn Việt Cường', 1, N'0369854123', N'Sương Nguyệt Ánh, P.Bến Thành', N'Quận 1', N'vietcuong@fpt.edu.vn')
INSERT [dbo].[NGUOIDUNG] ([MaNguoiDung], [TenNguoiDung], [GioiTinh], [DienThoai], [DiaChi], [Quan], [Email]) VALUES (8, N'Nguyễn Thanh Trúc', 0, N'03699554857', N'Bùi Thị Xuân, P.Bến Thành', N'Quận 1', N'Thanhtruc@fpt.edu.vn')
INSERT [dbo].[NGUOIDUNG] ([MaNguoiDung], [TenNguoiDung], [GioiTinh], [DienThoai], [DiaChi], [Quan], [Email]) VALUES (9, N'Nguyễn Thanh Thùy', 0, N'0362555485', N'Nguyễn Thị Minh Khai, P.Bến Nghé', N'Quận 1', N'Thanhthuy@fpt.edu.vn')
INSERT [dbo].[NGUOIDUNG] ([MaNguoiDung], [TenNguoiDung], [GioiTinh], [DienThoai], [DiaChi], [Quan], [Email]) VALUES (10, N'CAO HOÀNG PHÚC', 0, N'0362555485', N'Nguyễn Thị Minh Khai, P.BếnThành', N'Quận 7', N'thanhpho@fpt.edu.vn')
INSERT [dbo].[NGUOIDUNG] ([MaNguoiDung], [TenNguoiDung], [GioiTinh], [DienThoai], [DiaChi], [Quan], [Email]) VALUES (11, N'CAO HOÀNG PHÚC', 0, N'0362555485', N'Nguyễn Thị Minh Khai, P.BếnThành', N'Quận 7', N'thanhpho@fpt.edu.vn')
INSERT [dbo].[NGUOIDUNG] ([MaNguoiDung], [TenNguoiDung], [GioiTinh], [DienThoai], [DiaChi], [Quan], [Email]) VALUES (12, N'CAO HOÀNG PHÚC', 0, N'0362555485', N'Nguyễn Thị Minh Khai, P.BếnThành', N'Quận 7', N'thanhpho@fpt.edu.vn')
SET IDENTITY_INSERT [dbo].[NGUOIDUNG] OFF
SET IDENTITY_INSERT [dbo].[NHATRO] ON 

INSERT [dbo].[NHATRO] ([MaNhaTro], [MaLoaiNha], [DienTich], [GiaPhong], [Quan], [ThongTinNhaTro], [NgayDang]) VALUES (1, 1, 39, 1000000.0000, N'Quận 1', N'Giá cả phải chăng', CAST(N'2013-02-10' AS Date))
INSERT [dbo].[NHATRO] ([MaNhaTro], [MaLoaiNha], [DienTich], [GiaPhong], [Quan], [ThongTinNhaTro], [NgayDang]) VALUES (2, 2, 60.7, 5000000.0000, N'Quận 2', N'Cho thuê làm cửa hàng', CAST(N'2013-08-01' AS Date))
INSERT [dbo].[NHATRO] ([MaNhaTro], [MaLoaiNha], [DienTich], [GiaPhong], [Quan], [ThongTinNhaTro], [NgayDang]) VALUES (3, 3, 50, 7000000.0000, N'Quận 5', N'Cho thuê nguyên căn', CAST(N'2013-06-12' AS Date))
INSERT [dbo].[NHATRO] ([MaNhaTro], [MaLoaiNha], [DienTich], [GiaPhong], [Quan], [ThongTinNhaTro], [NgayDang]) VALUES (4, 4, 100, 1000000.0000, N'Quận Gò Vấp', N'Cho Thuê dài hạn', CAST(N'2014-12-02' AS Date))
INSERT [dbo].[NHATRO] ([MaNhaTro], [MaLoaiNha], [DienTich], [GiaPhong], [Quan], [ThongTinNhaTro], [NgayDang]) VALUES (5, 2, 40, 8000000.0000, N'Quận 5', N'Cho Thuê ', CAST(N'2014-08-22' AS Date))
INSERT [dbo].[NHATRO] ([MaNhaTro], [MaLoaiNha], [DienTich], [GiaPhong], [Quan], [ThongTinNhaTro], [NgayDang]) VALUES (6, 1, 50.6, 4000000.0000, N'Quận 7', N'Cho Thuê', CAST(N'2014-11-22' AS Date))
INSERT [dbo].[NHATRO] ([MaNhaTro], [MaLoaiNha], [DienTich], [GiaPhong], [Quan], [ThongTinNhaTro], [NgayDang]) VALUES (7, 3, 66.2, 4500000.0000, N'Quận 8', N'Cho Thuê dài hạn', CAST(N'2015-04-22' AS Date))
INSERT [dbo].[NHATRO] ([MaNhaTro], [MaLoaiNha], [DienTich], [GiaPhong], [Quan], [ThongTinNhaTro], [NgayDang]) VALUES (8, 4, 120, 14000000.0000, N'Quận 1', N'Cho Thuê làm cửa hàng', CAST(N'2014-07-14' AS Date))
INSERT [dbo].[NHATRO] ([MaNhaTro], [MaLoaiNha], [DienTich], [GiaPhong], [Quan], [ThongTinNhaTro], [NgayDang]) VALUES (9, 3, 55, 7000000.0000, N'Quận 3', N'Cho Thuê dài hạn', CAST(N'2014-07-22' AS Date))
INSERT [dbo].[NHATRO] ([MaNhaTro], [MaLoaiNha], [DienTich], [GiaPhong], [Quan], [ThongTinNhaTro], [NgayDang]) VALUES (10, 2, 50.6, 4000000.0000, N'Quận 7', N'Cho Thuê', CAST(N'2014-11-22' AS Date))
INSERT [dbo].[NHATRO] ([MaNhaTro], [MaLoaiNha], [DienTich], [GiaPhong], [Quan], [ThongTinNhaTro], [NgayDang]) VALUES (13, 4, 50.6, 5000000.0000, N'Quận 12', N'Cho Thuê', CAST(N'2020-11-22' AS Date))
SET IDENTITY_INSERT [dbo].[NHATRO] OFF
INSERT [dbo].[TAIKHOAN] ([TENNGUOIDUNG], [MATKHAU], [TUOI]) VALUES (N'chipheo', N'123', 20)
INSERT [dbo].[TAIKHOAN] ([TENNGUOIDUNG], [MATKHAU], [TUOI]) VALUES (N'phuc', N'123', 20)
INSERT [dbo].[TAIKHOAN] ([TENNGUOIDUNG], [MATKHAU], [TUOI]) VALUES (N'teo', N'123', 20)
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD  CONSTRAINT [fk_nguoidung_danhgia] FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[NGUOIDUNG] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[DanhGia] CHECK CONSTRAINT [fk_nguoidung_danhgia]
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD  CONSTRAINT [fk_nhatro_danhgia] FOREIGN KEY([MaNhaTro])
REFERENCES [dbo].[NHATRO] ([MaNhaTro])
GO
ALTER TABLE [dbo].[DanhGia] CHECK CONSTRAINT [fk_nhatro_danhgia]
GO
ALTER TABLE [dbo].[NHATRO]  WITH CHECK ADD  CONSTRAINT [fk_loainha_nhatro] FOREIGN KEY([MaLoaiNha])
REFERENCES [dbo].[LOAINHA] ([MaLoaiNha])
GO
ALTER TABLE [dbo].[NHATRO] CHECK CONSTRAINT [fk_loainha_nhatro]
GO
/****** Object:  StoredProcedure [dbo].[sp_NguoiDung_insert]    Script Date: 6/10/2021 2:05:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_NguoiDung_insert]	
--1. khai báo tham số người dùng cần truyền vào
--..nhớ MaNguoiDung tăng tự động thì ko cần truyền vào nhé
	@TenNguoiDung nvarchar(50),
	@GioiTinh bit ,
	@DienThoai varchar(15),
	@DiaChi nvarchar(50),
	@Quan nvarchar(50),
	@Email varchar(50)
AS
BEGIN
	--2. thêm vào bảng NGUOIDUNG
	--với giá trị là các tham số truyền vào
	insert into  NGUOIDUNG values (@TenNguoiDung,@GioiTinh,@DienThoai,@DiaChi,@Quan,@Email)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_NhaTro_insert]    Script Date: 6/10/2021 2:05:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_NhaTro_insert]
--1. khai báo tham số tương ứng cần thêm của bảng NHATRO....nhớ theo thứ tự trong bảng NHATRO...
--MaNhaTro : tăng tự động khỏi thêm
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

GO
USE [master]
GO
ALTER DATABASE [masv_hoten_NHATRO2] SET  READ_WRITE 
GO
