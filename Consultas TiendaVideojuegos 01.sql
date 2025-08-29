--Listar los registros de la tabla TIPOS DE DOCUMENTO
SELECT * FROM TipoDocumento

--Listar los registros de la tabla Pais
SELECT * FROM Pais

--Listar los registros de la tabla CIUDAD
SELECT * 
	FROM Ciudad
		JOIN Pais ON Ciudad.IdPais=Pais.Id
	WHERE Ciudad.Nombre LIKE '%o'

--Listar los registros de la tabla PLATAFORMA
SELECT * FROM Plataforma
	WHERE Portable = 1

--Listar los registros de la tabla CATEGORIA
SELECT * FROM Categoria

--Listar los registros de la tabla FORMATO
SELECT * FROM Formato

--Listar los registros de la tabla DESARROLLADOR
SELECT D.*, P.Nombre
	FROM Desarrollador D
		JOIN Pais P ON D.IdPais = P.Id

--Listar los registros de la tabla TITULO
SELECT * FROM Titulo T
	JOIN Desarrollador D ON T.IdDesarrollador = D.Id
	JOIN TituloCategoria TC ON T.Id = TC.IdTitulo
	JOIN Categoria C ON TC.IdCategoria = C.Id

--Contar los registros de la tabla PAIS
SELECT COUNT(*)
	FROM Pais

	SELECT COUNT(*)
	FROM Ciudad

	--Listar cuantas CIUDADES tiene cada REGION
	SELECT R.Nombre, COUNT(*) TotalCiudades
		FROM Region R
			JOIN Ciudad C ON R.Id=C.IdRegion
		GROUP BY R.Nombre

--Listar cuantos CLIENTES hay por CIUDAD
SELECT C.Nombre, COUNT(*) TotalClientes
	FROM Ciudad C
		JOIN Cliente CL ON C.Id=CL.IdCiudad
	GROUP BY C.Nombre

--Cuales ciudades tienen mas de 5 clientes
SELECT C.Nombre, COUNT(*) TotalClientes
	FROM Ciudad C
		JOIN Cliente CL ON C.Id=CL.IdCiudad
	GROUP BY C.Nombre
	HAVING COUNT(*)>=5





