SELECT * FROM vGrupo
SELECT * FROM Grupo

SELECT * FROM vEncuentro
	WHERE IdCampeonato=10
	AND (Pais1='Colombia' OR Pais2='Colombia')

--Consultas de prueba del TRIGGER de Pais por Grupo
SELECT * FROM vGrupo
	WHERE IdCampeonato=10

SELECT * FROM vGrupoPais
	WHERE IdGrupo IN (19, 20, 21, 22,23, 24)
	ORDER BY Grupo, Pais

INSERT INTO GrupoPais
	(IdGrupo, IdPais)
	VALUES(20, 1)


	
	