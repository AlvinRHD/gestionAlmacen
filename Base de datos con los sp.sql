USE [master]
GO
/****** Object:  Database [gestionAlmacen]    Script Date: 9/4/2024 14:00:39 ******/
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
USE [gestionAlmacen]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 9/4/2024 14:00:39 ******/
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
/****** Object:  Table [dbo].[Clientes]    Script Date: 9/4/2024 14:00:39 ******/
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
/****** Object:  Table [dbo].[Detalles_Venta]    Script Date: 9/4/2024 14:00:39 ******/
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
/****** Object:  Table [dbo].[Productos]    Script Date: 9/4/2024 14:00:39 ******/
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
/****** Object:  Table [dbo].[Proveedores]    Script Date: 9/4/2024 14:00:39 ******/
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
/****** Object:  Table [dbo].[Ventas]    Script Date: 9/4/2024 14:00:39 ******/
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

INSERT [dbo].[Categorias] ([ID_Categoria], [Nombre], [Descripcion]) VALUES (1, N'Electrónicos', N'Productos electrónicos de consumo')
INSERT [dbo].[Categorias] ([ID_Categoria], [Nombre], [Descripcion]) VALUES (2, N'Ropa', N'Prendas de vestir')
INSERT [dbo].[Categorias] ([ID_Categoria], [Nombre], [Descripcion]) VALUES (3, N'Hogar', N'Artículos para el hogar')
INSERT [dbo].[Categorias] ([ID_Categoria], [Nombre], [Descripcion]) VALUES (4, N'Alimentos', N'Productos alimenticios')
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Direccion], [Telefono], [CorreoElectronico]) VALUES (1, N'Juan Pérez', N'Calle Principal 123', N'123456789', N'juan@example.com')
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Direccion], [Telefono], [CorreoElectronico]) VALUES (2, N'María García', N'Avenida Central 456', N'987654321', N'maria@example.com')
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Direccion], [Telefono], [CorreoElectronico]) VALUES (3, N'Carlos Rodríguez', N'Calle Secundaria 789', N'555555555', N'carlos@example.com')
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Direccion], [Telefono], [CorreoElectronico]) VALUES (4, N'Ana López', N'Boulevard Norte 1010', N'333333333', N'ana@example.com')
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[Detalles_Venta] ON 

INSERT [dbo].[Detalles_Venta] ([ID_Detalle], [ID_Venta], [ID_Producto], [Cantidad], [Precio_Unitario], [Subtotal], [Impuesto]) VALUES (1, 1, 1, 2, CAST(10.50 AS Decimal(10, 2)), 21.0000, 2.1000)
INSERT [dbo].[Detalles_Venta] ([ID_Detalle], [ID_Venta], [ID_Producto], [Cantidad], [Precio_Unitario], [Subtotal], [Impuesto]) VALUES (2, 1, 3, 1, CAST(15.75 AS Decimal(10, 2)), 15.7500, 1.5700)
INSERT [dbo].[Detalles_Venta] ([ID_Detalle], [ID_Venta], [ID_Producto], [Cantidad], [Precio_Unitario], [Subtotal], [Impuesto]) VALUES (3, 2, 2, 3, CAST(8.25 AS Decimal(10, 2)), 24.7500, 2.4800)
INSERT [dbo].[Detalles_Venta] ([ID_Detalle], [ID_Venta], [ID_Producto], [Cantidad], [Precio_Unitario], [Subtotal], [Impuesto]) VALUES (4, 2, 4, 2, CAST(12.40 AS Decimal(10, 2)), 24.8000, 2.4800)
SET IDENTITY_INSERT [dbo].[Detalles_Venta] OFF
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([ID_Producto], [Nombre], [Descripcion], [Precio], [Stock], [ID_Categoria], [ID_Proveedor]) VALUES (1, N'Televisor LED', N'Televisor LED de 55 pulgadas', 799.9900, 50, 1, 1)
INSERT [dbo].[Productos] ([ID_Producto], [Nombre], [Descripcion], [Precio], [Stock], [ID_Categoria], [ID_Proveedor]) VALUES (2, N'Camiseta', N'Camiseta de algodón de color blanco', 19.9900, 100, 2, 2)
INSERT [dbo].[Productos] ([ID_Producto], [Nombre], [Descripcion], [Precio], [Stock], [ID_Categoria], [ID_Proveedor]) VALUES (3, N'Sartén', N'Sartén antiadherente de 24 cm', 29.9900, 75, 3, 3)
INSERT [dbo].[Productos] ([ID_Producto], [Nombre], [Descripcion], [Precio], [Stock], [ID_Categoria], [ID_Proveedor]) VALUES (4, N'Arroz', N'Arroz blanco de grano largo', 5.9900, 200, 4, 4)
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
SET IDENTITY_INSERT [dbo].[Proveedores] ON 

