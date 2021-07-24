USE [master]
GO
/****** Object:  Database [QLDA]    Script Date: 08/06/2021 15:52:37 ******/
CREATE DATABASE [QLDA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLDA', FILENAME = N'E:\HocTap\Microsoft SQL Server 2019\MSSQL15.DUYPLUS\MSSQL\DATA\QLDA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLDA_log', FILENAME = N'E:\HocTap\Microsoft SQL Server 2019\MSSQL15.DUYPLUS\MSSQL\DATA\QLDA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QLDA] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLDA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLDA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLDA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLDA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLDA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLDA] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLDA] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLDA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLDA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLDA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLDA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLDA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLDA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLDA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLDA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLDA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLDA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLDA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLDA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLDA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLDA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLDA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLDA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLDA] SET RECOVERY FULL 
GO
ALTER DATABASE [QLDA] SET  MULTI_USER 
GO
ALTER DATABASE [QLDA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLDA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLDA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLDA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLDA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLDA] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QLDA] SET QUERY_STORE = OFF
GO
USE [QLDA]
GO
/****** Object:  UserDefinedFunction [dbo].[fDemNv]    Script Date: 08/06/2021 15:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fDemNv]()
RETURNS int
BEGIN
  RETURN (SELECT count(MANV)
  FROM NHANVIEN)
 END
GO
/****** Object:  UserDefinedFunction [dbo].[fDemNv_gioitinh]    Script Date: 08/06/2021 15:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fDemNv_gioitinh](@phai nvarchar(3))
RETURNS int
BEGIN
  RETURN (SELECT count(MANV)
  FROM NHANVIEN
  where PHAI like @phai)
 END
GO
/****** Object:  UserDefinedFunction [dbo].[fListPhong]    Script Date: 08/06/2021 15:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fListPhong] (@phong Int)
  RETURNS @ProdList Table
   (  ten nvarchar(15) , ma int, trphg nvarchar(9), ngay date
   )
 AS
  BEGIN
   IF @phong IS NULL
    BEGIN
     INSERT INTO @ProdList (ten,ma,trphg,ngay)
     SELECT TENPHG, MAPHG,TRPHG,NG_NHANCHUC
     FROM PhongBan
    END
   ELSE
   BEGIN
     INSERT INTO @ProdList (ten,ma,trphg,ngay)
    SELECT TENPHG, MAPHG,TRPHG,NG_NHANCHUC
     FROM PHONGBAN
     WHERE MAPHG=@phong
   END
  RETURN
  END
GO
/****** Object:  UserDefinedFunction [dbo].[fMaPHG]    Script Date: 08/06/2021 15:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fMaPHG] (@Manv nvarchar(9))
RETURNS  int
BEGIN
    RETURN (SELECT PHG FROM NHANVIEN WHERE MANV = @Manv)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fTuoi]    Script Date: 08/06/2021 15:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create function [dbo].[fTuoi] (@ns int) 
Returns int  
As  
Begin   
return year(getdate()) - @ns 
end 
GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 08/06/2021 15:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[HONV] [nvarchar](15) NOT NULL,
	[TENLOT] [nvarchar](15) NOT NULL,
	[TENNV] [nvarchar](15) NOT NULL,
	[MANV] [nvarchar](9) NOT NULL,
	[NGSINH] [datetime] NOT NULL,
	[DCHI] [nvarchar](30) NOT NULL,
	[PHAI] [nvarchar](3) NOT NULL,
	[LUONG] [float] NOT NULL,
	[MA_NQL] [nvarchar](9) NULL,
	[PHG] [int] NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MANV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[FNhanVien_PB]    Script Date: 08/06/2021 15:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Viết hàm trả về bảng các nhân viên làm việc ở phòng số 5 
 CREATE FUNCTION [dbo].[FNhanVien_PB](@Maphg int)
 RETURNS Table
 AS
   RETURN
   (
     SELECT MANV,HONV,TENNV FROM NHANVIEN
     WHERE PHG = @Maphg
    )
GO
/****** Object:  Table [dbo].[PHONGBAN]    Script Date: 08/06/2021 15:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHONGBAN](
	[TENPHG] [nvarchar](15) NOT NULL,
	[MAPHG] [int] NOT NULL,
	[TRPHG] [nvarchar](9) NULL,
	[NG_NHANCHUC] [date] NOT NULL,
 CONSTRAINT [PK_PhongBan] PRIMARY KEY CLUSTERED 
(
	[MAPHG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[NV_PB]    Script Date: 08/06/2021 15:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[NV_PB]
  as
  Select TENNV,TENPHG
  From NHANVIEN inner join PhongBan on NHANVIEN.PHG=PHONGBAN.MAPHG
GO
/****** Object:  View [dbo].[ThongtinNV]    Script Date: 08/06/2021 15:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ThongtinNV] AS
Select TenNV, LUONG,YEAR(GetDate()) - YEAR(NHANVIEN.NGSINH) as Tuoi
  from NHANVIEN
  where YEAR(GetDate()) - YEAR(NHANVIEN.NGSINH)>57
GO
/****** Object:  View [dbo].[COMP]    Script Date: 08/06/2021 15:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[COMP] (TenNV, Luong)
 AS SELECT TENLOT, LUONG AS Pay
 FROM NHANVIEN;
GO
/****** Object:  View [dbo].[test]    Script Date: 08/06/2021 15:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[test]
  as
  select TENNV, LUONG
  from NHANVIEN
GO
/****** Object:  View [dbo].[test1]    Script Date: 08/06/2021 15:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create view [dbo].[test1]
  as
  select TENNV, (LUONG +10) as a
  from NHANVIEN
GO
/****** Object:  View [dbo].[test2]    Script Date: 08/06/2021 15:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[test2]
  as
  select TENNV,LUONG
  from NHANVIEN
GO
/****** Object:  View [dbo].[NV_Phai]    Script Date: 08/06/2021 15:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[NV_Phai]
AS
 SELECT TenNV,PHAI
 FROM NHANVIEN
 WHERE PHAI like N'nữ'
GO
/****** Object:  View [dbo].[NV_Phai1]    Script Date: 08/06/2021 15:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[NV_Phai1]
AS
 SELECT TENPHG,MAPHG
 FROM PHONGBAN
 WHERE MAPHG =5
GO
/****** Object:  View [dbo].[ThongTin_Phong]    Script Date: 08/06/2021 15:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ThongTin_Phong]
AS
 SELECT TENPHG,MAPHG
 FROM PHONGBAN
 WHERE MAPHG =6
GO
/****** Object:  Table [dbo].[CONGVIEC]    Script Date: 08/06/2021 15:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONGVIEC](
	[MADA] [int] NOT NULL,
	[STT] [int] NOT NULL,
	[TEN_CONG_VIEC] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CongViec] PRIMARY KEY CLUSTERED 
(
	[MADA] ASC,
	[STT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DEAN]    Script Date: 08/06/2021 15:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEAN](
	[TENDEAN] [nvarchar](15) NOT NULL,
	[MADA] [int] NOT NULL,
	[DDIEM_DA] [nvarchar](15) NOT NULL,
	[PHONG] [int] NULL,
 CONSTRAINT [PK_DeAn] PRIMARY KEY CLUSTERED 
(
	[MADA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIADIEM_PHG]    Script Date: 08/06/2021 15:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIADIEM_PHG](
	[MAPHG] [int] NOT NULL,
	[DIADIEM] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_DiaDiemPhong] PRIMARY KEY CLUSTERED 
(
	[MAPHG] ASC,
	[DIADIEM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHANCONG]    Script Date: 08/06/2021 15:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHANCONG](
	[MA_NVIEN] [nvarchar](9) NOT NULL,
	[MADA] [int] NOT NULL,
	[STT] [int] NOT NULL,
	[THOIGIAN] [float] NOT NULL,
 CONSTRAINT [PK_PhanCong] PRIMARY KEY CLUSTERED 
(
	[MA_NVIEN] ASC,
	[MADA] ASC,
	[STT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TAIKHOAN]    Script Date: 08/06/2021 15:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAIKHOAN](
	[TENNGUOIDUNG] [varchar](10) NOT NULL,
	[MATKHAU] [varchar](10) NULL,
	[TUOI] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TENNGUOIDUNG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THANNHAN]    Script Date: 08/06/2021 15:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THANNHAN](
	[MA_NVIEN] [nvarchar](9) NOT NULL,
	[TENTN] [nvarchar](15) NOT NULL,
	[PHAI] [nvarchar](3) NOT NULL,
	[NGSINH] [date] NOT NULL,
	[QUANHE] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_ThanNhan] PRIMARY KEY CLUSTERED 
(
	[MA_NVIEN] ASC,
	[TENTN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CONGVIEC] ([MADA], [STT], [TEN_CONG_VIEC]) VALUES (1, 1, N'Thiết kế sản phẩm X')
INSERT [dbo].[CONGVIEC] ([MADA], [STT], [TEN_CONG_VIEC]) VALUES (1, 2, N'Thử nghiệm sản phẩm X')
INSERT [dbo].[CONGVIEC] ([MADA], [STT], [TEN_CONG_VIEC]) VALUES (2, 1, N'Sản xuất sản phẩm Y')
INSERT [dbo].[CONGVIEC] ([MADA], [STT], [TEN_CONG_VIEC]) VALUES (2, 2, N'Quảng cáo sản phẩm Y')
INSERT [dbo].[CONGVIEC] ([MADA], [STT], [TEN_CONG_VIEC]) VALUES (3, 1, N'Khuyến mãi sản phẩm Z')
INSERT [dbo].[CONGVIEC] ([MADA], [STT], [TEN_CONG_VIEC]) VALUES (10, 1, N'Tin học hóa phòng nhân sự')
INSERT [dbo].[CONGVIEC] ([MADA], [STT], [TEN_CONG_VIEC]) VALUES (10, 2, N'Tin học hóa phòng kinh doanh')
INSERT [dbo].[CONGVIEC] ([MADA], [STT], [TEN_CONG_VIEC]) VALUES (20, 1, N'Lắp đặt cáp quang')
INSERT [dbo].[CONGVIEC] ([MADA], [STT], [TEN_CONG_VIEC]) VALUES (30, 1, N'Đào tạo nhân viên Marketing')
INSERT [dbo].[CONGVIEC] ([MADA], [STT], [TEN_CONG_VIEC]) VALUES (30, 2, N'Đào tạo nhân viên thiết kế')
GO
INSERT [dbo].[DEAN] ([TENDEAN], [MADA], [DDIEM_DA], [PHONG]) VALUES (N'Sản Phẩm x', 1, N'Vũng Tàu', 5)
INSERT [dbo].[DEAN] ([TENDEAN], [MADA], [DDIEM_DA], [PHONG]) VALUES (N'Sản Phẩm Y', 2, N'Nha Trang', 5)
INSERT [dbo].[DEAN] ([TENDEAN], [MADA], [DDIEM_DA], [PHONG]) VALUES (N'Sản Phẩm Z', 3, N'TP HCM', 5)
INSERT [dbo].[DEAN] ([TENDEAN], [MADA], [DDIEM_DA], [PHONG]) VALUES (N'Tin Học Hóa', 10, N'Hà Nội', 4)
INSERT [dbo].[DEAN] ([TENDEAN], [MADA], [DDIEM_DA], [PHONG]) VALUES (N'Cáp quang', 20, N'TP HCM', 1)
INSERT [dbo].[DEAN] ([TENDEAN], [MADA], [DDIEM_DA], [PHONG]) VALUES (N'Đào tạo', 30, N'Hà Nội', 4)
GO
INSERT [dbo].[DIADIEM_PHG] ([MAPHG], [DIADIEM]) VALUES (1, N'TP HCM')
INSERT [dbo].[DIADIEM_PHG] ([MAPHG], [DIADIEM]) VALUES (4, N'Hà Nội')
INSERT [dbo].[DIADIEM_PHG] ([MAPHG], [DIADIEM]) VALUES (5, N'Nha Trang')
INSERT [dbo].[DIADIEM_PHG] ([MAPHG], [DIADIEM]) VALUES (5, N'TP HCM')
INSERT [dbo].[DIADIEM_PHG] ([MAPHG], [DIADIEM]) VALUES (5, N'Vũng Tàu')
GO
INSERT [dbo].[NHANVIEN] ([HONV], [TENLOT], [TENNV], [MANV], [NGSINH], [DCHI], [PHAI], [LUONG], [MA_NQL], [PHG]) VALUES (N'Đinh', N'Quỳnh', N'Như', N'001', CAST(N'1967-02-01T00:00:00.000' AS DateTime), N'291 Hồ Văn Huê, TP HCM', N'Nữ', 43000, N'006', 4)
INSERT [dbo].[NHANVIEN] ([HONV], [TENLOT], [TENNV], [MANV], [NGSINH], [DCHI], [PHAI], [LUONG], [MA_NQL], [PHG]) VALUES (N'Phan', N'Viet', N'The', N'002', CAST(N'1984-01-11T00:00:00.000' AS DateTime), N'778 nguyễn kiệm , TP hcm', N'', 30000, N'001', 4)
INSERT [dbo].[NHANVIEN] ([HONV], [TENLOT], [TENNV], [MANV], [NGSINH], [DCHI], [PHAI], [LUONG], [MA_NQL], [PHG]) VALUES (N'Trần', N'Thanh', N'Tâm', N'003', CAST(N'1957-05-04T00:00:00.000' AS DateTime), N'34 Mai Thị Lự, Tp Hồ Chí Minh', N'Nữ', 20000, N'005', 5)
INSERT [dbo].[NHANVIEN] ([HONV], [TENLOT], [TENNV], [MANV], [NGSINH], [DCHI], [PHAI], [LUONG], [MA_NQL], [PHG]) VALUES (N'Nguyễn', N'Mạnh ', N'Hùng', N'004', CAST(N'1967-03-04T00:00:00.000' AS DateTime), N'95 Bà Rịa, Vũng Tàu', N'Nam', 38000, N'005', 5)
INSERT [dbo].[NHANVIEN] ([HONV], [TENLOT], [TENNV], [MANV], [NGSINH], [DCHI], [PHAI], [LUONG], [MA_NQL], [PHG]) VALUES (N'Nguễn', N'Thanh', N'Tùng', N'005', CAST(N'1962-08-20T00:00:00.000' AS DateTime), N'222 Nguyễn Văn Cừ, Tp HCM', N'Nam', 40000, N'006', 5)
INSERT [dbo].[NHANVIEN] ([HONV], [TENLOT], [TENNV], [MANV], [NGSINH], [DCHI], [PHAI], [LUONG], [MA_NQL], [PHG]) VALUES (N'Phạm', N'Văn', N'Vinh', N'006', CAST(N'1965-01-01T00:00:00.000' AS DateTime), N'15 Trưng Vương, Hà Nội', N'Nữ', 55000, NULL, 1)
INSERT [dbo].[NHANVIEN] ([HONV], [TENLOT], [TENNV], [MANV], [NGSINH], [DCHI], [PHAI], [LUONG], [MA_NQL], [PHG]) VALUES (N'Bùi ', N'Ngọc', N'Hành', N'007', CAST(N'1954-03-11T00:00:00.000' AS DateTime), N'332 Nguyễn Thái Học, Tp HCM', N'Nam', 25000, N'001', 4)
INSERT [dbo].[NHANVIEN] ([HONV], [TENLOT], [TENNV], [MANV], [NGSINH], [DCHI], [PHAI], [LUONG], [MA_NQL], [PHG]) VALUES (N'Trần', N'Hồng', N'Quang', N'008', CAST(N'1967-09-01T00:00:00.000' AS DateTime), N'80 Lê Hồng Phong, Tp HCM', N'Nam', 25000, N'001', 4)
INSERT [dbo].[NHANVIEN] ([HONV], [TENLOT], [TENNV], [MANV], [NGSINH], [DCHI], [PHAI], [LUONG], [MA_NQL], [PHG]) VALUES (N'Đinh ', N'Bá ', N'Tiên', N'009', CAST(N'1960-02-11T00:00:00.000' AS DateTime), N'119 Cống Quỳnh, Tp HCM', N'Nam', 30000, N'005', 5)
INSERT [dbo].[NHANVIEN] ([HONV], [TENLOT], [TENNV], [MANV], [NGSINH], [DCHI], [PHAI], [LUONG], [MA_NQL], [PHG]) VALUES (N'Nguyễn', N'Văn', N'Tèo', N'015', CAST(N'1960-03-11T00:00:00.000' AS DateTime), N'45 Lê Văn Sỹ,TP HCM', N'Nữ', 20000, N'001', 4)
INSERT [dbo].[NHANVIEN] ([HONV], [TENLOT], [TENNV], [MANV], [NGSINH], [DCHI], [PHAI], [LUONG], [MA_NQL], [PHG]) VALUES (N'Đinh ', N'Bá ', N'Tiên', N'017', CAST(N'1960-02-11T00:00:00.000' AS DateTime), N'119 Cống Quỳnh, Tp HCM', N'Nam', 30000, N'005', 5)
GO
INSERT [dbo].[PHANCONG] ([MA_NVIEN], [MADA], [STT], [THOIGIAN]) VALUES (N'001', 20, 1, 15.321547)
INSERT [dbo].[PHANCONG] ([MA_NVIEN], [MADA], [STT], [THOIGIAN]) VALUES (N'001', 30, 1, 20.5)
INSERT [dbo].[PHANCONG] ([MA_NVIEN], [MADA], [STT], [THOIGIAN]) VALUES (N'003', 1, 2, 20)
INSERT [dbo].[PHANCONG] ([MA_NVIEN], [MADA], [STT], [THOIGIAN]) VALUES (N'003', 2, 1, 20)
INSERT [dbo].[PHANCONG] ([MA_NVIEN], [MADA], [STT], [THOIGIAN]) VALUES (N'004', 3, 1, 40.7)
INSERT [dbo].[PHANCONG] ([MA_NVIEN], [MADA], [STT], [THOIGIAN]) VALUES (N'005', 3, 1, 10)
INSERT [dbo].[PHANCONG] ([MA_NVIEN], [MADA], [STT], [THOIGIAN]) VALUES (N'005', 10, 2, 10)
INSERT [dbo].[PHANCONG] ([MA_NVIEN], [MADA], [STT], [THOIGIAN]) VALUES (N'005', 20, 1, 10)
INSERT [dbo].[PHANCONG] ([MA_NVIEN], [MADA], [STT], [THOIGIAN]) VALUES (N'006', 20, 1, 30)
INSERT [dbo].[PHANCONG] ([MA_NVIEN], [MADA], [STT], [THOIGIAN]) VALUES (N'007', 10, 2, 10.7)
INSERT [dbo].[PHANCONG] ([MA_NVIEN], [MADA], [STT], [THOIGIAN]) VALUES (N'007', 30, 2, 30)
INSERT [dbo].[PHANCONG] ([MA_NVIEN], [MADA], [STT], [THOIGIAN]) VALUES (N'008', 10, 1, 35.2)
INSERT [dbo].[PHANCONG] ([MA_NVIEN], [MADA], [STT], [THOIGIAN]) VALUES (N'008', 30, 2, 5)
INSERT [dbo].[PHANCONG] ([MA_NVIEN], [MADA], [STT], [THOIGIAN]) VALUES (N'009', 1, 1, 32.54)
INSERT [dbo].[PHANCONG] ([MA_NVIEN], [MADA], [STT], [THOIGIAN]) VALUES (N'009', 2, 2, 8.9)
GO
INSERT [dbo].[PHONGBAN] ([TENPHG], [MAPHG], [TRPHG], [NG_NHANCHUC]) VALUES (N'Quản Lý', 1, N'006', CAST(N'1971-06-19' AS Date))
INSERT [dbo].[PHONGBAN] ([TENPHG], [MAPHG], [TRPHG], [NG_NHANCHUC]) VALUES (N'keToan', 2, N'003', CAST(N'2020-06-02' AS Date))
INSERT [dbo].[PHONGBAN] ([TENPHG], [MAPHG], [TRPHG], [NG_NHANCHUC]) VALUES (N'Điều Hành', 4, N'008', CAST(N'1985-01-01' AS Date))
INSERT [dbo].[PHONGBAN] ([TENPHG], [MAPHG], [TRPHG], [NG_NHANCHUC]) VALUES (N'Nghiên Cứu', 5, N'005', CAST(N'0197-05-22' AS Date))
INSERT [dbo].[PHONGBAN] ([TENPHG], [MAPHG], [TRPHG], [NG_NHANCHUC]) VALUES (N'IT', 6, N'008', CAST(N'1985-01-01' AS Date))
INSERT [dbo].[PHONGBAN] ([TENPHG], [MAPHG], [TRPHG], [NG_NHANCHUC]) VALUES (N'keToan', 9, N'003', CAST(N'2020-06-02' AS Date))
INSERT [dbo].[PHONGBAN] ([TENPHG], [MAPHG], [TRPHG], [NG_NHANCHUC]) VALUES (N'Hanh Chinh', 12, N'007', CAST(N'2020-05-05' AS Date))
GO
INSERT [dbo].[THANNHAN] ([MA_NVIEN], [TENTN], [PHAI], [NGSINH], [QUANHE]) VALUES (N'005', N'Khang', N'Nam', CAST(N'1973-10-25' AS Date), N'Con Trai')
INSERT [dbo].[THANNHAN] ([MA_NVIEN], [TENTN], [PHAI], [NGSINH], [QUANHE]) VALUES (N'005', N'Phương', N'Nữ', CAST(N'1948-05-03' AS Date), N'Vợ Chồng')
INSERT [dbo].[THANNHAN] ([MA_NVIEN], [TENTN], [PHAI], [NGSINH], [QUANHE]) VALUES (N'005', N'Trinh', N'Nữ', CAST(N'1976-04-05' AS Date), N'Con Gái')
INSERT [dbo].[THANNHAN] ([MA_NVIEN], [TENTN], [PHAI], [NGSINH], [QUANHE]) VALUES (N'009', N'Châu ', N'Nữ', CAST(N'1978-09-30' AS Date), N'Con Gái')
INSERT [dbo].[THANNHAN] ([MA_NVIEN], [TENTN], [PHAI], [NGSINH], [QUANHE]) VALUES (N'009', N'Phương', N'Nữ', CAST(N'1957-05-05' AS Date), N'Vợ Chồng')
INSERT [dbo].[THANNHAN] ([MA_NVIEN], [TENTN], [PHAI], [NGSINH], [QUANHE]) VALUES (N'009', N'Tiến ', N'Nam', CAST(N'1978-01-01' AS Date), N'Con Trai')
INSERT [dbo].[THANNHAN] ([MA_NVIEN], [TENTN], [PHAI], [NGSINH], [QUANHE]) VALUES (N'017', N'Tiến ', N'Nam', CAST(N'1978-01-01' AS Date), N'Con Trai')
GO
ALTER TABLE [dbo].[CONGVIEC]  WITH CHECK ADD  CONSTRAINT [FK_DeAn_CongViec] FOREIGN KEY([MADA])
REFERENCES [dbo].[DEAN] ([MADA])
GO
ALTER TABLE [dbo].[CONGVIEC] CHECK CONSTRAINT [FK_DeAn_CongViec]
GO
ALTER TABLE [dbo].[DEAN]  WITH CHECK ADD  CONSTRAINT [FK_PhongBan_DeAn] FOREIGN KEY([PHONG])
REFERENCES [dbo].[PHONGBAN] ([MAPHG])
GO
ALTER TABLE [dbo].[DEAN] CHECK CONSTRAINT [FK_PhongBan_DeAn]
GO
ALTER TABLE [dbo].[DIADIEM_PHG]  WITH CHECK ADD  CONSTRAINT [FK_PhongBan_DiaDiemPhg] FOREIGN KEY([MAPHG])
REFERENCES [dbo].[PHONGBAN] ([MAPHG])
GO
ALTER TABLE [dbo].[DIADIEM_PHG] CHECK CONSTRAINT [FK_PhongBan_DiaDiemPhg]
GO
ALTER TABLE [dbo].[NHANVIEN]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_NhanVien] FOREIGN KEY([MA_NQL])
REFERENCES [dbo].[NHANVIEN] ([MANV])
GO
ALTER TABLE [dbo].[NHANVIEN] CHECK CONSTRAINT [FK_NhanVien_NhanVien]
GO
ALTER TABLE [dbo].[NHANVIEN]  WITH CHECK ADD  CONSTRAINT [FK_PhongBan_NhanVien] FOREIGN KEY([PHG])
REFERENCES [dbo].[PHONGBAN] ([MAPHG])
GO
ALTER TABLE [dbo].[NHANVIEN] CHECK CONSTRAINT [FK_PhongBan_NhanVien]
GO
ALTER TABLE [dbo].[PHANCONG]  WITH CHECK ADD  CONSTRAINT [FK_CongViec_PhanCong] FOREIGN KEY([MADA], [STT])
REFERENCES [dbo].[CONGVIEC] ([MADA], [STT])
GO
ALTER TABLE [dbo].[PHANCONG] CHECK CONSTRAINT [FK_CongViec_PhanCong]
GO
ALTER TABLE [dbo].[PHANCONG]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_PhanCong] FOREIGN KEY([MA_NVIEN])
REFERENCES [dbo].[NHANVIEN] ([MANV])
GO
ALTER TABLE [dbo].[PHANCONG] CHECK CONSTRAINT [FK_NhanVien_PhanCong]
GO
ALTER TABLE [dbo].[PHONGBAN]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_PhongBan] FOREIGN KEY([TRPHG])
REFERENCES [dbo].[NHANVIEN] ([MANV])
GO
ALTER TABLE [dbo].[PHONGBAN] CHECK CONSTRAINT [FK_NhanVien_PhongBan]
GO
ALTER TABLE [dbo].[THANNHAN]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_ThanNhan] FOREIGN KEY([MA_NVIEN])
REFERENCES [dbo].[NHANVIEN] ([MANV])
GO
ALTER TABLE [dbo].[THANNHAN] CHECK CONSTRAINT [FK_NhanVien_ThanNhan]
GO
/****** Object:  StoredProcedure [dbo].[DemNv]    Script Date: 08/06/2021 15:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DemNv]
  @cityvar nvarchar(30)
 AS
     DECLARE @num Int
     SELECT @num = Count(*) FROM NHANVIEN
     WHERE DCHI like '%' + @cityvar
 RETURN @num
GO
/****** Object:  StoredProcedure [dbo].[NumberWeek_Year]    Script Date: 08/06/2021 15:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[NumberWeek_Year]
as
--Setup Variables
DECLARE @myTable TABLE(WeekNumber int,
                       DateStarting smalldatetime)
DECLARE @n int = 0
DECLARE @firstWeek smalldatetime = '12/31/2017'

--Loop Through weeks
WHILE @n <= 52
BEGIN
   INSERT INTO @myTable VALUES (@n, DATEADD(wk,@n,@firstWeek));
   SELECT @n = @n + 1
END

--Show Results
SELECT WeekNumber, DateStarting
FROM   @myTable
GO
/****** Object:  StoredProcedure [dbo].[sp_bai1a]    Script Date: 08/06/2021 15:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_bai1a]
@ten nvarchar(50)
as
BEGIN
	PRINT N'Xin chào ' + @ten
END
GO
/****** Object:  StoredProcedure [dbo].[sp_bai1b]    Script Date: 08/06/2021 15:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_bai1b]
@a int, @b int
as
BEGIN
	DECLARE @tong int
	SET @tong = @a + @b
	PRINT N'Kết quả là: '+ CAST(@tong as varchar(10))
END
GO
/****** Object:  StoredProcedure [dbo].[sp_bai1c]    Script Date: 08/06/2021 15:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_bai1c]
@n int
as
BEGIN
	DECLARE @i int, @tong int
	SET @i = 1
	SET @tong = 0
	WHILE(@i <= @n)
	BEGIN
		IF(@i % 2 = 0)
			SET @tong = @tong + @i
		SET @i = @i + 1
	END
	PRINT N'Kết quả là: '+ CAST(@tong as varchar(10))
END
GO
/****** Object:  StoredProcedure [dbo].[sp_bai1d]    Script Date: 08/06/2021 15:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_bai1d]
@a int, @b int
as
BEGIN
	WHILE(@a <> @b)
	BEGIN
		IF(@a > @b)
			SET @a = @a - @b
		ELSE
			SET @b = @b - @a
	END
	PRINT N'Ước chung lớn nhất là: '+ CAST(@a as varchar(10))
END
GO
/****** Object:  StoredProcedure [dbo].[sp_bai2a]    Script Date: 08/06/2021 15:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_bai2a]
@manv nvarchar(50)
as
BEGIN
	SELECT * FROM NHANVIEN
	WHERE MANV = @manv
END
GO
/****** Object:  StoredProcedure [dbo].[sp_bai2b]    Script Date: 08/06/2021 15:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_bai2b]
@MaDa int
as
BEGIN
	SELECT MADA, COUNT(*) as 'So Luong NV' FROM PHANCONG
	GROUP BY MADA
	HAVING MADA = @MaDa
END
GO
/****** Object:  StoredProcedure [dbo].[sp_bai2c]    Script Date: 08/06/2021 15:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_bai2c]
@MaDA int,
@DDiem_DA nvarchar(20)
as
BEGIN
	SELECT PHANCONG.MADA, COUNT(*) as 'So Luong NV' FROM PHANCONG
	INNER JOIN DEAN ON DEAN.MADA = PHANCONG.MADA
	WHERE DDIEM_DA = @DDiem_DA
	AND DEAN.MADA = @MaDA
	GROUP BY PHANCONG.MADA
END
GO
/****** Object:  StoredProcedure [dbo].[sp_bai2d]    Script Date: 08/06/2021 15:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_bai2d]
@Trphg nvarchar(10)
as
BEGIN
	SELECT * FROM NHANVIEN
	WHERE MA_NQL = @Trphg
	AND MANV not in (SELECT DISTINCT MA_NVIEN FROM THANNHAN)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_bai2e]    Script Date: 08/06/2021 15:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_bai2e]
@MaNV nvarchar(10),
@MaPB int
as
BEGIN
	IF EXISTS (SELECT * FROM NHANVIEN
				WHERE PHG = @MaPB AND MANV = @MaNV)
		PRINT CAST(@MaNV as varchar(10)) + N' Có thuộc phòng ' + CAST(@MaPB as varchar(10))
	ELSE
		PRINT CAST(@MaNV as varchar(10)) + N' Không thuộc phòng ' + CAST(@MaPB as varchar(10))
END
GO
/****** Object:  StoredProcedure [dbo].[sp_bai3a]    Script Date: 08/06/2021 15:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_bai3a]
@TenPHG nvarchar(15),
@MaPHG int,
@TrPHG nvarchar(15),
@Ng_NhanChuc date
as
BEGIN
	IF EXISTS (SELECT * FROM PHONGBAN WHERE MAPHG = @MaPHG)
		PRINT N'Đã tồn tại, không thêm vào được!'
	ELSE
		INSERT INTO PHONGBAN
		VALUES(@TenPHG,@MaPHG,@TrPHG,@Ng_NhanChuc)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_bai3b]    Script Date: 08/06/2021 15:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_bai3b]
@TenPB nvarchar(10)
as
BEGIN
	UPDATE PHONGBAN SET TENPHG = @TenPB
	WHERE TENPHG = N'Công Nghệ Thông Tin'
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Chao]    Script Date: 08/06/2021 15:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Chao]
as
BEGIN
	PRINT N'Chào 500 anh em!'
END
EXEC sp_Chao
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemPhongBan]    Script Date: 08/06/2021 15:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ThemPhongBan]
 @TenPHG nvarchar(15),  @MaPHG int,
 @TRPHG nvarchar(9),  @NG_NHANCHUC date
 AS
 IF EXISTS(SELECT * From PHONGBAN Where MAPHG = @MaPHG)
 UPDATE PHONGBAN SET TENPHG =  @TenPHG, TRPHG = @Trphg,NG_NHANCHUC=@NG_NHANCHUC
 WHERE MAPHG = @MaPHG
 ELSE
 INSERT INTO PHONGBAN
 VALUES (@TenPHG,@MaPHG,@TRPHG,@NG_NHANCHUC)
GO
/****** Object:  StoredProcedure [dbo].[sp_ThongtinNV]    Script Date: 08/06/2021 15:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ThongtinNV] @MaNV nvarchar(9)
 AS
 Begin
 SELECT * from NHANVIEN WHERE MaNV = @MaNV
 End
GO
/****** Object:  StoredProcedure [dbo].[sp_Tong]    Script Date: 08/06/2021 15:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Tong] @So1 int =3, @So2 int=2
AS 
Begin 
Declare @Tong int  
SET @Tong = @So1 + @So2; 
Print @Tong
End 
GO
USE [master]
GO
ALTER DATABASE [QLDA] SET  READ_WRITE 
GO
