use gestionAlmacen
go

--------------
-- Insertar en la tabla Categorias
INSERT INTO Categorias (Nombre, Descripcion) VALUES ('Categoria Ejemplo', 'Descripci�n de la categor�a');

-- Insertar en la tabla Proveedores
INSERT INTO Proveedores (Nombre, Direccion, Telefono, CorreoElectronico) 
VALUES ('Proveedor Ejemplo', 'Direcci�n del proveedor', '123456789', 'proveedor@example.com');

-- Insertar en la tabla Clientes
INSERT INTO Clientes (Nombre, Direccion, Telefono, CorreoElectronico) 
VALUES ('Cliente Ejemplo', 'Direcci�n del cliente', '987654321', 'cliente@example.com');

-- Insertar en la tabla Productos
INSERT INTO Productos (Nombre, Descripcion, Precio, Stock, ID_Categoria, ID_Proveedor) 
VALUES ('Producto Ejemplo', 'Descripci�n del producto', 100.00, 10, 8, 8); -- Asignando la categor�a y proveedor previamente creados

-- Insertar en la tabla Ventas
INSERT INTO Ventas (ID_Cliente, Fecha, Total, EstadoVenta) 
VALUES (5, '2024-04-03', 200.00, 'Completada'); -- Asignando el ID del cliente previamente creado

-- Insertar en la tabla Detalles_Venta
INSERT INTO Detalles_Venta (ID_Venta, ID_Producto, Cantidad, Precio_Unitario, Subtotal, Impuesto) 
VALUES (9, 11, 2, 50.00, 100.00, 10.00); -- Asignando el ID de venta y producto previamente creados


---Selecionamos todas las tablas

select * from Clientes
select * from Ventas
select * from Detalles_Venta
select * from Productos
select * from Categorias
select * from Proveedores

------------------------------------------
--Prodecimiento alamcenado: Devuelve el listado de todos los Clientes
-------------------------------------------
create procedure dbo.sp_Clientes_GetAll
as
begin
	select ID_Cliente, Nombre, Direccion, Telefono, CorreoElectronico from Clientes
end;

exec dbo.sp_Clientes_GetAll


------------------------------------------
--Prodecimiento alamcenado: Filtra los registros por el ID_Cliente
-------------------------------------------
create procedure dbo.sp_Clientes_GetById (@ID_Cliente int)
as
begin
	Select ID_Cliente, Nombre, Direccion, Telefono, CorreoElectronico
	from Clientes
	where ID_Cliente = @ID_Cliente
end;

exec dbo.sp_Clientes_GetById 5


------------------------------------------
--Prodecimiento alamcenado: Inserta datos a la tabla Clientes
-------------------------------------------
create procedure dbo.sp_Clientes_Insert 
(
@Nombre nvarchar(100), @Direccion nvarchar(255),
@Telefono nvarchar(20),@CorreoElectronico nvarchar(100)
)
as
begin
	insert into dbo.Clientes
	values (@Nombre, @Direccion, @Telefono, @CorreoElectronico)
end;

exec dbo.sp_Clientes_Insert 'leo', 'Lolo', '76013988', 'estevensalmeron@gmail.com'

select * from Clientes

------------------------------------------
------------------------------------------
--Prodecimiento alamcenado: Actualiza los datos a la tabla Clientes
-------------------------------------------
create procedure dbo.sp_Clientes_Update 
(
@Nombre nvarchar(100), @Direccion nvarchar(255),
@Telefono nvarchar(20), @CorreoElectronico nvarchar(100), @ID_Cliente int 
)
as
begin
	update dbo.Clientes
	set Nombre = @Nombre , Direccion = @Direccion, Telefono = @Telefono, CorreoElectronico = @CorreoElectronico
	where ID_Cliente = @ID_Cliente
end;

exec dbo.sp_Clientes_Update 'ren', 'San', '789024', 'ReneSalmeron@gmail.com', 7


------------------------------------------
--Prodecimiento alamcenado: Elimina los datos de la tabla Clientes
-------------------------------------------
create procedure dbo.sp_Clientes_Delete
(
@ID_Cliente int
)
as
begin
	delete from Clientes where ID_Cliente = @ID_Cliente;
end;

exec dbo.sp_Clientes_Delete 5


-------------------------------------------------------------------------
--------------------------------------------------------------------------
---------------Procedimientos almacenados de ventas ----------------------
--------------------------------------------------------------------------