INSERT [dbo].[Proveedores] ([ID_Proveedor], [Nombre], [Direccion], [Telefono], [CorreoElectronico]) VALUES (1, N'Proveedor A', N'Calle Uno 123', N'111222333', N'proveedorA@example.com')
INSERT [dbo].[Proveedores] ([ID_Proveedor], [Nombre], [Direccion], [Telefono], [CorreoElectronico]) VALUES (2, N'Proveedor B', N'Avenida Dos 456', N'444555666', N'proveedorB@example.com')
INSERT [dbo].[Proveedores] ([ID_Proveedor], [Nombre], [Direccion], [Telefono], [CorreoElectronico]) VALUES (3, N'Proveedor C', N'Boulevard Tres 789', N'777888999', N'proveedorC@example.com')
INSERT [dbo].[Proveedores] ([ID_Proveedor], [Nombre], [Direccion], [Telefono], [CorreoElectronico]) VALUES (4, N'Proveedor D', N'Calle Cuatro 1010', N'123456789', N'proveedorD@example.com')
INSERT [dbo].[Proveedores] ([ID_Proveedor], [Nombre], [Direccion], [Telefono], [CorreoElectronico]) VALUES (5, N'Proveedor E', N'Avenida Cinco 2020', N'987654321', N'proveedorE@example.com')
SET IDENTITY_INSERT [dbo].[Proveedores] OFF
GO
SET IDENTITY_INSERT [dbo].[Ventas] ON 

