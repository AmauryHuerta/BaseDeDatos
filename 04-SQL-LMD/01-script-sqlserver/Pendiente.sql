-- Seleccionar los productos incluyendo su categoria y el proveedor
-- que lo surte

SELECT ProductID, ProductName, UnitPrice, UnitsInStock, CategoryID, SupplierID
FROM Products; -- fORMA TRUCHA


SELECT ProductID AS [Numero Producto], ProductName AS [Nombre Producto], 
		UnitPrice AS [Precio], UnitsInStock AS [Existencia], 
		CategoryID AS [Categoria], SupplierID AS [Proveedor]
FROM Products;

SELECT *
FROM Products
	INNER JOIN Categories
	ON Products.CategoryID = Categories.CategoryID;

SELECT *
FROM Products AS [Pr]
	INNER JOIN Categories AS [Ca]
	ON Pr.CategoryID = Ca.CategoryID;

SELECT Pr.ProductID AS [Numero Producto], Pr.ProductName AS [Nombre Producto], 
		Pr.UnitPrice AS [Precio], Pr.UnitsInStock AS [Existencia], 
		Ca.CategoryName AS [Categoria], Su.CompanyName AS [Proveedor]
FROM Products AS [Pr]
	INNER JOIN Categories AS [Ca]
	ON Pr.CategoryID = Ca.CategoryID
	INNER JOIN Suppliers AS [Su]
	ON Pr.SupplierID = Su.SupplierID;

SELECT *
FROM Products AS [Pr]
	INNER JOIN Categories AS [Ca]
	ON Pr.CategoryID = Ca.CategoryID
	INNER JOIN Suppliers AS [Su]
	ON Pr.SupplierID = Su.SupplierID;

----------------------
USE PruebaJOINS;

SELECT *
FROM Categorias;

SELECT *
FROM Productos;

SELECT C.IdCategoria, C.Nombre, P.Nombre, P.Precio
FROM Categorias AS C
	 INNER JOIN Productos AS P
	 ON C.IdCategoria = P.IdCategoria;

SELECT C.IdCategoria, C.Nombre, P.Nombre, P.Precio, P.IdProductos
FROM Categorias AS C
	 LEFT OUTER JOIN Productos AS P
	 ON C.IdCategoria = P.IdCategoria;

-- Mostrar todas las categorias que no tienen productos asignados
SELECT C.IdCategoria, C.Nombre, P.Nombre, P.Precio, P.IdProductos
FROM Categorias AS C
	 LEFT OUTER JOIN Productos AS P
	 ON C.IdCategoria = P.IdCategoria
WHERE P.IdProductos IS NULL;

SELECT C.IdCategoria, C.Nombre, P.Nombre, P.Precio, P.IdProductos
FROM Categorias AS C
	 RIGHT JOIN Productos AS P
	 ON C.IdCategoria = P.IdCategoria
WHERE C.IdCategoria IS NULL;

---------------------------------------------
USE BDEJEMPLO2;

-- Listar las oficinas y los nombres y puestos de sus jefes
SELECT O.Oficina, R.Nombre, R.Puesto
FROM Oficinas AS O
	INNER JOIN Representantes AS R
	ON R.Num_Empl = O.Jef;

-- Listar las oficinas y los nombres y puestos de sus jefes, 
-- con un objetivo superior a 600000
SELECT O.Oficina, R.Nombre, R.Puesto, O.Objetivo
FROM Oficinas AS O
	INNER JOIN Representantes AS R
	ON R.Num_Empl = O.Jef
WHERE O.Objetivo > 600000;

-- Listar todos los pedidos, mostrando el numero de pedido
-- el importe y la descripcion de los productos
SELECT Pe.Num_Pedido, Pe.Importe, Pr.Descripcion
FROM Pedidos AS [Pe]
	 INNER JOIN Productos AS [Pr]
	 ON (Pr.Id_fab = Pe.Fab) AND (Pr.Id_producto = Pe.Producto);

-- Listar los pedidos superiores (IMPORTE) a 25000, incluyendo el numero de
-- pedido, importe, el nombre del representante que tomo la nota del
-- pedido y el nombre del cliente 
SELECT P.Num_Pedido, P.Importe, R.Nombre, C.Empresa
FROM Representantes AS [R]
	 INNER JOIN Pedidos AS [P]
	 ON P.Rep = R.Num_Empl
	 INNER JOIN Clientes AS [C]
	 ON C.Num_Cli = P.Cliente
WHERE P.Importe > 25000;

-- Listar los pedidos superiores a 25000
-- mostrar el numero de pedido,
-- el nombre del cliente que lo encargo y el nombre del representante
-- asignado al cliente



-- Listar los pedidos superiores a 25000, mostrando el numero de pedido
-- el nombre del cliente que lo encargo, el representante del cliente y 
-- la oficina en la que trabaja el representante 



-- Listar los nombres de los empleados y jefes




-- Consultas de agregado
-- Cual es la cuota y las ventas medias de los representantes 