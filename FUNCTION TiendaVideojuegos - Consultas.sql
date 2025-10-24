SELECT V.NumeroFactura, V.Fecha, dbo.fTotalVenta(V.Id) TotalVenta
	FROM Venta V
	WHERE IdCliente = 20

SELECT * FROM dbo.fTitulosVenta(28)

SELECT V.NumeroFactura, V.Fecha, C.Nombre, TV.Titulo, TV.Cantidad, TV.ValorTotal
	FROM Venta V
		JOIN Cliente C ON V.IdCliente=C.Id
		CROSS APPLY dbo.fTitulosVenta(V.Id) TV 
	WHERE C.Id=52