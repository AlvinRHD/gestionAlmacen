
/****** Object:  Database [gestionAlmacen]    Script Date: 05/04/2024 15:58:57 ******/
CREATE DATABASE [gestionAlmacen]
USE gestionAlmacen
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'gestionAlmacen', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.U20210358\MSSQL\DATA\gestionAlmacen.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'gestionAlmacen_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.U20210358\MSSQL\DATA\gestionAlmacen_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [gestionAlmacen] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [gestionAlmacen].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [gestionAlmacen] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [gestionAlmacen] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [gestionAlmacen] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [gestionAlmacen] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [gestionAlmacen] SET ARITHABORT OFF 
GO
ALTER DATABASE [gestionAlmacen] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [gestionAlmacen] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [gestionAlmacen] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [gestionAlmacen] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [gestionAlmacen] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [gestionAlmacen] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [gestionAlmacen] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [gestionAlmacen] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [gestionAlmacen] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [gestionAlmacen] SET  ENABLE_BROKER 
GO
ALTER DATABASE [gestionAlmacen] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [gestionAlmacen] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [gestionAlmacen] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [gestionAlmacen] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [gestionAlmacen] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [gestionAlmacen] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [gestionAlmacen] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [gestionAlmacen] SET RECOVERY FULL 
GO
ALTER DATABASE [gestionAlmacen] SET  MULTI_USER 
GO
ALTER DATABASE [gestionAlmacen] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [gestionAlmacen] SET DB_CHAINING OFF 
GO
ALTER DATABASE [gestionAlmacen] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [gestionAlmacen] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [gestionAlmacen] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [gestionAlmacen] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'gestionAlmacen', N'ON'
GO
ALTER DATABASE [gestionAlmacen] SET QUERY_STORE = ON
GO
ALTER DATABASE [gestionAlmacen] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [gestionAlmacen]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 05/04/2024 15:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[ID_Categoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NULL,
	[Descripcion] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 05/04/2024 15:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[ID_Cliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NULL,
	[Direccion] [nvarchar](255) NULL,
	[Telefono] [nvarchar](20) NULL,
	[CorreoElectronico] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalles_Venta]    Script Date: 05/04/2024 15:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalles_Venta](
	[ID_Detalle] [int] IDENTITY(1,1) NOT NULL,
	[ID_Venta] [int] NULL,
	[ID_Producto] [int] NULL,
	[Cantidad] [int] NULL,
	[Precio_Unitario] [decimal](10, 2) NULL,
	[Subtotal] [money] NULL,
	[Impuesto] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 05/04/2024 15:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[ID_Producto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NULL,
	[Descripcion] [nvarchar](255) NULL,
	[Precio] [money] NULL,
	[Stock] [int] NULL,
	[ID_Categoria] [int] NULL,
	[ID_Proveedor] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 05/04/2024 15:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[ID_Proveedor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NULL,
	[Direccion] [nvarchar](255) NULL,
	[Telefono] [nvarchar](20) NULL,
	[CorreoElectronico] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 05/04/2024 15:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[ID_Venta] [int] IDENTITY(1,1) NOT NULL,
	[ID_Cliente] [int] NULL,
	[Fecha] [date] NULL,
	[Total] [money] NULL,
	[EstadoVenta] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Detalles_Venta]  WITH CHECK ADD FOREIGN KEY([ID_Producto])
REFERENCES [dbo].[Productos] ([ID_Producto])
GO
ALTER TABLE [dbo].[Detalles_Venta]  WITH CHECK ADD FOREIGN KEY([ID_Venta])
REFERENCES [dbo].[Ventas] ([ID_Venta])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD FOREIGN KEY([ID_Categoria])
REFERENCES [dbo].[Categorias] ([ID_Categoria])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD FOREIGN KEY([ID_Proveedor])
REFERENCES [dbo].[Proveedores] ([ID_Proveedor])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD FOREIGN KEY([ID_Cliente])
REFERENCES [dbo].[Clientes] ([ID_Cliente])
ON DELETE CASCADE
GO
/****** Object:  StoredProcedure [dbo].[sp_Clientes_Delete]    Script Date: 05/04/2024 15:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_Clientes_Delete]
(
@ID_Cliente int
)
as
begin
	delete from Clientes where ID_Cliente = @ID_Cliente;
end;

GO
/****** Object:  StoredProcedure [dbo].[sp_Clientes_GetAll]    Script Date: 05/04/2024 15:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_Clientes_GetAll]
as
begin
	select ID_Cliente, Nombre, Direccion, Telefono, CorreoElectronico from Clientes
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_Clientes_GetById]    Script Date: 05/04/2024 15:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_Clientes_GetById] (@ID_Cliente int)
as
begin
	Select ID_Cliente, Nombre, Direccion, Telefono, CorreoElectronico
	from Clientes
	where ID_Cliente = @ID_Cliente
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_Clientes_Insert]    Script Date: 05/04/2024 15:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE procedure [dbo].[sp_Clientes_Insert] (@Nombre nvarchar(100), @Direccion nvarchar(255),
@Telefono nvarchar(20),@CorreoElectronico nvarchar(100))
as
begin
	insert into dbo.Clientes
	values (@Nombre, @Direccion, @Telefono, @CorreoElectronico)
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_Clientes_Update]    Script Date: 05/04/2024 15:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_Clientes_Update] (@Nombre nvarchar(100), @Direccion nvarchar(255),
@Telefono nvarchar(20), @CorreoElectronico nvarchar(100), @ID_Cliente int )
as
begin
	update dbo.Clientes
	set Nombre = @Nombre , Direccion = @Direccion, Telefono = @Telefono, CorreoElectronico = @CorreoElectronico
	where ID_Cliente = @ID_Cliente
end;

GO
USE [master]
GO
ALTER DATABASE [gestionAlmacen] SET  READ_WRITE 
GO
