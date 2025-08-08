--Crear la base de datos
CREATE DATABASE TiendaVideoJuegos

--Cambiar de base de datos
USE TiendaVideoJuegos

--Crear tabla PAIS
CREATE TABLE Pais(
	Id INT IDENTITY NOT NULL,
	Nombre VARCHAR(100) NOT NULL,
	CodigoAlfa VARCHAR(5) NOT NULL,
	Indicativo INT NULL
)

--Modificar la tabla PAIS para crear CLAVE PRIMARIA
ALTER TABLE Pais
	ADD CONSTRAINT pkPais_Id PRIMARY KEY (Id)

--Crear indices de la tabla PAIS
CREATE INDEX ixPais_Nombre
	ON Pais(Nombre)

CREATE INDEX ixPais_CodigoAlfa
	ON Pais(CodigoAlfa)

--Crear tabla PLATAFORMA
CREATE TABLE Plataforma(
	Id INT IDENTITY NOT NULL,
	CONSTRAINT pkPlataforma_Id PRIMARY KEY (Id),
	Nombre VARCHAR(50) NOT NULL,
	Portable BIT NOT NULL,
	Año INT NULL
)

--Crear indice de la tabla PLATAFORMA
CREATE INDEX ixPlataforma_Nombre
	ON Plataforma(Nombre)

--Crear tabla CATEGORIA
CREATE TABLE Categoria(
	Id INT IDENTITY NOT NULL,
	CONSTRAINT pkCategoria_Id PRIMARY KEY (Id),
	Nombre VARCHAR(50) NOT NULL
)

--Crear indice de la tabla CATEGORIA
CREATE INDEX ixCategoria_Nombre
	ON Categoria(Nombre)

--Crear tabla FORMATO
CREATE TABLE Formato(
	Id INT IDENTITY NOT NULL,
	CONSTRAINT pkFormato_Id PRIMARY KEY (Id),
	Nombre VARCHAR(50) NOT NULL
)

--Crear indice de la tabla FORMATO
CREATE INDEX ixFormato_Nombre
	ON Formato(Nombre)

--Crear tabla DESARROLLADOR
CREATE TABLE Desarrollador(
	Id INT IDENTITY NOT NULL,
	CONSTRAINT pkDesarrollador_Id PRIMARY KEY (Id),
	Nombre VARCHAR(100) NOT NULL,
	IdPais INT NOT NULL,
	CONSTRAINT fkDesarrollador_IdPais FOREIGN KEY (IdPais) REFERENCES Pais (Id)
)