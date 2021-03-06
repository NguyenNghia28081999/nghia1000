USE [master]
GO

/****** Object:  Database [Giay]    Script Date: 12/17/2019 6:58:18 PM ******/
CREATE DATABASE [Giay]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Giay', FILENAME = N'D:\SQL\Giay.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Giay_log', FILENAME = N'D:\SQL\Giay_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Giay] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Giay].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Giay] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Giay] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Giay] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Giay] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Giay] SET ARITHABORT OFF 
GO
ALTER DATABASE [Giay] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Giay] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Giay] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Giay] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Giay] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Giay] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Giay] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Giay] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Giay] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Giay] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Giay] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Giay] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Giay] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Giay] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Giay] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Giay] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Giay] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Giay] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Giay] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Giay] SET  MULTI_USER 
GO
ALTER DATABASE [Giay] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Giay] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Giay] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Giay] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Giay]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 12/17/2019 6:58:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[MaAdmin] [int] IDENTITY(1,1) NOT NULL,
	[TaiKhoanAdmin] [varchar](100) NULL,
	[MatKhauAdmin] [varchar](400) NULL,
	[TenHienThi] [nvarchar](50) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[MaAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BinhLuan]    Script Date: 12/17/2019 6:58:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuan](
	[MaBinhLuan] [int] IDENTITY(1,1) NOT NULL,
	[MaNguoiDung] [int] NOT NULL,
	[MaGiay] [int] NOT NULL,
	[BinhLuan] [nvarchar](max) NULL,
	[NgayDang] [datetime] NULL,
 CONSTRAINT [PK_BinhLuan] PRIMARY KEY CLUSTERED 
(
	[MaBinhLuan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTDatHang]    Script Date: 12/17/2019 6:58:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTDatHang](
	[MaDH] [int] NOT NULL,
	[MaGiay] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [money] NULL,
	[ThanhTien] [money] NULL,
 CONSTRAINT [PK_CTDatHang] PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC,
	[MaGiay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 12/17/2019 6:58:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[MaDanhMuc] [int] IDENTITY(1,1) NOT NULL,
	[TenDanhMuc] [nvarchar](300) NULL,
	[HinhAnhDanhMuc] [nvarchar](3000) NULL,
 CONSTRAINT [PK_DanhMuc] PRIMARY KEY CLUSTERED 
(
	[MaDanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonDatHang]    Script Date: 12/17/2019 6:58:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DonDatHang](
	[MaDH] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NULL,
	[NgayDH] [datetime] NULL,
	[NgayGH] [datetime] NULL,
	[DiaChiNhan] [nchar](10) NULL,
	[SDTNhan] [varchar](14) NULL,
	[HTGH] [bit] NULL,
	[HTTT] [bit] NULL,
	[TinhTrangGH] [bit] NULL,
	[TongThanhToan] [money] NULL,
 CONSTRAINT [PK_DonDatHang] PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Giay]    Script Date: 12/17/2019 6:58:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Giay](
	[MaGiay] [int] IDENTITY(1,1) NOT NULL,
	[TenGiay] [nvarchar](100) NULL,
	[HinhAnhGiay] [nvarchar](3000) NULL,
	[SoLuong] [int] NULL,
	[MaMau] [int] NULL,
	[MaAdmin] [int] NULL,
	[GiaTien] [float] NULL,
	[KichCo] [float] NULL,
	[MaDanhMuc] [int] NULL,
	[MaPhanLoai] [int] NULL,
	[GiamGia] [int] NULL,
	[NgayHangVe] [date] NULL,
	[SoDonHang] [int] NULL,
	[Phai] [int] NULL,
	[Collection] [bit] NULL,
 CONSTRAINT [PK_Giay] PRIMARY KEY CLUSTERED 
(
	[MaGiay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/17/2019 6:58:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKhachHang] [int] IDENTITY(1,1) NOT NULL,
	[TenKhachHang] [nvarchar](50) NULL,
	[SoDienThoai] [varchar](15) NULL,
	[Email] [varchar](200) NULL,
	[DiaChi] [nvarchar](1000) NULL,
	[GhiChu] [ntext] NULL,
	[MatKhau] [nvarchar](1000) NULL,
	[Token] [nvarchar](max) NULL,
	[Quyen] [int] NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhanLoai]    Script Date: 12/17/2019 6:58:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanLoai](
	[MaPhanLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenPhanLoai] [nvarchar](300) NULL,
	[HinhAnhPhanLoai] [nvarchar](3000) NULL,
 CONSTRAINT [PK_PhanLoai] PRIMARY KEY CLUSTERED 
(
	[MaPhanLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TraLoi]    Script Date: 12/17/2019 6:58:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TraLoi](
	[MaTraLoi] [int] IDENTITY(1,1) NOT NULL,
	[MaBinhLuan] [int] NOT NULL,
	[MaNguoiDung] [int] NOT NULL,
	[TraLoi] [nvarchar](max) NULL,
	[NgayDang] [datetime] NULL,
 CONSTRAINT [PK_TraLoi] PRIMARY KEY CLUSTERED 
(
	[MaTraLoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([MaAdmin], [TaiKhoanAdmin], [MatKhauAdmin], [TenHienThi]) VALUES (1, N'Admin@1', N'1', N'Admin')
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[BinhLuan] ON 

INSERT [dbo].[BinhLuan] ([MaBinhLuan], [MaNguoiDung], [MaGiay], [BinhLuan], [NgayDang]) VALUES (3, 1, 7, N'cc', CAST(0x0000AB1E0124A00C AS DateTime))
INSERT [dbo].[BinhLuan] ([MaBinhLuan], [MaNguoiDung], [MaGiay], [BinhLuan], [NgayDang]) VALUES (4, 1, 7, N'cc', CAST(0x0000AB1E0124B149 AS DateTime))
INSERT [dbo].[BinhLuan] ([MaBinhLuan], [MaNguoiDung], [MaGiay], [BinhLuan], [NgayDang]) VALUES (5, 1, 7, N'cc', CAST(0x0000AB1E0140C352 AS DateTime))
INSERT [dbo].[BinhLuan] ([MaBinhLuan], [MaNguoiDung], [MaGiay], [BinhLuan], [NgayDang]) VALUES (6, 1, 7, N'cc', CAST(0x0000AB1E01427504 AS DateTime))
INSERT [dbo].[BinhLuan] ([MaBinhLuan], [MaNguoiDung], [MaGiay], [BinhLuan], [NgayDang]) VALUES (7, 1, 7, N'cc', CAST(0x0000AB1E01442A51 AS DateTime))
SET IDENTITY_INSERT [dbo].[BinhLuan] OFF
INSERT [dbo].[CTDatHang] ([MaDH], [MaGiay], [SoLuong], [DonGia], [ThanhTien]) VALUES (1, 10, 1, 23000.0000, 23000.0000)
INSERT [dbo].[CTDatHang] ([MaDH], [MaGiay], [SoLuong], [DonGia], [ThanhTien]) VALUES (2, 10, 1, 23000.0000, 23000.0000)
SET IDENTITY_INSERT [dbo].[DanhMuc] ON 

INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [HinhAnhDanhMuc]) VALUES (1, N'Giày Adidas', N'adidas-icon.png')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [HinhAnhDanhMuc]) VALUES (2, N'Giày Nike', N'nike-icon.png')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [HinhAnhDanhMuc]) VALUES (3, N'Giày Converse', N'conversasc.png')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [HinhAnhDanhMuc]) VALUES (4, N'Giày Puma', N'puma.png')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [HinhAnhDanhMuc]) VALUES (5, N'Giày VanS', N'vans.png')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [HinhAnhDanhMuc]) VALUES (6, N'Giày Gucci', N'puma.png')
SET IDENTITY_INSERT [dbo].[DanhMuc] OFF
SET IDENTITY_INSERT [dbo].[DonDatHang] ON 

