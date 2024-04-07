USE [master]
GO
/****** Object:  Database [gestionAlmacen]    Script Date: 7/4/2024 13:06:10 ******/
CREATE DATABASE [gestionAlmacen]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'gestionAlmacen', FILENAME = N'C:\SQLData\gestionAlmacen.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'gestionAlmacen_log', FILENAME = N'C:\SQLData\Logs\gestionAlmacen_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
ALTER DATABASE [gestionAlmacen] SET QUERY_STORE = ON
GO
ALTER DATABASE [gestionAlmacen] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/****** Object:  Login [SAVI5\ezequ]    Script Date: 7/4/2024 13:06:11 ******/
CREATE LOGIN [SAVI5\ezequ] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\Winmgmt]    Script Date: 7/4/2024 13:06:11 ******/
CREATE LOGIN [NT SERVICE\Winmgmt] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 7/4/2024 13:06:11 ******/
CREATE LOGIN [NT SERVICE\SQLWriter] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLTELEMETRY$SQLEXPRESS]    Script Date: 7/4/2024 13:06:11 ******/
CREATE LOGIN [NT SERVICE\SQLTELEMETRY$SQLEXPRESS] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT Service\MSSQL$SQLEXPRESS]    Script Date: 7/4/2024 13:06:11 ******/
CREATE LOGIN [NT Service\MSSQL$SQLEXPRESS] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT AUTHORITY\SYSTEM]    Script Date: 7/4/2024 13:06:11 ******/
CREATE LOGIN [NT AUTHORITY\SYSTEM] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [BUILTIN\Usuarios]    Script Date: 7/4/2024 13:06:11 ******/
CREATE LOGIN [BUILTIN\Usuarios] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 7/4/2024 13:06:11 ******/
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'I0mbh2h2LExlLqGtKCzA3gKloh5kVFVTSQhCJdHxjOc=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 7/4/2024 13:06:11 ******/
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'yZA42bNZ/tF4e9kR7Lf4BxpzMhfVs83M9EtWZpKNeRc=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [SAVI5\ezequ]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\Winmgmt]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLWriter]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT Service\MSSQL$SQLEXPRESS]
GO
USE [gestionAlmacen]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 7/4/2024 13:06:12 ******/
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
/****** Object:  Table [dbo].[Clientes]    Script Date: 7/4/2024 13:06:12 ******/
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
/****** Object:  Table [dbo].[Detalles_Venta]    Script Date: 7/4/2024 13:06:12 ******/
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
/****** Object:  Table [dbo].[Productos]    Script Date: 7/4/2024 13:06:12 ******/
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
/****** Object:  Table [dbo].[Proveedores]    Script Date: 7/4/2024 13:06:12 ******/
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
/****** Object:  Table [dbo].[Ventas]    Script Date: 7/4/2024 13:06:12 ******/
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
SET IDENTITY_INSERT [dbo].[Categorias] ON 
GO
INSERT [dbo].[Categorias] ([ID_Categoria], [Nombre], [Descripcion]) VALUES (7, N'Categoria Ejemplo', N'Descripción de la categoría')
GO
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 
GO
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Direccion], [Telefono], [CorreoElectronico]) VALUES (8, N'11', N'2025-06-06', N'1000', N'NoCompleta')
GO
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Direccion], [Telefono], [CorreoElectronico]) VALUES (10, N'leo', N'Lolo', N'76013988', N'estevensalmeron@gmail.com')
GO
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Direccion], [Telefono], [CorreoElectronico]) VALUES (11, N'8', N'2026-06-06', N'700', N'Comp')
GO
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Direccion], [Telefono], [CorreoElectronico]) VALUES (1011, N'leo', N'Lolo', N'76013988', N'estevensalmeron@gmail.com')
GO
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Direccion], [Telefono], [CorreoElectronico]) VALUES (1012, N'Cliente A', N'Calle Uno 456', N'111222333', N'clienteA@example.com')
GO
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Direccion], [Telefono], [CorreoElectronico]) VALUES (1013, N'Cliente A', N'Calle Uno 456', N'111222333', N'clienteA@example.com')
GO
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[Detalles_Venta] ON 
GO
INSERT [dbo].[Detalles_Venta] ([ID_Detalle], [ID_Venta], [ID_Producto], [Cantidad], [Precio_Unitario], [Subtotal], [Impuesto]) VALUES (4, 12, 11, 3, CAST(1000.00 AS Decimal(10, 2)), 2000.0000, 10.0000)
GO
SET IDENTITY_INSERT [dbo].[Detalles_Venta] OFF
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 
GO
INSERT [dbo].[Productos] ([ID_Producto], [Nombre], [Descripcion], [Precio], [Stock], [ID_Categoria], [ID_Proveedor]) VALUES (11, N'Producto Ejemplo', N'Descripción del producto', 100.0000, 10, 7, 7)
GO
INSERT [dbo].[Productos] ([ID_Producto], [Nombre], [Descripcion], [Precio], [Stock], [ID_Categoria], [ID_Proveedor]) VALUES (13, N'Laptop', N'Laptop de última generación', 1500.0000, 20, 7, 7)
GO
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
SET IDENTITY_INSERT [dbo].[Proveedores] ON 
GO
INSERT [dbo].[Proveedores] ([ID_Proveedor], [Nombre], [Direccion], [Telefono], [CorreoElectronico]) VALUES (7, N'Proveedor Ejemplo', N'Dirección del proveedor', N'123456789', N'proveedor@example.com')
GO
SET IDENTITY_INSERT [dbo].[Proveedores] OFF
GO
SET IDENTITY_INSERT [dbo].[Ventas] ON 
GO
INSERT [dbo].[Ventas] ([ID_Venta], [ID_Cliente], [Fecha], [Total], [EstadoVenta]) VALUES (12, 10, CAST(N'2025-04-06' AS Date), 600.0000, N'No')
GO
INSERT [dbo].[Ventas] ([ID_Venta], [ID_Cliente], [Fecha], [Total], [EstadoVenta]) VALUES (15, 8, CAST(N'2024-04-01' AS Date), 1600.0000, N'Completada')
GO
SET IDENTITY_INSERT [dbo].[Ventas] OFF
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
/****** Object:  StoredProcedure [dbo].[sp_Clientes_Delete]    Script Date: 7/4/2024 13:06:13 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Clientes_GetAll]    Script Date: 7/4/2024 13:06:13 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Clientes_GetById]    Script Date: 7/4/2024 13:06:13 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Clientes_Insert]    Script Date: 7/4/2024 13:06:13 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Clientes_Update]    Script Date: 7/4/2024 13:06:13 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DetallesVenta_Delete]    Script Date: 7/4/2024 13:06:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DetallesVenta_Delete]
(
    @ID_Detalle INT
)
AS
BEGIN
    DELETE FROM Detalles_Venta
    WHERE ID_Detalle = @ID_Detalle;
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_DetallesVenta_GetAll]    Script Date: 7/4/2024 13:06:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DetallesVenta_GetAll]
AS
BEGIN
    SELECT Detalles_Venta.ID_Detalle, Detalles_Venta.ID_Venta, Detalles_Venta.ID_Producto, Detalles_Venta.Cantidad, Detalles_Venta.Precio_Unitario, Detalles_Venta.Subtotal, Detalles_Venta.Impuesto
    FROM Detalles_Venta
	INNER JOIN Ventas ON Detalles_Venta.ID_Venta = Ventas.ID_Venta;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_DetallesVenta_GetByVentaID]    Script Date: 7/4/2024 13:06:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DetallesVenta_GetByVentaID] (@ID_Detalle INT)
AS
BEGIN
    SELECT ID_Detalle, ID_Venta, ID_Producto, Cantidad, Precio_Unitario, Subtotal, Impuesto
    FROM Detalles_Venta
    WHERE ID_Detalle = @ID_Detalle;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_DetallesVenta_Insert]    Script Date: 7/4/2024 13:06:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DetallesVenta_Insert] 
(
    @ID_Venta INT,
    @ID_Producto INT,
    @Cantidad INT,
    @Precio_Unitario DECIMAL(10, 2),
    @Subtotal MONEY,
    @Impuesto MONEY
)
AS
BEGIN
    INSERT INTO Detalles_Venta (ID_Venta, ID_Producto, Cantidad, Precio_Unitario, Subtotal, Impuesto)
    VALUES (@ID_Venta, @ID_Producto, @Cantidad, @Precio_Unitario, @Subtotal, @Impuesto);
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_DetallesVenta_Update]    Script Date: 7/4/2024 13:06:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DetallesVenta_Update] 
(
    @ID_Detalle INT,
    @ID_Venta INT,
    @ID_Producto INT,
    @Cantidad INT,
    @Precio_Unitario DECIMAL(10, 2),
    @Subtotal MONEY,
    @Impuesto MONEY
)
AS
BEGIN
    UPDATE Detalles_Venta
    SET ID_Venta = @ID_Venta, ID_Producto = @ID_Producto, Cantidad = @Cantidad, Precio_Unitario = @Precio_Unitario, Subtotal = @Subtotal, Impuesto = @Impuesto
    WHERE ID_Detalle = @ID_Detalle;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_Ventas_Delete]    Script Date: 7/4/2024 13:06:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_Ventas_Delete]
(
@ID_Venta int
)
as
begin
	delete from Ventas
	where ID_Venta = @ID_Venta;
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_Ventas_GetAll]    Script Date: 7/4/2024 13:06:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_Ventas_GetAll]
as
begin
	select Ventas.ID_Venta, Ventas.Fecha, Ventas.Total, Ventas.EstadoVenta, Clientes.Nombre
	from Ventas
	inner join Clientes
	on Ventas.ID_Cliente = Clientes.ID_Cliente
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_Ventas_GetById]    Script Date: 7/4/2024 13:06:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_Ventas_GetById] (@ID_Venta int)
as
begin
	Select ID_Venta, ID_Cliente, Fecha, Total, EstadoVenta
	from Ventas
	where ID_Venta = @ID_Venta
end;

GO
/****** Object:  StoredProcedure [dbo].[sp_Ventas_Insert]    Script Date: 7/4/2024 13:06:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_Ventas_Insert] 
(
@ID_Cliente int, @Fecha date,
@Total money, @EstadoVenta nvarchar(50)
)
as
begin
	insert into dbo.Ventas
	values (@ID_Cliente, @Fecha, @Total, @EstadoVenta)
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_Ventas_Update]    Script Date: 7/4/2024 13:06:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_Ventas_Update] 
(
@ID_Venta int , @ID_Cliente int,
@Fecha date,@Total money, @EstadoVenta nvarchar(50) 
)
as
begin
	update dbo.Ventas
	set @ID_Cliente = ID_Cliente,  Fecha = @Fecha, Total = @Total, EstadoVenta = @EstadoVenta
	where ID_Venta = @ID_Venta
end;
GO
USE [master]
GO
ALTER DATABASE [gestionAlmacen] SET  READ_WRITE 
GO