------------------------------------------
--Prodecimiento alamcenado: Devuelve el listado de todas las ventas
-------------------------------------------
alter procedure dbo.sp_Ventas_GetAll
as
begin
	select Ventas.ID_Venta, Ventas.Fecha, Clientes.ID_Cliente, Ventas.Total, Ventas.EstadoVenta, Clientes.Nombre
	from  Ventas inner join Clientes
	on Ventas.ID_Cliente = Clientes.ID_Cliente
end;

exec dbo.sp_Ventas_GetAll


select Ventas.ID_Venta, Ventas.Fecha, Clientes.ID_Cliente, Ventas.Total, Ventas.EstadoVenta, Clientes.Nombre
from  Ventas inner join Clientes
on Ventas.ID_Cliente = Clientes.ID_Cliente

------------------------------------------
--Prodecimiento alamcenado: Filtra los registros por el ID_Venta
-------------------------------------------
create procedure dbo.sp_Ventas_GetById (@ID_Venta int)
as
begin
	Select ID_Venta, ID_Cliente, Fecha, Total, EstadoVenta
	from Ventas
	where ID_Venta = @ID_Venta
end;

exec dbo.sp_Ventas_GetById 11


------------------------------------------
--Prodecimiento alamcenado: Inserta datos a la tabla Ventas
-------------------------------------------
create procedure dbo.sp_Ventas_Insert 
(
@ID_Cliente int, @Fecha date,
@Total money, @EstadoVenta nvarchar(50)
)
as
begin
	insert into dbo.Ventas
	values (@ID_Cliente, @Fecha, @Total, @EstadoVenta)
end;

exec dbo.sp_Ventas_Insert 8, '2025-04-04', 300, 'NoCompleta'


------------------------------------------
--Prodecimiento alamcenado: Actualiza los datos a la tabla ventas
-------------------------------------------
alter procedure dbo.sp_Ventas_Update 
(
@ID_Venta int , @ID_Cliente int,
@Fecha date, @Total money, @EstadoVenta nvarchar(50) 
)
as
begin
	update dbo.Ventas
	set @ID_Cliente = ID_Cliente,  Fecha = @Fecha, Total = @Total, EstadoVenta = @EstadoVenta
	where ID_Venta = @ID_Venta
end;


exec dbo.sp_Ventas_Update 12, 10, '2025-04-06', 600.00, 'No';

EXEC dbo.sp_Ventas_Update @ID_Venta = 11, @ID_Cliente = 8, @Fecha = '2024-04-06', @Total = 500.00, @EstadoVenta = 'Completada';


select * from Clientes
select * from Productos
select * from Ventas
select * from Detalles_Venta

------------------------------------------
--Prodecimiento alamcenado: Elimina los datos de la tabla Ventas
-------------------------------------------

create procedure dbo.sp_Ventas_Delete
(
@ID_Venta int
)
as
begin
	delete from Ventas
	where ID_Venta = @ID_Venta;
end;

exec dbo.sp_Ventas_Delete 11

select * from Categorias
SELECT * FROM Proveedores

DELETE FROM Proveedores
WHERE ID_Proveedor = 8;


SELECT ID_Venta, ID_Cliente, Fecha, Total, EstadoVenta FROM Ventas

------------------------------------------
--Prodecimiento alamcenado de la tabla Detalle_Venta
-------------------------------------------

SELECT ID_Producto, Nombre, Descripcion, Precio, Stock, ID_Categoria, ID_Proveedor FROM Productos


ALTER PROCEDURE dbo.sp_DetallesVenta_GetAll
AS
BEGIN
    SELECT Detalles_Venta.ID_Detalle, Detalles_Venta.ID_Venta, Productos.ID_Producto, Detalles_Venta.Cantidad, Detalles_Venta.Precio_Unitario, Detalles_Venta.Subtotal, Detalles_Venta.Impuesto, Productos.Nombre
    FROM Detalles_Venta
	INNER JOIN Productos
	ON Detalles_Venta.ID_Producto = Productos.ID_Producto
END;



INSERT INTO Clientes (Nombre, Direccion, Telefono, CorreoElectronico) 
VALUES ('Cliente A', 'Calle Uno 456', '111222333', 'clienteA@example.com');

INSERT INTO Ventas (ID_Cliente, Fecha, Total, EstadoVenta) 
VALUES (8, '2024-04-01', 1600.00, 'Completada');