INSERT [dbo].[DonDatHang] ([MaDH], [MaKH], [NgayDH], [NgayGH], [DiaChiNhan], [SDTNhan], [HTGH], [HTTT], [TinhTrangGH], [TongThanhToan]) VALUES (1, 1, NULL, NULL, N'binh duong', N'12345', 1, 1, NULL, NULL)
INSERT [dbo].[DonDatHang] ([MaDH], [MaKH], [NgayDH], [NgayGH], [DiaChiNhan], [SDTNhan], [HTGH], [HTTT], [TinhTrangGH], [TongThanhToan]) VALUES (2, 1, NULL, NULL, N'binh duong', N'12345', 1, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[DonDatHang] OFF
SET IDENTITY_INSERT [dbo].[Giay] ON 

INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [HinhAnhGiay], [SoLuong], [MaMau], [MaAdmin], [GiaTien], [KichCo], [MaDanhMuc], [MaPhanLoai], [GiamGia], [NgayHangVe], [SoDonHang], [Phai], [Collection]) VALUES (1, N'GIÀY TRẺ EM JD8 TRẮNG TÍM', N'BE98CF21-4EF7-492D-937E-1CD7A6B1CCEC.jpeg', 2, NULL, NULL, 23000, 33.5, 1, NULL, 20, NULL, 2, 0, 0)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [HinhAnhGiay], [SoLuong], [MaMau], [MaAdmin], [GiaTien], [KichCo], [MaDanhMuc], [MaPhanLoai], [GiamGia], [NgayHangVe], [SoDonHang], [Phai], [Collection]) VALUES (2, N'GIÀY TRẺ EM JD8 TRẮNG TÍM', N'BE98CF21-4EF7-492D-937E-1CD7A6B1CCEC.jpeg', 2, NULL, NULL, 23000, 33.5, 2, NULL, 10, NULL, 11, 1, 0)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [HinhAnhGiay], [SoLuong], [MaMau], [MaAdmin], [GiaTien], [KichCo], [MaDanhMuc], [MaPhanLoai], [GiamGia], [NgayHangVe], [SoDonHang], [Phai], [Collection]) VALUES (3, N'GIÀY TRẺ EM JD8 TRẮNG TÍM', N'BE98CF21-4EF7-492D-937E-1CD7A6B1CCEC.jpeg', 3, NULL, NULL, 23000, 33.5, 3, NULL, 15, NULL, 22, 2, 0)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [HinhAnhGiay], [SoLuong], [MaMau], [MaAdmin], [GiaTien], [KichCo], [MaDanhMuc], [MaPhanLoai], [GiamGia], [NgayHangVe], [SoDonHang], [Phai], [Collection]) VALUES (4, N'GIÀY TRẺ EM JD8 TRẮNG TÍM', N'BE98CF21-4EF7-492D-937E-1CD7A6B1CCEC.jpeg', 4, NULL, NULL, 23000, 33.5, 4, NULL, 2, NULL, 33, 1, 0)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [HinhAnhGiay], [SoLuong], [MaMau], [MaAdmin], [GiaTien], [KichCo], [MaDanhMuc], [MaPhanLoai], [GiamGia], [NgayHangVe], [SoDonHang], [Phai], [Collection]) VALUES (5, N'GIÀY TRẺ EM JD8 TRẮNG TÍM', N'BE98CF21-4EF7-492D-937E-1CD7A6B1CCEC.jpeg', 1, NULL, NULL, 23000, 33.5, 5, NULL, 33, NULL, 1, 0, 0)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [HinhAnhGiay], [SoLuong], [MaMau], [MaAdmin], [GiaTien], [KichCo], [MaDanhMuc], [MaPhanLoai], [GiamGia], [NgayHangVe], [SoDonHang], [Phai], [Collection]) VALUES (6, N'GIÀY TRẺ EM JD8 TRẮNG TÍM', N'BE98CF21-4EF7-492D-937E-1CD7A6B1CCEC.jpeg', 2, NULL, NULL, 23000, 33.5, 1, NULL, 1, NULL, 2, 0, 0)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [HinhAnhGiay], [SoLuong], [MaMau], [MaAdmin], [GiaTien], [KichCo], [MaDanhMuc], [MaPhanLoai], [GiamGia], [NgayHangVe], [SoDonHang], [Phai], [Collection]) VALUES (7, N'GIÀY TRẺ EM JD8 TRẮNG TÍM', N'BE98CF21-4EF7-492D-937E-1CD7A6B1CCEC.jpeg', 3, NULL, NULL, 23000, 33.5, 2, NULL, 2, NULL, 3, 1, 1)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [HinhAnhGiay], [SoLuong], [MaMau], [MaAdmin], [GiaTien], [KichCo], [MaDanhMuc], [MaPhanLoai], [GiamGia], [NgayHangVe], [SoDonHang], [Phai], [Collection]) VALUES (8, N'GIÀY TRẺ EM JD8 TRẮNG TÍM', N'BE98CF21-4EF7-492D-937E-1CD7A6B1CCEC.jpeg', 4, NULL, NULL, 23000, 33.5, 3, NULL, 3, NULL, 4, 1, 0)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [HinhAnhGiay], [SoLuong], [MaMau], [MaAdmin], [GiaTien], [KichCo], [MaDanhMuc], [MaPhanLoai], [GiamGia], [NgayHangVe], [SoDonHang], [Phai], [Collection]) VALUES (9, N'GIÀY TRẺ EM JD8 TRẮNG TÍM', N'BE98CF21-4EF7-492D-937E-1CD7A6B1CCEC.jpeg', 5, NULL, NULL, 23000, 33.5, 4, NULL, 5, NULL, 5, 0, 1)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [HinhAnhGiay], [SoLuong], [MaMau], [MaAdmin], [GiaTien], [KichCo], [MaDanhMuc], [MaPhanLoai], [GiamGia], [NgayHangVe], [SoDonHang], [Phai], [Collection]) VALUES (10, N'GIÀY TRẺ EM JD8 TRẮNG TÍM', N'BE98CF21-4EF7-492D-937E-1CD7A6B1CCEC.jpeg', 3, NULL, NULL, 23000, 33.5, 5, NULL, 3, NULL, 44, 1, 0)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [HinhAnhGiay], [SoLuong], [MaMau], [MaAdmin], [GiaTien], [KichCo], [MaDanhMuc], [MaPhanLoai], [GiamGia], [NgayHangVe], [SoDonHang], [Phai], [Collection]) VALUES (11, N'GIÀY TRẺ EM JD8 TRẮNG TÍM', N'BE98CF21-4EF7-492D-937E-1CD7A6B1CCEC.jpeg', 2, NULL, NULL, 23000, 33.5, 6, NULL, 0, NULL, 3, 1, 1)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [HinhAnhGiay], [SoLuong], [MaMau], [MaAdmin], [GiaTien], [KichCo], [MaDanhMuc], [MaPhanLoai], [GiamGia], [NgayHangVe], [SoDonHang], [Phai], [Collection]) VALUES (12, N'GIÀY TRẺ EM JD8 TRẮNG TÍM', N'BE98CF21-4EF7-492D-937E-1CD7A6B1CCEC.jpeg', 2, NULL, NULL, 23000, 33.5, 6, NULL, 0, NULL, 2, 2, 0)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [HinhAnhGiay], [SoLuong], [MaMau], [MaAdmin], [GiaTien], [KichCo], [MaDanhMuc], [MaPhanLoai], [GiamGia], [NgayHangVe], [SoDonHang], [Phai], [Collection]) VALUES (13, N'GIÀY TRẺ EM JD8 TRẮNG TÍM', N'BE98CF21-4EF7-492D-937E-1CD7A6B1CCEC.jpeg', 3, NULL, NULL, 23000, 33.5, 5, NULL, 0, NULL, 1, 0, 0)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [HinhAnhGiay], [SoLuong], [MaMau], [MaAdmin], [GiaTien], [KichCo], [MaDanhMuc], [MaPhanLoai], [GiamGia], [NgayHangVe], [SoDonHang], [Phai], [Collection]) VALUES (14, N'GIÀY TRẺ EM JD8 TRẮNG TÍM', N'BE98CF21-4EF7-492D-937E-1CD7A6B1CCEC.jpeg', 4, NULL, NULL, 23000, 33.5, 4, NULL, 0, NULL, 22, 1, 0)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [HinhAnhGiay], [SoLuong], [MaMau], [MaAdmin], [GiaTien], [KichCo], [MaDanhMuc], [MaPhanLoai], [GiamGia], [NgayHangVe], [SoDonHang], [Phai], [Collection]) VALUES (15, N'GIÀY TRẺ EM JD8 TRẮNG TÍM', N'BE98CF21-4EF7-492D-937E-1CD7A6B1CCEC.jpeg', 5, NULL, NULL, 23000, 33.5, 2, NULL, 0, NULL, 44, 0, 0)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [HinhAnhGiay], [SoLuong], [MaMau], [MaAdmin], [GiaTien], [KichCo], [MaDanhMuc], [MaPhanLoai], [GiamGia], [NgayHangVe], [SoDonHang], [Phai], [Collection]) VALUES (16, N'GIÀY TRẺ EM JD8 TRẮNG TÍM', N'BE98CF21-4EF7-492D-937E-1CD7A6B1CCEC.jpeg', 3, NULL, NULL, 23000, 33.5, 1, NULL, 0, NULL, 3, 2, 0)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [HinhAnhGiay], [SoLuong], [MaMau], [MaAdmin], [GiaTien], [KichCo], [MaDanhMuc], [MaPhanLoai], [GiamGia], [NgayHangVe], [SoDonHang], [Phai], [Collection]) VALUES (17, N'GIÀY TRẺ EM JD8 TRẮNG TÍM', N'BE98CF21-4EF7-492D-937E-1CD7A6B1CCEC.jpeg', 2, NULL, NULL, 23000, 33.5, 3, NULL, 0, NULL, 2, 2, 1)
SET IDENTITY_INSERT [dbo].[Giay] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [SoDienThoai], [Email], [DiaChi], [GhiChu], [MatKhau], [Token], [Quyen]) VALUES (1, N'user1', N'12345', N'user1@1', N'binh duong', NULL, N'1', N'42217614-d53e-47fd-a6f8-85a86ee2b68b', 0)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[TraLoi] ON 

