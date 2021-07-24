USE [master]
GO
/****** Object:  Database [QLSV]    Script Date: 12/07/2021 01:10:57 ******/
CREATE DATABASE [QLSV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLSV', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.DUYPLUS\MSSQL\DATA\QLSV.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLSV_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.DUYPLUS\MSSQL\DATA\QLSV_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLSV] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLSV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLSV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLSV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLSV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLSV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLSV] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLSV] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLSV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLSV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLSV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLSV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLSV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLSV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLSV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLSV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLSV] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLSV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLSV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLSV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLSV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLSV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLSV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLSV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLSV] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLSV] SET  MULTI_USER 
GO
ALTER DATABASE [QLSV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLSV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLSV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLSV] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLSV] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QLSV]
GO
/****** Object:  Table [dbo].[KETQUA]    Script Date: 12/07/2021 01:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KETQUA](
	[MaSV] [varchar](10) NOT NULL,
	[MaMH] [varchar](10) NOT NULL,
	[DiemThi] [real] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC,
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KHOA]    Script Date: 12/07/2021 01:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KHOA](
	[MaKhoa] [varchar](10) NOT NULL,
	[TenKhoa] [nvarchar](50) NULL,
	[SoCBGD] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKhoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LOP]    Script Date: 12/07/2021 01:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LOP](
	[MaLop] [nvarchar](10) NOT NULL,
	[TenLop] [nvarchar](50) NULL,
	[SiSo] [int] NULL,
	[MaKhoa] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MONHOC]    Script Date: 12/07/2021 01:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MONHOC](
	[MaMH] [varchar](10) NOT NULL,
	[TenMH] [nvarchar](50) NULL,
	[SoTiet] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SINHVIEN]    Script Date: 12/07/2021 01:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SINHVIEN](
	[MaSV] [varchar](10) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[Nu] [bit] NULL,
	[NgaySinh] [date] NULL,
	[MaLop] [nvarchar](10) NULL,
	[Tinh] [nvarchar](20) NULL,
	[HocBong] [real] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[KETQUA] ([MaSV], [MaMH], [DiemThi]) VALUES (N'14843', N'NV3651', 9)
INSERT [dbo].[KETQUA] ([MaSV], [MaMH], [DiemThi]) VALUES (N'19293', N'CSDL', 10)
INSERT [dbo].[KETQUA] ([MaSV], [MaMH], [DiemThi]) VALUES (N'19293', N'SOF203', 9.5)
INSERT [dbo].[KETQUA] ([MaSV], [MaMH], [DiemThi]) VALUES (N'34581', N'SP1257', 10)
INSERT [dbo].[KETQUA] ([MaSV], [MaMH], [DiemThi]) VALUES (N'42578', N'SOF203', 10)
INSERT [dbo].[KETQUA] ([MaSV], [MaMH], [DiemThi]) VALUES (N'56745', N'PL1523', 9.2)
INSERT [dbo].[KETQUA] ([MaSV], [MaMH], [DiemThi]) VALUES (N'74256', N'CSDL', 9)
INSERT [dbo].[KETQUA] ([MaSV], [MaMH], [DiemThi]) VALUES (N'99001', N'KDI451', 8.5)
INSERT [dbo].[KHOA] ([MaKhoa], [TenKhoa], [SoCBGD]) VALUES (N'CK4', N'Cơ Khí - Tự Động Hoá', N'4')
INSERT [dbo].[KHOA] ([MaKhoa], [TenKhoa], [SoCBGD]) VALUES (N'CNTT1', N'Công Nghệ Thông Tin', N'1')
INSERT [dbo].[KHOA] ([MaKhoa], [TenKhoa], [SoCBGD]) VALUES (N'KT2', N'Điện - Điện Tử', N'2')
INSERT [dbo].[KHOA] ([MaKhoa], [TenKhoa], [SoCBGD]) VALUES (N'QTKD3', N'Quản Trị Kinh Doanh', N'3')
INSERT [dbo].[KHOA] ([MaKhoa], [TenKhoa], [SoCBGD]) VALUES (N'SPA5', N'Thẫm Mĩ - Làm Đẹp', N'5')
INSERT [dbo].[LOP] ([MaLop], [TenLop], [SiSo], [MaKhoa]) VALUES (N'CDTH2B', N'Lớp số 6', 32, N'CNTT1')
INSERT [dbo].[LOP] ([MaLop], [TenLop], [SiSo], [MaKhoa]) VALUES (N'DHTH2B', N'Lớp số 3', 25, N'SPA5')
INSERT [dbo].[LOP] ([MaLop], [TenLop], [SiSo], [MaKhoa]) VALUES (N'DT12045', N'Lớp số 4', 50, N'CK4')
INSERT [dbo].[LOP] ([MaLop], [TenLop], [SiSo], [MaKhoa]) VALUES (N'KS34451', N'Lớp số 5', 70, N'QTKD3')
INSERT [dbo].[LOP] ([MaLop], [TenLop], [SiSo], [MaKhoa]) VALUES (N'PR35421', N'Lớp số 2', 35, N'KT2')
INSERT [dbo].[LOP] ([MaLop], [TenLop], [SiSo], [MaKhoa]) VALUES (N'UD16314', N'Lớp số 7', 28, N'CNTT1')
INSERT [dbo].[LOP] ([MaLop], [TenLop], [SiSo], [MaKhoa]) VALUES (N'UD16315', N'Lớp số 1', 30, N'CNTT1')
INSERT [dbo].[MONHOC] ([MaMH], [TenMH], [SoTiet]) VALUES (N'CSDL', N'Cơ sở dữ liệu', N'16')
INSERT [dbo].[MONHOC] ([MaMH], [TenMH], [SoTiet]) VALUES (N'KDI451', N'Dự Án 1', N'16')
INSERT [dbo].[MONHOC] ([MaMH], [TenMH], [SoTiet]) VALUES (N'NV3651', N'Nghiệp vụ lưu trú', N'16')
INSERT [dbo].[MONHOC] ([MaMH], [TenMH], [SoTiet]) VALUES (N'PL1523', N'PLC cơ bản', N'16')
INSERT [dbo].[MONHOC] ([MaMH], [TenMH], [SoTiet]) VALUES (N'SOF203', N'Lập trình Java 3', N'16')
INSERT [dbo].[MONHOC] ([MaMH], [TenMH], [SoTiet]) VALUES (N'SP1257', N'Chăm sóc da', N'16')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [Nu], [NgaySinh], [MaLop], [Tinh], [HocBong]) VALUES (N'14843', N'Trần Thị Lan Anh', 1, CAST(N'2000-02-03' AS Date), N'KS34451', N'Quảng Ninh', 7000)
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [Nu], [NgaySinh], [MaLop], [Tinh], [HocBong]) VALUES (N'19293', N'Nguyễn Hoàng Duy', 0, CAST(N'1999-08-22' AS Date), N'CDTH2B', N'Bình Thuận', 5000)
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [Nu], [NgaySinh], [MaLop], [Tinh], [HocBong]) VALUES (N'34581', N'Lê Đức Phúc', 0, CAST(N'2002-10-15' AS Date), N'PR35421', N'Vĩnh Long', 8000)
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [Nu], [NgaySinh], [MaLop], [Tinh], [HocBong]) VALUES (N'42578', N'Hoàng Thị Nhung', 1, CAST(N'2000-05-12' AS Date), N'CDTH2B', N'Hải Phòng', 5000)
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [Nu], [NgaySinh], [MaLop], [Tinh], [HocBong]) VALUES (N'56745', N'Đào Xuân Đạt', 0, CAST(N'2001-07-11' AS Date), N'DT12045', N'Gia Lai', 1000)
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [Nu], [NgaySinh], [MaLop], [Tinh], [HocBong]) VALUES (N'74256', N'Thái Văn Học', 0, CAST(N'2001-08-08' AS Date), N'DHTH2B', N'Nam Định', 1200)
INSERT [dbo].[SINHVIEN] ([MaSV], [HoTen], [Nu], [NgaySinh], [MaLop], [Tinh], [HocBong]) VALUES (N'99001', N'Huỳnh Thị Quyên', 1, CAST(N'2002-01-01' AS Date), N'UD16315', N'Quãng Ngải', 2000)
ALTER TABLE [dbo].[KETQUA]  WITH CHECK ADD FOREIGN KEY([MaMH])
REFERENCES [dbo].[MONHOC] ([MaMH])
GO
ALTER TABLE [dbo].[KETQUA]  WITH CHECK ADD FOREIGN KEY([MaSV])
REFERENCES [dbo].[SINHVIEN] ([MaSV])
GO
ALTER TABLE [dbo].[LOP]  WITH CHECK ADD FOREIGN KEY([MaKhoa])
REFERENCES [dbo].[KHOA] ([MaKhoa])
GO
ALTER TABLE [dbo].[SINHVIEN]  WITH CHECK ADD FOREIGN KEY([MaLop])
REFERENCES [dbo].[LOP] ([MaLop])
GO
USE [master]
GO
ALTER DATABASE [QLSV] SET  READ_WRITE 
GO
