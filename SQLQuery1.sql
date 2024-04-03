CREATE DATABASE gestionAlmacen
GO

USE gestionAlmacen
GO

CREATE TABLE Categorias (
    ID_Categoria INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100),
    Descripcion NVARCHAR(255)
);

CREATE TABLE Proveedores (
    ID_Proveedor INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100),
    Direccion NVARCHAR(255),
    Telefono NVARCHAR(20),
    CorreoElectronico NVARCHAR(100)
);

CREATE TABLE Clientes (
    ID_Cliente INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100),
    Direccion NVARCHAR(255),
    Telefono NVARCHAR(20),
    CorreoElectronico NVARCHAR(100)
);

CREATE TABLE Productos (
    ID_Producto INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100),
    Descripcion NVARCHAR(255),
    Precio MONEY,
    Stock INT,
    ID_Categoria INT,
    ID_Proveedor INT,
    FOREIGN KEY (ID_Categoria) REFERENCES Categorias(ID_Categoria) ON DELETE CASCADE,
    FOREIGN KEY (ID_Proveedor) REFERENCES Proveedores(ID_Proveedor) ON DELETE CASCADE
);

CREATE TABLE Ventas (
    ID_Venta INT IDENTITY(1,1) PRIMARY KEY,
    ID_Cliente INT,
    Fecha DATE,
    Total MONEY,
    EstadoVenta NVARCHAR(50),
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente) ON DELETE CASCADE
);

CREATE TABLE Detalles_Venta (
    ID_Detalle INT IDENTITY(1,1) PRIMARY KEY,
    ID_Venta INT,
    ID_Producto INT,
    Cantidad INT,
    Precio_Unitario DECIMAL(10, 2),
    Subtotal MONEY,
    Impuesto MONEY,
    FOREIGN KEY (ID_Venta) REFERENCES Ventas(ID_Venta) ON DELETE CASCADE,
    FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto)
);