INSERT [dbo].[TraLoi] ([MaTraLoi], [MaBinhLuan], [MaNguoiDung], [TraLoi], [NgayDang]) VALUES (1, 5, 1, N'jh', CAST(0x0000AB1E0141E5DC AS DateTime))
INSERT [dbo].[TraLoi] ([MaTraLoi], [MaBinhLuan], [MaNguoiDung], [TraLoi], [NgayDang]) VALUES (2, 6, 1, N'jh', CAST(0x0000AB1E01427956 AS DateTime))
INSERT [dbo].[TraLoi] ([MaTraLoi], [MaBinhLuan], [MaNguoiDung], [TraLoi], [NgayDang]) VALUES (3, 7, 1, N'jh', CAST(0x0000AB1E0144307E AS DateTime))
SET IDENTITY_INSERT [dbo].[TraLoi] OFF
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuan_KhachHang] FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[BinhLuan] CHECK CONSTRAINT [FK_BinhLuan_KhachHang]
GO
ALTER TABLE [dbo].[CTDatHang]  WITH CHECK ADD  CONSTRAINT [FK_CTDatHang_DonDatHang] FOREIGN KEY([MaDH])
REFERENCES [dbo].[DonDatHang] ([MaDH])
GO
ALTER TABLE [dbo].[CTDatHang] CHECK CONSTRAINT [FK_CTDatHang_DonDatHang]
GO
ALTER TABLE [dbo].[CTDatHang]  WITH CHECK ADD  CONSTRAINT [FK_CTDatHang_Giay] FOREIGN KEY([MaGiay])
REFERENCES [dbo].[Giay] ([MaGiay])
GO
ALTER TABLE [dbo].[CTDatHang] CHECK CONSTRAINT [FK_CTDatHang_Giay]
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_DonDatHang_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[DonDatHang] CHECK CONSTRAINT [FK_DonDatHang_KhachHang]
GO
ALTER TABLE [dbo].[Giay]  WITH CHECK ADD  CONSTRAINT [FK_Giay_Admin] FOREIGN KEY([MaAdmin])
REFERENCES [dbo].[Admin] ([MaAdmin])
GO
ALTER TABLE [dbo].[Giay] CHECK CONSTRAINT [FK_Giay_Admin]
GO
ALTER TABLE [dbo].[Giay]  WITH CHECK ADD  CONSTRAINT [FK_Giay_DanhMuc] FOREIGN KEY([MaDanhMuc])
REFERENCES [dbo].[DanhMuc] ([MaDanhMuc])
GO
ALTER TABLE [dbo].[Giay] CHECK CONSTRAINT [FK_Giay_DanhMuc]
GO
ALTER TABLE [dbo].[Giay]  WITH CHECK ADD  CONSTRAINT [FK_Giay_PhanLoai] FOREIGN KEY([MaPhanLoai])
REFERENCES [dbo].[PhanLoai] ([MaPhanLoai])
GO
ALTER TABLE [dbo].[Giay] CHECK CONSTRAINT [FK_Giay_PhanLoai]
GO
ALTER TABLE [dbo].[TraLoi]  WITH CHECK ADD  CONSTRAINT [FK_TraLoi_BinhLuan] FOREIGN KEY([MaBinhLuan])
REFERENCES [dbo].[BinhLuan] ([MaBinhLuan])
GO
ALTER TABLE [dbo].[TraLoi] CHECK CONSTRAINT [FK_TraLoi_BinhLuan]
GO
ALTER TABLE [dbo].[TraLoi]  WITH CHECK ADD  CONSTRAINT [FK_TraLoi_KhachHang] FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[TraLoi] CHECK CONSTRAINT [FK_TraLoi_KhachHang]
GO
USE [master]
GO
ALTER DATABASE [Giay] SET  READ_WRITE 
GO
