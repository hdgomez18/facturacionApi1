USE [master]
GO
/****** Object:  Database [facturacion]    Script Date: 02/06/2021 21:33:46 ******/
CREATE DATABASE [facturacion]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'facturacion', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.HGOMEZ\MSSQL\DATA\facturacion.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'facturacion_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.HGOMEZ\MSSQL\DATA\facturacion_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [facturacion] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [facturacion].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [facturacion] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [facturacion] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [facturacion] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [facturacion] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [facturacion] SET ARITHABORT OFF 
GO
ALTER DATABASE [facturacion] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [facturacion] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [facturacion] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [facturacion] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [facturacion] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [facturacion] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [facturacion] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [facturacion] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [facturacion] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [facturacion] SET  ENABLE_BROKER 
GO
ALTER DATABASE [facturacion] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [facturacion] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [facturacion] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [facturacion] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [facturacion] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [facturacion] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [facturacion] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [facturacion] SET RECOVERY FULL 
GO
ALTER DATABASE [facturacion] SET  MULTI_USER 
GO
ALTER DATABASE [facturacion] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [facturacion] SET DB_CHAINING OFF 
GO
ALTER DATABASE [facturacion] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [facturacion] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [facturacion] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'facturacion', N'ON'
GO
ALTER DATABASE [facturacion] SET QUERY_STORE = OFF
GO
USE [facturacion]
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 02/06/2021 21:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria](
	[id_categoria] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_categoria] PRIMARY KEY CLUSTERED 
