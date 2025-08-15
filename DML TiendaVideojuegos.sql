--Ir a la base de datos
USE  TiendaVideojuegos605
GO

SET IDENTITY_INSERT TipoDocumento ON
INSERT INTO TipoDocumento(Id, Nombre, Sigla) VALUES(11, 'Registro Civil', 'RC')
INSERT INTO TipoDocumento(Id, Nombre, Sigla) VALUES(12, 'Tarjeta de identidad', 'TI')
INSERT INTO TipoDocumento(Id, Nombre, Sigla) VALUES(13, 'C�dula de ciudadan�a', 'CC');
INSERT INTO TipoDocumento(Id, Nombre, Sigla) VALUES(21, 'Tarjeta de extranjer�a', 'TE');
INSERT INTO TipoDocumento(Id, Nombre, Sigla) VALUES(22, 'C�dula de extranjer�a', 'CE');
INSERT INTO TipoDocumento(Id, Nombre, Sigla) VALUES(31, 'N�mero de Identificaci�n Tributaria', 'NIT ');
INSERT INTO TipoDocumento(Id, Nombre, Sigla) VALUES(41, 'Pasaporte', 'PS');
INSERT INTO TipoDocumento(Id, Nombre, Sigla) VALUES(42, 'Documento de Identificaci�n Extranjero', 'NIE');
INSERT INTO TipoDocumento(Id, Nombre, Sigla) VALUES(50, 'N�mero de Identificaci�n Tributaria Otro Pa�s', 'NITE');
SET IDENTITY_INSERT TipoDocumento OFF

SET IDENTITY_INSERT Pais ON
INSERT INTO Pais (Id, Nombre, CodigoAlfa, Indicativo) 
	VALUES(1, 'COLOMBIA', 'CO', 57)
INSERT INTO Pais (Id, Nombre, CodigoAlfa, Indicativo) 
	VALUES(2, 'ARGENTINA', 'AR', 54)
INSERT INTO Pais (Id, Nombre, CodigoAlfa, Indicativo) 
	VALUES( 3,'BOLIVIA', 'BO', 591);
INSERT INTO Pais (Id, Nombre, CodigoAlfa, Indicativo) 
	VALUES( 4,'BRASIL', 'BR', 55);
INSERT INTO Pais (Id, Nombre, CodigoAlfa, Indicativo) 
	VALUES( 5,'CANADA', 'CA', 1);
INSERT INTO Pais (Id, Nombre, CodigoAlfa, Indicativo) 
	VALUES( 6,'COSTA RICA', 'CR', 506);
INSERT INTO Pais (Id, Nombre, CodigoAlfa, Indicativo) 
	VALUES( 7,'REPUBLICA DOMINICANA', 'DO', 809);
INSERT INTO Pais (Id, Nombre, CodigoAlfa, Indicativo) 
	VALUES( 8,'CUBA', 'CU', 53);
INSERT INTO Pais (Id, Nombre, CodigoAlfa, Indicativo) 
	VALUES( 9,'CHILE', 'CL', 56);
INSERT INTO Pais (Id, Nombre, CodigoAlfa, Indicativo) 
	VALUES(10,'ECUADOR', 'EC', 593);
INSERT INTO Pais (Id, Nombre, CodigoAlfa, Indicativo) 
	VALUES(11,'ESTADOS UNIDOS DE AM�RICA','US', 1);
INSERT INTO Pais (Id, Nombre, CodigoAlfa, Indicativo) 
	VALUES(12,'GUATEMALA', 'GT', 502);
INSERT INTO Pais (Id, Nombre, CodigoAlfa, Indicativo) 
	VALUES(13,'HONDURAS', 'HN', 504);
INSERT INTO Pais (Id, Nombre, CodigoAlfa, Indicativo) 
	VALUES(14,'M�XICO', 'MX', 52);
INSERT INTO Pais (Id, Nombre, CodigoAlfa, Indicativo) 
	VALUES(15,'NICARAGUA', 'NI', 505);
INSERT INTO Pais (Id, Nombre, CodigoAlfa, Indicativo) 
	VALUES(16,'PANAMA', 'PA', 507);
INSERT INTO Pais (Id, Nombre, CodigoAlfa, Indicativo) 
	VALUES(17,'PARAGUAY', 'PY', 595);
INSERT INTO Pais (Id, Nombre, CodigoAlfa, Indicativo) 
	VALUES(18,'PERU', 'PE', 51);
INSERT INTO Pais (Id, Nombre, CodigoAlfa, Indicativo) 
	VALUES(19,'URUGUAY', 'UY', 598);
