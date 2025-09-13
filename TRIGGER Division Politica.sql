CREATE TRIGGER tActualizarCapitalRegion
ON Ciudad
FOR INSERT, UPDATE
AS BEGIN
	--Validar que se esta actualizando una capital de region
	IF EXISTS(SELECT * FROM Inserted WHERE CapitalRegion=1)
	BEGIN
		-- Verificar si la inserci�n o actualizaci�n causar�a que haya m�s de una capital de regi�n
		IF EXISTS(SELECT 1
					FROM Inserted I
						JOIN Ciudad C ON I.IdRegion=C.IdRegion
					WHERE I.CapitalRegion=1 AND C.CapitalRegion=1 AND C.Id<>I.Id
					GROUP BY I.IdRegion
					HAVING COUNT(*) > 1)
		BEGIN
			RAISERROR('No se acepta m�s de una capital por regi�n', 16, 1)
			ROLLBACK TRANSACTION
		END

		-- Si se est� estableciendo una ciudad como capital, asegurarse de que las dem�s no lo sean
		UPDATE Ciudad
			SET CapitalRegion=0
			FROM Ciudad C
				JOIN Inserted I ON C.IdRegion=I.IdRegion
					AND C.Id<>I.Id
				
		
	END
END
GO
