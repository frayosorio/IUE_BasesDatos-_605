SELECT V.NumeroFactura, V.Fecha, dbo.fTotalVenta(V.Id) TotalVenta
	FROM Venta V
	WHERE IdCliente = 20