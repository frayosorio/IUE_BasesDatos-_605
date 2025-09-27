--Crear un TRIGGER que actualice la existencia de TITULOS despues de hacer una VENTA
CREATE TRIGGER tActualizarExistenciaTitulo
ON VentaDetalle
AFTER INSERT
AS BEGIN
	UPDATE T
		SET Existencia = T.Existencia - I.Cantidad
		FROM Titulo T
				JOIN inserted I ON T.Id = I.IdTitulo
END
GO