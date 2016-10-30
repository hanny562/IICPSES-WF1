USE [master]
GO
/****** Object:  Database [IICPSES]    Script Date: 10/31/2016 1:13:36 AM ******/
CREATE DATABASE [IICPSES]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IICPSES', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\IICPSES.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'IICPSES_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\IICPSES_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [IICPSES] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IICPSES].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IICPSES] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IICPSES] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IICPSES] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IICPSES] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IICPSES] SET ARITHABORT OFF 
GO
ALTER DATABASE [IICPSES] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IICPSES] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IICPSES] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IICPSES] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IICPSES] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IICPSES] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IICPSES] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IICPSES] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IICPSES] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IICPSES] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IICPSES] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IICPSES] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IICPSES] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IICPSES] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IICPSES] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IICPSES] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IICPSES] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IICPSES] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [IICPSES] SET  MULTI_USER 
GO
ALTER DATABASE [IICPSES] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IICPSES] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IICPSES] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IICPSES] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [IICPSES] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [IICPSES] SET QUERY_STORE = OFF
GO
USE [IICPSES]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [IICPSES]
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 10/31/2016 1:13:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Response] [nvarchar](max) NULL,
	[QuestionId] [nvarchar](max) NULL,
	[SubmitDateTime] [datetime] NULL,
	[SecretCodeId] [int] NULL,
 CONSTRAINT [PK_Answer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Question]    Script Date: 10/31/2016 1:13:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Type] [int] NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SurveyProfile]    Script Date: 10/31/2016 1:13:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyProfile](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SemesterName] [nvarchar](max) NULL,
	[SchoolCode] [nvarchar](max) NULL,
	[SchoolName] [nvarchar](max) NULL,
	[ProgramCode] [nvarchar](max) NULL,
	[ProgramName] [nvarchar](max) NULL,
	[SubjectCode] [nvarchar](max) NULL,
	[SubjectName] [nvarchar](max) NULL,
	[LecturerName] [nvarchar](max) NULL,
	[SecretCodeText] [nvarchar](max) NULL,
	[CreatedDateTime] [nvarchar](max) NULL,
	[IsExpired] [bit] NULL,
 CONSTRAINT [PK_SurveyProfile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 10/31/2016 1:13:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[DisplayName] [nvarchar](max) NULL,
	[RegisteredDateTime] [datetime] NULL,
	[LastLoginDateTime] [datetime] NULL,
	[Role] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [IICPSES] SET  READ_WRITE 
GO
