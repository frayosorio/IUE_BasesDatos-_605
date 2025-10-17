SELECT * FROM Campeonato 

SELECT * FROM Pais 

SET IDENTITY_INSERT Pais ON
INSERT INTO Pais
	(Id, Pais, Entidad)
	VALUES(70, 'Catar', 'Qatar Football Association')
SET IDENTITY_INSERT Pais OFF

SET IDENTITY_INSERT Campeonato ON
INSERT INTO Campeonato
	(Campeonato, IdPais, PaisesXGrupo, Año)
	VALUES('FIFA World Cup 2022', 70, 4, 2022)
SET IDENTITY_INSERT Campeonato OFF

select *
	from vgrupos