create database Project_64131348
go
USE Project_64131348
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPhieuDatPhong](
	[maPDP] [varchar](10) NOT NULL,
	[maP] [varchar](10) NOT NULL,
	[tienCoc] [decimal](18, 0) NOT NULL,
 CONSTRAINT [ctpdp_pk] PRIMARY KEY CLUSTERED 
(
	[maPDP] ASC,
	[maP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPhieuThuePhong](
	[maPTP] [varchar](10) NOT NULL,
	[maP] [varchar](10) NOT NULL,
	[ngaySD] [datetime] NOT NULL,
	[maDV] [varchar](10) NOT NULL,
	[soLuong] [int] NOT NULL,
 CONSTRAINT [ctptp_pk] PRIMARY KEY CLUSTERED 
(
	[maPTP] ASC,
	[maP] ASC,
	[ngaySD] ASC,
	[maDV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhSachQuyen](
	[IDNhom] [varchar](20) NOT NULL,
	[IDQuyen] [varchar](50) NOT NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_DanhSachQuyen] PRIMARY KEY CLUSTERED 
(
	[IDNhom] ASC,
	[IDQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DichVu](
	[maDV] [varchar](10) NOT NULL,
	[tenDV] [nvarchar](50) NOT NULL,
	[gia] [decimal](18, 0) NOT NULL,
 CONSTRAINT [dv_pk] PRIMARY KEY CLUSTERED 
(
	[maDV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[maHD] [varchar](10) NOT NULL,
	[ngayTT] [Datetime] NOT NULL,
	[maPTP] [varchar](10) NOT NULL,
	[maNV] [varchar](10) NOT NULL,
	[tongTien] [decimal](18, 0) NOT NULL,
 CONSTRAINT [hd_pk] PRIMARY KEY CLUSTERED 
(
	[maPTP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[maKH] [varchar](10) NOT NULL,
	[tenKH] [nvarchar](50) NOT NULL,
	[gioiTinh] [bit] NOT NULL,
	[cmnd_passport] [varchar](15) NOT NULL,
	[diaChi] [nvarchar](50) NOT NULL,
	[quocTich] [nvarchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[sdt] [varchar](20) NOT NULL,
 CONSTRAINT [kh_pk] PRIMARY KEY CLUSTERED 
(
	[maKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LienHe](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[hoTen] [nvarchar](50) NOT NULL,
	[sdt] [varchar](20) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[ngayGui] [date] NOT NULL,
	[tinhTrang] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiPhong](
	[maLP] [varchar](10) NOT NULL,
	[tenLP] [nvarchar](50) NOT NULL,
	[hinhAnh] [varchar](250) NOT NULL,
	[sucChua] [int] NOT NULL,
	[donGia] [decimal](18, 0) NOT NULL,
	[moTa] [nvarchar](500) NULL,
 CONSTRAINT [lp_pk] PRIMARY KEY CLUSTERED 
(
	[maLP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[maNV] [varchar](10) NOT NULL,
	[tenNV] [nvarchar](50) NOT NULL,
	[gioiTinh] [bit] NOT NULL,
	[ngaySinh] [date] NOT NULL,
	[diaChi] [nvarchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[sdt] [varchar](20) NOT NULL,
	[hinhAnh] [varchar](250) NOT NULL,
 CONSTRAINT [nv_pk] PRIMARY KEY CLUSTERED 
(
	[maNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhomNhanVien](
	[IDNhom] [varchar](20) NOT NULL,
	[TenNhom] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_NhomNhanVien] PRIMARY KEY CLUSTERED 
(
	[IDNhom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanHoi](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[hoTen] [nvarchar](50) NOT NULL,
	[sdt] [varchar](20) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[noiDung] [varchar](500) NOT NULL,
	[ngayGui] [date] NOT NULL,
	[TinhTrang] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuDatPhong](
	[maPDP] [varchar](10) NOT NULL,
	[maKH] [varchar](10) NOT NULL,
	[ngayDen] [date] NOT NULL,
	[ngayDi] [date] NOT NULL,
	[tongTienCoc] [decimal](18, 0) NOT NULL,
	[soNguoi] [int] NOT NULL,
	[tinhTrang] [bit] NOT NULL,
	[maNV] [varchar](10) NOT NULL,
 CONSTRAINT [pdp_pk] PRIMARY KEY CLUSTERED 
(
	[maPDP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuThuePhong](
	[maPTP] [varchar](10) NOT NULL,
	[maPDP] [varchar](10) NOT NULL,
	[maKH] [varchar](10) NOT NULL,
	[maNV] [varchar](10) NOT NULL,
	[ngayThue] [date] NOT NULL,
	[ngayTra] [date] NOT NULL,
 CONSTRAINT [ptp_pk] PRIMARY KEY CLUSTERED 
(
	[maPTP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phong](
	[maP] [varchar](10) NOT NULL,
	[maLP] [varchar](10) NOT NULL,
	[tinhTrang] [nvarchar](20) NOT NULL,
 CONSTRAINT [p_pk] PRIMARY KEY CLUSTERED 
(
	[maP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuanTri](
	[username] [varchar](20) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[tinhTrang] [bit] NOT NULL,
	[maNV] [varchar](10) NOT NULL,
	[IDNhom] [varchar](20) NOT NULL,
 CONSTRAINT [qt_pk] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quyen](
	[IDQuyen] [varchar](50) NOT NULL,
	[TenQuyen] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Quyen] PRIMARY KEY CLUSTERED 
(
	[IDQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT [dbo].[CTPhieuDatPhong] ([maPDP], [maP], [tienCoc]) VALUES (N'PDP0001', N'P101', CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuDatPhong] ([maPDP], [maP], [tienCoc]) VALUES (N'PDP0002', N'P102', CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuDatPhong] ([maPDP], [maP], [tienCoc]) VALUES (N'PDP0003', N'P103', CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuDatPhong] ([maPDP], [maP], [tienCoc]) VALUES (N'PDP0004', N'P104', CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuDatPhong] ([maPDP], [maP], [tienCoc]) VALUES (N'PDP0005', N'P105', CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuDatPhong] ([maPDP], [maP], [tienCoc]) VALUES (N'PDP0006', N'P106', CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuDatPhong] ([maPDP], [maP], [tienCoc]) VALUES (N'PDP0007', N'P107', CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuDatPhong] ([maPDP], [maP], [tienCoc]) VALUES (N'PDP0008', N'P108', CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuDatPhong] ([maPDP], [maP], [tienCoc]) VALUES (N'PDP0009', N'P109', CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuDatPhong] ([maPDP], [maP], [tienCoc]) VALUES (N'PDP0010', N'P110', CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuDatPhong] ([maPDP], [maP], [tienCoc]) VALUES (N'PDP0011', N'P201', CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuDatPhong] ([maPDP], [maP], [tienCoc]) VALUES (N'PDP0012', N'P202', CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuDatPhong] ([maPDP], [maP], [tienCoc]) VALUES (N'PDP0013', N'P203', CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuDatPhong] ([maPDP], [maP], [tienCoc]) VALUES (N'PDP0014', N'P204', CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuDatPhong] ([maPDP], [maP], [tienCoc]) VALUES (N'PDP0015', N'P205', CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuDatPhong] ([maPDP], [maP], [tienCoc]) VALUES (N'PDP0016', N'P206', CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuDatPhong] ([maPDP], [maP], [tienCoc]) VALUES (N'PDP0017', N'P207', CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuDatPhong] ([maPDP], [maP], [tienCoc]) VALUES (N'PDP0018', N'P208', CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuDatPhong] ([maPDP], [maP], [tienCoc]) VALUES (N'PDP0019', N'P209', CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuDatPhong] ([maPDP], [maP], [tienCoc]) VALUES (N'PDP0020', N'P210', CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuDatPhong] ([maPDP], [maP], [tienCoc]) VALUES (N'PDP0021', N'P301', CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuDatPhong] ([maPDP], [maP], [tienCoc]) VALUES (N'PDP0022', N'P302', CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuDatPhong] ([maPDP], [maP], [tienCoc]) VALUES (N'PDP0023', N'P303', CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuDatPhong] ([maPDP], [maP], [tienCoc]) VALUES (N'PDP0024', N'P304', CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuDatPhong] ([maPDP], [maP], [tienCoc]) VALUES (N'PDP0025', N'P305', CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuDatPhong] ([maPDP], [maP], [tienCoc]) VALUES (N'PDP0026', N'P306', CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuDatPhong] ([maPDP], [maP], [tienCoc]) VALUES (N'PDP0027', N'P307', CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuDatPhong] ([maPDP], [maP], [tienCoc]) VALUES (N'PDP0028', N'P308', CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuDatPhong] ([maPDP], [maP], [tienCoc]) VALUES (N'PDP0029', N'P309', CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTPhieuDatPhong] ([maPDP], [maP], [tienCoc]) VALUES (N'PDP0030', N'P310', CAST(300000 AS Decimal(18, 0)))
GO
INSERT [dbo].[DanhSachQuyen] ([IDNhom], [IDQuyen], [GhiChu]) VALUES (N'NHANVIEN', N'ADD_CUSTOMER', NULL)
INSERT [dbo].[DanhSachQuyen] ([IDNhom], [IDQuyen], [GhiChu]) VALUES (N'NHANVIEN', N'DELETE_CUSTOMER', NULL)
INSERT [dbo].[DanhSachQuyen] ([IDNhom], [IDQuyen], [GhiChu]) VALUES (N'NHANVIEN', N'DETAILS_CUSTOMER', NULL)
INSERT [dbo].[DanhSachQuyen] ([IDNhom], [IDQuyen], [GhiChu]) VALUES (N'NHANVIEN', N'EDIT_CUSTOMER', NULL)
INSERT [dbo].[DanhSachQuyen] ([IDNhom], [IDQuyen], [GhiChu]) VALUES (N'NHANVIEN', N'VIEW_CUSTOMER', NULL)
GO

INSERT [dbo].[DichVu] ([maDV], [tenDV], [gia]) VALUES (N'DV0001', N'Pepsi', CAST(25000 AS Decimal(18, 0)))
INSERT [dbo].[DichVu] ([maDV], [tenDV], [gia]) VALUES (N'DV0002', N'Dịch Vụ Giặt', CAST(50000 AS Decimal(18, 0)))
INSERT [dbo].[DichVu] ([maDV], [tenDV], [gia]) VALUES (N'DV0003', N'Nước Khoáng Evian', CAST(10000 AS Decimal(18, 0)))
INSERT [dbo].[DichVu] ([maDV], [tenDV], [gia]) VALUES (N'DV0004', N'Nước Tăng Lực Red Bull', CAST(25000 AS Decimal(18, 0)))
INSERT [dbo].[DichVu] ([maDV], [tenDV], [gia]) VALUES (N'DV0005', N'Bò Dát Vàng', CAST(1000000 AS Decimal(18, 0)))
INSERT [dbo].[DichVu] ([maDV], [tenDV], [gia]) VALUES (N'DV0006', N'Nước Khoáng', CAST(10000 AS Decimal(18, 0)))
INSERT [dbo].[DichVu] ([maDV], [tenDV], [gia]) VALUES (N'DV0007', N'Soup Vi Cua', CAST(150000 AS Decimal(18, 0)))
INSERT [dbo].[DichVu] ([maDV], [tenDV], [gia]) VALUES (N'DV0008', N'Soup Bò Hầm Nâm', CAST(150000 AS Decimal(18, 0)))
INSERT [dbo].[DichVu] ([maDV], [tenDV], [gia]) VALUES (N'DV0009', N'Mì Ý', CAST(150000 AS Decimal(18, 0)))
INSERT [dbo].[DichVu] ([maDV], [tenDV], [gia]) VALUES (N'DV0010', N'Bún Bò Wagyu', CAST(1500000 AS Decimal(18, 0)))
INSERT [dbo].[DichVu] ([maDV], [tenDV], [gia]) VALUES (N'DV0011', N'Bún Sài Gòn', CAST(150000 AS Decimal(18, 0)))
INSERT [dbo].[DichVu] ([maDV], [tenDV], [gia]) VALUES (N'DV0012', N'Bún Chả', CAST(150000 AS Decimal(18, 0)))
INSERT [dbo].[DichVu] ([maDV], [tenDV], [gia]) VALUES (N'DV0013', N'Mì Trứng Nghệ Thuật', CAST(150000 AS Decimal(18, 0)))
INSERT [dbo].[DichVu] ([maDV], [tenDV], [gia]) VALUES (N'DV0014', N'Vịt Quay Cao Cấp', CAST(150000 AS Decimal(18, 0)))
INSERT [dbo].[DichVu] ([maDV], [tenDV], [gia]) VALUES (N'DV0015', N'Mì Xào Hải Sản', CAST(150000 AS Decimal(18, 0)))
INSERT [dbo].[DichVu] ([maDV], [tenDV], [gia]) VALUES (N'DV0016', N'Mì Xào Giòn Thương Hạng', CAST(150000 AS Decimal(18, 0)))
INSERT [dbo].[DichVu] ([maDV], [tenDV], [gia]) VALUES (N'DV0017', N'Phở Bò Kobe', CAST(1200000 AS Decimal(18, 0)))
INSERT [dbo].[DichVu] ([maDV], [tenDV], [gia]) VALUES (N'DV0018', N'Cơm Chiên Trứng', CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[DichVu] ([maDV], [tenDV], [gia]) VALUES (N'DV0019', N'Cơm Lam', CAST(120000 AS Decimal(18, 0)))
INSERT [dbo].[DichVu] ([maDV], [tenDV], [gia]) VALUES (N'DV0020', N'Sushi Thập Cẩm', CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[DichVu] ([maDV], [tenDV], [gia]) VALUES (N'DV0021', N'Salad Bò', CAST(10000 AS Decimal(18, 0)))
INSERT [dbo].[DichVu] ([maDV], [tenDV], [gia]) VALUES (N'DV0022', N'Điểm Tâm', CAST(50000 AS Decimal(18, 0)))
INSERT [dbo].[DichVu] ([maDV], [tenDV], [gia]) VALUES (N'DV0023', N'Ghẹ Rang Muối', CAST(800000 AS Decimal(18, 0)))
INSERT [dbo].[DichVu] ([maDV], [tenDV], [gia]) VALUES (N'DV0024', N'Tôm Sốt Chanh Dây', CAST(250000 AS Decimal(18, 0)))
INSERT [dbo].[DichVu] ([maDV], [tenDV], [gia]) VALUES (N'DV0025', N'Xôi Gà', CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[DichVu] ([maDV], [tenDV], [gia]) VALUES (N'DV0026', N'Xôi Ngũ Sắc', CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[DichVu] ([maDV], [tenDV], [gia]) VALUES (N'DV0027', N'Cháo Lòng', CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[DichVu] ([maDV], [tenDV], [gia]) VALUES (N'DV0028', N'Cháo Gà', CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[DichVu] ([maDV], [tenDV], [gia]) VALUES (N'DV0029', N'Súp Yến', CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[DichVu] ([maDV], [tenDV], [gia]) VALUES (N'DV0030', N'Bò Áp chảo', CAST(150000 AS Decimal(18, 0)))

GO
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [gioiTinh], [cmnd_passport], [diaChi], [quocTich], [email], [sdt]) VALUES (N'KH0001', N'Nguyễn Trà My', 0, N'12345678', N'Nha Trang', N'Việt Nam', N'nguyentramy.45@gmail.com', N'123456790')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [gioiTinh], [cmnd_passport], [diaChi], [quocTich], [email], [sdt]) VALUES (N'KH0002', N'Nguyễn Hoàng Gia Bảo', 1, N'225661231', N'Nha Trang', N'Việt Nam', N'giabao@gmail.com', N'123456780')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [gioiTinh], [cmnd_passport], [diaChi], [quocTich], [email], [sdt]) VALUES (N'KH0003', N'Lê Ngọc Minh Châu', 0, N'225923603', N'Nha Trang', N'Việt Nam', N'minhchau@gmail.com', N'123456787')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [gioiTinh], [cmnd_passport], [diaChi], [quocTich], [email], [sdt]) VALUES (N'KH0004', N'Phan Mạnh Cường', 1, N'2212312', N'Cam Lâm', N'Việt Nam', N'phanmanhcuong@gmail.com', N'123456786')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [gioiTinh], [cmnd_passport], [diaChi], [quocTich], [email], [sdt]) VALUES (N'KH0005', N'Phạm Thế Đạt', 1, N'056203001111', N'Ninh Hòa', N'Việt Nam', N'phamthedat@gmail.com', N'123456785')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [gioiTinh], [cmnd_passport], [diaChi], [quocTich], [email], [sdt]) VALUES (N'KH0006', N'Đỗ Châu Đôn', 1, N'056203001112', N'Cam Ranh', N'Việt Nam', N'dochaudon@gmail.com', N'123456784')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [gioiTinh], [cmnd_passport], [diaChi], [quocTich], [email], [sdt]) VALUES (N'KH0007', N'Nguyễn Tiến Dũng', 1, N'056203001113', N'Cam Lâm', N'Việt Nam', N'nguyentiendung@gmail.com', N'123456783')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [gioiTinh], [cmnd_passport], [diaChi], [quocTich], [email], [sdt]) VALUES (N'KH0008', N'Trần Thị Hạnh Duyên', 0, N'056203001114', N'Phú Yên', N'Việt Nam', N'tranthihanhduyen@gmail.com', N'123456782')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [gioiTinh], [cmnd_passport], [diaChi], [quocTich], [email], [sdt]) VALUES (N'KH0009', N'Phạm Đức Hải', 1, N'056203001115', N'Cam Lâm', N'Việt Nam', N'phamduchai@gmail.com', N'123456781')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [gioiTinh], [cmnd_passport], [diaChi], [quocTich], [email], [sdt]) VALUES (N'KH0010', N'Phan Nhựt Hào', 1, N'056203001116', N'Diên Khánh', N'Việt Nam', N'phannhuthao@gmail.com', N'123456790')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [gioiTinh], [cmnd_passport], [diaChi], [quocTich], [email], [sdt]) VALUES (N'KH0011', N'Trương Thành Hiếu', 1, N'056203001117', N'Nha Trang', N'Việt Nam', N'truongthanhhieu@gmail.com', N'123456791')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [gioiTinh], [cmnd_passport], [diaChi], [quocTich], [email], [sdt]) VALUES (N'KH0012', N'Huỳnh Minh Huy', 1, N'056203001118', N'Vạn Ninh', N'Việt Nam', N'huynhminhhuy@gmail.com', N'123456792')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [gioiTinh], [cmnd_passport], [diaChi], [quocTich], [email], [sdt]) VALUES (N'KH0013', N'Nguyễn Quốc Kha', 1, N'056203001119', N'Nha Trang', N'Việt Nam', N'nguyenquockha@gmail.com', N'123456793')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [gioiTinh], [cmnd_passport], [diaChi], [quocTich], [email], [sdt]) VALUES (N'KH0014', N'Hoàng Gia Khánh', 1, N'056203001120', N'Ninh Hòa', N'Việt Nam', N'hoanggiaKhanh@gmail.com', N'123456794')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [gioiTinh], [cmnd_passport], [diaChi], [quocTich], [email], [sdt]) VALUES (N'KH0015', N'Đặng Nguyễn Đăng Khoa', 1, N'056203001121', N'Ninh Thuận', N'Việt Nam', N'dangnguyendangkhoa@gmail.com', N'123456794')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [gioiTinh], [cmnd_passport], [diaChi], [quocTich], [email], [sdt]) VALUES (N'KH0016', N'Trần Đăng Khoa', 1, N'056203001122', N'Bình Định', N'Việt Nam', N'trandangkhoa@gmail.com', N'123456794')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [gioiTinh], [cmnd_passport], [diaChi], [quocTich], [email], [sdt]) VALUES (N'KH0017', N'Trần Đức Ngạn', 1, N'056203001123', N'Bình Định', N'Việt Nam', N'tranducngan@gmail.com', N'123456794')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [gioiTinh], [cmnd_passport], [diaChi], [quocTich], [email], [sdt]) VALUES (N'KH0018', N'Nguyễn Minh Tài', 1, N'056203001124', N'Hà Nội', N'Việt Nam', N'nguyenminhtai@gmail.com', N'123456794')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [gioiTinh], [cmnd_passport], [diaChi], [quocTich], [email], [sdt]) VALUES (N'KH0019', N'Phạm Bá Thái', 1, N'056203001125', N'Sóc Trăng', N'Việt Nam', N'phambathai@gmail.com', N'123456794')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [gioiTinh], [cmnd_passport], [diaChi], [quocTich], [email], [sdt]) VALUES (N'KH0020', N'Giả Tấn Thịnh', 1, N'056203001126', N'Hồ Chí Minh', N'Việt Nam', N'giatanthinh@gmail.com', N'123456794')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [gioiTinh], [cmnd_passport], [diaChi], [quocTich], [email], [sdt]) VALUES (N'KH0021', N'Nguyễn Đức Thông', 1, N'056203001127', N'Nha Trang', N'Việt Nam', N'nguyenducthong@gmail.com', N'123456794')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [gioiTinh], [cmnd_passport], [diaChi], [quocTich], [email], [sdt]) VALUES (N'KH0022', N'Phạm Hồ Như Thủy', 0, N'056203001128', N'Nha Trang', N'Việt Nam', N'phamhonhuthuy@gmail.com', N'123456794')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [gioiTinh], [cmnd_passport], [diaChi], [quocTich], [email], [sdt]) VALUES (N'KH0023', N'Phan Hồ Ngọc Tiên', 0, N'056203001129', N'Nha Trang', N'Việt Nam', N'phanhongoctien@gmail.com', N'123456794')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [gioiTinh], [cmnd_passport], [diaChi], [quocTich], [email], [sdt]) VALUES (N'KH0024', N'Đặng Minh Trí', 1, N'056203001130', N'Nha Trang', N'Việt Nam', N'dangminhtri@gmail.com', N'123456794')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [gioiTinh], [cmnd_passport], [diaChi], [quocTich], [email], [sdt]) VALUES (N'KH0025', N'Trần Thanh Trí', 1, N'056203001131', N'Nha Trang', N'Việt Nam', N'tranthanhtri@gmail.com', N'123456794')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [gioiTinh], [cmnd_passport], [diaChi], [quocTich], [email], [sdt]) VALUES (N'KH0026', N'Vương Minh Trí', 1, N'056203001132', N'Nha Trang', N'Việt Nam', N'vuongminhtri@gmail.com', N'123456794')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [gioiTinh], [cmnd_passport], [diaChi], [quocTich], [email], [sdt]) VALUES (N'KH0027', N'Đỗ Trầm Trung Trực', 1, N'056203001133', N'Nha Trang', N'Việt Nam', N'dotramtrungtruc@gmail.com', N'123456794')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [gioiTinh], [cmnd_passport], [diaChi], [quocTich], [email], [sdt]) VALUES (N'KH0028', N'Đoàn Thanh Tú', 1, N'056203001134', N'Nha Trang', N'Việt Nam', N'doanthantu@gmail.com', N'123456794')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [gioiTinh], [cmnd_passport], [diaChi], [quocTich], [email], [sdt]) VALUES (N'KH0029', N'Nguyễn Trung Tuấn', 1, N'056203001135', N'Nha Trang', N'Việt Nam', N'nguyentrungtuan@gmail.com', N'123456794')
INSERT [dbo].[KhachHang] ([maKH], [tenKH], [gioiTinh], [cmnd_passport], [diaChi], [quocTich], [email], [sdt]) VALUES (N'KH0030', N'Nguyễn Quang Vinh', 1, N'056203001136', N'Nha Trang', N'Việt Nam', N'nguyenquangvinh@gmail.com', N'123456794')

GO
SET IDENTITY_INSERT [dbo].[LienHe] ON 
INSERT [dbo].[LienHe] ([id], [hoTen], [sdt], [email], [ngayGui], [tinhTrang]) VALUES (1, N'Nguyễn Trà My', N'0123456789', N'nguyentramy16042001@gmail.com', CAST(N'2004-04-16' AS Date), 0)
SET IDENTITY_INSERT [dbo].[LienHe] OFF
GO
INSERT [dbo].[LoaiPhong] ([maLP], [tenLP], [hinhAnh], [sucChua], [donGia], [moTa]) VALUES (N'DBL', N'Double', N'double.jpg', 2, CAST(900000 AS Decimal(18, 0)), N'Đây là phòng 1 giường đôi')
INSERT [dbo].[LoaiPhong] ([maLP], [tenLP], [hinhAnh], [sucChua], [donGia], [moTa]) VALUES (N'SGL', N'Single', N'single.jpg', 1, CAST(450000 AS Decimal(18, 0)), N'Đây là phòng 1 giường đơn')
INSERT [dbo].[LoaiPhong] ([maLP], [tenLP], [hinhAnh], [sucChua], [donGia], [moTa]) VALUES (N'TRPL1', N'Triple 3', N'single.jpg', 3, CAST(1000000 AS Decimal(18, 0)), N'Đây là phòng 3 giường đơn')
INSERT [dbo].[LoaiPhong] ([maLP], [tenLP], [hinhAnh], [sucChua], [donGia], [moTa]) VALUES (N'TRPL2', N'Triple 1 1', N'single.jpg', 3, CAST(1200000 AS Decimal(18, 0)), N'Đây là phòng 1 giường đơn và 1 giường đôi')
INSERT [dbo].[LoaiPhong] ([maLP], [tenLP], [hinhAnh], [sucChua], [donGia], [moTa]) VALUES (N'TWN', N'TWIN', N'twin.jpg', 2, CAST(800000 AS Decimal(18, 0)), N'Đây là phòng 2 giường đơn')
GO
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [gioiTinh], [ngaySinh], [diaChi], [email], [sdt], [hinhAnh]) VALUES (N'NV0001', N'Nguyễn Trà My', 0, CAST(N'2004-04-16' AS Date), N'Khánh Hòa', N'nguyentramy04@gmail.com', N'123456789', N'avatar.jpg')
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [gioiTinh], [ngaySinh], [diaChi], [email], [sdt], [hinhAnh]) VALUES (N'NV0002', N'Trần Thị Hạnh Duyên', 0, CAST(N'2004-03-19' AS Date), N'Ninh Thuận', N'hanhduyen@gmail.com', N'01234571819', N'avatar.jpg')
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [gioiTinh], [ngaySinh], [diaChi], [email], [sdt], [hinhAnh]) VALUES (N'NV0003', N'Nguyễn Thị Ngọc Ly', 0, CAST(N'2004-01-04' AS Date), N'Khánh Hòa', N'nguyenthingocly@gmail.com', N'123456789', N'avatar.jpg')
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [gioiTinh], [ngaySinh], [diaChi], [email], [sdt], [hinhAnh]) VALUES (N'NV0004', N'Nguyễn Minh Tuấn', 1, CAST(N'2002-02-04' AS Date), N'Khánh Hòa', N'minhtuan@gmail.com', N'123456789', N'avatar.jpg')
INSERT [dbo].[NhanVien] ([maNV], [tenNV], [gioiTinh], [ngaySinh], [diaChi], [email], [sdt], [hinhAnh]) VALUES (N'NV0005', N'Lê Ngọc Minh Châu', 0, CAST(N'2004-02-01' AS Date), N'Khánh Hòa', N'minhchau@gmail.com', N'123456789', N'avatar.jpg')
GO
INSERT [dbo].[NhomNhanVien] ([IDNhom], [TenNhom]) VALUES (N'ADMIN', N'Quản trị hệ thống')
INSERT [dbo].[NhomNhanVien] ([IDNhom], [TenNhom]) VALUES (N'NHANVIEN', N'Nhân viên')
GO
SET IDENTITY_INSERT [dbo].[PhanHoi] ON 
GO
INSERT [dbo].[PhanHoi] ([id], [hoTen], [sdt], [email], [noiDung], [ngayGui], [tinhTrang]) VALUES (1, N'Nguyễn Trà My', N'0123456789', N'nguyentramy45@gmail.com', N'Best service', CAST(N'2024-11-23' AS Date), 0)
INSERT [dbo].[PhanHoi] ([id], [hoTen], [sdt], [email], [noiDung], [ngayGui], [tinhTrang]) VALUES (2, N'Nguyễn Hoàng Bảo', N'0123456790', N'nguyenhoangbao@gmail.com', N'Tôi sẽ giới thiệu cho bạn bè!', CAST(N'2024-12-01' AS Date), 1)
INSERT [dbo].[PhanHoi] ([id], [hoTen], [sdt], [email], [noiDung], [ngayGui], [tinhTrang]) VALUES (3, N'Phan Minh Thảo', N'0123456791', N'phanminhthao@gmail.com', N'Tôi khá hài lòng với dịch vụ.', CAST(N'2024-12-05' AS Date), 0)
INSERT [dbo].[PhanHoi] ([id], [hoTen], [sdt], [email], [noiDung], [ngayGui], [tinhTrang]) VALUES (4, N'Hoàng Mai Lan', N'0123456792', N'hoangmailan@gmail.com', N'Dịch vụ tuyệt vời, giữ vững phong độ nhé!', CAST(N'2024-12-10' AS Date), 1)
INSERT [dbo].[PhanHoi] ([id], [hoTen], [sdt], [email], [noiDung], [ngayGui], [tinhTrang]) VALUES (5, N'Nguyễn Lan Hương', N'0123456793', N'nguyenlanhuong@gmail.com', N'I will definitely come back!', CAST(N'2024-12-12' AS Date), 0)
GO
SET IDENTITY_INSERT [dbo].[PhanHoi] OFF
GO
INSERT [dbo].[PhieuDatPhong] ([maPDP], [maKH], [ngayDen], [ngayDi], [tongTienCoc], [soNguoi], [tinhTrang], [maNV]) VALUES (N'PDP0001', N'KH0001', CAST(N'2023-03-17' AS Date), CAST(N'2022-03-25' AS Date), CAST(300000 AS Decimal(18, 0)), 1, 1, N'NV0001')
INSERT [dbo].[PhieuDatPhong] ([maPDP], [maKH], [ngayDen], [ngayDi], [tongTienCoc], [soNguoi], [tinhTrang], [maNV]) VALUES (N'PDP0002', N'KH0002', CAST(N'2023-04-22' AS Date), CAST(N'2022-05-25' AS Date), CAST(600000 AS Decimal(18, 0)), 3, 0, N'NV0002')
INSERT [dbo].[PhieuDatPhong] ([maPDP], [maKH], [ngayDen], [ngayDi], [tongTienCoc], [soNguoi], [tinhTrang], [maNV]) VALUES (N'PDP0003', N'KH0003', CAST(N'2023-05-17' AS Date), CAST(N'2022-07-30' AS Date), CAST(300000 AS Decimal(18, 0)), 3, 1, N'NV0001')
INSERT [dbo].[PhieuDatPhong] ([maPDP], [maKH], [ngayDen], [ngayDi], [tongTienCoc], [soNguoi], [tinhTrang], [maNV]) VALUES (N'PDP0004', N'KH0004', CAST(N'2023-11-01' AS Date), CAST(N'2022-12-25' AS Date), CAST(600000 AS Decimal(18, 0)), 4, 1, N'NV0002')
INSERT [dbo].[PhieuDatPhong] ([maPDP], [maKH], [ngayDen], [ngayDi], [tongTienCoc], [soNguoi], [tinhTrang], [maNV]) VALUES (N'PDP0005', N'KH0005', CAST(N'2023-11-11' AS Date), CAST(N'2022-11-29' AS Date), CAST(300000 AS Decimal(18, 0)), 2, 0, N'NV0002')
INSERT [dbo].[PhieuDatPhong] ([maPDP], [maKH], [ngayDen], [ngayDi], [tongTienCoc], [soNguoi], [tinhTrang], [maNV]) VALUES (N'PDP0006', N'KH0006', CAST(N'2023-03-17' AS Date), CAST(N'2022-03-25' AS Date), CAST(300000 AS Decimal(18, 0)), 1, 1, N'NV0001')
INSERT [dbo].[PhieuDatPhong] ([maPDP], [maKH], [ngayDen], [ngayDi], [tongTienCoc], [soNguoi], [tinhTrang], [maNV]) VALUES (N'PDP0007', N'KH0007', CAST(N'2023-04-22' AS Date), CAST(N'2022-05-25' AS Date), CAST(600000 AS Decimal(18, 0)), 3, 0, N'NV0002')
INSERT [dbo].[PhieuDatPhong] ([maPDP], [maKH], [ngayDen], [ngayDi], [tongTienCoc], [soNguoi], [tinhTrang], [maNV]) VALUES (N'PDP0008', N'KH0008', CAST(N'2023-05-17' AS Date), CAST(N'2022-07-30' AS Date), CAST(300000 AS Decimal(18, 0)), 3, 1, N'NV0001')
INSERT [dbo].[PhieuDatPhong] ([maPDP], [maKH], [ngayDen], [ngayDi], [tongTienCoc], [soNguoi], [tinhTrang], [maNV]) VALUES (N'PDP0009', N'KH0009', CAST(N'2023-11-01' AS Date), CAST(N'2022-12-25' AS Date), CAST(600000 AS Decimal(18, 0)), 4, 1, N'NV0002')
INSERT [dbo].[PhieuDatPhong] ([maPDP], [maKH], [ngayDen], [ngayDi], [tongTienCoc], [soNguoi], [tinhTrang], [maNV]) VALUES (N'PDP0010', N'KH0010', CAST(N'2023-11-11' AS Date), CAST(N'2022-11-29' AS Date), CAST(300000 AS Decimal(18, 0)), 2, 0, N'NV0002')
INSERT [dbo].[PhieuDatPhong] ([maPDP], [maKH], [ngayDen], [ngayDi], [tongTienCoc], [soNguoi], [tinhTrang], [maNV]) VALUES (N'PDP0011', N'KH0011', CAST(N'2023-03-17' AS Date), CAST(N'2022-03-25' AS Date), CAST(300000 AS Decimal(18, 0)), 1, 1, N'NV0001')
INSERT [dbo].[PhieuDatPhong] ([maPDP], [maKH], [ngayDen], [ngayDi], [tongTienCoc], [soNguoi], [tinhTrang], [maNV]) VALUES (N'PDP0012', N'KH0012', CAST(N'2023-04-22' AS Date), CAST(N'2022-05-25' AS Date), CAST(600000 AS Decimal(18, 0)), 3, 0, N'NV0002')
INSERT [dbo].[PhieuDatPhong] ([maPDP], [maKH], [ngayDen], [ngayDi], [tongTienCoc], [soNguoi], [tinhTrang], [maNV]) VALUES (N'PDP0013', N'KH0013', CAST(N'2023-05-17' AS Date), CAST(N'2022-07-30' AS Date), CAST(300000 AS Decimal(18, 0)), 3, 1, N'NV0001')
INSERT [dbo].[PhieuDatPhong] ([maPDP], [maKH], [ngayDen], [ngayDi], [tongTienCoc], [soNguoi], [tinhTrang], [maNV]) VALUES (N'PDP0014', N'KH0014', CAST(N'2023-11-01' AS Date), CAST(N'2022-12-25' AS Date), CAST(600000 AS Decimal(18, 0)), 4, 1, N'NV0002')
INSERT [dbo].[PhieuDatPhong] ([maPDP], [maKH], [ngayDen], [ngayDi], [tongTienCoc], [soNguoi], [tinhTrang], [maNV]) VALUES (N'PDP0015', N'KH0015', CAST(N'2023-11-11' AS Date), CAST(N'2022-11-29' AS Date), CAST(300000 AS Decimal(18, 0)), 2, 0, N'NV0002')
INSERT [dbo].[PhieuDatPhong] ([maPDP], [maKH], [ngayDen], [ngayDi], [tongTienCoc], [soNguoi], [tinhTrang], [maNV]) VALUES (N'PDP0016', N'KH0016', CAST(N'2023-03-17' AS Date), CAST(N'2022-03-25' AS Date), CAST(300000 AS Decimal(18, 0)), 1, 1, N'NV0001')
INSERT [dbo].[PhieuDatPhong] ([maPDP], [maKH], [ngayDen], [ngayDi], [tongTienCoc], [soNguoi], [tinhTrang], [maNV]) VALUES (N'PDP0017', N'KH0017', CAST(N'2023-04-22' AS Date), CAST(N'2022-05-25' AS Date), CAST(600000 AS Decimal(18, 0)), 3, 0, N'NV0002')
INSERT [dbo].[PhieuDatPhong] ([maPDP], [maKH], [ngayDen], [ngayDi], [tongTienCoc], [soNguoi], [tinhTrang], [maNV]) VALUES (N'PDP0018', N'KH0018', CAST(N'2023-05-17' AS Date), CAST(N'2022-07-30' AS Date), CAST(300000 AS Decimal(18, 0)), 3, 1, N'NV0001')
INSERT [dbo].[PhieuDatPhong] ([maPDP], [maKH], [ngayDen], [ngayDi], [tongTienCoc], [soNguoi], [tinhTrang], [maNV]) VALUES (N'PDP0019', N'KH0019', CAST(N'2023-11-01' AS Date), CAST(N'2022-12-25' AS Date), CAST(600000 AS Decimal(18, 0)), 4, 1, N'NV0002')
INSERT [dbo].[PhieuDatPhong] ([maPDP], [maKH], [ngayDen], [ngayDi], [tongTienCoc], [soNguoi], [tinhTrang], [maNV]) VALUES (N'PDP0020', N'KH0020', CAST(N'2023-11-11' AS Date), CAST(N'2022-11-29' AS Date), CAST(300000 AS Decimal(18, 0)), 2, 0, N'NV0002')
INSERT [dbo].[PhieuDatPhong] ([maPDP], [maKH], [ngayDen], [ngayDi], [tongTienCoc], [soNguoi], [tinhTrang], [maNV]) VALUES (N'PDP0021', N'KH0021', CAST(N'2023-03-17' AS Date), CAST(N'2022-03-25' AS Date), CAST(300000 AS Decimal(18, 0)), 1, 1, N'NV0001')
INSERT [dbo].[PhieuDatPhong] ([maPDP], [maKH], [ngayDen], [ngayDi], [tongTienCoc], [soNguoi], [tinhTrang], [maNV]) VALUES (N'PDP0022', N'KH0022', CAST(N'2023-04-22' AS Date), CAST(N'2022-05-25' AS Date), CAST(600000 AS Decimal(18, 0)), 3, 0, N'NV0002')
INSERT [dbo].[PhieuDatPhong] ([maPDP], [maKH], [ngayDen], [ngayDi], [tongTienCoc], [soNguoi], [tinhTrang], [maNV]) VALUES (N'PDP0023', N'KH0023', CAST(N'2023-05-17' AS Date), CAST(N'2022-07-30' AS Date), CAST(300000 AS Decimal(18, 0)), 3, 1, N'NV0001')
INSERT [dbo].[PhieuDatPhong] ([maPDP], [maKH], [ngayDen], [ngayDi], [tongTienCoc], [soNguoi], [tinhTrang], [maNV]) VALUES (N'PDP0024', N'KH0024', CAST(N'2023-11-01' AS Date), CAST(N'2022-12-25' AS Date), CAST(600000 AS Decimal(18, 0)), 4, 1, N'NV0002')
INSERT [dbo].[PhieuDatPhong] ([maPDP], [maKH], [ngayDen], [ngayDi], [tongTienCoc], [soNguoi], [tinhTrang], [maNV]) VALUES (N'PDP0025', N'KH0025', CAST(N'2023-11-11' AS Date), CAST(N'2022-11-29' AS Date), CAST(300000 AS Decimal(18, 0)), 2, 0, N'NV0002')
INSERT [dbo].[PhieuDatPhong] ([maPDP], [maKH], [ngayDen], [ngayDi], [tongTienCoc], [soNguoi], [tinhTrang], [maNV]) VALUES (N'PDP0026', N'KH0026', CAST(N'2023-03-17' AS Date), CAST(N'2022-03-25' AS Date), CAST(300000 AS Decimal(18, 0)), 1, 1, N'NV0001')
INSERT [dbo].[PhieuDatPhong] ([maPDP], [maKH], [ngayDen], [ngayDi], [tongTienCoc], [soNguoi], [tinhTrang], [maNV]) VALUES (N'PDP0027', N'KH0027', CAST(N'2023-04-22' AS Date), CAST(N'2022-05-25' AS Date), CAST(600000 AS Decimal(18, 0)), 3, 0, N'NV0002')
INSERT [dbo].[PhieuDatPhong] ([maPDP], [maKH], [ngayDen], [ngayDi], [tongTienCoc], [soNguoi], [tinhTrang], [maNV]) VALUES (N'PDP0028', N'KH0028', CAST(N'2023-05-17' AS Date), CAST(N'2022-07-30' AS Date), CAST(300000 AS Decimal(18, 0)), 3, 1, N'NV0001')
INSERT [dbo].[PhieuDatPhong] ([maPDP], [maKH], [ngayDen], [ngayDi], [tongTienCoc], [soNguoi], [tinhTrang], [maNV]) VALUES (N'PDP0029', N'KH0029', CAST(N'2023-11-01' AS Date), CAST(N'2022-12-25' AS Date), CAST(600000 AS Decimal(18, 0)), 4, 1, N'NV0002')
INSERT [dbo].[PhieuDatPhong] ([maPDP], [maKH], [ngayDen], [ngayDi], [tongTienCoc], [soNguoi], [tinhTrang], [maNV]) VALUES (N'PDP0030', N'KH0030', CAST(N'2023-11-11' AS Date), CAST(N'2022-11-29' AS Date), CAST(300000 AS Decimal(18, 0)), 2, 0, N'NV0002')
GO
INSERT [dbo].[PhieuThuePhong] ([maPTP], [maPDP], [maKH], [maNV], [ngayThue], [ngayTra]) VALUES (N'PTP0001', N'PDP0001', N'KH0001', N'NV0001', CAST(N'2023-03-19' AS Date), CAST(N'2022-03-25' AS Date))
INSERT [dbo].[PhieuThuePhong] ([maPTP], [maPDP], [maKH], [maNV], [ngayThue], [ngayTra]) VALUES (N'PTP0002', N'PDP0002', N'KH0002', N'NV0002', CAST(N'2023-04-22' AS Date), CAST(N'2022-05-25' AS Date))
INSERT [dbo].[PhieuThuePhong] ([maPTP], [maPDP], [maKH], [maNV], [ngayThue], [ngayTra]) VALUES (N'PTP0003', N'PDP0003', N'KH0003', N'NV0001', CAST(N'2023-05-17' AS Date), CAST(N'2022-07-27' AS Date))
INSERT [dbo].[PhieuThuePhong] ([maPTP], [maPDP], [maKH], [maNV], [ngayThue], [ngayTra]) VALUES (N'PTP0004', N'PDP0004', N'KH0004', N'NV0001', CAST(N'2023-11-10' AS Date), CAST(N'2022-12-21' AS Date))
INSERT [dbo].[PhieuThuePhong] ([maPTP], [maPDP], [maKH], [maNV], [ngayThue], [ngayTra]) VALUES (N'PTP0005', N'PDP0005', N'KH0005', N'NV0002', CAST(N'2023-11-11' AS Date), CAST(N'2022-11-29' AS Date))
INSERT [dbo].[PhieuThuePhong] ([maPTP], [maPDP], [maKH], [maNV], [ngayThue], [ngayTra]) VALUES (N'PTP0006', N'PDP0006', N'KH0006', N'NV0001', CAST(N'2023-03-19' AS Date), CAST(N'2022-03-25' AS Date))
INSERT [dbo].[PhieuThuePhong] ([maPTP], [maPDP], [maKH], [maNV], [ngayThue], [ngayTra]) VALUES (N'PTP0007', N'PDP0007', N'KH0007', N'NV0002', CAST(N'2023-04-22' AS Date), CAST(N'2022-05-25' AS Date))
INSERT [dbo].[PhieuThuePhong] ([maPTP], [maPDP], [maKH], [maNV], [ngayThue], [ngayTra]) VALUES (N'PTP0008', N'PDP0008', N'KH0008', N'NV0001', CAST(N'2023-05-17' AS Date), CAST(N'2022-07-27' AS Date))
INSERT [dbo].[PhieuThuePhong] ([maPTP], [maPDP], [maKH], [maNV], [ngayThue], [ngayTra]) VALUES (N'PTP0009', N'PDP0009', N'KH0009', N'NV0001', CAST(N'2023-11-10' AS Date), CAST(N'2022-12-21' AS Date))
INSERT [dbo].[PhieuThuePhong] ([maPTP], [maPDP], [maKH], [maNV], [ngayThue], [ngayTra]) VALUES (N'PTP0010', N'PDP0010', N'KH0010', N'NV0002', CAST(N'2023-11-11' AS Date), CAST(N'2022-11-29' AS Date))
INSERT [dbo].[PhieuThuePhong] ([maPTP], [maPDP], [maKH], [maNV], [ngayThue], [ngayTra]) VALUES (N'PTP0011', N'PDP0011', N'KH0011', N'NV0001', CAST(N'2023-03-19' AS Date), CAST(N'2022-03-25' AS Date))
INSERT [dbo].[PhieuThuePhong] ([maPTP], [maPDP], [maKH], [maNV], [ngayThue], [ngayTra]) VALUES (N'PTP0012', N'PDP0012', N'KH0012', N'NV0002', CAST(N'2023-04-22' AS Date), CAST(N'2022-05-25' AS Date))
INSERT [dbo].[PhieuThuePhong] ([maPTP], [maPDP], [maKH], [maNV], [ngayThue], [ngayTra]) VALUES (N'PTP0013', N'PDP0013', N'KH0013', N'NV0001', CAST(N'2023-05-17' AS Date), CAST(N'2022-07-27' AS Date))
INSERT [dbo].[PhieuThuePhong] ([maPTP], [maPDP], [maKH], [maNV], [ngayThue], [ngayTra]) VALUES (N'PTP0014', N'PDP0014', N'KH0014', N'NV0001', CAST(N'2023-11-10' AS Date), CAST(N'2022-12-21' AS Date))
INSERT [dbo].[PhieuThuePhong] ([maPTP], [maPDP], [maKH], [maNV], [ngayThue], [ngayTra]) VALUES (N'PTP0015', N'PDP0015', N'KH0015', N'NV0002', CAST(N'2023-11-11' AS Date), CAST(N'2022-11-29' AS Date))
INSERT [dbo].[PhieuThuePhong] ([maPTP], [maPDP], [maKH], [maNV], [ngayThue], [ngayTra]) VALUES (N'PTP0016', N'PDP0016', N'KH0016', N'NV0001', CAST(N'2023-03-19' AS Date), CAST(N'2022-03-25' AS Date))
INSERT [dbo].[PhieuThuePhong] ([maPTP], [maPDP], [maKH], [maNV], [ngayThue], [ngayTra]) VALUES (N'PTP0017', N'PDP0017', N'KH0017', N'NV0002', CAST(N'2023-04-22' AS Date), CAST(N'2022-05-25' AS Date))
INSERT [dbo].[PhieuThuePhong] ([maPTP], [maPDP], [maKH], [maNV], [ngayThue], [ngayTra]) VALUES (N'PTP0018', N'PDP0018', N'KH0018', N'NV0001', CAST(N'2023-05-17' AS Date), CAST(N'2022-07-27' AS Date))
INSERT [dbo].[PhieuThuePhong] ([maPTP], [maPDP], [maKH], [maNV], [ngayThue], [ngayTra]) VALUES (N'PTP0019', N'PDP0019', N'KH0019', N'NV0001', CAST(N'2023-11-10' AS Date), CAST(N'2022-12-21' AS Date))
INSERT [dbo].[PhieuThuePhong] ([maPTP], [maPDP], [maKH], [maNV], [ngayThue], [ngayTra]) VALUES (N'PTP0020', N'PDP0020', N'KH0020', N'NV0002', CAST(N'2023-11-11' AS Date), CAST(N'2022-11-29' AS Date))
INSERT [dbo].[PhieuThuePhong] ([maPTP], [maPDP], [maKH], [maNV], [ngayThue], [ngayTra]) VALUES (N'PTP0021', N'PDP0021', N'KH0021', N'NV0001', CAST(N'2023-03-19' AS Date), CAST(N'2022-03-25' AS Date))
INSERT [dbo].[PhieuThuePhong] ([maPTP], [maPDP], [maKH], [maNV], [ngayThue], [ngayTra]) VALUES (N'PTP0022', N'PDP0022', N'KH0022', N'NV0002', CAST(N'2023-04-22' AS Date), CAST(N'2022-05-25' AS Date))
INSERT [dbo].[PhieuThuePhong] ([maPTP], [maPDP], [maKH], [maNV], [ngayThue], [ngayTra]) VALUES (N'PTP0023', N'PDP0023', N'KH0023', N'NV0001', CAST(N'2023-05-17' AS Date), CAST(N'2022-07-27' AS Date))
INSERT [dbo].[PhieuThuePhong] ([maPTP], [maPDP], [maKH], [maNV], [ngayThue], [ngayTra]) VALUES (N'PTP0024', N'PDP0024', N'KH0024', N'NV0001', CAST(N'2023-11-10' AS Date), CAST(N'2022-12-21' AS Date))
INSERT [dbo].[PhieuThuePhong] ([maPTP], [maPDP], [maKH], [maNV], [ngayThue], [ngayTra]) VALUES (N'PTP0025', N'PDP0025', N'KH0025', N'NV0002', CAST(N'2023-11-11' AS Date), CAST(N'2022-11-29' AS Date))
INSERT [dbo].[PhieuThuePhong] ([maPTP], [maPDP], [maKH], [maNV], [ngayThue], [ngayTra]) VALUES (N'PTP0026', N'PDP0026', N'KH0026', N'NV0001', CAST(N'2023-03-19' AS Date), CAST(N'2022-03-25' AS Date))
INSERT [dbo].[PhieuThuePhong] ([maPTP], [maPDP], [maKH], [maNV], [ngayThue], [ngayTra]) VALUES (N'PTP0027', N'PDP0027', N'KH0027', N'NV0002', CAST(N'2023-04-22' AS Date), CAST(N'2022-05-25' AS Date))
INSERT [dbo].[PhieuThuePhong] ([maPTP], [maPDP], [maKH], [maNV], [ngayThue], [ngayTra]) VALUES (N'PTP0028', N'PDP0028', N'KH0028', N'NV0001', CAST(N'2023-05-17' AS Date), CAST(N'2022-07-27' AS Date))
INSERT [dbo].[PhieuThuePhong] ([maPTP], [maPDP], [maKH], [maNV], [ngayThue], [ngayTra]) VALUES (N'PTP0029', N'PDP0029', N'KH0029', N'NV0001', CAST(N'2023-11-10' AS Date), CAST(N'2022-12-21' AS Date))
INSERT [dbo].[PhieuThuePhong] ([maPTP], [maPDP], [maKH], [maNV], [ngayThue], [ngayTra]) VALUES (N'PTP0030', N'PDP0030', N'KH0030', N'NV0002', CAST(N'2023-11-11' AS Date), CAST(N'2022-11-29' AS Date))
GO
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P101', N'SGL', N'Trống')
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P102', N'SGL', N'Trống')
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P103', N'DBL', N'Trống')
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P104', N'TWN', N'Trống')
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P105', N'TRPL1', N'Trống')
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P106', N'SGL', N'Trống')
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P107', N'SGL', N'Trống')
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P108', N'DBL', N'Trống')
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P109', N'TWN', N'Trống')
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P110', N'TRPL1', N'Trống')
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P201', N'SGL', N'Trống')
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P202', N'DBL', N'Trống')
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P203', N'TWN', N'Trống')
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P204', N'TRPL2', N'Trống')
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P205', N'TRPL2', N'Trống')
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P206', N'SGL', N'Trống')
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P207', N'DBL', N'Trống')
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P208', N'TWN', N'Trống')
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P209', N'TRPL2', N'Trống')
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P210', N'TRPL2', N'Trống')
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P301', N'TRPL1', N'Trống')
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P302', N'DBL', N'Trống')
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P303', N'SGL', N'Trống')
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P304', N'TRPL1', N'Trống')
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P305', N'DBL', N'Trống')
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P306', N'SGL', N'Trống')
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P307', N'TRPL1', N'Trống')
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P308', N'DBL', N'Trống')
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P309', N'SGL', N'Trống')
INSERT [dbo].[Phong] ([maP], [maLP], [tinhTrang]) VALUES (N'P310', N'SGL', N'Trống')
GO
-- PASSWORD: tramy1604
INSERT [dbo].[QuanTri] ([username], [password], [tinhTrang], [maNV], [IDNhom]) VALUES (N'admin', N'32f7edfdedf40065cffc22771832d401', 1, N'NV0001', N'ADMIN')
INSERT [dbo].[QuanTri] ([username], [password], [tinhTrang], [maNV], [IDNhom]) VALUES (N'tramy', N'32f7edfdedf40065cffc22771832d401', 1, N'NV0002', N'NHANVIEN')
GO
INSERT [dbo].[Quyen] ([IDQuyen], [TenQuyen]) VALUES (N'ADD_CUSTOMER', N'Thêm khách hàng')
INSERT [dbo].[Quyen] ([IDQuyen], [TenQuyen]) VALUES (N'ADD_USER', N'Thêm người dùng')
INSERT [dbo].[Quyen] ([IDQuyen], [TenQuyen]) VALUES (N'DELETE_CUSTOMER', N'Xóa khách hàng')
INSERT [dbo].[Quyen] ([IDQuyen], [TenQuyen]) VALUES (N'DELETE_USER', N'Xóa người dùng')
INSERT [dbo].[Quyen] ([IDQuyen], [TenQuyen]) VALUES (N'DETAILS_CUSTOMER', N'Xem thông tin chi tiết khách hàng')
INSERT [dbo].[Quyen] ([IDQuyen], [TenQuyen]) VALUES (N'EDIT_CUSTOMER', N'Sửa khách hàng')
INSERT [dbo].[Quyen] ([IDQuyen], [TenQuyen]) VALUES (N'EDIT_USER', N'Sửa người dùng')
INSERT [dbo].[Quyen] ([IDQuyen], [TenQuyen]) VALUES (N'VIEW_CUSTOMER', N'Xem danh sách khách hàng')
INSERT [dbo].[Quyen] ([IDQuyen], [TenQuyen]) VALUES (N'VIEW_USER', N'Xem danh sách người dùng')
GO
ALTER TABLE [dbo].[QuanTri] ADD  CONSTRAINT [DF_QuanTri_IDNhom]  DEFAULT ('NHANVIEN') FOR [IDNhom]
GO
ALTER TABLE [dbo].[CTPhieuDatPhong]  WITH CHECK ADD  CONSTRAINT [ctpdp_p_fk] FOREIGN KEY([maP])
REFERENCES [dbo].[Phong] ([maP])
GO
ALTER TABLE [dbo].[CTPhieuDatPhong] CHECK CONSTRAINT [ctpdp_p_fk]
GO
ALTER TABLE [dbo].[CTPhieuDatPhong]  WITH CHECK ADD  CONSTRAINT [ctpdp_pdp_fk] FOREIGN KEY([maPDP])
REFERENCES [dbo].[PhieuDatPhong] ([maPDP])
GO
ALTER TABLE [dbo].[CTPhieuDatPhong] CHECK CONSTRAINT [ctpdp_pdp_fk]
GO
ALTER TABLE [dbo].[CTPhieuThuePhong]  WITH CHECK ADD  CONSTRAINT [ctptp_dv_fk] FOREIGN KEY([maDV])
REFERENCES [dbo].[DichVu] ([maDV])
GO
ALTER TABLE [dbo].[CTPhieuThuePhong] CHECK CONSTRAINT [ctptp_dv_fk]
GO
ALTER TABLE [dbo].[CTPhieuThuePhong]  WITH CHECK ADD  CONSTRAINT [ctptp_p_fk] FOREIGN KEY([maP])
REFERENCES [dbo].[Phong] ([maP])
GO
ALTER TABLE [dbo].[CTPhieuThuePhong] CHECK CONSTRAINT [ctptp_p_fk]
GO
ALTER TABLE [dbo].[CTPhieuThuePhong]  WITH CHECK ADD  CONSTRAINT [ctptp_ptp_fk] FOREIGN KEY([maPTP])
REFERENCES [dbo].[PhieuThuePhong] ([maPTP])
GO
ALTER TABLE [dbo].[CTPhieuThuePhong] CHECK CONSTRAINT [ctptp_ptp_fk]
GO
ALTER TABLE [dbo].[DanhSachQuyen]  WITH CHECK ADD  CONSTRAINT [FK_DanhSachQuyen_NhomNhanVien] FOREIGN KEY([IDNhom])
REFERENCES [dbo].[NhomNhanVien] ([IDNhom])
GO
ALTER TABLE [dbo].[DanhSachQuyen] CHECK CONSTRAINT [FK_DanhSachQuyen_NhomNhanVien]
GO
ALTER TABLE [dbo].[DanhSachQuyen]  WITH CHECK ADD  CONSTRAINT [FK_DanhSachQuyen_Quyen] FOREIGN KEY([IDQuyen])
REFERENCES [dbo].[Quyen] ([IDQuyen])
GO
ALTER TABLE [dbo].[DanhSachQuyen] CHECK CONSTRAINT [FK_DanhSachQuyen_Quyen]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [hd_nv_fk] FOREIGN KEY([maNV])
REFERENCES [dbo].[NhanVien] ([maNV])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [hd_nv_fk]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [hd_ptp_fk] FOREIGN KEY([maPTP])
REFERENCES [dbo].[PhieuThuePhong] ([maPTP])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [hd_ptp_fk]
GO
ALTER TABLE [dbo].[PhieuDatPhong]  WITH CHECK ADD  CONSTRAINT [pdp_kh_fk] FOREIGN KEY([maKH])
REFERENCES [dbo].[KhachHang] ([maKH])
GO
ALTER TABLE [dbo].[PhieuDatPhong] CHECK CONSTRAINT [pdp_kh_fk]
GO
ALTER TABLE [dbo].[PhieuDatPhong]  WITH CHECK ADD  CONSTRAINT [pdp_nv_fk] FOREIGN KEY([maNV])
REFERENCES [dbo].[NhanVien] ([maNV])
GO
ALTER TABLE [dbo].[PhieuDatPhong] CHECK CONSTRAINT [pdp_nv_fk]
GO
ALTER TABLE [dbo].[PhieuThuePhong]  WITH CHECK ADD  CONSTRAINT [ptp_kh_fk] FOREIGN KEY([maKH])
REFERENCES [dbo].[KhachHang] ([maKH])
GO
ALTER TABLE [dbo].[PhieuThuePhong] CHECK CONSTRAINT [ptp_kh_fk]
GO
ALTER TABLE [dbo].[PhieuThuePhong]  WITH CHECK ADD  CONSTRAINT [ptp_nv_fk] FOREIGN KEY([maNV])
REFERENCES [dbo].[NhanVien] ([maNV])
GO
ALTER TABLE [dbo].[PhieuThuePhong] CHECK CONSTRAINT [ptp_nv_fk]
GO
ALTER TABLE [dbo].[PhieuThuePhong]  WITH CHECK ADD  CONSTRAINT [ptp_pdp_fk] FOREIGN KEY([maPDP])
REFERENCES [dbo].[PhieuDatPhong] ([maPDP])
GO
ALTER TABLE [dbo].[PhieuThuePhong] CHECK CONSTRAINT [ptp_pdp_fk]
GO
ALTER TABLE [dbo].[Phong]  WITH CHECK ADD  CONSTRAINT [p_lp_fk] FOREIGN KEY([maLP])
REFERENCES [dbo].[LoaiPhong] ([maLP])
GO
ALTER TABLE [dbo].[Phong] CHECK CONSTRAINT [p_lp_fk]
GO
ALTER TABLE [dbo].[QuanTri]  WITH CHECK ADD  CONSTRAINT [qt_nnv_fk] FOREIGN KEY([IDNhom])
REFERENCES [dbo].[NhomNhanVien] ([IDNhom])
GO
ALTER TABLE [dbo].[QuanTri] CHECK CONSTRAINT [qt_nnv_fk]
GO
ALTER TABLE [dbo].[QuanTri]  WITH CHECK ADD  CONSTRAINT [qt_nv_fk] FOREIGN KEY([maNV])
REFERENCES [dbo].[NhanVien] ([maNV])
GO
ALTER TABLE [dbo].[QuanTri] CHECK CONSTRAINT [qt_nv_fk]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[KhachHang_TimKiem]
	@maKH varchar(10) =null,
	@tenKH nvarchar(50) =null,
	@gioiTinh nvarchar(3) =null,
	@cmnd_passport varchar(15) =null,
	@diaChi nvarchar(50) =null,
	@quocTich nvarchar(50) =null,
	@email varchar(50) =null,
	@sdt varchar(20) =null
