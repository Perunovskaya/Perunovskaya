USE [master]
GO
/****** Object:  Database [Deanery]    Script Date: 14.04.2020 17:06:24 ******/
CREATE DATABASE [Deanery]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DataBase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DataBase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DataBase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DataBase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Deanery] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Deanery].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Deanery] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Deanery] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Deanery] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Deanery] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Deanery] SET ARITHABORT OFF 
GO
ALTER DATABASE [Deanery] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Deanery] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Deanery] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Deanery] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Deanery] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Deanery] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Deanery] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Deanery] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Deanery] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Deanery] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Deanery] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Deanery] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Deanery] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Deanery] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Deanery] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Deanery] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Deanery] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Deanery] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Deanery] SET  MULTI_USER 
GO
ALTER DATABASE [Deanery] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Deanery] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Deanery] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Deanery] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Deanery] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Deanery] SET QUERY_STORE = OFF
GO
USE [Deanery]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 14.04.2020 17:06:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[№ Кафедры] [int] NOT NULL,
	[Название] [nvarchar](50) NOT NULL,
	[Телефон] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[№ Кафедры] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marks]    Script Date: 14.04.2020 17:06:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marks](
	[Оценка] [int] NOT NULL,
	[Нижняя граница] [int] NOT NULL,
	[Верхняя граница] [int] NOT NULL,
 CONSTRAINT [PK_Marks] PRIMARY KEY CLUSTERED 
(
	[Оценка] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Results]    Script Date: 14.04.2020 17:06:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Results](
	[№ Преподавателя] [int] NOT NULL,
	[№ Группы] [nvarchar](50) NOT NULL,
	[№ Студента] [int] NOT NULL,
	[№ Семестра] [int] NOT NULL,
	[№ Дисциплины] [int] NOT NULL,
	[Баллы] [int] NOT NULL,
	[Дата сдачи] [datetime] NOT NULL,
	[Оценка] [time](7) NOT NULL,
 CONSTRAINT [PK_Results] PRIMARY KEY CLUSTERED 
(
	[№ Преподавателя] ASC,
	[№ Группы] ASC,
	[№ Студента] ASC,
	[№ Семестра] ASC,
	[№ Дисциплины] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sessions]    Script Date: 14.04.2020 17:06:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sessions](
	[№ Группы] [nvarchar](10) NOT NULL,
	[№ Семестра] [int] NOT NULL,
	[№ Дисциплины] [int] NOT NULL,
	[Отчетность] [nvarchar](7) NOT NULL,
	[№ Преподавателя] [int] NOT NULL,
 CONSTRAINT [PK_Sessions] PRIMARY KEY CLUSTERED 
(
	[№ Группы] ASC,
	[№ Семестра] ASC,
	[№ Дисциплины] ASC,
	[№ Преподавателя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 14.04.2020 17:06:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[№ Зачетной книжки] [int] NOT NULL,
	[ФИО студента] [nvarchar](50) NOT NULL,
	[№ Группы] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[№ Зачетной книжки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 14.04.2020 17:06:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[№ Дисциплина] [int] NOT NULL,
	[Название] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Subjects] PRIMARY KEY CLUSTERED 
(
	[№ Дисциплина] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 14.04.2020 17:06:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[№ Преподавателя] [int] NOT NULL,
	[ФИО] [nvarchar](50) NOT NULL,
	[Должность] [nvarchar](50) NOT NULL,
	[№ Кафедры] [int] NOT NULL,
 CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED 
(
	[№ Преподавателя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Results]  WITH CHECK ADD  CONSTRAINT [FK_Results_Student] FOREIGN KEY([№ Студента])
REFERENCES [dbo].[Student] ([№ Зачетной книжки])
GO
ALTER TABLE [dbo].[Results] CHECK CONSTRAINT [FK_Results_Student]
GO
ALTER TABLE [dbo].[Results]  WITH CHECK ADD  CONSTRAINT [FK_Results_Teachers] FOREIGN KEY([№ Преподавателя])
REFERENCES [dbo].[Teachers] ([№ Преподавателя])
GO
ALTER TABLE [dbo].[Results] CHECK CONSTRAINT [FK_Results_Teachers]
GO
ALTER TABLE [dbo].[Sessions]  WITH CHECK ADD  CONSTRAINT [FK_Sessions_Subjects] FOREIGN KEY([№ Дисциплины])
REFERENCES [dbo].[Subjects] ([№ Дисциплина])
GO
ALTER TABLE [dbo].[Sessions] CHECK CONSTRAINT [FK_Sessions_Subjects]
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD  CONSTRAINT [FK_Teachers_Departments] FOREIGN KEY([№ Кафедры])
REFERENCES [dbo].[Departments] ([№ Кафедры])
GO
ALTER TABLE [dbo].[Teachers] CHECK CONSTRAINT [FK_Teachers_Departments]
GO
USE [master]
GO
ALTER DATABASE [Deanery] SET  READ_WRITE 
GO
