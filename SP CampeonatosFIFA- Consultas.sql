--Agregar Paises Faltantes
SET IDENTITY_INSERT Pais ON
INSERT INTO Pais
	(Id, Pais, Entidad)
	VALUES(70, 'Catar', 'Qatar Football Association')

INSERT INTO Pais
	(Id, Pais, Entidad)
	VALUES(71, 'Senegal', '')
SET IDENTITY_INSERT Pais OFF

--Agregar el Campeonato
SET IDENTITY_INSERT Campeonato ON
INSERT INTO Campeonato
	(Id, Campeonato, IdPais, PaisesXGrupo, Año)
	VALUES(11, 'FIFA World Cup 2022', 70, 4, 2022)
SET IDENTITY_INSERT Campeonato OFF

--Agregar Grupo al Campeonato
SET IDENTITY_INSERT Grupo ON
INSERT INTO Grupo
	(Id, Grupo,IdCampeonato)
	VALUES (25, 'A', 11)
SET IDENTITY_INSERT Grupo OFF

--Agregar Paises al Grupo
INSERT INTO GrupoPais
	(IdGrupo,IdPais)
	VALUES (25, 21),
	(25, 71),
	(25, 20),
	(25, 70)

--Agregar Ciudad
SET IDENTITY_INSERT Ciudad ON
INSERT INTO Ciudad
	(Id, Ciudad, IdPais)
	VALUES (61, 'Jor', 70)
SET IDENTITY_INSERT Ciudad OFF

--Agregar Estadio
SET IDENTITY_INSERT Estadio ON
INSERT INTO Estadio
	(Id, Estadio, IdCiudad, Capacidad)
	VALUES (63, 'Estadio Al Bayt', 61, 68885)
SET IDENTITY_INSERT Estadio OFF


SELECT * FROM Campeonato 

SELECT * FROM Pais 
	WHERE Pais LIKE '%Ecuador%'

SELECT * FROM Grupo

SELECT Max(Id) FROM Ciudad

SELECT Max(Id) FROM Estadio

SELECT * FROM vgrupos
	WHERE Campeonato LIKE '%2022%'


SELECT * FROM vEncuentros
	WHERE Campeonato LIKE '%2022%'


EXEC spGenerarEncuentrosGrupo 25, 63
	