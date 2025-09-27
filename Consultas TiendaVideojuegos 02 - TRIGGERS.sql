--Agregar campo para registrar las existencias para las ventas
ALTER TABLE Titulo
    ADD Existencia INT NOT NULL DEFAULT 0;

--Actualizar el campo EXISTENCIA en un valor inicial
UPDATE Titulo
	SET Existencia = 10

--Consultar EXISTENCIA
SELECT Id, Nombre, Existencia
	FROM Titulo

	
--Consulta de Prueba: Agregar un Detalle de una Venta
INSERT INTO VentaDetalle (IdVenta, IdTitulo, Cantidad, Precio, Descuento) 
	VALUES(1, 1, 2, 75000, 0);

INSERT INTO VentaDetalle (IdVenta, IdTitulo, Cantidad, Precio, Descuento) 
	VALUES(2, 1, 1, 75000, 0),
	(2, 2, 2, 100000, 0);

