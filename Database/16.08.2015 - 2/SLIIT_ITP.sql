USE [master]
GO
/****** Object:  Database [SLIIT.ITP]    Script Date: 8/16/2015 10:39:46 PM ******/
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
/****** Object:  Table [dbo].[TB_Dept]    Script Date: 8/16/2015 10:39:46 PM ******/
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
/****** Object:  Table [dbo].[TB_HR_AttendanceLog]    Script Date: 8/16/2015 10:39:46 PM ******/
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
/****** Object:  Table [dbo].[TB_HR_AttendUser]    Script Date: 8/16/2015 10:39:46 PM ******/
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
/****** Object:  Table [dbo].[TB_Menu]    Script Date: 8/16/2015 10:39:46 PM ******/
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
/****** Object:  Table [dbo].[TB_MenuRole]    Script Date: 8/16/2015 10:39:46 PM ******/
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
/****** Object:  Table [dbo].[TB_Role]    Script Date: 8/16/2015 10:39:46 PM ******/
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
/****** Object:  Table [dbo].[TB_User]    Script Date: 8/16/2015 10:39:46 PM ******/
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
/****** Object:  Table [dbo].[TB_UserRole]    Script Date: 8/16/2015 10:39:46 PM ******/
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
SET IDENTITY_INSERT [dbo].[TB_Dept] ON 

INSERT [dbo].[TB_Dept] ([RnDeptID], [DeptName]) VALUES (1, N'Warehouse')
SET IDENTITY_INSERT [dbo].[TB_Dept] OFF
SET IDENTITY_INSERT [dbo].[TB_HR_AttendanceLog] ON 

INSERT [dbo].[TB_HR_AttendanceLog] ([RnLogID], [UserID], [LogTime], [Type], [IsDeleted]) VALUES (1, 2, CAST(N'2015-08-16 22:37:43.720' AS DateTime), 1, 0)
INSERT [dbo].[TB_HR_AttendanceLog] ([RnLogID], [UserID], [LogTime], [Type], [IsDeleted]) VALUES (2, 2, CAST(N'2015-08-16 22:38:09.367' AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[TB_HR_AttendanceLog] OFF
SET IDENTITY_INSERT [dbo].[TB_HR_AttendUser] ON 

INSERT [dbo].[TB_HR_AttendUser] ([RnAttendUserID], [FirstName], [LastName], [Dept], [CardNo], [IsDeleted]) VALUES (2, N'Isuru', N'Malaka', 1, 123, 0)
SET IDENTITY_INSERT [dbo].[TB_HR_AttendUser] OFF
SET IDENTITY_INSERT [dbo].[TB_Menu] ON 

INSERT [dbo].[TB_Menu] ([RnMenu], [MenuName], [MenuImage], [MenuPath], [MenuColorStyle], [MenuOrder]) VALUES (1, N'Attendence', N'fa-plus-square-o', N'/UI/HR/PunchCard', NULL, 1)
INSERT [dbo].[TB_Menu] ([RnMenu], [MenuName], [MenuImage], [MenuPath], [MenuColorStyle], [MenuOrder]) VALUES (2, N'Delete Employee', NULL, N'2', NULL, 2)
INSERT [dbo].[TB_Menu] ([RnMenu], [MenuName], [MenuImage], [MenuPath], [MenuColorStyle], [MenuOrder]) VALUES (3, N'Delete Vehicle', NULL, N'5', NULL, 1)
INSERT [dbo].[TB_Menu] ([RnMenu], [MenuName], [MenuImage], [MenuPath], [MenuColorStyle], [MenuOrder]) VALUES (4, N'Add Vehicle', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TB_Menu] OFF
SET IDENTITY_INSERT [dbo].[TB_MenuRole] ON 

INSERT [dbo].[TB_MenuRole] ([RnMenuRoleID], [MenuID], [RoleID]) VALUES (1, 1, 1)
INSERT [dbo].[TB_MenuRole] ([RnMenuRoleID], [MenuID], [RoleID]) VALUES (2, 2, 1)
INSERT [dbo].[TB_MenuRole] ([RnMenuRoleID], [MenuID], [RoleID]) VALUES (3, 3, 2)
INSERT [dbo].[TB_MenuRole] ([RnMenuRoleID], [MenuID], [RoleID]) VALUES (4, 3, 3)
INSERT [dbo].[TB_MenuRole] ([RnMenuRoleID], [MenuID], [RoleID]) VALUES (5, 3, 4)
SET IDENTITY_INSERT [dbo].[TB_MenuRole] OFF
SET IDENTITY_INSERT [dbo].[TB_Role] ON 

INSERT [dbo].[TB_Role] ([RnRoleID], [RoleName], [RoleIcon]) VALUES (1, N'HR', N'fa fa-user')
INSERT [dbo].[TB_Role] ([RnRoleID], [RoleName], [RoleIcon]) VALUES (2, N'Vehicle Fleet', N'fa fa-car')
INSERT [dbo].[TB_Role] ([RnRoleID], [RoleName], [RoleIcon]) VALUES (3, N'Gate Pass', N'fa fa-bomb')
INSERT [dbo].[TB_Role] ([RnRoleID], [RoleName], [RoleIcon]) VALUES (4, N'Inventory Control', N'fa fa-briefcase')
INSERT [dbo].[TB_Role] ([RnRoleID], [RoleName], [RoleIcon]) VALUES (5, N'PettyCash/IOU', N'fa fa-money')
INSERT [dbo].[TB_Role] ([RnRoleID], [RoleName], [RoleIcon]) VALUES (6, N'Procurement Mgmt', N'fa fa-shopping-cart')
INSERT [dbo].[TB_Role] ([RnRoleID], [RoleName], [RoleIcon]) VALUES (7, N'Complaint Mgmt', N'fa fa-check')
SET IDENTITY_INSERT [dbo].[TB_Role] OFF
SET IDENTITY_INSERT [dbo].[TB_User] ON 

INSERT [dbo].[TB_User] ([RnUserID], [UserName], [Password], [FirstName], [LastName], [Dept], [ProfilePic]) VALUES (1, N'admin', N'123', N'Admin', N'', NULL, NULL)
INSERT [dbo].[TB_User] ([RnUserID], [UserName], [Password], [FirstName], [LastName], [Dept], [ProfilePic]) VALUES (2, N'rakitha', N'123', N'Rakitha', N'Mendis', NULL, NULL)
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
USE [master]
GO
ALTER DATABASE [SLIIT.ITP] SET  READ_WRITE 
GO
