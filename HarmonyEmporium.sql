USE [master]
GO
/****** Object:  Database [HarmonyEmporium]    Script Date: 8/20/2019 4:31:48 PM ******/
CREATE DATABASE [HarmonyEmporium]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HarmonyEmporium', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\HarmonyEmporium.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HarmonyEmporium_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\HarmonyEmporium_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [HarmonyEmporium] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HarmonyEmporium].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HarmonyEmporium] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HarmonyEmporium] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HarmonyEmporium] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HarmonyEmporium] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HarmonyEmporium] SET ARITHABORT OFF 
GO
ALTER DATABASE [HarmonyEmporium] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [HarmonyEmporium] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HarmonyEmporium] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HarmonyEmporium] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HarmonyEmporium] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HarmonyEmporium] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HarmonyEmporium] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HarmonyEmporium] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HarmonyEmporium] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HarmonyEmporium] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HarmonyEmporium] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HarmonyEmporium] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HarmonyEmporium] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HarmonyEmporium] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HarmonyEmporium] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HarmonyEmporium] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HarmonyEmporium] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HarmonyEmporium] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HarmonyEmporium] SET  MULTI_USER 
GO
ALTER DATABASE [HarmonyEmporium] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HarmonyEmporium] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HarmonyEmporium] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HarmonyEmporium] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HarmonyEmporium] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HarmonyEmporium] SET QUERY_STORE = OFF
GO
USE [HarmonyEmporium]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 8/20/2019 4:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[BrandID] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [varchar](100) NULL,
	[BrandCreateDate] [datetime] NULL,
	[BrandPhotoURL] [varchar](250) NULL,
	[WebsiteURL] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[BrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItems]    Script Date: 8/20/2019 4:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItems](
	[UserID] [int] NULL,
	[ProductID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 8/20/2019 4:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](100) NULL,
	[CategoryCreateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 8/20/2019 4:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLog](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[TimeStamp] [datetime] NULL,
	[Message] [text] NULL,
	[StactTract] [text] NULL,
	[Source] [text] NULL,
	[TargetSite] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fees]    Script Date: 8/20/2019 4:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fees](
	[FeeID] [int] IDENTITY(1,1) NOT NULL,
	[Tax] [decimal](2, 2) NULL,
	[ShippingFee] [decimal](15, 2) NULL,
	[RateCreationDate] [datetime] NULL,
	[RateEndDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[FeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HashHistory]    Script Date: 8/20/2019 4:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HashHistory](
	[UserID] [int] NULL,
	[Salt] [varchar](64) NULL,
	[Hash] [varchar](64) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 8/20/2019 4:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[OrderID] [int] NULL,
	[UserID] [int] NULL,
	[ProductID] [int] NULL,
	[SaleID] [int] NULL,
	[TimeOfOrder] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 8/20/2019 4:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ProductID] [int] NULL,
	[FeeID] [int] NULL,
	[OnSale] [bit] NULL,
	[CashOrCard] [varchar](5) NULL,
	[GrandTotal] [decimal](15, 2) NULL,
	[TimeOfOrder] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 8/20/2019 4:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierID] [int] NULL,
	[CategoryID] [int] NULL,
	[BrandID] [int] NULL,
	[ProductName] [varchar](100) NULL,
	[RetailPrice] [decimal](15, 2) NULL,
	[WholeSalePrice] [decimal](15, 4) NULL,
	[OnSale] [bit] NULL,
	[Quantity] [int] NULL,
	[Color] [varchar](35) NULL,
	[Description] [text] NULL,
	[ProductCreateDate] [datetime] NULL,
	[ProductPhotoURL] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductViews]    Script Date: 8/20/2019 4:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductViews](
	[UserID] [int] NULL,
	[ProductID] [int] NULL,
	[ViewDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 8/20/2019 4:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](35) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 8/20/2019 4:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[SaleID] [int] IDENTITY(1,1) NOT NULL,
	[ProductOnSale] [int] NULL,
	[CategoryOnSale] [int] NULL,
	[BrandOnSale] [int] NULL,
	[SaleName] [varchar](100) NULL,
	[PercentOff] [decimal](2, 2) NULL,
	[Active] [bit] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[SaleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 8/20/2019 4:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[UserID] [int] NULL,
	[FontSize] [decimal](2, 1) NULL,
	[Font] [varchar](50) NULL,
	[PrimaryColor] [varchar](50) NULL,
	[SecondaryColor] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 8/20/2019 4:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [varchar](120) NULL,
	[ContactName] [varchar](120) NULL,
	[ContactEmail] [varchar](120) NULL,
	[Address] [varchar](120) NULL,
	[SupplierCreateDate] [datetime] NULL,
	[SuppliersPhotoURL] [varchar](250) NULL,
	[WebsiteURL] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/20/2019 4:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[Email] [varchar](65) NOT NULL,
	[Hash] [varchar](64) NOT NULL,
	[Salt] [varchar](64) NOT NULL,
	[Address] [varchar](100) NULL,
	[FirstName] [varchar](45) NULL,
	[LastName] [varchar](45) NULL,
	[Birthday] [date] NULL,
	[Phone] [varchar](15) NULL,
	[AccountCreateDate] [datetime] NULL,
	[PhotoURL] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([BrandID], [BrandName], [BrandCreateDate], [BrandPhotoURL], [WebsiteURL]) VALUES (1, N'Fender', CAST(N'2019-08-19T00:11:08.720' AS DateTime), NULL, NULL)
INSERT [dbo].[Brands] ([BrandID], [BrandName], [BrandCreateDate], [BrandPhotoURL], [WebsiteURL]) VALUES (2, N'Ibanez', CAST(N'2019-08-19T00:11:08.720' AS DateTime), NULL, NULL)
INSERT [dbo].[Brands] ([BrandID], [BrandName], [BrandCreateDate], [BrandPhotoURL], [WebsiteURL]) VALUES (3, N'Pearl', CAST(N'2019-08-19T00:11:08.720' AS DateTime), NULL, NULL)
INSERT [dbo].[Brands] ([BrandID], [BrandName], [BrandCreateDate], [BrandPhotoURL], [WebsiteURL]) VALUES (4, N'Akai', CAST(N'2019-08-19T00:11:08.720' AS DateTime), NULL, NULL)
INSERT [dbo].[Brands] ([BrandID], [BrandName], [BrandCreateDate], [BrandPhotoURL], [WebsiteURL]) VALUES (5, N'Peavey', CAST(N'2019-08-19T00:11:08.720' AS DateTime), NULL, NULL)
INSERT [dbo].[Brands] ([BrandID], [BrandName], [BrandCreateDate], [BrandPhotoURL], [WebsiteURL]) VALUES (6, N'Gibson', CAST(N'2019-08-19T00:11:08.720' AS DateTime), NULL, NULL)
INSERT [dbo].[Brands] ([BrandID], [BrandName], [BrandCreateDate], [BrandPhotoURL], [WebsiteURL]) VALUES (7, N'Jackson', CAST(N'2019-08-19T00:11:08.720' AS DateTime), NULL, NULL)
INSERT [dbo].[Brands] ([BrandID], [BrandName], [BrandCreateDate], [BrandPhotoURL], [WebsiteURL]) VALUES (8, N'Orange', CAST(N'2019-08-19T00:11:08.720' AS DateTime), NULL, NULL)
INSERT [dbo].[Brands] ([BrandID], [BrandName], [BrandCreateDate], [BrandPhotoURL], [WebsiteURL]) VALUES (9, N'Marshall', CAST(N'2019-08-19T00:11:08.720' AS DateTime), NULL, NULL)
INSERT [dbo].[Brands] ([BrandID], [BrandName], [BrandCreateDate], [BrandPhotoURL], [WebsiteURL]) VALUES (10, N'ErnieBall', CAST(N'2019-08-19T00:11:08.720' AS DateTime), NULL, NULL)
INSERT [dbo].[Brands] ([BrandID], [BrandName], [BrandCreateDate], [BrandPhotoURL], [WebsiteURL]) VALUES (11, N'Yamaha', CAST(N'2019-08-19T00:11:08.720' AS DateTime), NULL, NULL)
INSERT [dbo].[Brands] ([BrandID], [BrandName], [BrandCreateDate], [BrandPhotoURL], [WebsiteURL]) VALUES (12, N'Steinway', CAST(N'2019-08-19T00:11:08.720' AS DateTime), NULL, NULL)
INSERT [dbo].[Brands] ([BrandID], [BrandName], [BrandCreateDate], [BrandPhotoURL], [WebsiteURL]) VALUES (13, N'MusicMan', CAST(N'2019-08-19T00:11:08.720' AS DateTime), NULL, NULL)
INSERT [dbo].[Brands] ([BrandID], [BrandName], [BrandCreateDate], [BrandPhotoURL], [WebsiteURL]) VALUES (14, N'Roland', CAST(N'2019-08-19T00:11:08.720' AS DateTime), NULL, NULL)
INSERT [dbo].[Brands] ([BrandID], [BrandName], [BrandCreateDate], [BrandPhotoURL], [WebsiteURL]) VALUES (15, N'Johnson', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Brands] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryCreateDate]) VALUES (1, N'Guitar', CAST(N'2019-08-19T00:04:28.280' AS DateTime))
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryCreateDate]) VALUES (2, N'Bass', CAST(N'2019-08-19T00:04:28.280' AS DateTime))
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryCreateDate]) VALUES (3, N'Percussion', CAST(N'2019-08-19T00:04:28.280' AS DateTime))
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryCreateDate]) VALUES (4, N'Accessories ', CAST(N'2019-08-19T00:04:28.280' AS DateTime))
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryCreateDate]) VALUES (5, N'Tuner', CAST(N'2019-08-19T00:04:28.280' AS DateTime))
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryCreateDate]) VALUES (6, N'Microphones', CAST(N'2019-08-19T00:04:28.280' AS DateTime))
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryCreateDate]) VALUES (7, N'Gear', CAST(N'2019-08-19T00:04:28.280' AS DateTime))
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryCreateDate]) VALUES (8, N'Pedals', CAST(N'2019-08-19T00:04:28.280' AS DateTime))
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryCreateDate]) VALUES (9, N'Cables', CAST(N'2019-08-19T00:04:28.280' AS DateTime))
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryCreateDate]) VALUES (10, N'Software', CAST(N'2019-08-19T00:04:28.280' AS DateTime))
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryCreateDate]) VALUES (11, N'Woodwind', CAST(N'2019-08-19T00:04:28.280' AS DateTime))
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryCreateDate]) VALUES (12, N'Brass', CAST(N'2019-08-19T00:04:28.280' AS DateTime))
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryCreateDate]) VALUES (13, N'Tech', CAST(N'2019-08-19T00:04:28.280' AS DateTime))
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryCreateDate]) VALUES (14, N'Picks', CAST(N'2019-08-19T00:04:28.280' AS DateTime))
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryCreateDate]) VALUES (15, N'Strings', CAST(N'2019-08-19T00:04:28.280' AS DateTime))
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryCreateDate]) VALUES (16, N'Straps', CAST(N'2019-08-19T00:04:28.280' AS DateTime))
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryCreateDate]) VALUES (17, N'Piano', CAST(N'2019-08-19T00:04:28.280' AS DateTime))
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryCreateDate]) VALUES (18, N'Keyboards', CAST(N'2019-08-19T00:04:28.280' AS DateTime))
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryCreateDate]) VALUES (19, N'DJ', CAST(N'2019-08-19T00:04:28.280' AS DateTime))
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (1, N'User')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (2, N'Power User')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (3, N'Admin')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (4, N'Cheif Executive Officer')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [ContactName], [ContactEmail], [Address], [SupplierCreateDate], [SuppliersPhotoURL], [WebsiteURL]) VALUES (1, N'The Music Shipping Company', N'Jenny Elies', N'JennyElies24@gmail.com', N'12345 South Lane Street Atlanta GA', CAST(N'2019-08-19T09:48:38.073' AS DateTime), NULL, N'https://musicshipping.co.uk/')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [ContactName], [ContactEmail], [Address], [SupplierCreateDate], [SuppliersPhotoURL], [WebsiteURL]) VALUES (2, N'American Musical Supply ', N'Terry Jerry ', N'Terrynotjerry@gmail.com', N'8 Thornton Rd, Oakland, NJ 07436', CAST(N'2019-08-19T09:48:38.073' AS DateTime), NULL, N'https://www.americanmusical.com/?src=Y0805GLSHAMS0000&gclid=EAIaIQobChMI_I3lzIeP5AIVFbbICh344wjVEAAYASAAEgJkQvD_BwE')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [ContactName], [ContactEmail], [Address], [SupplierCreateDate], [SuppliersPhotoURL], [WebsiteURL]) VALUES (3, N'Sweetwater', N'Jane Ferry', N'JaneFerry@yahoo.com', N'5501 US Hwy 30 W, Fort Wayne, IN 46818', CAST(N'2019-08-19T09:48:38.073' AS DateTime), NULL, N'https://www.sweetwater.com/local/music-store/')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [ContactName], [ContactEmail], [Address], [SupplierCreateDate], [SuppliersPhotoURL], [WebsiteURL]) VALUES (4, N'Musician''s Friend', N'Brian Johnson', N'BrianJohnson@gmail.com', N'Musician''s Friend Inc.
PO Box 7479
Westlake Village, CA 91359', CAST(N'2019-08-19T09:48:38.073' AS DateTime), NULL, N'https://www.musiciansfriend.com/')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [ContactName], [ContactEmail], [Address], [SupplierCreateDate], [SuppliersPhotoURL], [WebsiteURL]) VALUES (5, N'Gear4music', N'John Wayne', N'JohnWayne@gmail.com', N'Kettlestring Lane
Clifton Moor
York, YO30 4XF
United Kingdom', CAST(N'2019-08-19T09:48:38.073' AS DateTime), NULL, N'https://www.gear4music.com/us/en/')
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [RoleID], [Email], [Hash], [Salt], [Address], [FirstName], [LastName], [Birthday], [Phone], [AccountCreateDate], [PhotoURL]) VALUES (3, 1, N'jimmypage@gmail.com', N'AAAAHASH', N'AAAASALT', N'The Tower House, 29 Melbury Road', N'Jimmy', N'Page', CAST(N'1944-01-09' AS Date), N'404-606-7106', NULL, NULL)
INSERT [dbo].[Users] ([UserID], [RoleID], [Email], [Hash], [Salt], [Address], [FirstName], [LastName], [Birthday], [Phone], [AccountCreateDate], [PhotoURL]) VALUES (4, 2, N'JohnnyBGoode@yahoo.com', N'BBBBHASH', N'BBBBSALT', N'1213 Salabar street', N'Johnny', N'Goode', CAST(N'1926-10-18' AS Date), N'607-250-7895', NULL, NULL)
INSERT [dbo].[Users] ([UserID], [RoleID], [Email], [Hash], [Salt], [Address], [FirstName], [LastName], [Birthday], [Phone], [AccountCreateDate], [PhotoURL]) VALUES (5, 3, N'Slasherfromgnr@gmail.com', N'CCCHASH', N'CCCCSALT', N'7015 Hollywood Street ', N'Saul ', N'Hudson', CAST(N'1965-07-23' AS Date), N'912-231-7015', NULL, NULL)
INSERT [dbo].[Users] ([UserID], [RoleID], [Email], [Hash], [Salt], [Address], [FirstName], [LastName], [Birthday], [Phone], [AccountCreateDate], [PhotoURL]) VALUES (6, 3, N'Mozartduhhhh@yahoo.com', N'DDDDHASH', N'DDDDSALT', N'1717 Ole town Rd', N'Amadeus ', N'Mozart', CAST(N'1756-01-27' AS Date), N'716-215-1515', NULL, NULL)
INSERT [dbo].[Users] ([UserID], [RoleID], [Email], [Hash], [Salt], [Address], [FirstName], [LastName], [Birthday], [Phone], [AccountCreateDate], [PhotoURL]) VALUES (7, 4, N'GypsyJazzKING@gmail.com', N'EEEEEHASH', N'EEEESALT', N'2514 Defrost Rd', N'Django ', N'Reinhardt', CAST(N'1910-01-23' AS Date), N'912-250-4567', NULL, NULL)
INSERT [dbo].[Users] ([UserID], [RoleID], [Email], [Hash], [Salt], [Address], [FirstName], [LastName], [Birthday], [Phone], [AccountCreateDate], [PhotoURL]) VALUES (8, 2, N'SaxaphoneGenius@gmail.com', N'FFFFHASH', N'FFFFSALT', N'2500 ScabTown Street', N'Charlie ', N'Parker', CAST(N'1920-08-29' AS Date), N'804-164-7895', NULL, NULL)
INSERT [dbo].[Users] ([UserID], [RoleID], [Email], [Hash], [Salt], [Address], [FirstName], [LastName], [Birthday], [Phone], [AccountCreateDate], [PhotoURL]) VALUES (9, 1, N'IamtheSaxKing@gmail.com', N'GGGGHASH', N'GGGGSALT', N'564 jerryDance street', N'Chris ', N'Potter', CAST(N'1971-01-01' AS Date), N'456-789-4562', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D10534D568E7C2]    Script Date: 8/20/2019 4:31:49 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[HashHistory]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD FOREIGN KEY([SaleID])
REFERENCES [dbo].[Sales] ([SaleID])
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([FeeID])
REFERENCES [dbo].[Fees] ([FeeID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([BrandID])
REFERENCES [dbo].[Brands] ([BrandID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[ProductViews]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[ProductViews]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD FOREIGN KEY([BrandOnSale])
REFERENCES [dbo].[Brands] ([BrandID])
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD FOREIGN KEY([CategoryOnSale])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD FOREIGN KEY([ProductOnSale])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Settings]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
/****** Object:  StoredProcedure [dbo].[ProductsDeleteByID]    Script Date: 8/20/2019 4:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		</CodyBarber>
-- Create date: <8/19/19>
-- Description:	<TableName + Action>
-- =============================================
CREATE PROCEDURE [dbo].[ProductsDeleteByID]
@ProductID INT


AS
BEGIN
	
	SET NOCOUNT ON;
Delete FROM Products WHERE ProductID =@ProductID		
END
GO
/****** Object:  StoredProcedure [dbo].[ProductsGetAll]    Script Date: 8/20/2019 4:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		</CodyBarber>
-- Create date: <8/19/19>
-- Description:	<TableName + Action>
-- =============================================
CREATE PROCEDURE [dbo].[ProductsGetAll]

AS
BEGIN
	
	SET NOCOUNT ON;
	SELECT  ProductID , SupplierID, CategoryID, BrandID,ProductName, RetailPrice, WholeSalePrice, OnSale, Quantity, Color, Description, ProductCreateDate, ProductPhotoURL FROM Products
		
END
GO
/****** Object:  StoredProcedure [dbo].[ProductsGetByID]    Script Date: 8/20/2019 4:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		</CodyBarber>
-- Create date: <8/19/19>
-- Description:	<TableName + Action>
-- =============================================
CREATE PROCEDURE [dbo].[ProductsGetByID]
@ProductID INT
AS
BEGIN
	
	SET NOCOUNT ON;
	SELECT  a.ProductID,a.ProductName, a.SupplierID, b.SupplierName, a.CategoryID,c.CategoryName, a.BrandID, d.BrandName, a.RetailPrice, a.WholeSalePrice, a.OnSale, a.Quantity, a.Color, a.[Description], a.ProductCreateDate,a.ProductPhotoURL 
	FROM Products AS a 
	LEFT JOIN Suppliers AS b
	ON a.SupplierID = b.SupplierID
	LEFT JOIN Categories AS c
	ON a.CategoryID = c.CategoryID
	
	LEFT JOIN Brands AS d
	on a.BrandID = d.BrandID
	WHERE ProductID = @ProductID
		
END
GO
/****** Object:  StoredProcedure [dbo].[ProductsUpdateByID]    Script Date: 8/20/2019 4:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		</CodyBarber>
-- Create date: <8/19/19>
-- Description:	<TableName + Action>
-- =============================================
CREATE PROCEDURE [dbo].[ProductsUpdateByID]

@SupplierID INT,
@CategoryID INT,
@BrandID INT,
@ProductName VARCHAR (100),
@RetailPrice decimal (15,2),
@WholeSalePrice DECIMAL (15,4),
@OnSale BIT,
@Quantity INT,
@Color VARCHAR(35),
@Description TEXT,
@ProductCreateDate DATETIME,
@ProductPhotoURL VARCHAR(250)

AS
BEGIN
	
	SET NOCOUNT ON;
		INSERT INTO Products(SupplierID, CategoryID, BrandID, ProductName, RetailPrice, WholeSalePrice, OnSale, Quantity, Color,Description, ProductCreateDate,ProductPhotoURL)
		VALUES(@SupplierID, @CategoryID, @BrandID, @ProductName, @RetailPrice, @WholeSalePrice, @OnSale, @Quantity, @Color,@Description, @ProductCreateDate,@ProductPhotoURL)
END
GO
/****** Object:  StoredProcedure [dbo].[UserCreate]    Script Date: 8/20/2019 4:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		</CodyBarber>
-- Create date: <8/19/19>
-- Description:	<TableName + Action>
-- =============================================
CREATE PROCEDURE [dbo].[UserCreate]
 

@Email VARCHAR (65),
@Hash VARCHAR(64),
@Salt VARCHAR(64),
@Address VARCHAR(100),
@FirstName VARCHAR(45),
@LastName VARCHAR(45),
@Birthday DATE,
@Phone VARCHAR(15),
@AccountCreateDate DATETIME,
@PhotoURL VARCHAR(250)

AS
BEGIN
	
	SET NOCOUNT ON;
	--INSERT INTO IS THE COLUMS
	--VALUES ARE PASSING PARAMETERS TO THE COLUMNS (COLUMNS ARE VARIABLES AND ROWS ARE LIKE OBJECTS)
		INSERT INTO Users(RoleID, Email, Hash, Salt, Address, FirstName, LastName, Birthday, Phone,AccountCreateDate,PhotoURL)
		VALUES (1,@Email, @Hash, @Salt, @Address, @FirstName, @LastName, @Birthday, @Phone, @AccountCreateDate,@PhotoURL)
END
GO
/****** Object:  StoredProcedure [dbo].[UserDeleteByID]    Script Date: 8/20/2019 4:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		</CodyBarber>
-- Create date: <8/19/19>
-- Description:	<TableName + Action>
-- =============================================
CREATE PROCEDURE [dbo].[UserDeleteByID]
 
@UserID INT

AS
BEGIN
	
	SET NOCOUNT ON;
	DELETE FROM CartItems WHERE UserID = @UserID
		DELETE FROM Users WHERE UserID = @UserID   
END
GO
/****** Object:  StoredProcedure [dbo].[UsersGetAll]    Script Date: 8/20/2019 4:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		</CodyBarber>
-- Create date: <8/19/19>
-- Description:	<TableName + Action>
-- =============================================
CREATE PROCEDURE [dbo].[UsersGetAll]
@UserID INT

AS
BEGIN
	
	SET NOCOUNT ON;
	SELECT UserID,RoleID,Email,Hash,Salt, Address, FirstName, LastName, Birthday, Phone, PhotoURL, AccountCreateDate FROM Users 
    
END
GO
/****** Object:  StoredProcedure [dbo].[UsersGetByID]    Script Date: 8/20/2019 4:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		</CodyBarber>
-- Create date: <8/19/19>
-- Description:	<TableName + Action>
-- =============================================
CREATE PROCEDURE [dbo].[UsersGetByID]
@UserID INT

AS
BEGIN
	
	SET NOCOUNT ON;
	SELECT UserID,RoleID,Email,Hash,Salt, Address, FirstName, LastName, Birthday, Phone, PhotoURL, AccountCreateDate FROM Users WHERE UserID = @UserID
    
END
GO
/****** Object:  StoredProcedure [dbo].[UsersGetCredentialsByEmail]    Script Date: 8/20/2019 4:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		</CodyBarber>
-- Create date: <8/19/19>
-- Description:	<TableName + Action>
-- =============================================
CREATE PROCEDURE [dbo].[UsersGetCredentialsByEmail]
 
@Email varchar(100)

AS
BEGIN
	
	SET NOCOUNT ON;
		SELECT Hash, Salt FROM Users WHERE Email = @Email    
END
GO
/****** Object:  StoredProcedure [dbo].[UserUpdateByID]    Script Date: 8/20/2019 4:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		</CodyBarber>
-- Create date: <8/19/19>
-- Description:	<TableName + Action>
-- =============================================
CREATE PROCEDURE [dbo].[UserUpdateByID]
 
@UserID INT,
@Email VARCHAR (65),
@Address VARCHAR(100),
@FirstName VARCHAR(45),
@LastName VARCHAR(45),
@Birthday DATE,
@Phone VARCHAR(15),
@PhotoURL VARCHAR(250)

AS
BEGIN
	
	SET NOCOUNT ON;
	UPDATE Users SET Email = @Email,Address = @Address, FirstName = @FirstName, LastName =@LastName, Birthday= @Birthday,Phone=@Phone, PhotoURL= @PhotoURL WHERE UserID = @UserID;
		
END
GO
/****** Object:  StoredProcedure [dbo].[UserUpdatePasswordByID]    Script Date: 8/20/2019 4:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		</CodyBarber>
-- Create date: <8/19/19>
-- Description:	<TableName + Action>
-- =============================================
CREATE PROCEDURE [dbo].[UserUpdatePasswordByID]
 
@UserID INT,
@Hash VARCHAR(64),
@Salt VARCHAR(64)
AS
BEGIN
	-- SELECT USER CURRENT HASH AND SALT INSERTING IT INTO HASH HISTORY 
	--UPDATING THE USERS TABLE TO HAVE NEW HASH AND SALT 
	SET NOCOUNT ON;
	INSERT INTO HashHistory (UserID,[Hash], Salt)
	Values (@UserID, (SELECT [Hash] FROM Users WHERE UserID= @UserID), (SELECT Salt FROM Users WHERE UserID= @UserID));
	UPDATE Users SET[Hash]= @Hash, Salt = @Salt WHERE UserID = @UserID
END
GO
/****** Object:  StoredProcedure [dbo].[UserUpdateRole]    Script Date: 8/20/2019 4:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		</CodyBarber>
-- Create date: <8/19/19>
-- Description:	<TableName + Action>
-- =============================================
CREATE PROCEDURE [dbo].[UserUpdateRole]
 
@UserID INT,
@RoleID INT

AS
BEGIN
	
	SET NOCOUNT ON;
	UPDATE Users SET RoleID =@RoleID WHERE UserID =@UserID
		
END
GO
USE [master]
GO
ALTER DATABASE [HarmonyEmporium] SET  READ_WRITE 
GO