(
	[id_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 02/06/2021 21:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
	[direccion] [varchar](100) NULL,
	[fecha_nacimiento] [date] NULL,
	[telefono] [varchar](50) NULL,
	[email] [varchar](50) NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle]    Script Date: 02/06/2021 21:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle](
	[num_detalle] [int] IDENTITY(1,1) NOT NULL,
	[id_factura] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[cantidad] [int] NULL,
	[precio] [decimal](18, 0) NULL,
 CONSTRAINT [PK_detalle] PRIMARY KEY CLUSTERED 
(
	[num_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[factura]    Script Date: 02/06/2021 21:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factura](
	[num_factura] [int] IDENTITY(1,1) NOT NULL,
	[id_cliente] [int] NOT NULL,
	[fecha] [date] NULL,
	[num_pago] [int] NOT NULL,
 CONSTRAINT [PK_factura] PRIMARY KEY CLUSTERED 
(
	[num_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[modo_pago]    Script Date: 02/06/2021 21:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modo_pago](
	[num_pago] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[otros_detalles] [varchar](50) NULL,
 CONSTRAINT [PK_modo_pago] PRIMARY KEY CLUSTERED 
(
	[num_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto]    Script Date: 02/06/2021 21:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto](
	[id_producto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[precio] [decimal](18, 0) NULL,
	[stock] [int] NULL,
	[id_categoria] [int] NOT NULL,
 CONSTRAINT [PK_producto] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[categoria] ON 
GO
INSERT [dbo].[categoria] ([id_categoria], [nombre], [descripcion]) VALUES (1, N'Tecno', N'tecnologia')
GO
INSERT [dbo].[categoria] ([id_categoria], [nombre], [descripcion]) VALUES (2, N'Comida', N'mercado')
GO
INSERT [dbo].[categoria] ([id_categoria], [nombre], [descripcion]) VALUES (3, N'Ropa', N'seccion ropa')
GO
SET IDENTITY_INSERT [dbo].[categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[cliente] ON 
GO
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fecha_nacimiento], [telefono], [email]) VALUES (1, N'Hernan', N'Gomez', N'cra 34 28-08', CAST(N'1982-01-18' AS Date), N'3002734695', N'hdgomez18@gmail.com')
GO
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fecha_nacimiento], [telefono], [email]) VALUES (2, N'Adriana', N'Hoyos', N'cra 82 15-03', CAST(N'1980-09-06' AS Date), N'3207467868', N'adrianahoyos@gmail.com')
GO
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fecha_nacimiento], [telefono], [email]) VALUES (3, N'Juan', N'Pena', N'cll 54 78-25', CAST(N'2011-04-28' AS Date), N'3505464544', N'juanpena@gmail.com')
GO
INSERT [dbo].[cliente] ([id_cliente], [nombre], [apellido], [direccion], [fecha_nacimiento], [telefono], [email]) VALUES (4, N'Jeronimo', N'Gomez', N'Diag 50 40-20', CAST(N'2015-05-02' AS Date), N'3130453578', N'jeronimog@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[detalle] ON 
GO
INSERT [dbo].[detalle] ([num_detalle], [id_factura], [id_producto], [cantidad], [precio]) VALUES (1, 1, 3, 5, CAST(200 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle] ([num_detalle], [id_factura], [id_producto], [cantidad], [precio]) VALUES (2, 2, 1, 4, CAST(5000 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle] ([num_detalle], [id_factura], [id_producto], [cantidad], [precio]) VALUES (3, 3, 2, 6, CAST(30000 AS Decimal(18, 0)))
GO
INSERT [dbo].[detalle] ([num_detalle], [id_factura], [id_producto], [cantidad], [precio]) VALUES (4, 5, 4, 12, CAST(45000 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[detalle] OFF
GO
SET IDENTITY_INSERT [dbo].[factura] ON 
GO
INSERT [dbo].[factura] ([num_factura], [id_cliente], [fecha], [num_pago]) VALUES (1, 1, CAST(N'2021-05-02' AS Date), 1)
GO
INSERT [dbo].[factura] ([num_factura], [id_cliente], [fecha], [num_pago]) VALUES (2, 2, CAST(N'2020-06-20' AS Date), 2)
GO
INSERT [dbo].[factura] ([num_factura], [id_cliente], [fecha], [num_pago]) VALUES (3, 1, CAST(N'2015-03-02' AS Date), 2)
GO
INSERT [dbo].[factura] ([num_factura], [id_cliente], [fecha], [num_pago]) VALUES (4, 3, CAST(N'2018-06-20' AS Date), 3)
GO
INSERT [dbo].[factura] ([num_factura], [id_cliente], [fecha], [num_pago]) VALUES (5, 3, CAST(N'2021-08-12' AS Date), 1)
GO
SET IDENTITY_INSERT [dbo].[factura] OFF
GO
SET IDENTITY_INSERT [dbo].[modo_pago] ON 
GO
INSERT [dbo].[modo_pago] ([num_pago], [nombre], [otros_detalles]) VALUES (1, N'efectivo', N'moneda local')
GO
INSERT [dbo].[modo_pago] ([num_pago], [nombre], [otros_detalles]) VALUES (2, N'tarjeta debito', NULL)
GO
INSERT [dbo].[modo_pago] ([num_pago], [nombre], [otros_detalles]) VALUES (3, N'tarjeta credito', N'')
GO
SET IDENTITY_INSERT [dbo].[modo_pago] OFF
GO
SET IDENTITY_INSERT [dbo].[producto] ON 
GO
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (1, N'Lenovo', CAST(2000 AS Decimal(18, 0)), 100, 1)
GO
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (2, N'Cereal', CAST(500 AS Decimal(18, 0)), 2000, 2)
GO
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (3, N'Salchichas', CAST(200 AS Decimal(18, 0)), 3000, 2)
GO
INSERT [dbo].[producto] ([id_producto], [nombre], [precio], [stock], [id_categoria]) VALUES (4, N'Pantalon', CAST(100 AS Decimal(18, 0)), 2000, 3)
GO
SET IDENTITY_INSERT [dbo].[producto] OFF
GO
ALTER TABLE [dbo].[detalle]  WITH CHECK ADD  CONSTRAINT [FK_detalle_factura] FOREIGN KEY([id_factura])
REFERENCES [dbo].[factura] ([num_factura])
GO
ALTER TABLE [dbo].[detalle] CHECK CONSTRAINT [FK_detalle_factura]
GO
ALTER TABLE [dbo].[detalle]  WITH CHECK ADD  CONSTRAINT [FK_detalle_producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[producto] ([id_producto])
GO
ALTER TABLE [dbo].[detalle] CHECK CONSTRAINT [FK_detalle_producto]
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD  CONSTRAINT [FK_factura_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[factura] CHECK CONSTRAINT [FK_factura_cliente]
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD  CONSTRAINT [FK_factura_modo_pago] FOREIGN KEY([num_pago])
REFERENCES [dbo].[modo_pago] ([num_pago])
GO
ALTER TABLE [dbo].[factura] CHECK CONSTRAINT [FK_factura_modo_pago]
GO
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [FK_producto_categoria] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[categoria] ([id_categoria])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [FK_producto_categoria]
GO
USE [master]
GO
ALTER DATABASE [facturacion] SET  READ_WRITE 
GO
