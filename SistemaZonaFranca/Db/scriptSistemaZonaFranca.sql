USE [master]
GO
/****** Object:  Database [sistemaZonaFranca]    Script Date: 11/17/2022 10:52:39 AM ******/
CREATE DATABASE [sistemaZonaFranca]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'sistemaZonaFranca', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\sistemaZonaFranca.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'sistemaZonaFranca_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\sistemaZonaFranca_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [sistemaZonaFranca] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sistemaZonaFranca].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [sistemaZonaFranca] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sistemaZonaFranca] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sistemaZonaFranca] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sistemaZonaFranca] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sistemaZonaFranca] SET ARITHABORT OFF 
GO
ALTER DATABASE [sistemaZonaFranca] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [sistemaZonaFranca] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sistemaZonaFranca] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sistemaZonaFranca] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sistemaZonaFranca] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [sistemaZonaFranca] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sistemaZonaFranca] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sistemaZonaFranca] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sistemaZonaFranca] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sistemaZonaFranca] SET  ENABLE_BROKER 
GO
ALTER DATABASE [sistemaZonaFranca] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sistemaZonaFranca] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [sistemaZonaFranca] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [sistemaZonaFranca] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [sistemaZonaFranca] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sistemaZonaFranca] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [sistemaZonaFranca] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [sistemaZonaFranca] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [sistemaZonaFranca] SET  MULTI_USER 
GO
ALTER DATABASE [sistemaZonaFranca] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [sistemaZonaFranca] SET DB_CHAINING OFF 
GO
ALTER DATABASE [sistemaZonaFranca] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [sistemaZonaFranca] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [sistemaZonaFranca] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [sistemaZonaFranca] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [sistemaZonaFranca] SET QUERY_STORE = OFF
GO
USE [sistemaZonaFranca]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11/17/2022 10:52:39 AM ******/
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
/****** Object:  Table [dbo].[Ciudades]    Script Date: 11/17/2022 10:52:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ciudades](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](30) NOT NULL,
	[PaisId] [int] NOT NULL,
 CONSTRAINT [PK_Ciudades] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 11/17/2022 10:52:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PersonaId] [nvarchar](50) NOT NULL,
	[Cargo] [nvarchar](50) NOT NULL,
	[Salario] [money] NOT NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Envios]    Script Date: 11/17/2022 10:52:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Envios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FacturaId] [int] NOT NULL,
	[CiudadOrigenId] [int] NOT NULL,
	[DireccionOrigen] [nvarchar](50) NOT NULL,
	[CiudadDestinoId] [int] NOT NULL,
	[DireccionDestino] [nvarchar](50) NOT NULL,
	[FechaEntrega] [datetime2](7) NOT NULL,
	[Estado] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Envios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacturaDetalles]    Script Date: 11/17/2022 10:52:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacturaDetalles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FacturaId] [int] NOT NULL,
	[InventarioId] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[SubTotal] [money] NOT NULL,
 CONSTRAINT [PK_FacturaDetalles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facturas]    Script Date: 11/17/2022 10:52:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PersonaId] [nvarchar](50) NOT NULL,
	[Estado] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Facturas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventarios]    Script Date: 11/17/2022 10:52:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Descripcion] [nvarchar](150) NOT NULL,
	[Stock] [int] NOT NULL,
	[Precio] [money] NOT NULL,
 CONSTRAINT [PK_Inventarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paises]    Script Date: 11/17/2022 10:52:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paises](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Paises] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personas]    Script Date: 11/17/2022 10:52:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personas](
	[Cedula] [nvarchar](50) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Apellido] [nvarchar](50) NOT NULL,
	[Telefono] [nvarchar](max) NOT NULL,
	[Edad] [int] NOT NULL,
 CONSTRAINT [PK_Personas] PRIMARY KEY CLUSTERED 
(
	[Cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_Ciudades_PaisId]    Script Date: 11/17/2022 10:52:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_Ciudades_PaisId] ON [dbo].[Ciudades]
(
	[PaisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Empleados_PersonaId]    Script Date: 11/17/2022 10:52:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_Empleados_PersonaId] ON [dbo].[Empleados]
(
	[PersonaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Envios_CiudadDestinoId]    Script Date: 11/17/2022 10:52:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_Envios_CiudadDestinoId] ON [dbo].[Envios]
(
	[CiudadDestinoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Envios_CiudadOrigenId]    Script Date: 11/17/2022 10:52:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_Envios_CiudadOrigenId] ON [dbo].[Envios]
(
	[CiudadOrigenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Envios_FacturaId]    Script Date: 11/17/2022 10:52:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_Envios_FacturaId] ON [dbo].[Envios]
(
	[FacturaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FacturaDetalles_FacturaId]    Script Date: 11/17/2022 10:52:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_FacturaDetalles_FacturaId] ON [dbo].[FacturaDetalles]
(
	[FacturaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FacturaDetalles_InventarioId]    Script Date: 11/17/2022 10:52:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_FacturaDetalles_InventarioId] ON [dbo].[FacturaDetalles]
(
	[InventarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Facturas_PersonaId]    Script Date: 11/17/2022 10:52:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_Facturas_PersonaId] ON [dbo].[Facturas]
(
	[PersonaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ciudades]  WITH CHECK ADD  CONSTRAINT [FK_Ciudades_Paises_PaisId] FOREIGN KEY([PaisId])
REFERENCES [dbo].[Paises] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ciudades] CHECK CONSTRAINT [FK_Ciudades_Paises_PaisId]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_Personas_PersonaId] FOREIGN KEY([PersonaId])
REFERENCES [dbo].[Personas] ([Cedula])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Empleados_Personas_PersonaId]
GO
ALTER TABLE [dbo].[Envios]  WITH CHECK ADD  CONSTRAINT [FK_Envios_Ciudades_CiudadDestinoId] FOREIGN KEY([CiudadDestinoId])
REFERENCES [dbo].[Ciudades] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Envios] CHECK CONSTRAINT [FK_Envios_Ciudades_CiudadDestinoId]
GO
ALTER TABLE [dbo].[Envios]  WITH CHECK ADD  CONSTRAINT [FK_Envios_Ciudades_CiudadOrigenId] FOREIGN KEY([CiudadOrigenId])
REFERENCES [dbo].[Ciudades] ([Id])
GO
ALTER TABLE [dbo].[Envios] CHECK CONSTRAINT [FK_Envios_Ciudades_CiudadOrigenId]
GO
ALTER TABLE [dbo].[Envios]  WITH CHECK ADD  CONSTRAINT [FK_Envios_Facturas_FacturaId] FOREIGN KEY([FacturaId])
REFERENCES [dbo].[Facturas] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Envios] CHECK CONSTRAINT [FK_Envios_Facturas_FacturaId]
GO
ALTER TABLE [dbo].[FacturaDetalles]  WITH CHECK ADD  CONSTRAINT [FK_FacturaDetalles_Facturas_FacturaId] FOREIGN KEY([FacturaId])
REFERENCES [dbo].[Facturas] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FacturaDetalles] CHECK CONSTRAINT [FK_FacturaDetalles_Facturas_FacturaId]
GO
ALTER TABLE [dbo].[FacturaDetalles]  WITH CHECK ADD  CONSTRAINT [FK_FacturaDetalles_Inventarios_InventarioId] FOREIGN KEY([InventarioId])
REFERENCES [dbo].[Inventarios] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FacturaDetalles] CHECK CONSTRAINT [FK_FacturaDetalles_Inventarios_InventarioId]
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD  CONSTRAINT [FK_Facturas_Personas_PersonaId] FOREIGN KEY([PersonaId])
REFERENCES [dbo].[Personas] ([Cedula])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Facturas] CHECK CONSTRAINT [FK_Facturas_Personas_PersonaId]
GO
USE [master]
GO
ALTER DATABASE [sistemaZonaFranca] SET  READ_WRITE 
GO