INSERT [dbo].[Ventas] ([ID_Venta], [ID_Cliente], [Fecha], [Total], [EstadoVenta]) VALUES (1, 1, CAST(N'2024-04-09' AS Date), 150.0000, N'Completada')
INSERT [dbo].[Ventas] ([ID_Venta], [ID_Cliente], [Fecha], [Total], [EstadoVenta]) VALUES (2, 2, CAST(N'2024-04-08' AS Date), 300.0000, N'Pendiente')
INSERT [dbo].[Ventas] ([ID_Venta], [ID_Cliente], [Fecha], [Total], [EstadoVenta]) VALUES (3, 3, CAST(N'2024-04-07' AS Date), 75.0000, N'Completada')
INSERT [dbo].[Ventas] ([ID_Venta], [ID_Cliente], [Fecha], [Total], [EstadoVenta]) VALUES (4, 4, CAST(N'2024-04-06' AS Date), 200.0000, N'Completada')
SET IDENTITY_INSERT [dbo].[Ventas] OFF
GO
ALTER TABLE [dbo].[Detalles_Venta]  WITH CHECK ADD FOREIGN KEY([ID_Producto])
REFERENCES [dbo].[Productos] ([ID_Producto])
GO
ALTER TABLE [dbo].[Detalles_Venta]  WITH CHECK ADD FOREIGN KEY([ID_Venta])
REFERENCES [dbo].[Ventas] ([ID_Venta])
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD FOREIGN KEY([ID_Categoria])
REFERENCES [dbo].[Categorias] ([ID_Categoria])
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD FOREIGN KEY([ID_Proveedor])
REFERENCES [dbo].[Proveedores] ([ID_Proveedor])
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD FOREIGN KEY([ID_Cliente])
REFERENCES [dbo].[Clientes] ([ID_Cliente])
GO
/****** Object:  StoredProcedure [dbo].[sp_Categorias_Delete]    Script Date: 9/4/2024 14:00:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Categorias_Delete]
(
    @ID_Categoria int
)
AS
BEGIN
    DELETE FROM Categorias
    WHERE ID_Categoria = @ID_Categoria;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_Categorias_GetAll]    Script Date: 9/4/2024 14:00:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Categorias_GetAll]
AS
BEGIN
    SELECT ID_Categoria, Nombre, Descripcion
    FROM Categorias;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_Categorias_GetById]    Script Date: 9/4/2024 14:00:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Categorias_GetById]
(
    @ID_Categoria int
)
AS
BEGIN
    SELECT ID_Categoria, Nombre, Descripcion
    FROM Categorias
    WHERE ID_Categoria = @ID_Categoria;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_Categorias_Insert]    Script Date: 9/4/2024 14:00:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Categorias_Insert]
(
    @Nombre nvarchar(100),
    @Descripcion nvarchar(255)
)
AS
BEGIN
    INSERT INTO dbo.Categorias (Nombre, Descripcion)
    VALUES (@Nombre, @Descripcion);
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_Categorias_Update]    Script Date: 9/4/2024 14:00:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Categorias_Update]
(
    @ID_Categoria int,
    @Nombre nvarchar(100),
    @Descripcion nvarchar(255)
)
AS
BEGIN
    UPDATE dbo.Categorias
    SET Nombre = @Nombre, Descripcion = @Descripcion
    WHERE ID_Categoria = @ID_Categoria;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_Clientes_Delete]    Script Date: 9/4/2024 14:00:39 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Clientes_GetAll]    Script Date: 9/4/2024 14:00:39 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Clientes_GetById]    Script Date: 9/4/2024 14:00:39 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Clientes_Insert]    Script Date: 9/4/2024 14:00:39 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Clientes_Update]    Script Date: 9/4/2024 14:00:39 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DetallesVenta_Delete]    Script Date: 9/4/2024 14:00:39 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DetallesVenta_GetAll]    Script Date: 9/4/2024 14:00:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_DetallesVenta_GetAll]
AS
BEGIN
    SELECT Detalles_Venta.ID_Detalle, Detalles_Venta.ID_Venta, Productos.ID_Producto, Detalles_Venta.Cantidad, Detalles_Venta.Precio_Unitario, Detalles_Venta.Subtotal, Detalles_Venta.Impuesto, Productos.Nombre
    FROM Detalles_Venta
	INNER JOIN Productos
	ON Detalles_Venta.ID_Producto = Productos.ID_Producto
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_DetallesVenta_GetByVentaID]    Script Date: 9/4/2024 14:00:39 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DetallesVenta_Insert]    Script Date: 9/4/2024 14:00:39 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DetallesVenta_Update]    Script Date: 9/4/2024 14:00:39 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Productos_Delete]    Script Date: 9/4/2024 14:00:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Productos_Delete]
(
    @ID_Producto INT
)
AS
BEGIN
    DELETE FROM Productos
    WHERE ID_Producto = @ID_Producto;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_Productos_GetAll]    Script Date: 9/4/2024 14:00:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Productos_GetAll]
AS
BEGIN
    SELECT ID_Producto, Nombre, Descripcion, Precio, Stock, ID_Categoria, ID_Proveedor
    FROM Productos;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_Productos_GetById]    Script Date: 9/4/2024 14:00:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Productos_GetById] (@ID_Producto INT)
AS
BEGIN
    SELECT ID_Producto, Nombre, Descripcion, Precio, Stock, ID_Categoria, ID_Proveedor
    FROM Productos
    WHERE ID_Producto = @ID_Producto;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_Productos_Insert]    Script Date: 9/4/2024 14:00:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Productos_Insert] 
(
    @Nombre NVARCHAR(100),
    @Descripcion NVARCHAR(255),
    @Precio MONEY,
    @Stock INT,
    @ID_Categoria INT,
    @ID_Proveedor INT
)
AS
BEGIN
    INSERT INTO Productos (Nombre, Descripcion, Precio, Stock, ID_Categoria, ID_Proveedor)
    VALUES (@Nombre, @Descripcion, @Precio, @Stock, @ID_Categoria, @ID_Proveedor);
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_Productos_Update]    Script Date: 9/4/2024 14:00:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Productos_Update]
(
    @ID_Producto INT,
    @Nombre NVARCHAR(100),
    @Descripcion NVARCHAR(255),
    @Precio MONEY,
    @Stock INT,
    @ID_Categoria INT,
    @ID_Proveedor INT
)
AS
BEGIN
    UPDATE Productos
    SET Nombre = @Nombre, Descripcion = @Descripcion, Precio = @Precio, Stock = @Stock, ID_Categoria = @ID_Categoria, ID_Proveedor = @ID_Proveedor
    WHERE ID_Producto = @ID_Producto;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_Proveedores_Delete]    Script Date: 9/4/2024 14:00:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Proveedores_Delete]
(
    @ID_Proveedor int
)
AS
BEGIN
    DELETE FROM Proveedores
    WHERE ID_Proveedor = @ID_Proveedor;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_Proveedores_GetAll]    Script Date: 9/4/2024 14:00:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Proveedores_GetAll]
AS
BEGIN
    SELECT ID_Proveedor, Nombre, Direccion, Telefono, CorreoElectronico
    FROM Proveedores;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_Proveedores_GetById]    Script Date: 9/4/2024 14:00:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Proveedores_GetById]
(
    @ID_Proveedor int
)
AS
BEGIN
    SELECT ID_Proveedor, Nombre, Direccion, Telefono, CorreoElectronico
    FROM Proveedores
    WHERE ID_Proveedor = @ID_Proveedor;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_Proveedores_Insert]    Script Date: 9/4/2024 14:00:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Proveedores_Insert]
(
    @Nombre nvarchar(100),
    @Direccion nvarchar(255),
    @Telefono nvarchar(20),
    @CorreoElectronico nvarchar(100)
)
AS
BEGIN
    INSERT INTO dbo.Proveedores (Nombre, Direccion, Telefono, CorreoElectronico)
    VALUES (@Nombre, @Direccion, @Telefono, @CorreoElectronico);
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_Proveedores_Update]    Script Date: 9/4/2024 14:00:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Proveedores_Update]
(
    @ID_Proveedor int,
    @Nombre nvarchar(100),
    @Direccion nvarchar(255),
    @Telefono nvarchar(20),
    @CorreoElectronico nvarchar(100)
)
AS
BEGIN
    UPDATE dbo.Proveedores
    SET Nombre = @Nombre, Direccion = @Direccion, Telefono = @Telefono, CorreoElectronico = @CorreoElectronico
    WHERE ID_Proveedor = @ID_Proveedor;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_Ventas_Delete]    Script Date: 9/4/2024 14:00:39 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Ventas_GetAll]    Script Date: 9/4/2024 14:00:39 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Ventas_GetById]    Script Date: 9/4/2024 14:00:39 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Ventas_Insert]    Script Date: 9/4/2024 14:00:39 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Ventas_Update]    Script Date: 9/4/2024 14:00:39 ******/
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
