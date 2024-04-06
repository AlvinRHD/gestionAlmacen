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
VALUES ('Producto Ejemplo', 'Descripci�n del producto', 100.00, 10, 7, 7); -- Asignando la categor�a y proveedor previamente creados

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
create procedure dbo.sp_Ventas_GetAll
as
begin
	select Ventas.ID_Venta, Ventas.Fecha, Ventas.Total, Ventas.EstadoVenta, Clientes.Nombre
	from Ventas
	inner join Clientes
	on Ventas.ID_Cliente = Clientes.ID_Cliente
end;

exec dbo.sp_Ventas_GetAll


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

exec dbo.sp_Ventas_Insert 10, '2025-04-04', 300, 'NoCompleta'

select * from Ventas
select * from Clientes


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
select * from Ventas


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

select * from Ventas


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
