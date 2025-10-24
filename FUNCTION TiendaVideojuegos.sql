--Crar una función escalar que permita caclular el toral de una venta
CREATE FUNCTION fTotalVenta(@IdVenta INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
	DECLARE @Total DECIMAL(10,2)

	SELECT @Total=SUM(Precio*Cantidad-Descuento)
		FROM VentaDetalle
		WHERE IdVenta=@IdVenta

	RETURN @Total
END
GO

--Crear una función de tabla que permita listar los títulos incluidos en una venta
CREATE FUNCTION fTitulosVenta(@IdVenta INT)
RETURNS TABLE
AS
RETURN
(
	SELECT T.Nombre Titulo, VD.Cantidad, VD.Precio, VD.Descuento,
		VD.Cantidad*VD.Precio-VD.Descuento ValorTotal
		FROM VentaDetalle VD
			JOIN Titulo T ON T.Id=VD.IdTitulo
		WHERE VD.IdVenta=@IdVenta
)
GO