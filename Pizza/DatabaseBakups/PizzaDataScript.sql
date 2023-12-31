USE [master]
GO
/****** Object:  Database [Pizza_DB]    Script Date: 7/5/2020 4:45:49 PM ******/
CREATE DATABASE [Pizza_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Pizza_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Pizza_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Pizza_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Pizza_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Pizza_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Pizza_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Pizza_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Pizza_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Pizza_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Pizza_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [Pizza_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Pizza_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Pizza_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Pizza_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Pizza_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Pizza_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Pizza_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Pizza_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Pizza_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Pizza_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Pizza_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Pizza_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Pizza_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Pizza_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Pizza_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Pizza_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Pizza_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Pizza_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Pizza_DB] SET  MULTI_USER 
GO
ALTER DATABASE [Pizza_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Pizza_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Pizza_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Pizza_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
USE [Pizza_DB]
GO
/****** Object:  Table [dbo].[AppetizerPiecesSize]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppetizerPiecesSize](
	[AppetizerPiecesSizeID] [int] IDENTITY(1,1) NOT NULL,
	[AppetizerID] [int] NULL,
	[Size] [nvarchar](50) NULL,
	[Pieces] [nvarchar](50) NULL,
	[Price] [decimal](18, 2) NULL,
 CONSTRAINT [PK_AppetizerPiecesSize] PRIMARY KEY CLUSTERED 
(
	[AppetizerPiecesSizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appetizers]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appetizers](
	[AppetizersID] [int] IDENTITY(1,1) NOT NULL,
	[AppetizersName] [nvarchar](50) NULL,
	[AppetizersImage] [nvarchar](50) NULL,
 CONSTRAINT [PK_Appetizers] PRIMARY KEY CLUSTERED 
(
	[AppetizersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Branches]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branches](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BranchAddress] [nvarchar](50) NOT NULL,
	[BranchName] [nvarchar](50) NOT NULL,
	[BranchUsername] [nvarchar](50) NOT NULL,
	[BranchPassword] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Branches] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BurgersAndSandwiches]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BurgersAndSandwiches](
	[BSID] [int] IDENTITY(1,1) NOT NULL,
	[BSName] [nvarchar](50) NULL,
	[BSPrice] [decimal](18, 2) NULL,
	[BSImage] [nvarchar](50) NULL,
	[BSDesc] [nvarchar](255) NULL,
 CONSTRAINT [PK_Burgers&Sandwiches] PRIMARY KEY CLUSTERED 
(
	[BSID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChickenCategories]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChickenCategories](
	[ChickenID] [int] IDENTITY(1,1) NOT NULL,
	[ChickenName] [nvarchar](50) NULL,
	[ChickenImage] [nvarchar](50) NULL,
	[CheckenDesc] [nvarchar](255) NULL,
 CONSTRAINT [PK_ChickenCategories] PRIMARY KEY CLUSTERED 
(
	[ChickenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChickenDelights]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChickenDelights](
	[ChickenDelightsID] [int] IDENTITY(1,1) NOT NULL,
	[ChickenID] [int] NULL,
	[ChickenPieces] [nvarchar](50) NULL,
	[ChickenPrice] [decimal](18, 2) NULL,
 CONSTRAINT [PK_ChickenDelights] PRIMARY KEY CLUSTERED 
(
	[ChickenDelightsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deals]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deals](
	[DealID] [int] IDENTITY(1,1) NOT NULL,
	[DealName] [nvarchar](50) NOT NULL,
	[DealDesc] [nvarchar](max) NOT NULL,
	[DealPrice] [decimal](18, 2) NOT NULL,
	[DealImage] [nvarchar](100) NULL,
 CONSTRAINT [PK_Deals] PRIMARY KEY CLUSTERED 
(
	[DealID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flavour]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flavour](
	[FlavourID] [int] IDENTITY(1,1) NOT NULL,
	[FlavourName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Flavour] PRIMARY KEY CLUSTERED 
(
	[FlavourID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [nvarchar](50) NOT NULL,
	[itemDescription] [nvarchar](500) NULL,
	[itemTypeID] [int] NOT NULL,
	[createdOn] [datetime] NOT NULL,
	[MeasuringUnit] [varchar](50) NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemType]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemType](
	[itemTypeID] [int] IDENTITY(1,1) NOT NULL,
	[itemTypeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_ItemType] PRIMARY KEY CLUSTERED 
(
	[itemTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[PizzaID] [int] NULL,
	[CrustType] [nvarchar](50) NULL,
	[AppetizerSizePiecesID] [int] NULL,
	[BSID] [int] NULL,
	[ChickenDelightID] [int] NULL,
	[TwrtID] [int] NULL,
	[Toppings] [nvarchar](255) NULL,
	[Total] [decimal](18, 2) NULL,
	[Email] [nvarchar](50) NULL,
	[DealID] [int] NULL,
 CONSTRAINT [PK_OrderItem] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderMaster]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderMaster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[PhoneNo] [nvarchar](50) NOT NULL,
	[TotalPrice] [decimal](18, 2) NOT NULL,
	[OrderCode] [nvarchar](25) NOT NULL,
	[BranchID] [int] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[IsConfirmed] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_OrderMaster_1] PRIMARY KEY CLUSTERED 
(
	[OrderCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [nvarchar](50) NOT NULL,
	[ItemPrice] [decimal](18, 2) NOT NULL,
	[ItemDesc] [nvarchar](255) NOT NULL,
	[ItemQuantity] [int] NOT NULL,
	[ItemImage] [nvarchar](50) NOT NULL,
	[OrderCode] [nvarchar](25) NOT NULL,
	[ItemRemarks] [nvarchar](200) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pizza]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pizza](
	[PizzaID] [int] IDENTITY(1,1) NOT NULL,
	[PizzaName] [nvarchar](50) NULL,
	[PizzaIngredients] [nvarchar](100) NULL,
	[PizzaImage] [nvarchar](max) NULL,
 CONSTRAINT [PK_Pizza] PRIMARY KEY CLUSTERED 
(
	[PizzaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PizzaWRTSize]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PizzaWRTSize](
	[PizzaIDWRTSizeID] [int] IDENTITY(1,1) NOT NULL,
	[PizzaID] [int] NULL,
	[Size] [nvarchar](50) NULL,
	[Price] [decimal](18, 2) NULL,
 CONSTRAINT [PK_PizzaWRTSize] PRIMARY KEY CLUSTERED 
(
	[PizzaIDWRTSizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProdFlvrTbl]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProdFlvrTbl](
	[ProdFlvrID] [int] IDENTITY(1,1) NOT NULL,
	[FlavourID] [int] NULL,
	[ProductID] [int] NULL,
 CONSTRAINT [PK_ProdFlvrTbl] PRIMARY KEY CLUSTERED 
(
	[ProdFlvrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[ProductPeices] [int] NULL,
	[ProductImage] [nvarchar](50) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[SizeID] [int] IDENTITY(1,1) NOT NULL,
	[SizeName] [nvarchar](50) NOT NULL,
	[SizePrice] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[SizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpecialFlavour]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecialFlavour](
	[SpecialFID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[SpecialName] [nvarchar](50) NOT NULL,
	[SpecialPrice] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_SpecialFlavour] PRIMARY KEY CLUSTERED 
(
	[SpecialFID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[StockID] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NOT NULL,
	[QuantityRecieved] [int] NULL,
	[TotalPriceOfItems] [decimal](18, 2) NULL,
	[QuantityRemainig] [nvarchar](50) NULL,
	[createdOn] [datetime] NULL,
	[perPieceItemPrice] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[StockID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockHistory]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockHistory](
	[stockHistoryID] [int] IDENTITY(1,1) NOT NULL,
	[stockID] [int] NULL,
	[quantityConsumed] [int] NULL,
	[comments] [nvarchar](255) NULL,
	[createdOn] [datetime] NULL,
 CONSTRAINT [PK_StockHistory] PRIMARY KEY CLUSTERED 
(
	[stockHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topping]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topping](
	[TopingID] [int] IDENTITY(1,1) NOT NULL,
	[ToppingName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Topping] PRIMARY KEY CLUSTERED 
(
	[TopingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topping_WRTSize]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topping_WRTSize](
	[TwrtID] [int] IDENTITY(1,1) NOT NULL,
	[ToppingID] [int] NOT NULL,
	[TwrtPrice] [decimal](18, 2) NOT NULL,
	[ToppingSize] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Topping_WRTSize] PRIMARY KEY CLUSTERED 
(
	[TwrtID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTable]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTable](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserPassword] [nvarchar](30) NULL,
	[UserName] [nvarchar](50) NULL,
 CONSTRAINT [PK__UserTabl__1788CCAC2C9D2F52] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AppetizerPiecesSize] ON 

INSERT [dbo].[AppetizerPiecesSize] ([AppetizerPiecesSizeID], [AppetizerID], [Size], [Pieces], [Price]) VALUES (1, 1, N'Medium', N'Standard', CAST(1.99 AS Decimal(18, 2)))
INSERT [dbo].[AppetizerPiecesSize] ([AppetizerPiecesSizeID], [AppetizerID], [Size], [Pieces], [Price]) VALUES (2, 1, N'Large', N'Standard', CAST(3.99 AS Decimal(18, 2)))
INSERT [dbo].[AppetizerPiecesSize] ([AppetizerPiecesSizeID], [AppetizerID], [Size], [Pieces], [Price]) VALUES (3, 2, N'Standard', N'8 Pieces', CAST(2.25 AS Decimal(18, 2)))
INSERT [dbo].[AppetizerPiecesSize] ([AppetizerPiecesSizeID], [AppetizerID], [Size], [Pieces], [Price]) VALUES (4, 3, N'Standard', N'6 Pieces', CAST(3.99 AS Decimal(18, 2)))
INSERT [dbo].[AppetizerPiecesSize] ([AppetizerPiecesSizeID], [AppetizerID], [Size], [Pieces], [Price]) VALUES (5, 4, N'Standard', N'6 Pieces', CAST(4.99 AS Decimal(18, 2)))
INSERT [dbo].[AppetizerPiecesSize] ([AppetizerPiecesSizeID], [AppetizerID], [Size], [Pieces], [Price]) VALUES (6, 5, N'Standard', N'5 Pieces', CAST(2.99 AS Decimal(18, 2)))
INSERT [dbo].[AppetizerPiecesSize] ([AppetizerPiecesSizeID], [AppetizerID], [Size], [Pieces], [Price]) VALUES (7, 6, N'Standard', N'8 Pieces', CAST(3.99 AS Decimal(18, 2)))
INSERT [dbo].[AppetizerPiecesSize] ([AppetizerPiecesSizeID], [AppetizerID], [Size], [Pieces], [Price]) VALUES (8, 7, N'Standard', N'10 Pieces', CAST(5.50 AS Decimal(18, 2)))
INSERT [dbo].[AppetizerPiecesSize] ([AppetizerPiecesSizeID], [AppetizerID], [Size], [Pieces], [Price]) VALUES (9, 8, N'Standard', N'Standard', CAST(4.99 AS Decimal(18, 2)))
INSERT [dbo].[AppetizerPiecesSize] ([AppetizerPiecesSizeID], [AppetizerID], [Size], [Pieces], [Price]) VALUES (10, 9, N'Standard', N'Standard', CAST(7.49 AS Decimal(18, 2)))
INSERT [dbo].[AppetizerPiecesSize] ([AppetizerPiecesSizeID], [AppetizerID], [Size], [Pieces], [Price]) VALUES (11, 10, N'Standard', N'Standard', CAST(7.49 AS Decimal(18, 2)))
INSERT [dbo].[AppetizerPiecesSize] ([AppetizerPiecesSizeID], [AppetizerID], [Size], [Pieces], [Price]) VALUES (12, 11, N'Standard', N'8 Pieces', CAST(5.99 AS Decimal(18, 2)))
INSERT [dbo].[AppetizerPiecesSize] ([AppetizerPiecesSizeID], [AppetizerID], [Size], [Pieces], [Price]) VALUES (13, 12, N'Standard', N'8 Pieces', CAST(5.99 AS Decimal(18, 2)))
INSERT [dbo].[AppetizerPiecesSize] ([AppetizerPiecesSizeID], [AppetizerID], [Size], [Pieces], [Price]) VALUES (14, 13, N'Standard', N'6 Pieces', CAST(5.99 AS Decimal(18, 2)))
INSERT [dbo].[AppetizerPiecesSize] ([AppetizerPiecesSizeID], [AppetizerID], [Size], [Pieces], [Price]) VALUES (15, 15, N'Standard', N'4 Pieces', CAST(2.99 AS Decimal(18, 2)))
INSERT [dbo].[AppetizerPiecesSize] ([AppetizerPiecesSizeID], [AppetizerID], [Size], [Pieces], [Price]) VALUES (16, 15, N'Standard', N'8 Pieces', CAST(5.50 AS Decimal(18, 2)))
INSERT [dbo].[AppetizerPiecesSize] ([AppetizerPiecesSizeID], [AppetizerID], [Size], [Pieces], [Price]) VALUES (17, 15, N'Standard', N'12 Pieces', CAST(7.99 AS Decimal(18, 2)))
INSERT [dbo].[AppetizerPiecesSize] ([AppetizerPiecesSizeID], [AppetizerID], [Size], [Pieces], [Price]) VALUES (18, 16, N'Small', N'Standard', CAST(1.25 AS Decimal(18, 2)))
INSERT [dbo].[AppetizerPiecesSize] ([AppetizerPiecesSizeID], [AppetizerID], [Size], [Pieces], [Price]) VALUES (19, 16, N'Medium', N'Standard', CAST(4.99 AS Decimal(18, 2)))
INSERT [dbo].[AppetizerPiecesSize] ([AppetizerPiecesSizeID], [AppetizerID], [Size], [Pieces], [Price]) VALUES (20, 16, N'Large', N'Standard', CAST(8.99 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[AppetizerPiecesSize] OFF
SET IDENTITY_INSERT [dbo].[Appetizers] ON 

INSERT [dbo].[Appetizers] ([AppetizersID], [AppetizersName], [AppetizersImage]) VALUES (1, N'French Fries', N'fries.JPG')
INSERT [dbo].[Appetizers] ([AppetizersID], [AppetizersName], [AppetizersImage]) VALUES (2, N'Garlic Bread', N'garlic_bread.JPG')
INSERT [dbo].[Appetizers] ([AppetizersID], [AppetizersName], [AppetizersImage]) VALUES (3, N'Jalapeno Poppers', N'popppers.JPG')
INSERT [dbo].[Appetizers] ([AppetizersID], [AppetizersName], [AppetizersImage]) VALUES (4, N'Mozzarella Chees Sticks', N'cheese_sticks.JPG')
INSERT [dbo].[Appetizers] ([AppetizersID], [AppetizersName], [AppetizersImage]) VALUES (5, N'Onion Rings', N'onion_rings.JPG')
INSERT [dbo].[Appetizers] ([AppetizersID], [AppetizersName], [AppetizersImage]) VALUES (6, N'Fried Mushrooms', N'mushrooms.JPG')
INSERT [dbo].[Appetizers] ([AppetizersID], [AppetizersName], [AppetizersImage]) VALUES (7, N'Cheesy Bread', N'cheesy_bread.JPG')
INSERT [dbo].[Appetizers] ([AppetizersID], [AppetizersName], [AppetizersImage]) VALUES (8, N'Cheese Fries', N'Cheese-Fries.PNG')
INSERT [dbo].[Appetizers] ([AppetizersID], [AppetizersName], [AppetizersImage]) VALUES (9, N'Gyro Cheese Fries w/ Nacho Cheese', N'Gyros-Cheese-Fries-Nacho-Cheese.PNG')
INSERT [dbo].[Appetizers] ([AppetizersID], [AppetizersName], [AppetizersImage]) VALUES (10, N'Gyro Cheese Fries w/ Mozzerella Cheese', N'Gyros-Cheese-Fries-Mozzarella-Cheese.PNG')
INSERT [dbo].[Appetizers] ([AppetizersID], [AppetizersName], [AppetizersImage]) VALUES (11, N'Fish Finger Fries', N'Fish-Fingers.JPG')
INSERT [dbo].[Appetizers] ([AppetizersID], [AppetizersName], [AppetizersImage]) VALUES (12, N'Butterfly Shrimp ', N'Butterfly-Shrimp.JPG')
INSERT [dbo].[Appetizers] ([AppetizersID], [AppetizersName], [AppetizersImage]) VALUES (13, N'Coconut Shrimp', N'Coconut-Shrimp.JPG')
INSERT [dbo].[Appetizers] ([AppetizersID], [AppetizersName], [AppetizersImage]) VALUES (15, N'Falafel', N'falafel2.jpg')
INSERT [dbo].[Appetizers] ([AppetizersID], [AppetizersName], [AppetizersImage]) VALUES (16, N'Coleslaw', N'coleslaw2.jpg')
SET IDENTITY_INSERT [dbo].[Appetizers] OFF
SET IDENTITY_INSERT [dbo].[Branches] ON 

INSERT [dbo].[Branches] ([ID], [BranchAddress], [BranchName], [BranchUsername], [BranchPassword]) VALUES (1, N'Des Plaines', N'Branch 1', N'branch1', N'abc123')
INSERT [dbo].[Branches] ([ID], [BranchAddress], [BranchName], [BranchUsername], [BranchPassword]) VALUES (2, N'Schaumburg', N'Branch 2', N'branch2', N'abc123')
SET IDENTITY_INSERT [dbo].[Branches] OFF
SET IDENTITY_INSERT [dbo].[BurgersAndSandwiches] ON 

INSERT [dbo].[BurgersAndSandwiches] ([BSID], [BSName], [BSPrice], [BSImage], [BSDesc]) VALUES (1, N'Zinger Burger', CAST(5.99 AS Decimal(18, 2)), N'Zinger-Burger.PNG', N'NULWell-seasoned fried chicken patty
layered with our special homemade sauce
, good ol'' mayo with lettuce and onions, on a sesame bun.')
INSERT [dbo].[BurgersAndSandwiches] ([BSID], [BSName], [BSPrice], [BSImage], [BSDesc]) VALUES (2, N'Bihari Kabab Sandwich', CAST(5.99 AS Decimal(18, 2)), N'Bihari-Kabab-Sandwich.PNG', N'Starts out with beef strips marinated in Bihari
Masala and fried to perferction. Topped off with
a special homemade sauce, lettuce, onions
and tomatoes. All served on a gourmet French bread.')
INSERT [dbo].[BurgersAndSandwiches] ([BSID], [BSName], [BSPrice], [BSImage], [BSDesc]) VALUES (3, N'Gyro Pita Chicken', CAST(5.99 AS Decimal(18, 2)), N'Gyro-Pita-Chicken.PNG', N'Take our popular Chicken Pita Sandwich
with its boneless chicken pieces, mayo, lettuce,
onion, tomato and add gyros on top to give
you double the meat and double the flavor.')
INSERT [dbo].[BurgersAndSandwiches] ([BSID], [BSName], [BSPrice], [BSImage], [BSDesc]) VALUES (4, N'Gyro Cheese Burger', CAST(6.99 AS Decimal(18, 2)), N'Gyros-Cheese-Burger.PNG', N'Take everything you love about the classic
cheeseburger, and then add gyros on top of it.
This is truly a meat lover''s burger.')
INSERT [dbo].[BurgersAndSandwiches] ([BSID], [BSName], [BSPrice], [BSImage], [BSDesc]) VALUES (5, N'Bun Kabab', CAST(5.99 AS Decimal(18, 2)), N'bun_kabab.PNG', N'A traditional Pakistani burger. A well-done beef
patty covered with home made spices,
topped with some veggies and a
special green sauce (chutni).')
INSERT [dbo].[BurgersAndSandwiches] ([BSID], [BSName], [BSPrice], [BSImage], [BSDesc]) VALUES (6, N'Pita Spicy Chicken', CAST(5.99 AS Decimal(18, 2)), N'chicken_pita.JPG', N'Boneless chicken pieces marinated in tikka
masala, accompanied by mayo, lettuce, onion,
tomato and served on a pita which is
cooked on a flat top.')
INSERT [dbo].[BurgersAndSandwiches] ([BSID], [BSName], [BSPrice], [BSImage], [BSDesc]) VALUES (7, N'Pita Gyros', CAST(5.99 AS Decimal(18, 2)), N'gyros.JPG', N'Spicy or regular gyros, onions, tomatoes
and cucumber sauce
served on a Pita.')
INSERT [dbo].[BurgersAndSandwiches] ([BSID], [BSName], [BSPrice], [BSImage], [BSDesc]) VALUES (8, N'Crispy Chicken', CAST(5.99 AS Decimal(18, 2)), N'crispy_chicken.JPG', N'Long strips of battered chicken breast, topped
with lettuce, onion, tomato, mayo
and served on a gourmet bun.')
INSERT [dbo].[BurgersAndSandwiches] ([BSID], [BSName], [BSPrice], [BSImage], [BSDesc]) VALUES (9, N'Cheese Burger', CAST(5.99 AS Decimal(18, 2)), N'cheese_burger.JPG', N'Classic cheese burger consisting of a
delicious beef patty and all
the usual trimmings.')
INSERT [dbo].[BurgersAndSandwiches] ([BSID], [BSName], [BSPrice], [BSImage], [BSDesc]) VALUES (10, N'Chicken Patty', CAST(5.99 AS Decimal(18, 2)), N'chicken_patty.JPG', N'Breaded chicken patty served on a
gourmet bun with lettuce,
onion, tomato and mayo.')
INSERT [dbo].[BurgersAndSandwiches] ([BSID], [BSName], [BSPrice], [BSImage], [BSDesc]) VALUES (11, N'Hotdog', CAST(3.99 AS Decimal(18, 2)), N'hot_dog.JPG', N'Beef hot dog topped off with the usual
trimmings and served on a
gourmet hot dog bun.')
INSERT [dbo].[BurgersAndSandwiches] ([BSID], [BSName], [BSPrice], [BSImage], [BSDesc]) VALUES (12, N'Fish Sandwich', CAST(5.99 AS Decimal(18, 2)), N'Fish-Sandwich.JPG', N'Skip the chicken and beef and try out new
fish sandwich that features a Tilapia patty,
our popular homemade sauce, onions, tomato,
and lettuce on a french gourmet bun.')
INSERT [dbo].[BurgersAndSandwiches] ([BSID], [BSName], [BSPrice], [BSImage], [BSDesc]) VALUES (13, N'Chicken Fajita Sandwich', CAST(8.99 AS Decimal(18, 2)), N'chicken-Fajita-sandwich.png', N'Chicken Fajita Sandwiches – turn an old favorite into a gourmet sandwich. Forget your old regular sandwich, and try this amazing sandwich!')
INSERT [dbo].[BurgersAndSandwiches] ([BSID], [BSName], [BSPrice], [BSImage], [BSDesc]) VALUES (14, N'Double Cheez Burger', CAST(8.99 AS Decimal(18, 2)), N'duoblecheeseBurger.png', N'The Double Cheeseburger features two 100% pure beef patties seasoned with just a pinch of salt , pepper and two slices of melty American cheese.')
INSERT [dbo].[BurgersAndSandwiches] ([BSID], [BSName], [BSPrice], [BSImage], [BSDesc]) VALUES (15, N'Buffalo Chicken Sandwich', CAST(6.99 AS Decimal(18, 2)), N'buffalochickengrilledcheesesan2.jpg', N'')
INSERT [dbo].[BurgersAndSandwiches] ([BSID], [BSName], [BSPrice], [BSImage], [BSDesc]) VALUES (16, N'Spicy Habanaro Chicken Burger', CAST(6.99 AS Decimal(18, 2)), N'Spicy-Habanero-Chicken-Burger.jpg', N'')
SET IDENTITY_INSERT [dbo].[BurgersAndSandwiches] OFF
SET IDENTITY_INSERT [dbo].[ChickenCategories] ON 

INSERT [dbo].[ChickenCategories] ([ChickenID], [ChickenName], [ChickenImage], [CheckenDesc]) VALUES (1, N'Chicken Wings', N'chicken_wings1.JPG', N'Chicken wings marinated
with our spices and bathed
in a sausce of your choice.')
INSERT [dbo].[ChickenCategories] ([ChickenID], [ChickenName], [ChickenImage], [CheckenDesc]) VALUES (2, N'Chicken Tikka', N'chicken_tikka.JPG', N'Oven baked chicken thighs and
legs marinated in our very
own flavorful spices.')
INSERT [dbo].[ChickenCategories] ([ChickenID], [ChickenName], [ChickenImage], [CheckenDesc]) VALUES (3, N'Chicken Tenders', N'chicken_tenders.JPG', N'Boneless chicken marinated in
chicken broast spices and fried
to a golden brown.')
INSERT [dbo].[ChickenCategories] ([ChickenID], [ChickenName], [ChickenImage], [CheckenDesc]) VALUES (4, N'Chicken Nuggets', N'chicken_nuggets.JPG', N'A children''s favorite! Classic boneless
chicken nuggets baked to
a golden brown.')
SET IDENTITY_INSERT [dbo].[ChickenCategories] OFF
SET IDENTITY_INSERT [dbo].[ChickenDelights] ON 

INSERT [dbo].[ChickenDelights] ([ChickenDelightsID], [ChickenID], [ChickenPieces], [ChickenPrice]) VALUES (1, 1, N'10 Pieces', CAST(6.99 AS Decimal(18, 2)))
INSERT [dbo].[ChickenDelights] ([ChickenDelightsID], [ChickenID], [ChickenPieces], [ChickenPrice]) VALUES (2, 1, N'20 Pieces', CAST(12.99 AS Decimal(18, 2)))
INSERT [dbo].[ChickenDelights] ([ChickenDelightsID], [ChickenID], [ChickenPieces], [ChickenPrice]) VALUES (3, 1, N'30 Pieces', CAST(18.99 AS Decimal(18, 2)))
INSERT [dbo].[ChickenDelights] ([ChickenDelightsID], [ChickenID], [ChickenPieces], [ChickenPrice]) VALUES (4, 1, N'50 Pieces', CAST(30.99 AS Decimal(18, 2)))
INSERT [dbo].[ChickenDelights] ([ChickenDelightsID], [ChickenID], [ChickenPieces], [ChickenPrice]) VALUES (5, 2, N'6 Pieces', CAST(7.99 AS Decimal(18, 2)))
INSERT [dbo].[ChickenDelights] ([ChickenDelightsID], [ChickenID], [ChickenPieces], [ChickenPrice]) VALUES (6, 2, N'12 Pieces', CAST(13.99 AS Decimal(18, 2)))
INSERT [dbo].[ChickenDelights] ([ChickenDelightsID], [ChickenID], [ChickenPieces], [ChickenPrice]) VALUES (7, 3, N'4 Pieces', CAST(4.99 AS Decimal(18, 2)))
INSERT [dbo].[ChickenDelights] ([ChickenDelightsID], [ChickenID], [ChickenPieces], [ChickenPrice]) VALUES (8, 3, N'8 Pieces', CAST(8.99 AS Decimal(18, 2)))
INSERT [dbo].[ChickenDelights] ([ChickenDelightsID], [ChickenID], [ChickenPieces], [ChickenPrice]) VALUES (9, 4, N'10 Pieces', CAST(5.99 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[ChickenDelights] OFF
SET IDENTITY_INSERT [dbo].[Deals] ON 

INSERT [dbo].[Deals] ([DealID], [DealName], [DealDesc], [DealPrice], [DealImage]) VALUES (1, N'Deal 1', N'10 Piece Chicken Wings
French Fries
Can of Soda', CAST(7.99 AS Decimal(18, 2)), N'Deal1.png')
INSERT [dbo].[Deals] ([DealID], [DealName], [DealDesc], [DealPrice], [DealImage]) VALUES (2, N'Deal 2', N'10 Piece Chicken Wings
6 Piece Chicken Tikka
French Fries
2-Liter Soda', CAST(16.99 AS Decimal(18, 2)), N'Deal2.png')
INSERT [dbo].[Deals] ([DealID], [DealName], [DealDesc], [DealPrice], [DealImage]) VALUES (3, N'Deal 3', N'2 Topping Large Pizza
Garlic Bread
2-Liter Soda', CAST(13.99 AS Decimal(18, 2)), N'Deal3.png')
INSERT [dbo].[Deals] ([DealID], [DealName], [DealDesc], [DealPrice], [DealImage]) VALUES (4, N'Deal 4', N'1 Topping Large Pizza
10 Piece Chicken Wings
8 Piece Garlic Bread', CAST(17.99 AS Decimal(18, 2)), N'Deal4.png')
INSERT [dbo].[Deals] ([DealID], [DealName], [DealDesc], [DealPrice], [DealImage]) VALUES (6, N'Deal 5', N'1 Topping, 2 Large Pizzas
2 Liter Soda', CAST(22.99 AS Decimal(18, 2)), N'Deal6.png')
INSERT [dbo].[Deals] ([DealID], [DealName], [DealDesc], [DealPrice], [DealImage]) VALUES (7, N'Deal 6', N'2 Large Supreme Pizzas (#1 or #2)
2-Liter Soda', CAST(27.99 AS Decimal(18, 2)), N'Deal6.png')
INSERT [dbo].[Deals] ([DealID], [DealName], [DealDesc], [DealPrice], [DealImage]) VALUES (8, N'Party Deal 1', N'4 Large, 1 Topping Pizzas', CAST(36.99 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Deals] ([DealID], [DealName], [DealDesc], [DealPrice], [DealImage]) VALUES (9, N'Party Deal 2', N'30 Piece Chicken Tikka', CAST(31.99 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Deals] ([DealID], [DealName], [DealDesc], [DealPrice], [DealImage]) VALUES (10, N'Party Deal 3', N'Any 5 Sandwiches', CAST(27.99 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Deals] ([DealID], [DealName], [DealDesc], [DealPrice], [DealImage]) VALUES (12, N'Party Deal 4', N'50 Piece Chicken Wings', CAST(30.99 AS Decimal(18, 2)), NULL)
SET IDENTITY_INSERT [dbo].[Deals] OFF
SET IDENTITY_INSERT [dbo].[Flavour] ON 

INSERT [dbo].[Flavour] ([FlavourID], [FlavourName]) VALUES (1, N'Mama Supreme #1')
INSERT [dbo].[Flavour] ([FlavourID], [FlavourName]) VALUES (2, N'Mama Supreme #2')
INSERT [dbo].[Flavour] ([FlavourID], [FlavourName]) VALUES (3, N'Mama Supreme #3')
INSERT [dbo].[Flavour] ([FlavourID], [FlavourName]) VALUES (4, N'Mama Supreme #4')
SET IDENTITY_INSERT [dbo].[Flavour] OFF
SET IDENTITY_INSERT [dbo].[OrderItem] ON 

INSERT [dbo].[OrderItem] ([OrderID], [PizzaID], [CrustType], [AppetizerSizePiecesID], [BSID], [ChickenDelightID], [TwrtID], [Toppings], [Total], [Email], [DealID]) VALUES (1, 3, N'Plain', 3, 6, 3, 3, NULL, CAST(1000.00 AS Decimal(18, 2)), N'hasan', NULL)
SET IDENTITY_INSERT [dbo].[OrderItem] OFF
SET IDENTITY_INSERT [dbo].[OrderMaster] ON 

INSERT [dbo].[OrderMaster] ([ID], [Name], [CreatedOn], [Address], [Email], [PhoneNo], [TotalPrice], [OrderCode], [BranchID], [Remarks], [IsConfirmed], [IsDeleted]) VALUES (1016, N'hamza da prince', CAST(N'2019-12-26T15:32:51.243' AS DateTime), N'near abbasi shaheed', N'hamza.khan8910@gmail.com', N'23213', CAST(8.99 AS Decimal(18, 2)), N'1016Fi6', 1, NULL, 0, 0)
INSERT [dbo].[OrderMaster] ([ID], [Name], [CreatedOn], [Address], [Email], [PhoneNo], [TotalPrice], [OrderCode], [BranchID], [Remarks], [IsConfirmed], [IsDeleted]) VALUES (1017, N'ha', CAST(N'2019-12-26T16:05:52.460' AS DateTime), N'22', N'hamza.khan8910@gmail.com', N'2', CAST(3.99 AS Decimal(18, 2)), N'10172rX', 2, NULL, 0, 0)
INSERT [dbo].[OrderMaster] ([ID], [Name], [CreatedOn], [Address], [Email], [PhoneNo], [TotalPrice], [OrderCode], [BranchID], [Remarks], [IsConfirmed], [IsDeleted]) VALUES (2017, N'new', CAST(N'2019-12-26T19:00:02.790' AS DateTime), N'new', N'new@new.com', N'12121', CAST(2.25 AS Decimal(18, 2)), N'1018CSF', 1, N'giving remarks first time', 1, 0)
INSERT [dbo].[OrderMaster] ([ID], [Name], [CreatedOn], [Address], [Email], [PhoneNo], [TotalPrice], [OrderCode], [BranchID], [Remarks], [IsConfirmed], [IsDeleted]) VALUES (10, N'hamza.khan8910@gmail.com', CAST(N'2019-11-05T18:36:21.153' AS DateTime), N'', N'hamza.khan8910@gmail.com', N'7878', CAST(17.99 AS Decimal(18, 2)), N'10Uiz', 1, NULL, 0, 0)
INSERT [dbo].[OrderMaster] ([ID], [Name], [CreatedOn], [Address], [Email], [PhoneNo], [TotalPrice], [OrderCode], [BranchID], [Remarks], [IsConfirmed], [IsDeleted]) VALUES (11, N'hamza khan', CAST(N'2019-11-06T13:15:48.210' AS DateTime), N'address', N'hamza.khan8910@gmail.com', N'0342654', CAST(202.81 AS Decimal(18, 2)), N'11BuT', 1, NULL, 0, 0)
INSERT [dbo].[OrderMaster] ([ID], [Name], [CreatedOn], [Address], [Email], [PhoneNo], [TotalPrice], [OrderCode], [BranchID], [Remarks], [IsConfirmed], [IsDeleted]) VALUES (12, N'checking branch2', CAST(N'2019-11-06T13:25:10.790' AS DateTime), N'kk', N'hamza.khan8910@gmail.com', N'0202', CAST(144.85 AS Decimal(18, 2)), N'129uZ', 2, NULL, 0, 0)
INSERT [dbo].[OrderMaster] ([ID], [Name], [CreatedOn], [Address], [Email], [PhoneNo], [TotalPrice], [OrderCode], [BranchID], [Remarks], [IsConfirmed], [IsDeleted]) VALUES (13, N'hamza', CAST(N'2019-11-06T17:57:53.390' AS DateTime), N'', N'ammad.baig66@yahoo.com', N'03423519691', CAST(207.36 AS Decimal(18, 2)), N'133oD', 2, NULL, 0, 0)
INSERT [dbo].[OrderMaster] ([ID], [Name], [CreatedOn], [Address], [Email], [PhoneNo], [TotalPrice], [OrderCode], [BranchID], [Remarks], [IsConfirmed], [IsDeleted]) VALUES (14, N'a', CAST(N'2019-11-11T23:30:25.257' AS DateTime), N'near abbasi shaheed', N'ashhadullah19@gmail.com', N'03423519691', CAST(42.95 AS Decimal(18, 2)), N'14fM2', 2, NULL, 0, 0)
INSERT [dbo].[OrderMaster] ([ID], [Name], [CreatedOn], [Address], [Email], [PhoneNo], [TotalPrice], [OrderCode], [BranchID], [Remarks], [IsConfirmed], [IsDeleted]) VALUES (15, N'hamza', CAST(N'2019-12-11T18:02:00.237' AS DateTime), N'aa', N'hamza.khan8910@gmail.com', N'1232', CAST(26.98 AS Decimal(18, 2)), N'15PZZ', 1, NULL, 0, 0)
INSERT [dbo].[OrderMaster] ([ID], [Name], [CreatedOn], [Address], [Email], [PhoneNo], [TotalPrice], [OrderCode], [BranchID], [Remarks], [IsConfirmed], [IsDeleted]) VALUES (1015, N'hamza', CAST(N'2019-12-14T16:05:01.590' AS DateTime), N'nn', N'hamza.khan8910@gmail.com', N'0000', CAST(167.94 AS Decimal(18, 2)), N'16G3s', 2, NULL, 0, 0)
INSERT [dbo].[OrderMaster] ([ID], [Name], [CreatedOn], [Address], [Email], [PhoneNo], [TotalPrice], [OrderCode], [BranchID], [Remarks], [IsConfirmed], [IsDeleted]) VALUES (8, N'h', CAST(N'2019-11-05T18:17:49.127' AS DateTime), N'', N'hamza.khan8910@gmail.com', N'2', CAST(2.25 AS Decimal(18, 2)), N'1aWw', 1, NULL, 0, 0)
INSERT [dbo].[OrderMaster] ([ID], [Name], [CreatedOn], [Address], [Email], [PhoneNo], [TotalPrice], [OrderCode], [BranchID], [Remarks], [IsConfirmed], [IsDeleted]) VALUES (9, N'a', CAST(N'2019-11-05T18:20:14.790' AS DateTime), N'', N'hamza.khan8910@gmail.com', N'03423519691', CAST(22.99 AS Decimal(18, 2)), N'1Qd6', 2, NULL, 0, 0)
INSERT [dbo].[OrderMaster] ([ID], [Name], [CreatedOn], [Address], [Email], [PhoneNo], [TotalPrice], [OrderCode], [BranchID], [Remarks], [IsConfirmed], [IsDeleted]) VALUES (2018, N'new r', CAST(N'2019-12-26T19:31:21.633' AS DateTime), N' new r', N'new@new.com', N'1', CAST(3.99 AS Decimal(18, 2)), N'2018qia', 1, N'Remarks frist time', 1, 0)
INSERT [dbo].[OrderMaster] ([ID], [Name], [CreatedOn], [Address], [Email], [PhoneNo], [TotalPrice], [OrderCode], [BranchID], [Remarks], [IsConfirmed], [IsDeleted]) VALUES (2019, N'bara', CAST(N'2019-12-26T19:37:20.987' AS DateTime), N'bara', N'bara@gmail.com', N'121', CAST(1.99 AS Decimal(18, 2)), N'2019eUV', 1, N'bhai mai is baar bht bara wala remarks derha hn col check krne k lye k wo new kitna nechay jarha h or kaam ki baat to batana hi bhoolgya k bhai frise 1 dam chat patay or masala tez hona chahye apki frise mjhy wese hi bht pasand h to is bar bh zroor psnd ayengay', 1, 1)
INSERT [dbo].[OrderMaster] ([ID], [Name], [CreatedOn], [Address], [Email], [PhoneNo], [TotalPrice], [OrderCode], [BranchID], [Remarks], [IsConfirmed], [IsDeleted]) VALUES (2020, N'hamza', CAST(N'2019-12-27T16:15:24.993' AS DateTime), N'khan', N'hamza.khan8910@gmail.com', N'21', CAST(22.97 AS Decimal(18, 2)), N'2020UPY', 1, N'giving large remarks giving large remarks giving large remarks giving large remarks giving large remarks giving large remarks ', 1, 1)
INSERT [dbo].[OrderMaster] ([ID], [Name], [CreatedOn], [Address], [Email], [PhoneNo], [TotalPrice], [OrderCode], [BranchID], [Remarks], [IsConfirmed], [IsDeleted]) VALUES (2021, N'shakeel bhai', CAST(N'2020-06-05T11:49:19.000' AS DateTime), N'near abbasi', N'hamza.khan8910@gmail.com', N'1233121', CAST(87.95 AS Decimal(18, 2)), N'2021gKM', 1, N'checkin individual remarks', 0, 0)
SET IDENTITY_INSERT [dbo].[OrderMaster] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([ID], [ItemName], [ItemPrice], [ItemDesc], [ItemQuantity], [ItemImage], [OrderCode], [ItemRemarks]) VALUES (1, N' Garlic Bread ', CAST(2.25 AS Decimal(18, 2)), N'8 Pieces', 1, N'garlic_bread.JPG', N'1aWw', NULL)
INSERT [dbo].[Orders] ([ID], [ItemName], [ItemPrice], [ItemDesc], [ItemQuantity], [ItemImage], [OrderCode], [ItemRemarks]) VALUES (2, N' Deal 5 ', CAST(22.99 AS Decimal(18, 2)), N'Crust Type : Hand Tossed , Topping(s) : Banana Pepper Large', 1, N'Deal5.png', N'1Qd6', NULL)
INSERT [dbo].[Orders] ([ID], [ItemName], [ItemPrice], [ItemDesc], [ItemQuantity], [ItemImage], [OrderCode], [ItemRemarks]) VALUES (3, N' Deal 4 ', CAST(17.99 AS Decimal(18, 2)), N'Crust Type : Thin Crust , Topping(s) : Topping(s) : ', 1, N'Deal4.png', N'10Uiz', NULL)
INSERT [dbo].[Orders] ([ID], [ItemName], [ItemPrice], [ItemDesc], [ItemQuantity], [ItemImage], [OrderCode], [ItemRemarks]) VALUES (4, N' Party Deal 1 ', CAST(36.99 AS Decimal(18, 2)), N'Crust Type : Thin Crust , Topping(s) : Topping(s) : Cheese Large', 1, N'', N'10Uiz', NULL)
INSERT [dbo].[Orders] ([ID], [ItemName], [ItemPrice], [ItemDesc], [ItemQuantity], [ItemImage], [OrderCode], [ItemRemarks]) VALUES (5, N' Hotdog ', CAST(3.99 AS Decimal(18, 2)), N'Beef hot dog topped off with the usual
trimmings and served on a
gourmet hot dog bun.', 1, N'hot_dog.JPG', N'11BuT', NULL)
INSERT [dbo].[Orders] ([ID], [ItemName], [ItemPrice], [ItemDesc], [ItemQuantity], [ItemImage], [OrderCode], [ItemRemarks]) VALUES (6, N' Mama Special #2 ', CAST(40.96 AS Decimal(18, 2)), N'Crust Type : Thin Crust ,  , Size Medium, Topping(s) : Chicken Tikka Medium,Gyros Medium,Sausage Medium', 1, N'm1.png', N'11BuT', NULL)
INSERT [dbo].[Orders] ([ID], [ItemName], [ItemPrice], [ItemDesc], [ItemQuantity], [ItemImage], [OrderCode], [ItemRemarks]) VALUES (7, N' Mama Special #2 ', CAST(31.97 AS Decimal(18, 2)), N'Crust Type : Thin Crust ,  , Size Medium, Topping(s) : Chicken Tikka Medium,Gyros Medium', 3, N'm1.png', N'11BuT', NULL)
INSERT [dbo].[Orders] ([ID], [ItemName], [ItemPrice], [ItemDesc], [ItemQuantity], [ItemImage], [OrderCode], [ItemRemarks]) VALUES (8, N' Mama Special #2 ', CAST(31.97 AS Decimal(18, 2)), N'Crust Type : Deep Dish ,  , Size Medium, Topping(s) : Chicken Tikka Medium,Gyros Medium', 1, N'm1.png', N'11BuT', NULL)
INSERT [dbo].[Orders] ([ID], [ItemName], [ItemPrice], [ItemDesc], [ItemQuantity], [ItemImage], [OrderCode], [ItemRemarks]) VALUES (9, N' Mama Special #2 ', CAST(14.99 AS Decimal(18, 2)), N'Crust Type : Deep Dish ,  , Size Extra Large, Topping(s) : ', 2, N'm1.png', N'11BuT', NULL)
INSERT [dbo].[Orders] ([ID], [ItemName], [ItemPrice], [ItemDesc], [ItemQuantity], [ItemImage], [OrderCode], [ItemRemarks]) VALUES (10, N' Mama Supreme #2 ', CAST(45.95 AS Decimal(18, 2)), N'Crust Type : Hand Tossed ,  , Size Medium, Topping(s) : Banana Pepper Medium,Chicken Tikka Medium,Gyros Medium,Onion Medium', 1, N'm2.png', N'129uZ', NULL)
INSERT [dbo].[Orders] ([ID], [ItemName], [ItemPrice], [ItemDesc], [ItemQuantity], [ItemImage], [OrderCode], [ItemRemarks]) VALUES (11, N' Mama Supreme #2 ', CAST(38.96 AS Decimal(18, 2)), N'Crust Type : Hand Tossed ,  , Size Medium, Topping(s) : Banana Pepper Medium,Chicken Tikka Medium,Gyros Medium', 1, N'm2.png', N'129uZ', NULL)
INSERT [dbo].[Orders] ([ID], [ItemName], [ItemPrice], [ItemDesc], [ItemQuantity], [ItemImage], [OrderCode], [ItemRemarks]) VALUES (12, N' Mama Supreme #2 ', CAST(28.97 AS Decimal(18, 2)), N'Crust Type : Hand Tossed ,  , Size Medium, Topping(s) : Banana Pepper Medium,Chicken Tikka Medium', 1, N'm2.png', N'129uZ', NULL)
INSERT [dbo].[Orders] ([ID], [ItemName], [ItemPrice], [ItemDesc], [ItemQuantity], [ItemImage], [OrderCode], [ItemRemarks]) VALUES (13, N' Mama Supreme #2 ', CAST(18.98 AS Decimal(18, 2)), N'Crust Type : Hand Tossed ,  , Size Medium, Topping(s) : Banana Pepper Medium', 1, N'm2.png', N'129uZ', NULL)
INSERT [dbo].[Orders] ([ID], [ItemName], [ItemPrice], [ItemDesc], [ItemQuantity], [ItemImage], [OrderCode], [ItemRemarks]) VALUES (14, N' Mama Supreme #2 ', CAST(11.99 AS Decimal(18, 2)), N'Crust Type : Hand Tossed ,  , Size Medium, Topping(s) : ', 1, N'm2.png', N'129uZ', NULL)
INSERT [dbo].[Orders] ([ID], [ItemName], [ItemPrice], [ItemDesc], [ItemQuantity], [ItemImage], [OrderCode], [ItemRemarks]) VALUES (15, N' Chicken Tikka ', CAST(7.99 AS Decimal(18, 2)), N'6 Pieces', 5, N'chicken_tikka.JPG', N'133oD', NULL)
INSERT [dbo].[Orders] ([ID], [ItemName], [ItemPrice], [ItemDesc], [ItemQuantity], [ItemImage], [OrderCode], [ItemRemarks]) VALUES (16, N' Chicken Wings ', CAST(7.49 AS Decimal(18, 2)), N'10 Pieces Sauce(s) : Hot', 2, N'chicken_wings1.JPG', N'133oD', NULL)
INSERT [dbo].[Orders] ([ID], [ItemName], [ItemPrice], [ItemDesc], [ItemQuantity], [ItemImage], [OrderCode], [ItemRemarks]) VALUES (17, N' Chicken Wings ', CAST(13.49 AS Decimal(18, 2)), N'20 Pieces Sauce(s) : Hot', 1, N'chicken_wings1.JPG', N'133oD', NULL)
INSERT [dbo].[Orders] ([ID], [ItemName], [ItemPrice], [ItemDesc], [ItemQuantity], [ItemImage], [OrderCode], [ItemRemarks]) VALUES (18, N' Chicken Wings ', CAST(13.99 AS Decimal(18, 2)), N'20 Pieces Sauce(s) : Hot,Spicy Mango', 3, N'chicken_wings1.JPG', N'133oD', NULL)
INSERT [dbo].[Orders] ([ID], [ItemName], [ItemPrice], [ItemDesc], [ItemQuantity], [ItemImage], [OrderCode], [ItemRemarks]) VALUES (19, N' Chicken Wings ', CAST(32.49 AS Decimal(18, 2)), N'50 Pieces Sauce(s) : Hot,Mango Habanero,Spicy Mango', 2, N'chicken_wings1.JPG', N'133oD', NULL)
INSERT [dbo].[Orders] ([ID], [ItemName], [ItemPrice], [ItemDesc], [ItemQuantity], [ItemImage], [OrderCode], [ItemRemarks]) VALUES (20, N' Chicken Wings ', CAST(31.99 AS Decimal(18, 2)), N'50 Pieces Sauce(s) : Hot,Mango Habanero', 1, N'chicken_wings1.JPG', N'133oD', NULL)
INSERT [dbo].[Orders] ([ID], [ItemName], [ItemPrice], [ItemDesc], [ItemQuantity], [ItemImage], [OrderCode], [ItemRemarks]) VALUES (21, N' Mama Special #4 ', CAST(42.95 AS Decimal(18, 2)), N'Crust Type : Hand Tossed ,  , Size Medium, Topping(s) : Banana Pepper Medium,Chicken Tikka Medium,Jalapeno Medium,Pineapple Medium', 1, N'm5.png', N'14fM2', NULL)
INSERT [dbo].[Orders] ([ID], [ItemName], [ItemPrice], [ItemDesc], [ItemQuantity], [ItemImage], [OrderCode], [ItemRemarks]) VALUES (22, N' Chicken Wings ', CAST(7.49 AS Decimal(18, 2)), N'10 Pieces Sauce(s) : Hot', 1, N'chicken_wings1.JPG', N'15PZZ', NULL)
INSERT [dbo].[Orders] ([ID], [ItemName], [ItemPrice], [ItemDesc], [ItemQuantity], [ItemImage], [OrderCode], [ItemRemarks]) VALUES (23, N' Chicken Wings ', CAST(19.49 AS Decimal(18, 2)), N'30 Pieces Sauce(s) : Hot', 1, N'chicken_wings1.JPG', N'15PZZ', NULL)
INSERT [dbo].[Orders] ([ID], [ItemName], [ItemPrice], [ItemDesc], [ItemQuantity], [ItemImage], [OrderCode], [ItemRemarks]) VALUES (1022, N' Deal 6 ', CAST(27.99 AS Decimal(18, 2)), N'Crust Type : Hand Tossed , Topping(s) : ', 6, N'Deal6.png', N'16G3s', NULL)
INSERT [dbo].[Orders] ([ID], [ItemName], [ItemPrice], [ItemDesc], [ItemQuantity], [ItemImage], [OrderCode], [ItemRemarks]) VALUES (1023, N' Coleslaw ', CAST(8.99 AS Decimal(18, 2)), N'Peices : Standard, Size : Large', 1, N'coleslaw2.jpg', N'1016Fi6', NULL)
INSERT [dbo].[Orders] ([ID], [ItemName], [ItemPrice], [ItemDesc], [ItemQuantity], [ItemImage], [OrderCode], [ItemRemarks]) VALUES (1024, N' Jalapeno Poppers ', CAST(3.99 AS Decimal(18, 2)), N'Peices : 6 Pieces', 1, N'popppers.JPG', N'10172rX', NULL)
INSERT [dbo].[Orders] ([ID], [ItemName], [ItemPrice], [ItemDesc], [ItemQuantity], [ItemImage], [OrderCode], [ItemRemarks]) VALUES (2024, N' Garlic Bread ', CAST(2.25 AS Decimal(18, 2)), N'Peices : 8 Pieces', 1, N'garlic_bread.JPG', N'1018CSF', NULL)
INSERT [dbo].[Orders] ([ID], [ItemName], [ItemPrice], [ItemDesc], [ItemQuantity], [ItemImage], [OrderCode], [ItemRemarks]) VALUES (2025, N' French Fries ', CAST(3.99 AS Decimal(18, 2)), N'Peices : Standard, Size : Large', 1, N'fries.JPG', N'2018qia', NULL)
INSERT [dbo].[Orders] ([ID], [ItemName], [ItemPrice], [ItemDesc], [ItemQuantity], [ItemImage], [OrderCode], [ItemRemarks]) VALUES (2026, N' French Fries ', CAST(1.99 AS Decimal(18, 2)), N'Peices : Standard, Size : Medium', 1, N'fries.JPG', N'2019eUV', NULL)
INSERT [dbo].[Orders] ([ID], [ItemName], [ItemPrice], [ItemDesc], [ItemQuantity], [ItemImage], [OrderCode], [ItemRemarks]) VALUES (2027, N' Mama Special #1 ', CAST(22.97 AS Decimal(18, 2)), N'Crust Type : Thin Crust ,  , Size Small, Topping(s) : Banana Pepper Small,Chicken Tikka Small', 1, N'm5.png', N'2020UPY', NULL)
INSERT [dbo].[Orders] ([ID], [ItemName], [ItemPrice], [ItemDesc], [ItemQuantity], [ItemImage], [OrderCode], [ItemRemarks]) VALUES (2028, N' Deal 3 ', CAST(13.99 AS Decimal(18, 2)), N'Crust Type : Hand Tossed , Topping(s) : Banana Pepper Large,Cheese Large', 2, N'Deal3.png', N'2021gKM', N'')
INSERT [dbo].[Orders] ([ID], [ItemName], [ItemPrice], [ItemDesc], [ItemQuantity], [ItemImage], [OrderCode], [ItemRemarks]) VALUES (2029, N' Deal 5 ', CAST(22.99 AS Decimal(18, 2)), N'Crust Type : Hand Tossed , Topping(s) : Cheese Large', 2, N'Deal6.png', N'2021gKM', N'')
INSERT [dbo].[Orders] ([ID], [ItemName], [ItemPrice], [ItemDesc], [ItemQuantity], [ItemImage], [OrderCode], [ItemRemarks]) VALUES (2030, N' Deal 3 ', CAST(13.99 AS Decimal(18, 2)), N'Crust Type : Thin Crust , Topping(s) : ', 1, N'Deal3.png', N'2021gKM', N'')
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Pizza] ON 

INSERT [dbo].[Pizza] ([PizzaID], [PizzaName], [PizzaIngredients], [PizzaImage]) VALUES (1, N'Mama Supreme #1', N'Pepperoni, Sausage
Green Pepper, Onion
Black Olive, Mushroom', N'm1.png')
INSERT [dbo].[Pizza] ([PizzaID], [PizzaName], [PizzaIngredients], [PizzaImage]) VALUES (2, N'Mama Supreme #2', N'Chicken, Gyros
Green Pepper, Onion
Black Olive', N'm2.png')
INSERT [dbo].[Pizza] ([PizzaID], [PizzaName], [PizzaIngredients], [PizzaImage]) VALUES (3, N'Mama Supreme #3', N'All Meat Supreme', N'm3.png')
INSERT [dbo].[Pizza] ([PizzaID], [PizzaName], [PizzaIngredients], [PizzaImage]) VALUES (4, N'Mama Supreme #4', N'Bihari Kabob, Shami Kabob
Chicken Bihari, Green Pepper, Onion', N'm4.png')
INSERT [dbo].[Pizza] ([PizzaID], [PizzaName], [PizzaIngredients], [PizzaImage]) VALUES (5, N'Mama Special #1', N'Chicken, Pineapple
Green Pepper,
Black Olive', N'm5.png')
INSERT [dbo].[Pizza] ([PizzaID], [PizzaName], [PizzaIngredients], [PizzaImage]) VALUES (6, N'Mama Special #2', N'Chicken, Pineapple,
Jalapeno', N'm1.png')
INSERT [dbo].[Pizza] ([PizzaID], [PizzaName], [PizzaIngredients], [PizzaImage]) VALUES (7, N'Mama Special #3', N'HAWAIIAN,
Turkey Ham,
Pineapple', N'm3.png')
INSERT [dbo].[Pizza] ([PizzaID], [PizzaName], [PizzaIngredients], [PizzaImage]) VALUES (8, N'Mama Special #4', N'Pepper Chicken, Chicken, Green Peppers, Banana Peppers, Jalapeno Pepper', N'm5.png')
SET IDENTITY_INSERT [dbo].[Pizza] OFF
SET IDENTITY_INSERT [dbo].[PizzaWRTSize] ON 

INSERT [dbo].[PizzaWRTSize] ([PizzaIDWRTSizeID], [PizzaID], [Size], [Price]) VALUES (1, 1, N'Small', CAST(9.99 AS Decimal(18, 2)))
INSERT [dbo].[PizzaWRTSize] ([PizzaIDWRTSizeID], [PizzaID], [Size], [Price]) VALUES (2, 1, N'Medium', CAST(11.99 AS Decimal(18, 2)))
INSERT [dbo].[PizzaWRTSize] ([PizzaIDWRTSizeID], [PizzaID], [Size], [Price]) VALUES (3, 1, N'Large', CAST(13.99 AS Decimal(18, 2)))
INSERT [dbo].[PizzaWRTSize] ([PizzaIDWRTSizeID], [PizzaID], [Size], [Price]) VALUES (4, 1, N'Extra Large', CAST(16.99 AS Decimal(18, 2)))
INSERT [dbo].[PizzaWRTSize] ([PizzaIDWRTSizeID], [PizzaID], [Size], [Price]) VALUES (5, 2, N'Small', CAST(9.99 AS Decimal(18, 2)))
INSERT [dbo].[PizzaWRTSize] ([PizzaIDWRTSizeID], [PizzaID], [Size], [Price]) VALUES (6, 2, N'Medium', CAST(11.99 AS Decimal(18, 2)))
INSERT [dbo].[PizzaWRTSize] ([PizzaIDWRTSizeID], [PizzaID], [Size], [Price]) VALUES (7, 2, N'Large', CAST(13.99 AS Decimal(18, 2)))
INSERT [dbo].[PizzaWRTSize] ([PizzaIDWRTSizeID], [PizzaID], [Size], [Price]) VALUES (8, 2, N'Extra Large', CAST(16.99 AS Decimal(18, 2)))
INSERT [dbo].[PizzaWRTSize] ([PizzaIDWRTSizeID], [PizzaID], [Size], [Price]) VALUES (9, 3, N'Small', CAST(10.99 AS Decimal(18, 2)))
INSERT [dbo].[PizzaWRTSize] ([PizzaIDWRTSizeID], [PizzaID], [Size], [Price]) VALUES (10, 3, N'Medium', CAST(12.99 AS Decimal(18, 2)))
INSERT [dbo].[PizzaWRTSize] ([PizzaIDWRTSizeID], [PizzaID], [Size], [Price]) VALUES (11, 3, N'Large', CAST(14.99 AS Decimal(18, 2)))
INSERT [dbo].[PizzaWRTSize] ([PizzaIDWRTSizeID], [PizzaID], [Size], [Price]) VALUES (12, 3, N'Extra Large', CAST(17.99 AS Decimal(18, 2)))
INSERT [dbo].[PizzaWRTSize] ([PizzaIDWRTSizeID], [PizzaID], [Size], [Price]) VALUES (13, 4, N'Small', CAST(10.99 AS Decimal(18, 2)))
INSERT [dbo].[PizzaWRTSize] ([PizzaIDWRTSizeID], [PizzaID], [Size], [Price]) VALUES (14, 4, N'Medium', CAST(11.99 AS Decimal(18, 2)))
INSERT [dbo].[PizzaWRTSize] ([PizzaIDWRTSizeID], [PizzaID], [Size], [Price]) VALUES (15, 4, N'Large', CAST(13.99 AS Decimal(18, 2)))
INSERT [dbo].[PizzaWRTSize] ([PizzaIDWRTSizeID], [PizzaID], [Size], [Price]) VALUES (16, 4, N'Extra Large', CAST(16.99 AS Decimal(18, 2)))
INSERT [dbo].[PizzaWRTSize] ([PizzaIDWRTSizeID], [PizzaID], [Size], [Price]) VALUES (17, 5, N'Small', CAST(8.99 AS Decimal(18, 2)))
INSERT [dbo].[PizzaWRTSize] ([PizzaIDWRTSizeID], [PizzaID], [Size], [Price]) VALUES (18, 5, N'Medium', CAST(11.99 AS Decimal(18, 2)))
INSERT [dbo].[PizzaWRTSize] ([PizzaIDWRTSizeID], [PizzaID], [Size], [Price]) VALUES (19, 5, N'Large', CAST(12.99 AS Decimal(18, 2)))
INSERT [dbo].[PizzaWRTSize] ([PizzaIDWRTSizeID], [PizzaID], [Size], [Price]) VALUES (20, 5, N'Extra Large', CAST(15.99 AS Decimal(18, 2)))
INSERT [dbo].[PizzaWRTSize] ([PizzaIDWRTSizeID], [PizzaID], [Size], [Price]) VALUES (21, 6, N'Small', CAST(8.99 AS Decimal(18, 2)))
INSERT [dbo].[PizzaWRTSize] ([PizzaIDWRTSizeID], [PizzaID], [Size], [Price]) VALUES (22, 6, N'Medium', CAST(11.99 AS Decimal(18, 2)))
INSERT [dbo].[PizzaWRTSize] ([PizzaIDWRTSizeID], [PizzaID], [Size], [Price]) VALUES (23, 6, N'Large', CAST(12.99 AS Decimal(18, 2)))
INSERT [dbo].[PizzaWRTSize] ([PizzaIDWRTSizeID], [PizzaID], [Size], [Price]) VALUES (24, 6, N'Extra Large', CAST(14.99 AS Decimal(18, 2)))
INSERT [dbo].[PizzaWRTSize] ([PizzaIDWRTSizeID], [PizzaID], [Size], [Price]) VALUES (25, 7, N'Small', CAST(7.99 AS Decimal(18, 2)))
INSERT [dbo].[PizzaWRTSize] ([PizzaIDWRTSizeID], [PizzaID], [Size], [Price]) VALUES (26, 7, N'Medium', CAST(8.99 AS Decimal(18, 2)))
INSERT [dbo].[PizzaWRTSize] ([PizzaIDWRTSizeID], [PizzaID], [Size], [Price]) VALUES (27, 7, N'Large', CAST(9.99 AS Decimal(18, 2)))
INSERT [dbo].[PizzaWRTSize] ([PizzaIDWRTSizeID], [PizzaID], [Size], [Price]) VALUES (28, 7, N'Extra Large', CAST(11.99 AS Decimal(18, 2)))
INSERT [dbo].[PizzaWRTSize] ([PizzaIDWRTSizeID], [PizzaID], [Size], [Price]) VALUES (29, 8, N'Small', CAST(9.99 AS Decimal(18, 2)))
INSERT [dbo].[PizzaWRTSize] ([PizzaIDWRTSizeID], [PizzaID], [Size], [Price]) VALUES (30, 8, N'Medium', CAST(11.99 AS Decimal(18, 2)))
INSERT [dbo].[PizzaWRTSize] ([PizzaIDWRTSizeID], [PizzaID], [Size], [Price]) VALUES (31, 8, N'Large', CAST(12.99 AS Decimal(18, 2)))
INSERT [dbo].[PizzaWRTSize] ([PizzaIDWRTSizeID], [PizzaID], [Size], [Price]) VALUES (32, 8, N'Extra Large', CAST(15.99 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[PizzaWRTSize] OFF
SET IDENTITY_INSERT [dbo].[ProdFlvrTbl] ON 

INSERT [dbo].[ProdFlvrTbl] ([ProdFlvrID], [FlavourID], [ProductID]) VALUES (4, 1, 1)
INSERT [dbo].[ProdFlvrTbl] ([ProdFlvrID], [FlavourID], [ProductID]) VALUES (5, 2, 2)
SET IDENTITY_INSERT [dbo].[ProdFlvrTbl] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPeices], [ProductImage]) VALUES (1, N'Pizza', 1, N'm1.PNG')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPeices], [ProductImage]) VALUES (2, N'Fires', 1, N'fries.JPG')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPeices], [ProductImage]) VALUES (3, N'Mozzarella Sticks', 6, N'cheese_sticks.JPG')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPeices], [ProductImage]) VALUES (4, N'Zinger Burger', 1, N'Zinger-Burger.PNG')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPeices], [ProductImage]) VALUES (5, N'Bihari Kabab Sandwich', 1, N'Bihari-Kabab-Sandwich.PNG')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPeices], [ProductImage]) VALUES (6, N'Gyro Pita Chicken', 1, N'Gyro-Pita-Chicken.PNG')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPeices], [ProductImage]) VALUES (7, N'Gyro Cheese Burger', 1, N'Gyros-Cheese-Burger.PNG')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPeices], [ProductImage]) VALUES (8, N'Bun Kabab', 1, N'bun_kabab.PNG')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPeices], [ProductImage]) VALUES (9, N'Pita Spicy Chicken', 1, N'chicken_pita.JPG')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPeices], [ProductImage]) VALUES (10, N'Pita Gyros', 1, N'gyros.JPG')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPeices], [ProductImage]) VALUES (11, N'Crispy Chicken', 1, N'crispy_chicken.JPG')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPeices], [ProductImage]) VALUES (12, N'Cheese Burger', 1, N'cheese_burger.JPG')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPeices], [ProductImage]) VALUES (13, N'Chicken Patty', 1, N'chicken_patty.JPG')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPeices], [ProductImage]) VALUES (14, N'Hotdog', 1, N'hot_dog.JPG')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPeices], [ProductImage]) VALUES (15, N'Fish Sandwich', 1, N'Fish-Sandwich.JPG')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPeices], [ProductImage]) VALUES (16, N'Garlic Bread', 8, N'garlic_bread.JPG')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPeices], [ProductImage]) VALUES (17, N'Jalapeno Poppers', 6, N'popppers.JPG')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPeices], [ProductImage]) VALUES (18, N'Onion Rings', 5, N'onion_rings.JPG')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPeices], [ProductImage]) VALUES (19, N'Fried Mushrooms', 8, N'mushrooms.JPG')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPeices], [ProductImage]) VALUES (20, N'Cheesy Bread', 10, N'cheesy_bread.JPG')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPeices], [ProductImage]) VALUES (21, N'Butterfly Shrimp', 8, N'Butterfly-Shrimp.JPG')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPeices], [ProductImage]) VALUES (22, N'Coconut Shrimp', 6, N'Coconut-Shrimp.JPG')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPeices], [ProductImage]) VALUES (23, N'Gyro Cheese Fries w/ Nacho Cheese', 1, N'Gyros-Cheese-Fries-Nacho-Cheese.PNG')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPeices], [ProductImage]) VALUES (24, N'Gyro Cheese Fries w/ Mozzerella Cheese', 1, N'Gyros-Cheese-Fries-Mozzarella-Cheese.PNG')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPeices], [ProductImage]) VALUES (25, N'Cheese Fries', 1, N'Cheese-Fries.PNG')
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Size] ON 

INSERT [dbo].[Size] ([SizeID], [SizeName], [SizePrice]) VALUES (1, N'Small', CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[Size] ([SizeID], [SizeName], [SizePrice]) VALUES (2, N'Regular', CAST(400.00 AS Decimal(18, 2)))
INSERT [dbo].[Size] ([SizeID], [SizeName], [SizePrice]) VALUES (4, N'Large', CAST(800.00 AS Decimal(18, 2)))
INSERT [dbo].[Size] ([SizeID], [SizeName], [SizePrice]) VALUES (5, N'Extra Large', CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[Size] ([SizeID], [SizeName], [SizePrice]) VALUES (6, N'Small Fries', CAST(1.25 AS Decimal(18, 2)))
INSERT [dbo].[Size] ([SizeID], [SizeName], [SizePrice]) VALUES (7, N'Large Fries', CAST(3.50 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Size] OFF
SET IDENTITY_INSERT [dbo].[SpecialFlavour] ON 

INSERT [dbo].[SpecialFlavour] ([SpecialFID], [ProductID], [SpecialName], [SpecialPrice]) VALUES (1, 1, N'Mama Special #1', CAST(100 AS Decimal(18, 0)))
INSERT [dbo].[SpecialFlavour] ([SpecialFID], [ProductID], [SpecialName], [SpecialPrice]) VALUES (2, 1, N'Mama Special #2', CAST(200 AS Decimal(18, 0)))
INSERT [dbo].[SpecialFlavour] ([SpecialFID], [ProductID], [SpecialName], [SpecialPrice]) VALUES (3, 1, N'Mama Special #3', CAST(300 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[SpecialFlavour] OFF
SET IDENTITY_INSERT [dbo].[Topping] ON 

INSERT [dbo].[Topping] ([TopingID], [ToppingName]) VALUES (1, N'Cheese')
INSERT [dbo].[Topping] ([TopingID], [ToppingName]) VALUES (2, N'Mushroom')
INSERT [dbo].[Topping] ([TopingID], [ToppingName]) VALUES (3, N'Green Pepper')
INSERT [dbo].[Topping] ([TopingID], [ToppingName]) VALUES (4, N'Onion')
INSERT [dbo].[Topping] ([TopingID], [ToppingName]) VALUES (5, N'Black Olive')
INSERT [dbo].[Topping] ([TopingID], [ToppingName]) VALUES (6, N'Green Olive')
INSERT [dbo].[Topping] ([TopingID], [ToppingName]) VALUES (7, N'Jalapeno')
INSERT [dbo].[Topping] ([TopingID], [ToppingName]) VALUES (8, N'Pineapple')
INSERT [dbo].[Topping] ([TopingID], [ToppingName]) VALUES (9, N'Spinach')
INSERT [dbo].[Topping] ([TopingID], [ToppingName]) VALUES (10, N'Tomato')
INSERT [dbo].[Topping] ([TopingID], [ToppingName]) VALUES (11, N'Banana Pepper')
INSERT [dbo].[Topping] ([TopingID], [ToppingName]) VALUES (12, N'Pepperoni')
INSERT [dbo].[Topping] ([TopingID], [ToppingName]) VALUES (13, N'Sausage ')
INSERT [dbo].[Topping] ([TopingID], [ToppingName]) VALUES (14, N'Chicken Tikka')
INSERT [dbo].[Topping] ([TopingID], [ToppingName]) VALUES (15, N'Gyros')
INSERT [dbo].[Topping] ([TopingID], [ToppingName]) VALUES (16, N'Turkey Ham')
INSERT [dbo].[Topping] ([TopingID], [ToppingName]) VALUES (17, N'Bihari Kabob')
SET IDENTITY_INSERT [dbo].[Topping] OFF
SET IDENTITY_INSERT [dbo].[Topping_WRTSize] ON 

INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (1, 1, CAST(5.99 AS Decimal(18, 2)), N'SM')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (2, 1, CAST(6.99 AS Decimal(18, 2)), N'MD')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (3, 1, CAST(7.99 AS Decimal(18, 2)), N'LG')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (4, 1, CAST(9.99 AS Decimal(18, 2)), N'XL')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (5, 2, CAST(5.99 AS Decimal(18, 2)), N'SM')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (6, 2, CAST(6.99 AS Decimal(18, 2)), N'MD')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (7, 2, CAST(7.99 AS Decimal(18, 2)), N'LG')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (8, 2, CAST(9.99 AS Decimal(18, 2)), N'XL')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (12, 3, CAST(5.99 AS Decimal(18, 2)), N'SM')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (13, 3, CAST(6.99 AS Decimal(18, 2)), N'MD')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (14, 3, CAST(7.99 AS Decimal(18, 2)), N'LG')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (15, 3, CAST(9.99 AS Decimal(18, 2)), N'XL')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (16, 4, CAST(5.99 AS Decimal(18, 2)), N'SM')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (17, 4, CAST(6.99 AS Decimal(18, 2)), N'MD')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (18, 4, CAST(7.99 AS Decimal(18, 2)), N'LG')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (19, 4, CAST(9.99 AS Decimal(18, 2)), N'XL')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (20, 5, CAST(5.99 AS Decimal(18, 2)), N'SM')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (21, 5, CAST(6.99 AS Decimal(18, 2)), N'MD')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (22, 5, CAST(7.99 AS Decimal(18, 2)), N'LG')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (23, 5, CAST(9.99 AS Decimal(18, 2)), N'XL')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (24, 6, CAST(5.99 AS Decimal(18, 2)), N'SM')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (25, 6, CAST(6.99 AS Decimal(18, 2)), N'MD')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (26, 6, CAST(7.99 AS Decimal(18, 2)), N'LG')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (27, 6, CAST(9.99 AS Decimal(18, 2)), N'XL')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (28, 7, CAST(5.99 AS Decimal(18, 2)), N'SM')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (29, 7, CAST(6.99 AS Decimal(18, 2)), N'MD')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (30, 7, CAST(7.99 AS Decimal(18, 2)), N'LG')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (31, 7, CAST(9.99 AS Decimal(18, 2)), N'XL')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (32, 8, CAST(5.99 AS Decimal(18, 2)), N'SM')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (33, 8, CAST(6.99 AS Decimal(18, 2)), N'MD')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (34, 8, CAST(7.99 AS Decimal(18, 2)), N'LG')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (35, 8, CAST(9.99 AS Decimal(18, 2)), N'XL')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (36, 9, CAST(5.99 AS Decimal(18, 2)), N'SM')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (37, 9, CAST(6.99 AS Decimal(18, 2)), N'MD')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (38, 9, CAST(7.99 AS Decimal(18, 2)), N'LG')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (39, 9, CAST(9.99 AS Decimal(18, 2)), N'XL')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (40, 10, CAST(5.99 AS Decimal(18, 2)), N'SM')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (41, 10, CAST(6.99 AS Decimal(18, 2)), N'MD')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (42, 10, CAST(7.99 AS Decimal(18, 2)), N'LG')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (43, 10, CAST(9.99 AS Decimal(18, 2)), N'XL')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (44, 11, CAST(5.99 AS Decimal(18, 2)), N'SM')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (45, 11, CAST(6.99 AS Decimal(18, 2)), N'MD')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (46, 11, CAST(7.99 AS Decimal(18, 2)), N'LG')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (47, 11, CAST(9.99 AS Decimal(18, 2)), N'XL')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (48, 12, CAST(6.99 AS Decimal(18, 2)), N'SM')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (49, 12, CAST(8.99 AS Decimal(18, 2)), N'MD')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (50, 12, CAST(9.99 AS Decimal(18, 2)), N'LG')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (51, 12, CAST(11.99 AS Decimal(18, 2)), N'XL')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (52, 13, CAST(6.99 AS Decimal(18, 2)), N'SM')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (53, 13, CAST(8.99 AS Decimal(18, 2)), N'MD')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (54, 13, CAST(9.99 AS Decimal(18, 2)), N'LG')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (55, 13, CAST(11.99 AS Decimal(18, 2)), N'XL')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (56, 14, CAST(7.99 AS Decimal(18, 2)), N'SM')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (57, 14, CAST(9.99 AS Decimal(18, 2)), N'MD')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (58, 14, CAST(10.99 AS Decimal(18, 2)), N'LG')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (59, 14, CAST(12.99 AS Decimal(18, 2)), N'XL')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (60, 15, CAST(7.99 AS Decimal(18, 2)), N'SM')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (61, 15, CAST(9.99 AS Decimal(18, 2)), N'MD')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (62, 15, CAST(10.99 AS Decimal(18, 2)), N'LG')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (63, 15, CAST(12.99 AS Decimal(18, 2)), N'XL')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (64, 16, CAST(6.99 AS Decimal(18, 2)), N'SM')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (65, 16, CAST(8.99 AS Decimal(18, 2)), N'MD')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (66, 16, CAST(9.99 AS Decimal(18, 2)), N'LG')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (67, 16, CAST(11.99 AS Decimal(18, 2)), N'XL')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (68, 17, CAST(3.00 AS Decimal(18, 2)), N'LG')
INSERT [dbo].[Topping_WRTSize] ([TwrtID], [ToppingID], [TwrtPrice], [ToppingSize]) VALUES (69, 17, CAST(4.00 AS Decimal(18, 2)), N'XL')
SET IDENTITY_INSERT [dbo].[Topping_WRTSize] OFF
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_createdOn]  DEFAULT (getdate()) FOR [createdOn]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF_Stock_createdOn_1]  DEFAULT (getdate()) FOR [createdOn]
GO
ALTER TABLE [dbo].[StockHistory] ADD  CONSTRAINT [DF_StockHistory_createdOn_1]  DEFAULT (getdate()) FOR [createdOn]
GO
ALTER TABLE [dbo].[AppetizerPiecesSize]  WITH CHECK ADD  CONSTRAINT [FK_AppetizerPiecesSize_Appetizers] FOREIGN KEY([AppetizerID])
REFERENCES [dbo].[Appetizers] ([AppetizersID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AppetizerPiecesSize] CHECK CONSTRAINT [FK_AppetizerPiecesSize_Appetizers]
GO
ALTER TABLE [dbo].[ChickenDelights]  WITH CHECK ADD  CONSTRAINT [FK_ChickenDelights_ChickenCategories] FOREIGN KEY([ChickenID])
REFERENCES [dbo].[ChickenCategories] ([ChickenID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChickenDelights] CHECK CONSTRAINT [FK_ChickenDelights_ChickenCategories]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_ItemType] FOREIGN KEY([itemTypeID])
REFERENCES [dbo].[ItemType] ([itemTypeID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_ItemType]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_UserTable]
GO
ALTER TABLE [dbo].[OrderMaster]  WITH CHECK ADD  CONSTRAINT [FK_OrderMaster_Branches] FOREIGN KEY([BranchID])
REFERENCES [dbo].[Branches] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[OrderMaster] CHECK CONSTRAINT [FK_OrderMaster_Branches]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_OrderMaster] FOREIGN KEY([OrderCode])
REFERENCES [dbo].[OrderMaster] ([OrderCode])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_OrderMaster]
GO
ALTER TABLE [dbo].[PizzaWRTSize]  WITH CHECK ADD  CONSTRAINT [FK_PizzaWRTSize_Pizza] FOREIGN KEY([PizzaID])
REFERENCES [dbo].[Pizza] ([PizzaID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PizzaWRTSize] CHECK CONSTRAINT [FK_PizzaWRTSize_Pizza]
GO
ALTER TABLE [dbo].[ProdFlvrTbl]  WITH CHECK ADD  CONSTRAINT [FK_ProdFlvrTbl_Flavour] FOREIGN KEY([FlavourID])
REFERENCES [dbo].[Flavour] ([FlavourID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProdFlvrTbl] CHECK CONSTRAINT [FK_ProdFlvrTbl_Flavour]
GO
ALTER TABLE [dbo].[ProdFlvrTbl]  WITH CHECK ADD  CONSTRAINT [FK_ProdFlvrTbl_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProdFlvrTbl] CHECK CONSTRAINT [FK_ProdFlvrTbl_Product]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([ItemId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_Item]
GO
ALTER TABLE [dbo].[StockHistory]  WITH CHECK ADD  CONSTRAINT [FK_StockHistory_Stock] FOREIGN KEY([stockID])
REFERENCES [dbo].[Stock] ([StockID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[StockHistory] CHECK CONSTRAINT [FK_StockHistory_Stock]
GO
ALTER TABLE [dbo].[Topping_WRTSize]  WITH CHECK ADD  CONSTRAINT [FK_Topping_WRTSize_Topping] FOREIGN KEY([ToppingID])
REFERENCES [dbo].[Topping] ([TopingID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Topping_WRTSize] CHECK CONSTRAINT [FK_Topping_WRTSize_Topping]
GO
/****** Object:  StoredProcedure [dbo].[add_order]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[add_order]

@ordercode		nvarchar(25),
@itemname	 	nvarchar(50),
@itemprice	 	decimal(18,2),
@itemdesc	 	nvarchar(255),
@itemquantity	int,
@itemimage		nvarchar(50),
@ItemRemarks		nvarchar(200)




AS
BEGIN
insert into Orders
values(
@itemname	 ,	
@itemprice	 ,	
@itemdesc	 ,	
@itemquantity,	
@itemimage	 ,
@ordercode	 ,
@ItemRemarks

)

END
GO
/****** Object:  StoredProcedure [dbo].[add_order_master]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[add_order_master]

@orderCode nvarchar(25),
@branchID int,
@firstname nvarchar(50),
@email nvarchar(50),
@phoneno nvarchar(50),
@address nvarchar(50),
@createdon datetime,
@totalprice decimal(18,2),
@remarks nvarchar(max)


AS
BEGIN

insert into OrderMaster
values(@firstname,@createdon,@address,@email,@phoneno,@totalprice,@orderCode,@branchID,@remarks,0,0)


END
GO
/****** Object:  StoredProcedure [dbo].[get_order_by_id]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[get_order_by_id]

@ordercode nvarchar(25)

AS
BEGIN


select * from Orders where OrderCode = @ordercode


END
GO
/****** Object:  StoredProcedure [dbo].[getAppitizerSizesByID]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getAppitizerSizesByID]

@id int

AS
BEGIN
select Size, Price from AppetizerPiecesSize
where AppetizerID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[getMaxID]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getMaxID]


AS
declare @id int = (select max(ID) from OrderMaster)
BEGIN
	if((@id) is not null)
	Begin
		select @id
	end
END
GO
/****** Object:  StoredProcedure [dbo].[getorders]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getorders]

@username nvarchar(25)

AS
BEGIN

select * from OrderMaster 
where BranchID = (Select ID from Branches where BranchAddress = @username) and IsConfirmed = 0
order by ID Desc



END
GO
/****** Object:  StoredProcedure [dbo].[sp_getAllAppetizers]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_getAllAppetizers]
as
select * from Appetizers
GO
/****** Object:  StoredProcedure [dbo].[sp_getAllBurgersAndSandwiches]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_getAllBurgersAndSandwiches]
as
select * from BurgersAndSandwiches
GO
/****** Object:  StoredProcedure [dbo].[sp_getAllChickenDelight]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_getAllChickenDelight]
as
select * from ChickenCategories
GO
/****** Object:  StoredProcedure [dbo].[sp_getAllDeals]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_getAllDeals]

AS
BEGIN

select * from Deals
where DealID < 8

END
GO
/****** Object:  StoredProcedure [dbo].[sp_getAllPizza]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_getAllPizza]
as
select * from Pizza
GO
/****** Object:  StoredProcedure [dbo].[sp_getAllTopping]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_getAllTopping]
as
select * from Topping
GO
/****** Object:  StoredProcedure [dbo].[sp_getAppetizerByID]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_getAppetizerByID]
(@AppetizerID int)
as
select appid.AppetizersID, appid.AppetizersName, appid.AppetizersImage,aps.Price,aps.Size,aps.Pieces from Appetizers appid join AppetizerPiecesSize aps on appid.AppetizersID = aps.AppetizerID
where appid.AppetizersID = @AppetizerID
GO
/****** Object:  StoredProcedure [dbo].[sp_getBurgersAndSandwichesByID]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_getBurgersAndSandwichesByID]
(
@BSID int
)
as
select * from BurgersAndSandwiches BS where BS.BSID = @BSID
GO
/****** Object:  StoredProcedure [dbo].[sp_getChickenCatByID]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_getChickenCatByID] 

@ChickenID int	

AS
BEGIN

select * from ChickenCategories where ChickenID = @ChickenID 

END
GO
/****** Object:  StoredProcedure [dbo].[sp_getChickenDelightByID]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_getChickenDelightByID]
(
@ChickenID int
)
as
--select cCat.ChickenID,cDel.ChickenDelightsID,cCat.ChickenName,cDel.ChickenPieces,cDel.ChickenPrice,cCat.ChickenImage from 
--ChickenCategories cCat join ChickenDelights cDel on cCat.ChickenID = cDel.ChickenID where cCat.ChickenID = @ChickenID

select ChickenPieces,ChickenPrice from ChickenDelights where ChickenID = @ChickenID
GO
/****** Object:  StoredProcedure [dbo].[sp_getDealByID]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_getDealByID]

@id int

AS
BEGIN

select * from Deals
where DealID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getPizzaByID]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_getPizzaByID]
(
@PizzaID int
)
as
--select pizza.PizzaID,pizza.PizzaName,pizza.PizzaIngredients,PWRTS.Size,PWRTS.Price from 
--Pizza pizza join PizzaWRTSize PWRTS on pizza.PizzaID = PWRTS.PizzaID where pizza.PizzaID = @PizzaID

select * from Pizza where PizzaID = @PizzaID
GO
/****** Object:  StoredProcedure [dbo].[sp_getPizzaSizeByPizzaID]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_getPizzaSizeByPizzaID]

@PizzaID int

AS
BEGIN

--select p.PizzaName, p.PizzaIngredients, p.PizzaImage, ps.Size, ps.Price from Pizza p join PizzaWRTSize ps on p.PizzaID = ps.PizzaID
--where p.PizzaID = @PizzaID

select Size, Price from PizzaWRTSize 
where PizzaID = @PizzaID

END
GO
/****** Object:  StoredProcedure [dbo].[sp_getSpecialDeals]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_getSpecialDeals]

AS
BEGIN
select * from Deals
where DealID > 7
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getToppingByID]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_getToppingByID]
(
	@ToppingName nvarchar(50) 
)
as
select TopWRTS.ToppingSize, TopWRTS.TwrtPrice from
Topping topp join Topping_WRTSize TopWRTS on topp.TopingID = TopWRTS.ToppingID where Topp.ToppingName = @ToppingName
GO
/****** Object:  StoredProcedure [dbo].[sp_placeOrder]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_placeOrder]
(
@PizzaID int,
@CrustType nvarchar(50),
@AppetizerSizePiecesID int,
@BSID int,
@ChickenDelightID int,
@TwrtID int,
@Total decimal(18,2),
@Email nvarchar(50)
)
as
insert into OrderItem
(PizzaID,CrustType,AppetizerSizePiecesID,BSID,ChickenDelightID,TwrtID,Total,Email)
values
(@PizzaID,@CrustType,@AppetizerSizePiecesID,@BSID,@ChickenDelightID,@TwrtID,@Total,@Email)
GO
/****** Object:  StoredProcedure [dbo].[todayorder]    Script Date: 7/5/2020 4:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[todayorder]

@username nvarchar(25)

AS
BEGIN
select * from OrderMaster 
where BranchID = (Select ID from Branches where BranchAddress = @username)
and cast(CreatedOn as Date) = cast(getdate() as Date)
order by ID Desc
END
GO
USE [master]
GO
ALTER DATABASE [Pizza_DB] SET  READ_WRITE 
GO