INSERT INTO Detalles_Venta (ID_Venta, ID_Producto, Cantidad, Precio_Unitario, Subtotal, Impuesto) 
VALUES (12, 1, 1, 1500.00, 1500.00, 150.00);

INSERT INTO Productos (Nombre, Descripcion, Precio, Stock, ID_Categoria, ID_Proveedor) 
VALUES ('Laptop', 'Laptop de �ltima generaci�n', 1500.00, 20, 7, 7);


INSERT INTO Detalles_Venta (ID_Venta, ID_Producto, Cantidad, Precio_Unitario, Subtotal, Impuesto) 
VALUES (12, 11, 1, 1500.00, 1500.00, 150.00);

select * from Productos

select * from Proveedores

select * from Categorias

select * from Clientes

select * from Ventas

select * from Detalles_Venta

EXEC dbo.sp_DetallesVenta_GetAll 

------------------------------------------
--Prodecimiento alamcenado: Filtra los registros por el ID_Detalle_Venta
-------------------------------------------
ALTER PROCEDURE dbo.sp_DetallesVenta_GetByVentaID (@ID_Detalle INT)
AS
BEGIN
    SELECT ID_Detalle, ID_Venta, ID_Producto, Cantidad, Precio_Unitario, Subtotal, Impuesto
    FROM Detalles_Venta
    WHERE ID_Detalle = @ID_Detalle;
END;

EXEC dbo.sp_DetallesVenta_GetByVentaID 3


------------------------------------------
--Prodecimiento alamcenado: Inserta datos a la tabla Detalle_Venta
-------------------------------------------

CREATE PROCEDURE dbo.sp_DetallesVenta_Insert 
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

SELECT * FROM Detalles_Venta

EXEC dbo.sp_DetallesVenta_Insert 12, 11, 3, 1000.00, 2000.00, 10.00



------------------------------------------
--Prodecimiento alamcenado: Actualiza los datos a la tabla Detalles_Ventas
-------------------------------------------
CREATE PROCEDURE dbo.sp_DetallesVenta_Update 
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


EXEC dbo.sp_DetallesVenta_Update 3, 12, 11, 3, 1000.00, 4000.00, 20.00



------------------------------------------
--Prodecimiento alamcenado: Elimina los datos de la tabla Detalle_Venta
-------------------------------------------
CREATE PROCEDURE dbo.sp_DetallesVenta_Delete
(
    @ID_Detalle INT
)
AS
BEGIN
    DELETE FROM Detalles_Venta
    WHERE ID_Detalle = @ID_Detalle;
END;


SELECT * FROM Detalles_Venta


EXEC dbo.sp_DetallesVenta_Delete 3



------------------------------------------
--Prodecimiento alamcenado de la tabla Productos --Lista los productos
-------------------------------------------

CREATE PROCEDURE dbo.sp_Productos_GetAll
AS
BEGIN
    SELECT ID_Producto, Nombre, Descripcion, Precio, Stock, ID_Categoria, ID_Proveedor
    FROM Productos;
END;

exec dbo.sp_Productos_GetAll

------------------------------------------
--Prodecimiento alamcenado: Filtra los registros por el ID_Producto
-------------------------------------------

CREATE PROCEDURE dbo.sp_Productos_GetById (@ID_Producto INT)
AS
BEGIN
    SELECT ID_Producto, Nombre, Descripcion, Precio, Stock, ID_Categoria, ID_Proveedor
    FROM Productos
    WHERE ID_Producto = @ID_Producto;
END;

SELECT * FROM Productos

EXEC dbo.sp_Productos_GetById 11


------------------------------------------
--Prodecimiento alamcenado: Inserta datos a la tabla Productos
-------------------------------------------
CREATE PROCEDURE dbo.sp_Productos_Insert 
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

EXEC dbo.sp_Productos_Insert 'PS4', 'Consola', 400, 20, 7, 7

SELECT * FROM Productos


------------------------------------------
--Prodecimiento alamcenado: Actualizar datos a la tabla Productos
-------------------------------------------

CREATE PROCEDURE dbo.sp_Productos_Update
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

EXEC dbo.sp_Productos_Update 11, 'Prueba 1', 'hola', 500, 30, 7 ,7

SELECT * FROM Productos


------------------------------------------
--Prodecimiento alamcenado: Eliminar datos a la tabla Productos
-------------------------------------------

CREATE PROCEDURE dbo.sp_Productos_Delete
(
    @ID_Producto INT
)
AS
BEGIN
    DELETE FROM Productos
    WHERE ID_Producto = @ID_Producto;