INSERT INTO Pais (Id, Nombre, CodigoAlfa, Indicativo) 
	VALUES(20,'VENEZUELA', 'VE', 58);
INSERT INTO Pais (Id, Nombre, CodigoAlfa, Indicativo) 
	VALUES(21,'ESPA�A', 'ES', 34);
SET IDENTITY_INSERT Pais OFF

INSERT INTO Ciudad(Nombre, IdPais) VALUES('Envigado', 1)
INSERT INTO Ciudad(Nombre, IdPais) VALUES('Medell�n', 1)
INSERT INTO Ciudad(Nombre, IdPais) VALUES('Bello', 1)
INSERT INTO Ciudad(Nombre, IdPais) VALUES('Itag��', 1)
INSERT INTO Ciudad(Nombre, IdPais) VALUES('Girardota', 1)
INSERT INTO Ciudad(Nombre, IdPais) VALUES('Sabaneta', 1)
INSERT INTO Ciudad(Nombre, IdPais) VALUES('Copacabana', 1)
INSERT INTO Ciudad(Nombre, IdPais) VALUES('La Estrella', 1)
INSERT INTO Ciudad(Nombre, IdPais) VALUES('Barbosa', 1)
INSERT INTO Ciudad(Nombre, IdPais) VALUES('Rionegro', 1)
INSERT INTO Ciudad(Nombre, IdPais) VALUES('Caldas', 1)
INSERT INTO Ciudad(Nombre, IdPais) VALUES('La Ceja', 1)
INSERT INTO Ciudad(Nombre, IdPais) VALUES('El Retiro', 1)

INSERT INTO Plataforma(Nombre, Portable, A�o) VALUES('Atari 2600', 0, 1977)
INSERT INTO Plataforma(Nombre, Portable, A�o) VALUES('Nintendo Entertainment System (NES)', 0, 1983)
INSERT INTO Plataforma(Nombre, Portable, A�o) VALUES('Sega Master System', 0, 1985)
INSERT INTO Plataforma(Nombre, Portable, A�o) VALUES('Game Boy', 1, 1989)
INSERT INTO Plataforma(Nombre, Portable, A�o) VALUES('Sega Game Gear', 1, 1990)
INSERT INTO Plataforma(Nombre, Portable, A�o) VALUES('Super Nintendo (SNES)', 0, 1990)
INSERT INTO Plataforma(Nombre, Portable, A�o) VALUES('PlayStation', 0, 1994)
INSERT INTO Plataforma(Nombre, Portable, A�o) VALUES('PlayStation 2', 0, 2000)
INSERT INTO Plataforma(Nombre, Portable, A�o) VALUES('PlayStation 3', 0, 2006)
INSERT INTO Plataforma(Nombre, Portable, A�o) VALUES('PlayStation 4', 0, 2013)
INSERT INTO Plataforma(Nombre, Portable, A�o) VALUES('PlayStation 5', 0, 2020)
INSERT INTO Plataforma(Nombre, Portable, A�o) VALUES('Nintendo 64', 0, 1996)
INSERT INTO Plataforma(Nombre, Portable, A�o) VALUES('Nintendo DS', 1, 2004)
INSERT INTO Plataforma(Nombre, Portable, A�o) VALUES('Nintendo Wii', 0, 2006)
INSERT INTO Plataforma(Nombre, Portable, A�o) VALUES('Nintendo 3DS', 1, 2011)
INSERT INTO Plataforma(Nombre, Portable, A�o) VALUES('Nintendo Switch', 1, 2017)
INSERT INTO Plataforma(Nombre, Portable, A�o) VALUES('PlayStation Portable (PSP)', 1, 2004)
INSERT INTO Plataforma(Nombre, Portable, A�o) VALUES('PlayStation Vita', 1, 2011)
INSERT INTO Plataforma(Nombre, Portable, A�o) VALUES('Xbox One', 0, 2013)

