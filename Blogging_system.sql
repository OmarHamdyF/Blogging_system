USE [master]
GO
/****** Object:  Database [Blogging_System]    Script Date: 6/12/2019 10:43:11 AM ******/
CREATE DATABASE [Blogging_System]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Blogging_System', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Blogging_System.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Blogging_System_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Blogging_System_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Blogging_System] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Blogging_System].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Blogging_System] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Blogging_System] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Blogging_System] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Blogging_System] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Blogging_System] SET ARITHABORT OFF 
GO
ALTER DATABASE [Blogging_System] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Blogging_System] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Blogging_System] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Blogging_System] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Blogging_System] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Blogging_System] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Blogging_System] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Blogging_System] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Blogging_System] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Blogging_System] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Blogging_System] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Blogging_System] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Blogging_System] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Blogging_System] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Blogging_System] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Blogging_System] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Blogging_System] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Blogging_System] SET RECOVERY FULL 
GO
ALTER DATABASE [Blogging_System] SET  MULTI_USER 
GO
ALTER DATABASE [Blogging_System] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Blogging_System] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Blogging_System] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Blogging_System] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Blogging_System] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Blogging_System', N'ON'
GO
USE [Blogging_System]
GO
/****** Object:  Table [dbo].[admin_table]    Script Date: 6/12/2019 10:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin_table](
	[admin_id] [int] IDENTITY(1,1) NOT NULL,
	[admin_name] [nvarchar](50) NULL,
	[password] [int] NULL,
 CONSTRAINT [PK_admin_table] PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[article_table]    Script Date: 6/12/2019 10:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[article_table](
	[article_id] [int] IDENTITY(1,1) NOT NULL,
	[article_body] [nvarchar](max) NULL,
	[admin_id] [int] NULL,
	[cat_id] [int] NULL,
	[article_heading] [nvarchar](max) NULL,
 CONSTRAINT [PK_article_table] PRIMARY KEY CLUSTERED 
(
	[article_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[category_table]    Script Date: 6/12/2019 10:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category_table](
	[cat_id] [int] IDENTITY(1,1) NOT NULL,
	[cat_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_category_table] PRIMARY KEY CLUSTERED 
(
	[cat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[comment_table]    Script Date: 6/12/2019 10:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comment_table](
	[comment_id] [int] IDENTITY(1,1) NOT NULL,
	[visitor_id] [int] NOT NULL,
	[article_id] [int] NOT NULL,
	[comment_body] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_comment_table] PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[visitor_table]    Script Date: 6/12/2019 10:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[visitor_table](
	[visitor_id] [int] IDENTITY(1,1) NOT NULL,
	[visitor_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_visitor_table] PRIMARY KEY CLUSTERED 
(
	[visitor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[article_table]  WITH CHECK ADD  CONSTRAINT [FK_article_table_admin_table] FOREIGN KEY([admin_id])
REFERENCES [dbo].[admin_table] ([admin_id])
GO
ALTER TABLE [dbo].[article_table] CHECK CONSTRAINT [FK_article_table_admin_table]
GO
ALTER TABLE [dbo].[article_table]  WITH CHECK ADD  CONSTRAINT [FK_article_table_category_table] FOREIGN KEY([cat_id])
REFERENCES [dbo].[category_table] ([cat_id])
GO
ALTER TABLE [dbo].[article_table] CHECK CONSTRAINT [FK_article_table_category_table]
GO
ALTER TABLE [dbo].[comment_table]  WITH CHECK ADD  CONSTRAINT [FK_comment_table_article_table] FOREIGN KEY([article_id])
REFERENCES [dbo].[article_table] ([article_id])
GO
ALTER TABLE [dbo].[comment_table] CHECK CONSTRAINT [FK_comment_table_article_table]
GO
ALTER TABLE [dbo].[comment_table]  WITH CHECK ADD  CONSTRAINT [FK_comment_table_visitor_table] FOREIGN KEY([visitor_id])
REFERENCES [dbo].[visitor_table] ([visitor_id])
GO
ALTER TABLE [dbo].[comment_table] CHECK CONSTRAINT [FK_comment_table_visitor_table]
GO
USE [master]
GO
ALTER DATABASE [Blogging_System] SET  READ_WRITE 
GO
