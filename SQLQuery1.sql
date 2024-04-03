CREATE DATABASE gestionAlmacen;
GO

USE gestionAlmacen;
GO

CREATE TABLE Categorias (
    ID_Categoria INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    Descripcion NVARCHAR(255),
    Activo BIT
);


CREATE TABLE Proveedores (
    ID_Proveedor INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    Direccion NVARCHAR(255),
    Telefono NVARCHAR(20),
    CorreoElectronico NVARCHAR(100),
    Pais NVARCHAR(100)
);


CREATE TABLE Clientes (
    ID_Cliente INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    Direccion NVARCHAR(255),
    Telefono NVARCHAR(20),
    CorreoElectronico NVARCHAR(100),
    TipoCliente INT
);


CREATE TABLE Productos (
    ID_Producto INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    Descripcion NVARCHAR(255),
    Precio DECIMAL(10, 2),
    Stock INT,
    ID_Categoria INT FOREIGN KEY REFERENCES Categorias(ID_Categoria),
    ID_Proveedor INT FOREIGN KEY REFERENCES Proveedores(ID_Proveedor)
);



CREATE TABLE Ventas (
    ID_Venta INT PRIMARY KEY,
    ID_Cliente INT FOREIGN KEY REFERENCES Clientes(ID_Cliente),
    Fecha DATE,
    Total DECIMAL(10, 2),
    EstadoVenta NVARCHAR(50)
);


CREATE TABLE Detalles_Venta (
    ID_Detalle INT PRIMARY KEY,
    ID_Venta INT FOREIGN KEY REFERENCES Ventas(ID_Venta),
    ID_Producto INT FOREIGN KEY REFERENCES Productos(ID_Producto),
    Cantidad INT,
    Precio_Unitario DECIMAL(10, 2),
    Subtotal DECIMAL(10, 2),
    Impuesto DECIMAL(10, 2)
);