END;

exec dbo.sp_Productos_Delete 14

SELECT * FROM Productos

---------------------------------
--------------------------------
---------------------------------

------------------------------------------
--Prodecimiento alamcenado: listar datos a la tabla Proveedores
-------------------------------------------

CREATE PROCEDURE dbo.sp_Proveedores_GetAll
AS
BEGIN
    SELECT ID_Proveedor, Nombre, Direccion, Telefono, CorreoElectronico
    FROM Proveedores;
END;

EXEC dbo.sp_Proveedores_GetAll


------------------------------------------
--Prodecimiento alamcenado: filtrar datos a la tabla Proveedores
-------------------------------------------


CREATE PROCEDURE dbo.sp_Proveedores_GetById
(
    @ID_Proveedor int
)
AS
BEGIN
    SELECT ID_Proveedor, Nombre, Direccion, Telefono, CorreoElectronico
    FROM Proveedores
    WHERE ID_Proveedor = @ID_Proveedor;
END;


EXEC dbo.sp_Proveedores_GetById 8

select * from Proveedores


------------------------------------------
--Prodecimiento alamcenado: insertar datos a la tabla Proveedores
-------------------------------------------


CREATE PROCEDURE dbo.sp_Proveedores_Insert
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

EXEC dbo.sp_Proveedores_Insert 'Alvin', 'Por ahi', '1212-1212', 'hpla@gmail.com' 

select * from Proveedores

------------------------------------------
--Prodecimiento alamcenado: Actualizar datos a la tabla Proveedores
-------------------------------------------

CREATE PROCEDURE dbo.sp_Proveedores_Update
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

EXEC dbo.sp_Proveedores_Update 9, 'Ezequiel', 'Por alla', '1313-1313', 'example@gmail.com'

------------------------------------------
--Prodecimiento alamcenado: Eliminar datos a la tabla Proveedores
-------------------------------------------

CREATE PROCEDURE dbo.sp_Proveedores_Delete
(
    @ID_Proveedor int
)
AS
BEGIN
    DELETE FROM Proveedores
    WHERE ID_Proveedor = @ID_Proveedor;
END;

EXEC dbo.sp_Proveedores_Delete 9

------------------------------------
------------------------------------
-------------------------------------



------------------------------------------
--Prodecimiento alamcenado: Listar datos a la tabla Categorias
-------------------------------------------


CREATE PROCEDURE dbo.sp_Categorias_GetAll
AS
BEGIN
    SELECT ID_Categoria, Nombre, Descripcion
    FROM Categorias;
END;

EXEC dbo.sp_Categorias_GetAll


select * from Categorias


------------------------------------------
--Prodecimiento alamcenado: Filtrar datos a la tabla Categorias
-------------------------------------------

CREATE PROCEDURE dbo.sp_Categorias_GetById
(
    @ID_Categoria int
)
AS
BEGIN
    SELECT ID_Categoria, Nombre, Descripcion
    FROM Categorias
    WHERE ID_Categoria = @ID_Categoria;
END;

EXEC dbo.sp_Categorias_GetById 8



------------------------------------------
--Prodecimiento alamcenado: Insertar datos a la tabla Categorias
-------------------------------------------

CREATE PROCEDURE dbo.sp_Categorias_Insert
(
    @Nombre nvarchar(100),
    @Descripcion nvarchar(255)
)
AS
BEGIN
    INSERT INTO dbo.Categorias (Nombre, Descripcion)
    VALUES (@Nombre, @Descripcion);
END;

EXEC dbo.sp_Categorias_Insert 'NombreInventado', 'DescripcionInventada'



------------------------------------------
--Prodecimiento alamcenado: Actualizar datos a la tabla Categorias
-------------------------------------------

CREATE PROCEDURE dbo.sp_Categorias_Update
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

EXEC dbo.sp_Categorias_Update 9, 'OtroNombre', 'OtraDescripcion'

select * from Categorias



------------------------------------------
--Prodecimiento alamcenado: Eliminar datos a la tabla Categorias
-------------------------------------------

CREATE PROCEDURE dbo.sp_Categorias_Delete
(
    @ID_Categoria int
)
AS
BEGIN
    DELETE FROM Categorias
    WHERE ID_Categoria = @ID_Categoria;
END;

EXEC dbo.sp_Categorias_Delete 9



------------------------------------
------------------------------------
-------------------------------------
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