INSERT INTO Categoria(Nombre, Descripcion) VALUES('Acci�n', 'Juegos con ritmo r�pido que requieren reflejos y coordinaci�n (ej. Call of Duty, Doom).')
INSERT INTO Categoria(Nombre, Descripcion) VALUES('Aventura', 'Basados en exploraci�n y narrativa, con resoluci�n de acertijos (ej. The Legend of Zelda).')
INSERT INTO Categoria(Nombre, Descripcion) VALUES('Plataformas', 'El jugador salta y se desplaza por escenarios (ej. Super Mario Bros, Celeste).')
INSERT INTO Categoria(Nombre, Descripcion) VALUES('Shooter (FPS/TPS)', 'Disparos en primera o tercera persona (ej. Halo, Fortnite).')
INSERT INTO Categoria(Nombre, Descripcion) VALUES('Lucha', 'Combates uno contra uno o en equipos (ej. Street Fighter, Tekken).')
INSERT INTO Categoria(Nombre, Descripcion) VALUES('Carreras', 'Competencias de velocidad en veh�culos (ej. Mario Kart, Gran Turismo).')
INSERT INTO Categoria(Nombre, Descripcion) VALUES('Deportes', 'Simulan deportes reales (ej. FIFA, NBA 2K).')
INSERT INTO Categoria(Nombre, Descripcion) VALUES('Rol (RPG)', 'Desarrollo de personajes, historia y misiones (ej. Final Fantasy, The Witcher 3).')
INSERT INTO Categoria(Nombre, Descripcion) VALUES('Acci�n-RPG', 'Combina combate activo con progresi�n de RPG (ej. Dark Souls, Diablo).')
INSERT INTO Categoria(Nombre, Descripcion) VALUES('Estrategia', 'Planificaci�n y toma de decisiones (ej. Age of Empires, StarCraft).')
INSERT INTO Categoria(Nombre, Descripcion) VALUES('Simulaci�n', 'Recrea actividades reales (ej. The Sims, Flight Simulator).')
INSERT INTO Categoria(Nombre, Descripcion) VALUES('Sandbox / Mundo abierto', 'Libertad total para explorar y crear (ej. Minecraft, GTA V).')
INSERT INTO Categoria(Nombre, Descripcion) VALUES('Survival', 'Enfocado en sobrevivir con recursos limitados (ej. Rust, ARK: Survival Evolved).')
INSERT INTO Categoria(Nombre, Descripcion) VALUES('Terror (Horror)', 'Causar tensi�n y miedo al jugador (ej. Resident Evil, Silent Hill).')
INSERT INTO Categoria(Nombre, Descripcion) VALUES('Puzles', 'Resolver acertijos y desaf�os l�gicos (ej. Tetris, Portal).')
INSERT INTO Categoria(Nombre, Descripcion) VALUES('Battle Royale', 'Muchos jugadores compiten hasta que queda uno (ej. PUBG, Fortnite).')
INSERT INTO Categoria(Nombre, Descripcion) VALUES('Musical / Ritmo', 'Seguir patrones musicales (ej. Guitar Hero, Just Dance).')
INSERT INTO Categoria(Nombre, Descripcion) VALUES('Party Games', 'Minijuegos para jugar en grupo (ej. Mario Party, Overcooked).)')

INSERT INTO Formato(Nombre, Descripcion) VALUES('Cartucho', 'Medio s�lido con chip de memoria, usado sobre todo en consolas cl�sicas y port�tiles.')
INSERT INTO Formato(Nombre, Descripcion) VALUES('CD-ROM', 'Disco �ptico con hasta 700 MB de capacidad.')
INSERT INTO Formato(Nombre, Descripcion) VALUES('DVD-ROM', 'Disco �ptico con hasta 4.7 GB (o 8.5 GB en doble capa).')
INSERT INTO Formato(Nombre, Descripcion) VALUES('Blu-ray', 'Disco �ptico de alta capacidad (25�50 GB o m�s).')
INSERT INTO Formato(Nombre, Descripcion) VALUES('UMD', 'Disco �ptico peque�o usado exclusivamente por PSP.')
INSERT INTO Formato(Nombre, Descripcion) VALUES('MiniDVD', 'Variante reducida del DVD (1.4 GB).')
INSERT INTO Formato(Nombre, Descripcion) VALUES('Digital (Descarga)', 'Se descarga desde tiendas en l�nea, sin soporte f�sico.')
INSERT INTO Formato(Nombre, Descripcion) VALUES('Streaming', 'Juego ejecutado en servidores remotos y transmitido en tiempo real.')
INSERT INTO Formato(Nombre, Descripcion) VALUES('Arcade PCB', 'Placa de circuito con el juego instalado, usada en m�quinas recreativas.')
INSERT INTO Formato(Nombre, Descripcion) VALUES('Tarjeta SD / Memoria flash', 'Medio s�lido similar a un cartucho, pero m�s peque�o y con memoria flash.')
INSERT INTO Formato(Nombre, Descripcion) VALUES('Cassette de cinta', 'Usado en microordenadores antiguos.')



