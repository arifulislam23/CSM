USE [master]
GO
/****** Object:  Database [CSM]    Script Date: 10/28/2023 8:51:15 AM ******/
CREATE DATABASE [CSM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CSM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\CSM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CSM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\CSM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CSM] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CSM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CSM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CSM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CSM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CSM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CSM] SET ARITHABORT OFF 
GO
ALTER DATABASE [CSM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CSM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CSM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CSM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CSM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CSM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CSM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CSM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CSM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CSM] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CSM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CSM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CSM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CSM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CSM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CSM] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [CSM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CSM] SET RECOVERY FULL 
GO
ALTER DATABASE [CSM] SET  MULTI_USER 
GO
ALTER DATABASE [CSM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CSM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CSM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CSM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CSM] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CSM] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CSM', N'ON'
GO
ALTER DATABASE [CSM] SET QUERY_STORE = ON
GO
ALTER DATABASE [CSM] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CSM]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 10/28/2023 8:51:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 10/28/2023 8:51:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 10/28/2023 8:51:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 10/28/2023 8:51:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 10/28/2023 8:51:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 10/28/2023 8:51:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 10/28/2023 8:51:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 10/28/2023 8:51:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 10/28/2023 8:51:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](150) NOT NULL,
	[MobileNumber] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employe]    Script Date: 10/28/2023 8:51:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employe](
	[EmployeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
	[Phone] [nvarchar](15) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Employe] PRIMARY KEY CLUSTERED 
(
	[EmployeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parcels]    Script Date: 10/28/2023 8:51:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parcels](
	[ParcelId] [int] IDENTITY(1,1) NOT NULL,
	[ParcelType] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Weight] [decimal](18, 2) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[CreateAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Parcels] PRIMARY KEY CLUSTERED 
(
	[ParcelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Price]    Script Date: 10/28/2023 8:51:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Price](
	[PriceId] [int] IDENTITY(1,1) NOT NULL,
	[weightFrom] [decimal](18, 2) NOT NULL,
	[weightTo] [decimal](18, 2) NOT NULL,
	[Amount] [int] NOT NULL,
 CONSTRAINT [PK_Price] PRIMARY KEY CLUSTERED 
(
	[PriceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recipients]    Script Date: 10/28/2023 8:51:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recipients](
	[RecipientId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](150) NOT NULL,
	[MobileNumber] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Recipients] PRIMARY KEY CLUSTERED 
(
	[RecipientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipment]    Script Date: 10/28/2023 8:51:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipment](
	[ShipmentId] [int] IDENTITY(1,1) NOT NULL,
	[ParcelId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[RecipientId] [int] NOT NULL,
	[EmployeId] [int] NULL,
	[Status] [nvarchar](50) NOT NULL,
	[TrackNumber] [nvarchar](20) NULL,
	[DeliveryAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Shipment] PRIMARY KEY CLUSTERED 
(
	[ShipmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231027200547_CreateDB', N'6.0.23')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'4a8fc832-4fdf-42ad-b862-7abc3bdb0d7d', N'Admin', N'ADMIN', N'eaedff4b-2cf6-4850-945a-eb69399b717c')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2095df5e-7aa0-4bd5-be0e-b4e96278fc26', N'4a8fc832-4fdf-42ad-b862-7abc3bdb0d7d')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'630ab904-0946-4e95-9aa0-8e2bb5ff8156', N'4a8fc832-4fdf-42ad-b862-7abc3bdb0d7d')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'2095df5e-7aa0-4bd5-be0e-b4e96278fc26', N'admin@admin.com', N'ADMIN@ADMIN.COM', N'admin@admin.com', N'ADMIN@ADMIN.COM', 0, N'AQAAAAEAACcQAAAAEMAYKEbAV0N83O55fgMnkZmoY38tH7TPvg4MK/WWPKE2Rw28lgH1AdXF+mqO63tfKQ==', N'2IXEHFXKQCRYRCRADOGPIP3OLCPOKFI5', N'01d2029d-bd29-4f1b-917c-8692b0395070', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'630ab904-0946-4e95-9aa0-8e2bb5ff8156', N'admin@gmail.com', N'ADMIN@GMAIL.COM', N'admin@gmail.com', N'ADMIN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAELBUvpYGP8iQtKPYxlgC3M6pe+zrR6vKdt7P6C3SFTsTGv8W1eTIYDZCA8G2DJu5wg==', N'GLXV37KRQ2W3VOID74GK4UKJYNWU6AZQ', N'6e1f28bb-4eed-42bc-a652-db597364202b', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerId], [Name], [Address], [MobileNumber]) VALUES (1, N'Akash', N'Mirpur, Dhaka-1230', N'017302')
INSERT [dbo].[Customers] ([CustomerId], [Name], [Address], [MobileNumber]) VALUES (2, N'Amina Begum', N'14/A, Mohakhali, Dhaka', N'01761234567')
INSERT [dbo].[Customers] ([CustomerId], [Name], [Address], [MobileNumber]) VALUES (3, N'Ariful Islam Akash', N'Uttara, Dhaka', N'01612345678')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Employe] ON 

INSERT [dbo].[Employe] ([EmployeId], [Name], [Address], [Phone], [Email]) VALUES (1, N'Onik', N'Dhaka', N'01782734886', N'onik@gmail.com')
INSERT [dbo].[Employe] ([EmployeId], [Name], [Address], [Phone], [Email]) VALUES (2, N'Kausar', N'Dhaka', N'01716374867', N'kausar@gmail.com')
SET IDENTITY_INSERT [dbo].[Employe] OFF
GO
SET IDENTITY_INSERT [dbo].[Parcels] ON 

INSERT [dbo].[Parcels] ([ParcelId], [ParcelType], [Description], [Weight], [Price], [CreateAt]) VALUES (1, N'Heavy', NULL, CAST(2.00 AS Decimal(18, 2)), CAST(150.00 AS Decimal(18, 2)), CAST(N'2023-10-28T02:40:15.0100955' AS DateTime2))
INSERT [dbo].[Parcels] ([ParcelId], [ParcelType], [Description], [Weight], [Price], [CreateAt]) VALUES (2, N'Heavy', NULL, CAST(3.00 AS Decimal(18, 2)), CAST(150.00 AS Decimal(18, 2)), CAST(N'2023-10-28T05:09:02.4330118' AS DateTime2))
INSERT [dbo].[Parcels] ([ParcelId], [ParcelType], [Description], [Weight], [Price], [CreateAt]) VALUES (3, N'Light', N'NA', CAST(4.00 AS Decimal(18, 2)), CAST(150.00 AS Decimal(18, 2)), CAST(N'2023-10-28T05:09:58.7085238' AS DateTime2))
INSERT [dbo].[Parcels] ([ParcelId], [ParcelType], [Description], [Weight], [Price], [CreateAt]) VALUES (4, N'Light', N'NA', CAST(3.00 AS Decimal(18, 2)), CAST(150.00 AS Decimal(18, 2)), CAST(N'2023-10-28T06:58:43.1632975' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Parcels] OFF
GO
SET IDENTITY_INSERT [dbo].[Price] ON 

INSERT [dbo].[Price] ([PriceId], [weightFrom], [weightTo], [Amount]) VALUES (1, CAST(0.10 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 70)
INSERT [dbo].[Price] ([PriceId], [weightFrom], [weightTo], [Amount]) VALUES (2, CAST(1.01 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 150)
INSERT [dbo].[Price] ([PriceId], [weightFrom], [weightTo], [Amount]) VALUES (3, CAST(4.01 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), 250)
SET IDENTITY_INSERT [dbo].[Price] OFF
GO
SET IDENTITY_INSERT [dbo].[Recipients] ON 

INSERT [dbo].[Recipients] ([RecipientId], [Name], [Address], [MobileNumber]) VALUES (1, N'Ariful Islam', N'sector:4, Uttara, Dhaka-1230', N'019999')
INSERT [dbo].[Recipients] ([RecipientId], [Name], [Address], [MobileNumber]) VALUES (2, N'Md. Abdul Rahman', N'7/2, Dhanmondi, Dhaka', N'01876543210')
INSERT [dbo].[Recipients] ([RecipientId], [Name], [Address], [MobileNumber]) VALUES (3, N'Farhana Akter', N' 22, Gulshan, Dhaka', N'01987654321')
INSERT [dbo].[Recipients] ([RecipientId], [Name], [Address], [MobileNumber]) VALUES (4, N'Onik', N'Khulna', N'01761234567')
SET IDENTITY_INSERT [dbo].[Recipients] OFF
GO
SET IDENTITY_INSERT [dbo].[Shipment] ON 

INSERT [dbo].[Shipment] ([ShipmentId], [ParcelId], [CustomerId], [RecipientId], [EmployeId], [Status], [TrackNumber], [DeliveryAt]) VALUES (1, 1, 1, 1, 2, N'Completed', N'0173021', CAST(N'2023-10-28T02:46:13.0309814' AS DateTime2))
INSERT [dbo].[Shipment] ([ShipmentId], [ParcelId], [CustomerId], [RecipientId], [EmployeId], [Status], [TrackNumber], [DeliveryAt]) VALUES (2, 2, 2, 2, 1, N'On The Way', N'017612345672', CAST(N'2023-10-28T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Shipment] ([ShipmentId], [ParcelId], [CustomerId], [RecipientId], [EmployeId], [Status], [TrackNumber], [DeliveryAt]) VALUES (3, 3, 2, 3, NULL, N'Completed', N'017612345673', CAST(N'2023-10-28T05:21:14.5711132' AS DateTime2))
INSERT [dbo].[Shipment] ([ShipmentId], [ParcelId], [CustomerId], [RecipientId], [EmployeId], [Status], [TrackNumber], [DeliveryAt]) VALUES (4, 4, 3, 4, NULL, N'Pending', N'016123456784', NULL)
SET IDENTITY_INSERT [dbo].[Shipment] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 10/28/2023 8:51:16 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 10/28/2023 8:51:16 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 10/28/2023 8:51:16 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 10/28/2023 8:51:16 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 10/28/2023 8:51:16 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 10/28/2023 8:51:16 AM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 10/28/2023 8:51:16 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Shipment_CustomerId]    Script Date: 10/28/2023 8:51:16 AM ******/
CREATE NONCLUSTERED INDEX [IX_Shipment_CustomerId] ON [dbo].[Shipment]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Shipment_EmployeId]    Script Date: 10/28/2023 8:51:16 AM ******/
CREATE NONCLUSTERED INDEX [IX_Shipment_EmployeId] ON [dbo].[Shipment]
(
	[EmployeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Shipment_ParcelId]    Script Date: 10/28/2023 8:51:16 AM ******/
CREATE NONCLUSTERED INDEX [IX_Shipment_ParcelId] ON [dbo].[Shipment]
(
	[ParcelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Shipment_RecipientId]    Script Date: 10/28/2023 8:51:16 AM ******/
CREATE NONCLUSTERED INDEX [IX_Shipment_RecipientId] ON [dbo].[Shipment]
(
	[RecipientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD  CONSTRAINT [FK_Shipment_Customers_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK_Shipment_Customers_CustomerId]
GO
ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD  CONSTRAINT [FK_Shipment_Employe_EmployeId] FOREIGN KEY([EmployeId])
REFERENCES [dbo].[Employe] ([EmployeId])
GO
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK_Shipment_Employe_EmployeId]
GO
ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD  CONSTRAINT [FK_Shipment_Parcels_ParcelId] FOREIGN KEY([ParcelId])
REFERENCES [dbo].[Parcels] ([ParcelId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK_Shipment_Parcels_ParcelId]
GO
ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD  CONSTRAINT [FK_Shipment_Recipients_RecipientId] FOREIGN KEY([RecipientId])
REFERENCES [dbo].[Recipients] ([RecipientId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK_Shipment_Recipients_RecipientId]
GO
USE [master]
GO
ALTER DATABASE [CSM] SET  READ_WRITE 
GO
