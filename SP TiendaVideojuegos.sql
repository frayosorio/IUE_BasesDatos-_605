--SP para consultar el historial de compras de un cliente
CREATE OR ALTER PROCEDURE spHistorialComprasCliente
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
GO

-- Crear un reporte detallado de las ventas por cliente,
-- mostrando títulos y totales acumulados tanto por factura como por cliente

CREATE OR ALTER PROCEDURE spReporteVentasClientes
	@IdCliente INT = NULL -- Si se pasa un cliente, se filtran solo los datos de ese cliente
AS BEGIN
	-- CTE (Common Table Expression : Tabla Temporal en Memoria) para obtener detalle de cada venta
	WITH cteVentaDetalle AS (
		SELECT VD.IdVenta, V.NumeroFactura, V.Fecha,
			T.Nombre Titulo, VD.Cantidad, VD.Precio, VD.Descuento,
			VD.Cantidad*VD.Precio-VD.Descuento ValorToTal,
			EV.Nombre Estado,
			E.Nombre Vendedor,
			V.IdCliente, C.Nombre Cliente, TD.Sigla+' '+C.NumeroIdentificacion Identificacion
			FROM Venta V
				JOIN VentaDetalle VD ON V.Id=VD.IdVenta
				JOIN Titulo T ON VD.IdTitulo=T.Id
				JOIN EstadoVenta EV ON V.IdEstado=EV.Id
				JOIN Empleado E ON V.IdEmpleado=E.Id
				JOIN Cliente C ON C.Id=V.IdCliente
				JOIN TipoDocumento TD ON C.IdTipoDocumento=TD.Id
			WHERE @IdCliente IS NULL OR V.IdCliente=@IdCliente	
		),
		--CTE para acumular por cliente
		cteTotalesCliente AS (
			SELECT IdCliente, SUM(ValorToTal) ValorTotalComprado , SUM(Cantidad) TotalUnidadesCompradas
				FROM cteVentaDetalle 
				GROUP BY IdCliente
		),
		--CTE para acumular por venta
		cteTotalesVenta AS (
			SELECT IdVenta, SUM(ValorToTal) ValorTotalVenta, SUM(Cantidad) TotalUnidadesVenta
				FROM cteVentaDetalle 
				GROUP BY IdVenta
		)
		SELECT VD.NumeroFactura, VD.Fecha, VD.Cliente, VD.Identificacion, VD.Vendedor,
			VD.Titulo, VD.Cantidad, VD.Precio, VD.Descuento, VD.ValorToTal, 
			TV.ValorTotalVenta, TV.TotalUnidadesVenta,
			TC.ValorTotalComprado, TC.TotalUnidadesCompradas
			FROM cteVentaDetalle VD
				JOIN cteTotalesCliente TC ON VD.IdCliente=TC.IdCliente
				JOIN cteTotalesVenta TV ON VD.IdVenta=TV.IdVenta
			ORDER BY VD.Cliente, VD.NumeroFactura
END
GO

-- Crear un ranking de los clientes que mas han gastado en videojuegos
CREATE OR ALTER PROCEDURE spTopClientes
	@Top INT = 5
AS
BEGIN
	--CTE para calcular total gastado por el cliente
	WITH cteTotalCliente AS (
		SELECT V.IdCliente, SUM(VD.Cantidad*VD.Precio-VD.Descuento) TotalGastado
			FROM Venta V
				JOIN VentaDetalle VD ON V.Id=VD.IdVenta
			GROUP BY V.IdCliente
		),
		--CTE con ranking de clientes según el gasto
		cteRanking AS (
		SELECT IdCliente, TotalGastado, RANK() OVER(ORDER BY TotalGastado DESC) Posicion
			FROM cteTotalCliente
		)
		SELECT R.Posicion,
			C.Nombre Cliente, TD.Sigla+' '+C.NumeroIdentificacion Identificacion,
			R.TotalGastado
			FROM cteRanking R
				JOIN Cliente C ON C.Id=R.IdCliente
				JOIN TipoDocumento TD ON C.IdTipoDocumento=TD.Id
			WHERE R.Posicion<=@Top
END
GO