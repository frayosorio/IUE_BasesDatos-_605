--Listar Clientes que han comprado
SELECT DISTINCT C.Id, C.Nombre
	FROM Cliente C
		JOIN Venta V ON C.Id=V.IdCliente

-- Ejecutar SP
EXEC spHistorialComprasCliente 71

EXEC spReporteVentasClientes

EXEC spReporteVentasClientes 52

EXEC spTopClientes 

EXEC spTopClientes 20



--Eliminar los registros de VENTADETALLE asociados a un DESARROLLADOR
--(Ejemplo de uso de DELETE con tablas relacionadas)
DELETE VD
	FROM Titulo T
		JOIN VentaDetalle VD ON T.Id=VD.IdTitulo
	WHERE IdDesarrollador>=13

