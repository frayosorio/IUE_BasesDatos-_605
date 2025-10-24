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