as
begin
declare @SqlStr nvarchar(4000),
		@ParamList nvarchar(2000)
select @SqlStr ='select * from KhachHang where (1=1)'
if @maKH is not null 
	select @SqlStr = @SqlStr + ' and ( maKH like ''%'+@maKH+'%'') '
if @tenKH is not null
	select @SqlStr = @SqlStr + 'and (tenKH like N''%'+@tenKH+'%'')'
if @gioiTinh is not null
	select @SqlStr = @SqlStr + 'and (gioiTinh like ''%'+ @gioiTinh+'%'')'
if @cmnd_passport is not null
	select @SqlStr = @SqlStr + 'and (cmnd_passport like ''%'+@cmnd_passport+'%'')'
if @diaChi is not null
	select @SqlStr = @SqlStr + 'and (diaChi like N''%'+@diaChi+'%'')'
if @quocTich is not null
	select @SqlStr = @SqlStr + 'and (quocTich like N''%'+@quocTich+'%'')'
if @email is not null
	select @SqlStr = @SqlStr + 'and (email like ''%'+@email+'%'')'
if @sdt is not null
	select @SqlStr = @SqlStr + 'and (sdt like ''%'+@sdt+'%'')'

exec sp_executesql @SqlStr
end
GO
select * from KhachHang go

