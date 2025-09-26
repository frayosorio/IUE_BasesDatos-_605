--SP para consultar el historial de compras de un cliente
CREATE PROCEDURE spHistorialComprasCliente
	@IdCliente INT
AS BEGIN
	SELECT V.NumeroFactura, V.Fecha,
		T.Nombre Titulo, VD.Cantidad, VD.Precio, VD.Descuento,
		VD.Cantidad*VD.Precio-VD.Descuento ValorToTal,
		EV.Nombre Estado,
		E.Nombre Vendedor
		FROM Venta V
			JOIN VentaDetalle VD ON V.Id=VD.IdVenta
			JOIN Titulo T ON VD.IdTitulo=T.Id
			JOIN EstadoVenta EV ON V.IdEstado=EV.Id
			JOIN Empleado E ON V.IdEmpleado=E.Id
		WHERE V.IdCliente=@IdCliente
		ORDER BY V.Fecha, T.Nombre
END