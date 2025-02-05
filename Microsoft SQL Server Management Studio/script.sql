USE [master]
GO
/****** Object:  Database [JobhuntDb]    Script Date: 4/4/2024 11:25:11 AM ******/
CREATE DATABASE [JobhuntDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JobhuntDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\JobhuntDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'JobhuntDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\JobhuntDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [JobhuntDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JobhuntDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JobhuntDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JobhuntDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JobhuntDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JobhuntDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JobhuntDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [JobhuntDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JobhuntDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JobhuntDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JobhuntDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JobhuntDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JobhuntDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JobhuntDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JobhuntDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JobhuntDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JobhuntDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JobhuntDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JobhuntDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JobhuntDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JobhuntDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JobhuntDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JobhuntDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JobhuntDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JobhuntDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [JobhuntDb] SET  MULTI_USER 
GO
ALTER DATABASE [JobhuntDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JobhuntDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JobhuntDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JobhuntDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [JobhuntDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [JobhuntDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [JobhuntDb] SET QUERY_STORE = OFF
GO
USE [JobhuntDb]
GO
/****** Object:  Table [dbo].[CompanyTable]    Script Date: 4/4/2024 11:25:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyTable](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CompanyName] [nvarchar](500) NOT NULL,
	[ContactNo] [nvarchar](20) NOT NULL,
	[PhoneNo] [nvarchar](20) NOT NULL,
	[EmailAddress] [nvarchar](500) NOT NULL,
	[Logo] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](1000) NULL,
 CONSTRAINT [PK_CompanyTable] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobCategoryTable]    Script Date: 4/4/2024 11:25:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobCategoryTable](
	[JobCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[JobCategory] [nvarchar](350) NOT NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_JobCategoryTable] PRIMARY KEY CLUSTERED 
(
	[JobCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobNatureTable]    Script Date: 4/4/2024 11:25:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobNatureTable](
	[JobNatureID] [int] NOT NULL,
	[JobNature] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_JobNatureTable] PRIMARY KEY CLUSTERED 
(
	[JobNatureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobRequirementDetailTable]    Script Date: 4/4/2024 11:25:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobRequirementDetailTable](
	[JobRequirementDetailID] [int] IDENTITY(1,1) NOT NULL,
	[JobRequirementID] [int] NOT NULL,
	[JobRequirementDetails] [nvarchar](2000) NOT NULL,
	[PostJobID] [int] NOT NULL,
 CONSTRAINT [PK_JobRequirementDetailTable] PRIMARY KEY CLUSTERED 
(
	[JobRequirementDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobRequirementsTable]    Script Date: 4/4/2024 11:25:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobRequirementsTable](
	[JobRequirementID] [int] IDENTITY(1,1) NOT NULL,
	[JobRequirementTitle] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_JobRequirementsTable] PRIMARY KEY CLUSTERED 
(
	[JobRequirementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobStatusTable]    Script Date: 4/4/2024 11:25:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobStatusTable](
	[JobStatusID] [int] IDENTITY(1,1) NOT NULL,
	[JobStatus] [nvarchar](150) NOT NULL,
	[StatusMessage] [nvarchar](2000) NULL,
 CONSTRAINT [PK_JobStatusTable] PRIMARY KEY CLUSTERED 
(
	[JobStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostJobTable]    Script Date: 4/4/2024 11:25:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostJobTable](
	[PostJobID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NOT NULL,
	[JobCategoryID] [int] NOT NULL,
	[JobTitle] [nvarchar](500) NOT NULL,
	[JobDescription] [nvarchar](2000) NOT NULL,
	[MinSalary] [int] NOT NULL,
	[MaxSalary] [int] NOT NULL,
	[Location] [nvarchar](500) NOT NULL,
	[Vacancey] [int] NOT NULL,
	[JobNatureID] [int] NOT NULL,
	[PostDate] [date] NOT NULL,
	[ApplicationLastDate] [date] NOT NULL,
	[LastDate] [date] NOT NULL,
	[JobStatusID] [int] NOT NULL,
	[WebUrl] [nvarchar](1000) NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_PostJobTable] PRIMARY KEY CLUSTERED 
(
	[PostJobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTable]    Script Date: 4/4/2024 11:25:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTable](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserTypeID] [int] NOT NULL,
	[UserName] [nvarchar](150) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[EmailAddress] [nvarchar](150) NOT NULL,
	[ContactNo] [varchar](20) NOT NULL,
 CONSTRAINT [PK_UserTable] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTable_1]    Script Date: 4/4/2024 11:25:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTable_1](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserTypeID] [int] NOT NULL,
	[UserName] [nvarchar](150) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[EmailAddress] [nvarchar](150) NOT NULL,
	[ContactNo] [varchar](20) NOT NULL,
 CONSTRAINT [PK_UserTable_1] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTypeTable]    Script Date: 4/4/2024 11:25:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTypeTable](
	[UserTypeID] [int] IDENTITY(1,1) NOT NULL,
	[UserType] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserTypeTable] PRIMARY KEY CLUSTERED 
(
	[UserTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CompanyTable]  WITH CHECK ADD  CONSTRAINT [FK_CompanyTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[CompanyTable] CHECK CONSTRAINT [FK_CompanyTable_UserTable]
GO
ALTER TABLE [dbo].[JobRequirementDetailTable]  WITH CHECK ADD  CONSTRAINT [FK_JobRequirementDetailTable_JobRequirementsTable] FOREIGN KEY([JobRequirementID])
REFERENCES [dbo].[JobRequirementsTable] ([JobRequirementID])
GO
ALTER TABLE [dbo].[JobRequirementDetailTable] CHECK CONSTRAINT [FK_JobRequirementDetailTable_JobRequirementsTable]
GO
ALTER TABLE [dbo].[JobRequirementDetailTable]  WITH CHECK ADD  CONSTRAINT [FK_JobRequirementDetailTable_PostJobTable] FOREIGN KEY([PostJobID])
REFERENCES [dbo].[PostJobTable] ([PostJobID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[JobRequirementDetailTable] CHECK CONSTRAINT [FK_JobRequirementDetailTable_PostJobTable]
GO
ALTER TABLE [dbo].[PostJobTable]  WITH CHECK ADD  CONSTRAINT [FK_PostJobTable_CompanyTable] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[CompanyTable] ([CompanyID])
GO
ALTER TABLE [dbo].[PostJobTable] CHECK CONSTRAINT [FK_PostJobTable_CompanyTable]
GO
ALTER TABLE [dbo].[PostJobTable]  WITH CHECK ADD  CONSTRAINT [FK_PostJobTable_JobCategoryTable] FOREIGN KEY([JobCategoryID])
REFERENCES [dbo].[JobCategoryTable] ([JobCategoryID])
GO
ALTER TABLE [dbo].[PostJobTable] CHECK CONSTRAINT [FK_PostJobTable_JobCategoryTable]
GO
ALTER TABLE [dbo].[PostJobTable]  WITH CHECK ADD  CONSTRAINT [FK_PostJobTable_JobNatureTable] FOREIGN KEY([JobNatureID])
REFERENCES [dbo].[JobNatureTable] ([JobNatureID])
GO
ALTER TABLE [dbo].[PostJobTable] CHECK CONSTRAINT [FK_PostJobTable_JobNatureTable]
GO
ALTER TABLE [dbo].[PostJobTable]  WITH CHECK ADD  CONSTRAINT [FK_PostJobTable_JobStatusTable] FOREIGN KEY([JobStatusID])
REFERENCES [dbo].[JobStatusTable] ([JobStatusID])
GO
ALTER TABLE [dbo].[PostJobTable] CHECK CONSTRAINT [FK_PostJobTable_JobStatusTable]
GO
ALTER TABLE [dbo].[PostJobTable]  WITH CHECK ADD  CONSTRAINT [FK_PostJobTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[PostJobTable] CHECK CONSTRAINT [FK_PostJobTable_UserTable]
GO
ALTER TABLE [dbo].[UserTable]  WITH CHECK ADD  CONSTRAINT [FK_UserTypeTable_UserTable] FOREIGN KEY([UserTypeID])
REFERENCES [dbo].[UserTypeTable] ([UserTypeID])
GO
ALTER TABLE [dbo].[UserTable] CHECK CONSTRAINT [FK_UserTypeTable_UserTable]
GO
ALTER TABLE [dbo].[UserTable_1]  WITH CHECK ADD  CONSTRAINT [FK_UserTable_1_UserTypeTable] FOREIGN KEY([UserTypeID])
REFERENCES [dbo].[UserTypeTable] ([UserTypeID])
GO
ALTER TABLE [dbo].[UserTable_1] CHECK CONSTRAINT [FK_UserTable_1_UserTypeTable]
GO
USE [master]
GO
ALTER DATABASE [JobhuntDb] SET  READ_WRITE 
GO
