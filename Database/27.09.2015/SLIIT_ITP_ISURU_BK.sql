USE [master]
GO
/****** Object:  Database [SLIIT.ITP]    Script Date: 9/27/2015 9:44:32 PM ******/
CREATE DATABASE [SLIIT.ITP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SLIIT.ITP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.DEV\MSSQL\DATA\SLIIT.ITP.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SLIIT.ITP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.DEV\MSSQL\DATA\SLIIT.ITP_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SLIIT.ITP] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SLIIT.ITP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SLIIT.ITP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SLIIT.ITP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SLIIT.ITP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SLIIT.ITP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SLIIT.ITP] SET ARITHABORT OFF 
GO
ALTER DATABASE [SLIIT.ITP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SLIIT.ITP] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [SLIIT.ITP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SLIIT.ITP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SLIIT.ITP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SLIIT.ITP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SLIIT.ITP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SLIIT.ITP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SLIIT.ITP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SLIIT.ITP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SLIIT.ITP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SLIIT.ITP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SLIIT.ITP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SLIIT.ITP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SLIIT.ITP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SLIIT.ITP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SLIIT.ITP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SLIIT.ITP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SLIIT.ITP] SET RECOVERY FULL 
GO
ALTER DATABASE [SLIIT.ITP] SET  MULTI_USER 
GO
ALTER DATABASE [SLIIT.ITP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SLIIT.ITP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SLIIT.ITP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SLIIT.ITP] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SLIIT.ITP', N'ON'
GO
USE [SLIIT.ITP]
GO
/****** Object:  Table [dbo].[TB_Dept]    Script Date: 9/27/2015 9:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_Dept](
	[RnDeptID] [int] IDENTITY(1,1) NOT NULL,
	[DeptName] [varchar](max) NOT NULL,
 CONSTRAINT [PK_TB_Dept] PRIMARY KEY CLUSTERED 
(
	[RnDeptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_GP_Request]    Script Date: 9/27/2015 9:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_GP_Request](
	[RnRequestID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](max) NULL,
	[Address] [varchar](max) NULL,
	[Tel] [varchar](max) NULL,
	[EmailAddress] [varchar](max) NULL,
	[ReasonForRequest] [varchar](max) NULL,
	[ApprovedBy] [int] NULL,
	[ItemsToBeDeclared] [varchar](max) NULL,
	[VisitingArea] [varchar](max) NULL,
	[DateOfVisit] [datetime] NULL,
	[FromTime] [datetime] NULL,
	[ToTime] [datetime] NULL,
	[RequestComments] [varchar](max) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_TB_GP_Request] PRIMARY KEY CLUSTERED 
(
	[RnRequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_HR_AttendanceLog]    Script Date: 9/27/2015 9:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_HR_AttendanceLog](
	[RnLogID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[LogTime] [datetime] NOT NULL,
	[Type] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_TB_HR_AttendanceLog] PRIMARY KEY CLUSTERED 
(
	[RnLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TB_HR_AttendUser]    Script Date: 9/27/2015 9:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_HR_AttendUser](
	[RnAttendUserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](max) NOT NULL,
	[LastName] [varchar](max) NOT NULL,
	[Dept] [int] NULL,
	[CardNo] [int] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_TB_HR_AttendUser] PRIMARY KEY CLUSTERED 
(
	[RnAttendUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_IC_CustomerReturns]    Script Date: 9/27/2015 9:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_IC_CustomerReturns](
	[RnReturnID] [int] IDENTITY(1,1) NOT NULL,
	[ItemCategory] [nchar](10) NULL,
	[IssueCode] [nchar](10) NULL,
	[ItemName] [nchar](10) NULL,
	[StockQty] [int] NULL,
	[UnitPrice] [decimal](16, 0) NULL,
	[IssueQty] [int] NULL,
	[ReturnQty] [int] NULL,
	[IssuePrice] [decimal](16, 0) NULL,
 CONSTRAINT [PK_TB_IC_CustomerReturns] PRIMARY KEY CLUSTERED 
(
	[RnReturnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TB_IC_IssueItem]    Script Date: 9/27/2015 9:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_IC_IssueItem](
	[RnIssueID] [int] IDENTITY(1,1) NOT NULL,
	[ItemCode] [nchar](10) NULL,
	[ItemCategory] [nchar](10) NULL,
	[ItemName] [nchar](10) NULL,
	[UnitPrice] [decimal](16, 0) NULL,
	[StockQty] [int] NULL,
	[IssueQty] [int] NULL,
	[IssueUnitprice] [decimal](16, 0) NULL,
	[TotalPrice] [decimal](16, 0) NULL,
 CONSTRAINT [PK_TB_IC_IssueItem] PRIMARY KEY CLUSTERED 
(
	[RnIssueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TB_IC_MasterData]    Script Date: 9/27/2015 9:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_IC_MasterData](
	[RnItemID] [int] IDENTITY(1,1) NOT NULL,
	[ItemCode] [nchar](10) NULL,
	[ItemCategory] [nchar](10) NULL,
	[ItemName] [nchar](10) NULL,
	[UnitPrice] [decimal](16, 0) NULL,
	[Quantity] [int] NULL,
	[TotalPrice] [decimal](16, 0) NULL,
 CONSTRAINT [PK_TB_IC_MasterData] PRIMARY KEY CLUSTERED 
(
	[RnItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TB_Menu]    Script Date: 9/27/2015 9:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_Menu](
	[RnMenu] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [varchar](max) NULL,
	[MenuImage] [varchar](max) NULL,
	[MenuPath] [varchar](max) NULL,
	[MenuColorStyle] [varchar](max) NULL,
	[MenuOrder] [int] NULL,
 CONSTRAINT [PK_TB_Menu] PRIMARY KEY CLUSTERED 
(
	[RnMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_MenuRole]    Script Date: 9/27/2015 9:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_MenuRole](
	[RnMenuRoleID] [int] IDENTITY(1,1) NOT NULL,
	[MenuID] [int] NULL,
	[RoleID] [int] NULL,
 CONSTRAINT [PK_TB_MenuRole] PRIMARY KEY CLUSTERED 
(
	[RnMenuRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TB_PC_IOUDetails]    Script Date: 9/27/2015 9:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_PC_IOUDetails](
	[RnIOUDetailID] [int] IDENTITY(1,1) NOT NULL,
	[IOUHeaderID] [int] NULL,
	[Description] [varchar](max) NULL,
	[Amount] [decimal](16, 2) NULL,
	[IsDeleted] [bit] NULL,
	[InsertedDate] [datetime] NULL,
	[LastUpdatedBy] [int] NULL,
	[LastUpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_TB_PC_IOUDetails] PRIMARY KEY CLUSTERED 
(
	[RnIOUDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_PC_IOUHeader]    Script Date: 9/27/2015 9:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_PC_IOUHeader](
	[RnIOUID] [int] IDENTITY(1,1) NOT NULL,
	[IOUDate] [datetime] NULL,
	[ApprovedBy] [int] NULL,
	[ApprovedDate] [datetime] NULL,
	[RejectedBy] [int] NULL,
	[RejectedDate] [datetime] NULL,
	[RejectReason] [varchar](max) NULL,
	[PaidDate] [datetime] NULL,
	[Status] [int] NULL,
	[IsDeleted] [bit] NULL,
	[InsertedBy] [int] NULL,
	[InsertedDate] [datetime] NULL,
	[PCOfficer] [int] NULL,
	[LastUpdatedBy] [int] NULL,
	[LastUpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_TB_PC_IOUHeader] PRIMARY KEY CLUSTERED 
(
	[RnIOUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_Role]    Script Date: 9/27/2015 9:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_Role](
	[RnRoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](max) NULL,
	[RoleIcon] [varchar](max) NULL,
 CONSTRAINT [PK_TB_Role] PRIMARY KEY CLUSTERED 
(
	[RnRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_User]    Script Date: 9/27/2015 9:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_User](
	[RnUserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](max) NOT NULL,
	[Password] [varchar](max) NOT NULL,
	[FirstName] [varchar](max) NULL,
	[LastName] [varchar](max) NULL,
	[Dept] [int] NULL,
	[ProfilePic] [varchar](max) NULL,
 CONSTRAINT [PK_TB_User] PRIMARY KEY CLUSTERED 
(
	[RnUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_UserRole]    Script Date: 9/27/2015 9:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_UserRole](
	[RnUserRoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_TB_UserRole] PRIMARY KEY CLUSTERED 
(
	[RnUserRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TB_VF_Vehicle]    Script Date: 9/27/2015 9:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_VF_Vehicle](
	[RnVehicleID] [int] IDENTITY(1,1) NOT NULL,
	[RegNo] [varchar](50) NOT NULL,
	[Model] [varchar](max) NOT NULL,
	[YearOfManuf] [datetime] NOT NULL,
	[YearOfPurchase] [date] NOT NULL,
	[DriverID] [int] NOT NULL,
	[EngineNo] [varchar](max) NOT NULL,
	[ChassieNo] [varchar](max) NOT NULL,
	[Status] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_TB_VF_Vehicle] PRIMARY KEY CLUSTERED 
(
	[RnVehicleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_VF_VehicleStatus]    Script Date: 9/27/2015 9:44:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_VF_VehicleStatus](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusText] [varchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_TB_VF_VehicleStatus] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[TB_Dept] ON 

INSERT [dbo].[TB_Dept] ([RnDeptID], [DeptName]) VALUES (1, N'Warehouse')
SET IDENTITY_INSERT [dbo].[TB_Dept] OFF
SET IDENTITY_INSERT [dbo].[TB_HR_AttendanceLog] ON 

INSERT [dbo].[TB_HR_AttendanceLog] ([RnLogID], [UserID], [LogTime], [Type], [IsDeleted]) VALUES (1, 2, CAST(N'2015-08-16 22:37:43.720' AS DateTime), 1, 0)
INSERT [dbo].[TB_HR_AttendanceLog] ([RnLogID], [UserID], [LogTime], [Type], [IsDeleted]) VALUES (2, 2, CAST(N'2015-08-16 22:38:09.367' AS DateTime), 0, 0)
INSERT [dbo].[TB_HR_AttendanceLog] ([RnLogID], [UserID], [LogTime], [Type], [IsDeleted]) VALUES (1002, 2, CAST(N'2015-08-22 21:59:15.177' AS DateTime), 1, 0)
INSERT [dbo].[TB_HR_AttendanceLog] ([RnLogID], [UserID], [LogTime], [Type], [IsDeleted]) VALUES (1003, 2, CAST(N'2015-08-23 08:01:22.373' AS DateTime), 0, 0)
INSERT [dbo].[TB_HR_AttendanceLog] ([RnLogID], [UserID], [LogTime], [Type], [IsDeleted]) VALUES (1004, 2, CAST(N'2015-08-23 08:03:03.630' AS DateTime), 1, 0)
INSERT [dbo].[TB_HR_AttendanceLog] ([RnLogID], [UserID], [LogTime], [Type], [IsDeleted]) VALUES (1005, 2, CAST(N'2015-08-23 08:08:51.323' AS DateTime), 0, 0)
INSERT [dbo].[TB_HR_AttendanceLog] ([RnLogID], [UserID], [LogTime], [Type], [IsDeleted]) VALUES (1006, 2, CAST(N'2015-08-23 08:09:03.190' AS DateTime), 1, 0)
INSERT [dbo].[TB_HR_AttendanceLog] ([RnLogID], [UserID], [LogTime], [Type], [IsDeleted]) VALUES (1007, 2, CAST(N'2015-08-23 08:09:43.230' AS DateTime), 0, 0)
INSERT [dbo].[TB_HR_AttendanceLog] ([RnLogID], [UserID], [LogTime], [Type], [IsDeleted]) VALUES (1008, 2, CAST(N'2015-08-23 09:41:12.573' AS DateTime), 1, 0)
INSERT [dbo].[TB_HR_AttendanceLog] ([RnLogID], [UserID], [LogTime], [Type], [IsDeleted]) VALUES (1009, 2, CAST(N'2015-08-23 10:00:56.083' AS DateTime), 0, 0)
INSERT [dbo].[TB_HR_AttendanceLog] ([RnLogID], [UserID], [LogTime], [Type], [IsDeleted]) VALUES (1010, 1002, CAST(N'2015-08-23 10:07:34.437' AS DateTime), 1, 0)
INSERT [dbo].[TB_HR_AttendanceLog] ([RnLogID], [UserID], [LogTime], [Type], [IsDeleted]) VALUES (1011, 1002, CAST(N'2015-08-23 10:09:04.597' AS DateTime), 0, 0)
INSERT [dbo].[TB_HR_AttendanceLog] ([RnLogID], [UserID], [LogTime], [Type], [IsDeleted]) VALUES (1012, 1002, CAST(N'2015-08-23 10:23:05.663' AS DateTime), 1, 0)
INSERT [dbo].[TB_HR_AttendanceLog] ([RnLogID], [UserID], [LogTime], [Type], [IsDeleted]) VALUES (1013, 2, CAST(N'2015-08-23 10:23:11.673' AS DateTime), 1, 0)
INSERT [dbo].[TB_HR_AttendanceLog] ([RnLogID], [UserID], [LogTime], [Type], [IsDeleted]) VALUES (1014, 2, CAST(N'2015-08-23 10:33:05.700' AS DateTime), 0, 0)
INSERT [dbo].[TB_HR_AttendanceLog] ([RnLogID], [UserID], [LogTime], [Type], [IsDeleted]) VALUES (1015, 2, CAST(N'2015-08-23 11:25:10.280' AS DateTime), 1, 0)
INSERT [dbo].[TB_HR_AttendanceLog] ([RnLogID], [UserID], [LogTime], [Type], [IsDeleted]) VALUES (1016, 2, CAST(N'2015-08-23 11:26:21.900' AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[TB_HR_AttendanceLog] OFF
SET IDENTITY_INSERT [dbo].[TB_HR_AttendUser] ON 

INSERT [dbo].[TB_HR_AttendUser] ([RnAttendUserID], [FirstName], [LastName], [Dept], [CardNo], [IsDeleted]) VALUES (2, N'Isuru', N'Malaka', 1, 12345, 0)
INSERT [dbo].[TB_HR_AttendUser] ([RnAttendUserID], [FirstName], [LastName], [Dept], [CardNo], [IsDeleted]) VALUES (1002, N'Hiran', N'Adikari', 1, 11111, 0)
SET IDENTITY_INSERT [dbo].[TB_HR_AttendUser] OFF
SET IDENTITY_INSERT [dbo].[TB_Menu] ON 

INSERT [dbo].[TB_Menu] ([RnMenu], [MenuName], [MenuImage], [MenuPath], [MenuColorStyle], [MenuOrder]) VALUES (1, N'Attendence', N'fa-plus-square-o', N'/UI/HR/PunchCard', NULL, 1)
INSERT [dbo].[TB_Menu] ([RnMenu], [MenuName], [MenuImage], [MenuPath], [MenuColorStyle], [MenuOrder]) VALUES (2, N'Modify', NULL, N'/UI/HR/Modify', NULL, 2)
INSERT [dbo].[TB_Menu] ([RnMenu], [MenuName], [MenuImage], [MenuPath], [MenuColorStyle], [MenuOrder]) VALUES (3, N'Manage', NULL, N'UI/VF/AddVehicle', NULL, 1)
INSERT [dbo].[TB_Menu] ([RnMenu], [MenuName], [MenuImage], [MenuPath], [MenuColorStyle], [MenuOrder]) VALUES (4, N'View IOU', NULL, N'UI/PC/ViewAllRequestor', NULL, 1)
INSERT [dbo].[TB_Menu] ([RnMenu], [MenuName], [MenuImage], [MenuPath], [MenuColorStyle], [MenuOrder]) VALUES (1004, N'Request', NULL, N'UI/GP/RequestPage', NULL, 1)
INSERT [dbo].[TB_Menu] ([RnMenu], [MenuName], [MenuImage], [MenuPath], [MenuColorStyle], [MenuOrder]) VALUES (1005, N'New IOU', NULL, N'UI/PC/NewIou', NULL, 2)
INSERT [dbo].[TB_Menu] ([RnMenu], [MenuName], [MenuImage], [MenuPath], [MenuColorStyle], [MenuOrder]) VALUES (1006, N'BOQ', NULL, N'UI/PR/boq', NULL, 1)
INSERT [dbo].[TB_Menu] ([RnMenu], [MenuName], [MenuImage], [MenuPath], [MenuColorStyle], [MenuOrder]) VALUES (1007, N'New Contact Person', NULL, N'UI/PR/PRCP', NULL, 2)
INSERT [dbo].[TB_Menu] ([RnMenu], [MenuName], [MenuImage], [MenuPath], [MenuColorStyle], [MenuOrder]) VALUES (1008, N'RFQ', NULL, N'UI/PR/rfq', NULL, 3)
INSERT [dbo].[TB_Menu] ([RnMenu], [MenuName], [MenuImage], [MenuPath], [MenuColorStyle], [MenuOrder]) VALUES (1009, N'Returns', NULL, N'UI/IC/CustomerReturns', NULL, 2)
INSERT [dbo].[TB_Menu] ([RnMenu], [MenuName], [MenuImage], [MenuPath], [MenuColorStyle], [MenuOrder]) VALUES (1010, N'Issue', NULL, N'UI/IC/IssueItem', NULL, 3)
INSERT [dbo].[TB_Menu] ([RnMenu], [MenuName], [MenuImage], [MenuPath], [MenuColorStyle], [MenuOrder]) VALUES (1011, N'Master Data', NULL, N'UI/IC/MasterDataEntry', NULL, 1)
INSERT [dbo].[TB_Menu] ([RnMenu], [MenuName], [MenuImage], [MenuPath], [MenuColorStyle], [MenuOrder]) VALUES (1012, N'Search', NULL, N'UI/IC/Search', NULL, 4)
INSERT [dbo].[TB_Menu] ([RnMenu], [MenuName], [MenuImage], [MenuPath], [MenuColorStyle], [MenuOrder]) VALUES (1013, N'Add', NULL, N'UI/CM/AddComplaint', NULL, 1)
INSERT [dbo].[TB_Menu] ([RnMenu], [MenuName], [MenuImage], [MenuPath], [MenuColorStyle], [MenuOrder]) VALUES (1014, N'View', NULL, N'UI/CM/ViewComplaints', NULL, 2)
SET IDENTITY_INSERT [dbo].[TB_Menu] OFF
SET IDENTITY_INSERT [dbo].[TB_MenuRole] ON 

INSERT [dbo].[TB_MenuRole] ([RnMenuRoleID], [MenuID], [RoleID]) VALUES (1, 1, 1)
INSERT [dbo].[TB_MenuRole] ([RnMenuRoleID], [MenuID], [RoleID]) VALUES (2, 2, 1)
INSERT [dbo].[TB_MenuRole] ([RnMenuRoleID], [MenuID], [RoleID]) VALUES (3, 3, 2)
INSERT [dbo].[TB_MenuRole] ([RnMenuRoleID], [MenuID], [RoleID]) VALUES (1004, 4, 5)
INSERT [dbo].[TB_MenuRole] ([RnMenuRoleID], [MenuID], [RoleID]) VALUES (1005, 1005, 5)
INSERT [dbo].[TB_MenuRole] ([RnMenuRoleID], [MenuID], [RoleID]) VALUES (1006, 1004, 3)
INSERT [dbo].[TB_MenuRole] ([RnMenuRoleID], [MenuID], [RoleID]) VALUES (1007, 1006, 6)
INSERT [dbo].[TB_MenuRole] ([RnMenuRoleID], [MenuID], [RoleID]) VALUES (1008, 1007, 6)
INSERT [dbo].[TB_MenuRole] ([RnMenuRoleID], [MenuID], [RoleID]) VALUES (1009, 1008, 6)
INSERT [dbo].[TB_MenuRole] ([RnMenuRoleID], [MenuID], [RoleID]) VALUES (1010, 1009, 4)
INSERT [dbo].[TB_MenuRole] ([RnMenuRoleID], [MenuID], [RoleID]) VALUES (1011, 1010, 4)
INSERT [dbo].[TB_MenuRole] ([RnMenuRoleID], [MenuID], [RoleID]) VALUES (1012, 1011, 4)
INSERT [dbo].[TB_MenuRole] ([RnMenuRoleID], [MenuID], [RoleID]) VALUES (1013, 1012, 4)
INSERT [dbo].[TB_MenuRole] ([RnMenuRoleID], [MenuID], [RoleID]) VALUES (1014, 1013, 7)
INSERT [dbo].[TB_MenuRole] ([RnMenuRoleID], [MenuID], [RoleID]) VALUES (1015, 1014, 7)
SET IDENTITY_INSERT [dbo].[TB_MenuRole] OFF
SET IDENTITY_INSERT [dbo].[TB_PC_IOUHeader] ON 

INSERT [dbo].[TB_PC_IOUHeader] ([RnIOUID], [IOUDate], [ApprovedBy], [ApprovedDate], [RejectedBy], [RejectedDate], [RejectReason], [PaidDate], [Status], [IsDeleted], [InsertedBy], [InsertedDate], [PCOfficer], [LastUpdatedBy], [LastUpdatedDate]) VALUES (1, CAST(N'2015-01-01 00:00:00.000' AS DateTime), 1, CAST(N'2015-01-01 00:00:00.000' AS DateTime), 1, CAST(N'2015-01-01 00:00:00.000' AS DateTime), NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[TB_PC_IOUHeader] ([RnIOUID], [IOUDate], [ApprovedBy], [ApprovedDate], [RejectedBy], [RejectedDate], [RejectReason], [PaidDate], [Status], [IsDeleted], [InsertedBy], [InsertedDate], [PCOfficer], [LastUpdatedBy], [LastUpdatedDate]) VALUES (2, CAST(N'2015-01-01 00:00:00.000' AS DateTime), 3, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TB_PC_IOUHeader] ([RnIOUID], [IOUDate], [ApprovedBy], [ApprovedDate], [RejectedBy], [RejectedDate], [RejectReason], [PaidDate], [Status], [IsDeleted], [InsertedBy], [InsertedDate], [PCOfficer], [LastUpdatedBy], [LastUpdatedDate]) VALUES (3, CAST(N'2015-06-04 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TB_PC_IOUHeader] ([RnIOUID], [IOUDate], [ApprovedBy], [ApprovedDate], [RejectedBy], [RejectedDate], [RejectReason], [PaidDate], [Status], [IsDeleted], [InsertedBy], [InsertedDate], [PCOfficer], [LastUpdatedBy], [LastUpdatedDate]) VALUES (4, CAST(N'2015-02-13 00:00:00.000' AS DateTime), 1, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TB_PC_IOUHeader] OFF
SET IDENTITY_INSERT [dbo].[TB_Role] ON 

INSERT [dbo].[TB_Role] ([RnRoleID], [RoleName], [RoleIcon]) VALUES (1, N'HR', N'fa fa-user')
INSERT [dbo].[TB_Role] ([RnRoleID], [RoleName], [RoleIcon]) VALUES (2, N'Vehicle Fleet', N'fa fa-car')
INSERT [dbo].[TB_Role] ([RnRoleID], [RoleName], [RoleIcon]) VALUES (3, N'Gate Pass', N'fa fa-bomb')
INSERT [dbo].[TB_Role] ([RnRoleID], [RoleName], [RoleIcon]) VALUES (4, N'Inventory Control', N'fa fa-briefcase')
INSERT [dbo].[TB_Role] ([RnRoleID], [RoleName], [RoleIcon]) VALUES (5, N'IOU', N'fa fa-money')
INSERT [dbo].[TB_Role] ([RnRoleID], [RoleName], [RoleIcon]) VALUES (6, N'Procurement Mgmt', N'fa fa-shopping-cart')
INSERT [dbo].[TB_Role] ([RnRoleID], [RoleName], [RoleIcon]) VALUES (7, N'Complaint Mgmt', N'fa fa-check')
SET IDENTITY_INSERT [dbo].[TB_Role] OFF
SET IDENTITY_INSERT [dbo].[TB_User] ON 

INSERT [dbo].[TB_User] ([RnUserID], [UserName], [Password], [FirstName], [LastName], [Dept], [ProfilePic]) VALUES (1, N'admin', N'123', N'Isuru', N'Samarasinha', NULL, NULL)
INSERT [dbo].[TB_User] ([RnUserID], [UserName], [Password], [FirstName], [LastName], [Dept], [ProfilePic]) VALUES (2, N'rakitha', N'123', N'Rakitha', N'Mendis', NULL, NULL)
INSERT [dbo].[TB_User] ([RnUserID], [UserName], [Password], [FirstName], [LastName], [Dept], [ProfilePic]) VALUES (3, N'hiran', N'123', N'Hiran', N'Adikari', NULL, NULL)
INSERT [dbo].[TB_User] ([RnUserID], [UserName], [Password], [FirstName], [LastName], [Dept], [ProfilePic]) VALUES (4, N'gayeshi', N'123', N'Gayeshi', N'Jayasooriya', NULL, NULL)
INSERT [dbo].[TB_User] ([RnUserID], [UserName], [Password], [FirstName], [LastName], [Dept], [ProfilePic]) VALUES (5, N'kalhan', N'123', N'Kalhan', N'Abesinghe', NULL, NULL)
INSERT [dbo].[TB_User] ([RnUserID], [UserName], [Password], [FirstName], [LastName], [Dept], [ProfilePic]) VALUES (7, N'sachithra', N'123', N'Sachithra', N'Perera', NULL, NULL)
INSERT [dbo].[TB_User] ([RnUserID], [UserName], [Password], [FirstName], [LastName], [Dept], [ProfilePic]) VALUES (8, N'kalana', N'123', N'Kalana', N'Perea', NULL, NULL)
SET IDENTITY_INSERT [dbo].[TB_User] OFF
SET IDENTITY_INSERT [dbo].[TB_UserRole] ON 

INSERT [dbo].[TB_UserRole] ([RnUserRoleID], [RoleID], [UserID]) VALUES (1, 1, 1)
INSERT [dbo].[TB_UserRole] ([RnUserRoleID], [RoleID], [UserID]) VALUES (2, 2, 1)
INSERT [dbo].[TB_UserRole] ([RnUserRoleID], [RoleID], [UserID]) VALUES (3, 3, 1)
INSERT [dbo].[TB_UserRole] ([RnUserRoleID], [RoleID], [UserID]) VALUES (4, 4, 1)
INSERT [dbo].[TB_UserRole] ([RnUserRoleID], [RoleID], [UserID]) VALUES (5, 5, 1)
INSERT [dbo].[TB_UserRole] ([RnUserRoleID], [RoleID], [UserID]) VALUES (6, 6, 1)
INSERT [dbo].[TB_UserRole] ([RnUserRoleID], [RoleID], [UserID]) VALUES (7, 7, 1)
SET IDENTITY_INSERT [dbo].[TB_UserRole] OFF
SET IDENTITY_INSERT [dbo].[TB_VF_Vehicle] ON 

INSERT [dbo].[TB_VF_Vehicle] ([RnVehicleID], [RegNo], [Model], [YearOfManuf], [YearOfPurchase], [DriverID], [EngineNo], [ChassieNo], [Status], [IsDeleted]) VALUES (2, N'WP-6353', N'Isuzu', CAST(N'2014-05-01 00:00:00.000' AS DateTime), CAST(N'2015-01-01' AS Date), 2, N'MDX-52452S4CFoooooo', N'112312', 1, 0)
INSERT [dbo].[TB_VF_Vehicle] ([RnVehicleID], [RegNo], [Model], [YearOfManuf], [YearOfPurchase], [DriverID], [EngineNo], [ChassieNo], [Status], [IsDeleted]) VALUES (5, N'XY-7514', N'Toyota', CAST(N'2008-05-25 00:00:00.000' AS DateTime), CAST(N'2014-01-15' AS Date), 1002, N'521452-HDV-SS', N'84562153255325', 5, 1)
SET IDENTITY_INSERT [dbo].[TB_VF_Vehicle] OFF
SET IDENTITY_INSERT [dbo].[TB_VF_VehicleStatus] ON 

INSERT [dbo].[TB_VF_VehicleStatus] ([StatusID], [StatusText], [IsDeleted]) VALUES (1, N'Avaliable', 0)
INSERT [dbo].[TB_VF_VehicleStatus] ([StatusID], [StatusText], [IsDeleted]) VALUES (3, N'In Repairs', 0)
INSERT [dbo].[TB_VF_VehicleStatus] ([StatusID], [StatusText], [IsDeleted]) VALUES (5, N'Unavaliable', 0)
SET IDENTITY_INSERT [dbo].[TB_VF_VehicleStatus] OFF
ALTER TABLE [dbo].[TB_HR_AttendanceLog]  WITH CHECK ADD  CONSTRAINT [FK_TB_HR_AttendanceLog_TB_HR_AttendUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[TB_HR_AttendUser] ([RnAttendUserID])
GO
ALTER TABLE [dbo].[TB_HR_AttendanceLog] CHECK CONSTRAINT [FK_TB_HR_AttendanceLog_TB_HR_AttendUser]
GO
ALTER TABLE [dbo].[TB_HR_AttendUser]  WITH CHECK ADD  CONSTRAINT [FK_TB_HR_AttendUser_TB_Dept] FOREIGN KEY([Dept])
REFERENCES [dbo].[TB_Dept] ([RnDeptID])
GO
ALTER TABLE [dbo].[TB_HR_AttendUser] CHECK CONSTRAINT [FK_TB_HR_AttendUser_TB_Dept]
GO
ALTER TABLE [dbo].[TB_MenuRole]  WITH CHECK ADD  CONSTRAINT [FK_TB_MenuRole_TB_Menu] FOREIGN KEY([MenuID])
REFERENCES [dbo].[TB_Menu] ([RnMenu])
GO
ALTER TABLE [dbo].[TB_MenuRole] CHECK CONSTRAINT [FK_TB_MenuRole_TB_Menu]
GO
ALTER TABLE [dbo].[TB_MenuRole]  WITH CHECK ADD  CONSTRAINT [FK_TB_MenuRole_TB_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[TB_Role] ([RnRoleID])
GO
ALTER TABLE [dbo].[TB_MenuRole] CHECK CONSTRAINT [FK_TB_MenuRole_TB_Role]
GO
ALTER TABLE [dbo].[TB_PC_IOUDetails]  WITH CHECK ADD  CONSTRAINT [FK_TB_PC_IOUDetails_TB_PC_IOUHeader] FOREIGN KEY([IOUHeaderID])
REFERENCES [dbo].[TB_PC_IOUHeader] ([RnIOUID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TB_PC_IOUDetails] CHECK CONSTRAINT [FK_TB_PC_IOUDetails_TB_PC_IOUHeader]
GO
ALTER TABLE [dbo].[TB_UserRole]  WITH CHECK ADD  CONSTRAINT [FK_TB_UserRole_TB_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[TB_Role] ([RnRoleID])
GO
ALTER TABLE [dbo].[TB_UserRole] CHECK CONSTRAINT [FK_TB_UserRole_TB_Role]
GO
ALTER TABLE [dbo].[TB_UserRole]  WITH CHECK ADD  CONSTRAINT [FK_TB_UserRole_TB_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[TB_User] ([RnUserID])
GO
ALTER TABLE [dbo].[TB_UserRole] CHECK CONSTRAINT [FK_TB_UserRole_TB_User]
GO
ALTER TABLE [dbo].[TB_VF_Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_TB_VF_Vehicle_TB_HR_AttendUser] FOREIGN KEY([DriverID])
REFERENCES [dbo].[TB_HR_AttendUser] ([RnAttendUserID])
GO
ALTER TABLE [dbo].[TB_VF_Vehicle] CHECK CONSTRAINT [FK_TB_VF_Vehicle_TB_HR_AttendUser]
GO
ALTER TABLE [dbo].[TB_VF_Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_TB_VF_Vehicle_TB_VF_VehicleStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[TB_VF_VehicleStatus] ([StatusID])
GO
ALTER TABLE [dbo].[TB_VF_Vehicle] CHECK CONSTRAINT [FK_TB_VF_Vehicle_TB_VF_VehicleStatus]
GO
USE [master]
GO
ALTER DATABASE [SLIIT.ITP] SET  READ_WRITE 
GO
