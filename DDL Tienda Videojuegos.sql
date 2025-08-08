--Crear la base de datos
CREATE DATABASE TiendaVideoJuegos
GO

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
	ADD CONSTRAINT pk_Pais_Id PRIMARY KEY (Id)

--Crear indices de la tabla PAIS
CREATE INDEX ix_Pais_Nombre
	ON Pais(Nombre)

CREATE INDEX ix_Pais_CodigoAlfa
	ON Pais(CodigoAlfa)

--Crear tabla PLATAFORMA
CREATE TABLE Plataforma(
	Id INT IDENTITY NOT NULL,
	CONSTRAINT pk_Plataforma_Id PRIMARY KEY (Id),
	Nombre VARCHAR(50) NOT NULL,
	Portable BIT NOT NULL,
	Año INT NULL
)

--Crear indice de la tabla PLATAFORMA
CREATE INDEX ix_Plataforma_Nombre
	ON Plataforma(Nombre)

--Crear tabla CATEGORIA
CREATE TABLE Categoria(
	Id INT IDENTITY NOT NULL,
	CONSTRAINT pk_Categoria_Id PRIMARY KEY (Id),
	Nombre VARCHAR(50) NOT NULL
)

--Crear indice de la tabla CATEGORIA
CREATE INDEX ix_Categoria_Nombre
	ON Categoria(Nombre)

--Crear tabla FORMATO
CREATE TABLE Formato(
	Id INT IDENTITY NOT NULL,
	CONSTRAINT pk_Formato_Id PRIMARY KEY (Id),
	Nombre VARCHAR(50) NOT NULL
)

--Crear indice de la tabla FORMATO
CREATE INDEX ix_Formato_Nombre
	ON Formato(Nombre)

--Crear tabla DESARROLLADOR
CREATE TABLE Desarrollador(
	Id INT IDENTITY NOT NULL,
	CONSTRAINT pk_Desarrollador_Id PRIMARY KEY (Id),
	Nombre VARCHAR(100) NOT NULL,
	IdPais INT NOT NULL,
	CONSTRAINT fk_Desarrollador_IdPais FOREIGN KEY (IdPais) REFERENCES Pais (Id)
)

--Crear indice de la tabla DESARROLLADOR
CREATE UNIQUE INDEX ix_Desarrollador_Nombre
	ON Desarrollador(Nombre)

--Crear tabla TITULO
CREATE TABLE Titulo(
	Id INT IDENTITY NOT NULL,
	CONSTRAINT pk_Titulo_Id PRIMARY KEY (Id),
	Nombre VARCHAR(100) NOT NULL,
	Año INT NULL,
	Version VARCHAR(20) NOT NULL DEFAULT '1',
	PrecioActual FLOAT NOT NULL DEFAULT 0,
	IdDesarrollador INT NOT NULL,
	CONSTRAINT fk_Titulo_IdDesarrollador FOREIGN KEY (IdDesarrollador) REFERENCES Desarrollador(Id)
)

--Crear indice de la tabla TITULO
CREATE UNIQUE INDEX ix_Titulo_Nombre
	ON Titulo(Nombre, Version)

--Crear tabla CIUDAD
CREATE TABLE Ciudad(
	Id INT IDENTITY NOT NULL,
	CONSTRAINT pk_Ciudad_Id PRIMARY KEY (Id),
	Nombre VARCHAR(100) NOT NULL,
	IdPais INT NOT NULL,
	CONSTRAINT fk_Ciudad_IdPais FOREIGN KEY (IdPais) REFERENCES Pais(Id)
)

--Crear indice de la tabla CIUDAD
CREATE UNIQUE INDEX ix_Ciudad_Nombre
	ON Ciudad(IdPais, Nombre)

--Crear tabla TITULOPLATAFORMA
CREATE TABLE TituloPlataforma(
	IdTitulo INT NOT NULL,
	CONSTRAINT fk_TituloPlataforma_IdTitulo FOREIGN KEY (IdTitulo) REFERENCES Titulo(Id),
	IdPlataforma INT NOT NULL,
	CONSTRAINT fk_TituloPlataforma_IdPlataforma FOREIGN KEY (IdPlataforma) REFERENCES Plataforma(Id),
	CONSTRAINT pk_TituloPlataforma PRIMARY KEY (IdTitulo, IdPlataforma)
)

--Crear tabla TITULOCATEGORIA
CREATE TABLE TituloCategoria(
	IdTitulo INT NOT NULL,
	CONSTRAINT fk_TituloCategoria_IdTitulo FOREIGN KEY (IdTitulo) REFERENCES Titulo(Id),
	IdCategoria INT NOT NULL,
	CONSTRAINT fk_TituloCategoria_IdCategoria FOREIGN KEY (IdCategoria) REFERENCES Categoria(Id),
	CONSTRAINT pk_TituloCategoria PRIMARY KEY (IdTitulo, IdCategoria)
)

--Crear tabla TITULOFORMATO
CREATE TABLE TituloFormato(
	IdTitulo INT NOT NULL,
	CONSTRAINT fk_TituloFormato_IdTitulo FOREIGN KEY (IdTitulo) REFERENCES Titulo(Id),
	IdFormato INT NOT NULL,
	CONSTRAINT fk_TituloFormato_IdFormato FOREIGN KEY (IdFormato) REFERENCES Formato(Id),
	CONSTRAINT pk_TituloFormato PRIMARY KEY (IdTitulo, IdFormato)
)

--Crear tabla CLIENTE
CREATE TABLE Cliente(
	Id INT IDENTITY NOT NULL,
	CONSTRAINT pk_Cliente_Id PRIMARY KEY (Id),
	Nombre VARCHAR(100) NOT NULL,
	NumeroIdentificacion VARCHAR(20) NOT NULL,
	CodigoPostal VARCHAR(10) NULL,
	FechaNacimiento DATE NULL,
	Direccion VARCHAR(100) NOT NULL,
	IdCiudad INT NOT NULL,
	CONSTRAINT fk_Cliente_IdCiudad FOREIGN KEY (IdCiudad) REFERENCES Ciudad(Id),
	Correo VARCHAR(100) NOT NULL,
	Movil VARCHAR(20) NOT NULL
)

--Crear indices de la tabla CLIENTE
CREATE INDEX ix_Cliente_Nombre
	ON Cliente(Nombre)

CREATE UNIQUE INDEX ix_Cliente_Identificacion
	ON Cliente(NumeroIdentificacion)

--Crear tabla EMPLEADO
CREATE TABLE Empleado(
	Id INT IDENTITY NOT NULL,
	CONSTRAINT pk_Empleado_Id PRIMARY KEY (Id),
	Nombre VARCHAR(100) NOT NULL,
	NumeroIdentificacion VARCHAR(20) NOT NULL,
	Clave VARCHAR(20) NOT NULL
)

--Crear indices de la tabla EMPLEADO
CREATE INDEX ix_Empleado_Nombre
	ON Empleado(Nombre)

CREATE UNIQUE INDEX ix_Empleado_Identificacion
	ON Empleado(NumeroIdentificacion)

--Crear tabla ESTADOVENTA
CREATE TABLE EstadoVenta(
	Id INT IDENTITY NOT NULL,
	CONSTRAINT pk_EstadoVenta_Id PRIMARY KEY (Id),
	Nombre VARCHAR(50) NOT NULL
)

--Crear indice de la tabla ESTADOVENTA
CREATE INDEX ix_EstadoVenta_Nombre
	ON Formato(Nombre)

--Crear tabla VENTA
CREATE TABLE Venta(
	Id INT IDENTITY NOT NULL,
	CONSTRAINT pk_Venta_Id PRIMARY KEY (Id),
	NumeroFactura INT NOT NULL,
	Fecha DATE NOT NULL,
	FechaEntrega DATE NULL,
	IdCliente INT NOT NULL,
	CONSTRAINT fk_Venta_IdCliente FOREIGN KEY (IdCliente) REFERENCES Cliente(Id),
	IdEmpleado INT NOT NULL,
	CONSTRAINT fk_Venta_IdEmpleado FOREIGN KEY (IdEmpleado) REFERENCES Empleado(Id),
	IdEstado INT NOT NULL,
	CONSTRAINT fk_Venta_IdEstado FOREIGN KEY (IdEstado) REFERENCES EstadoVenta(Id)
)

--Crear indice de la tabla VENTA
CREATE UNIQUE INDEX ix_Venta_NumeroFactura
	ON Venta(NumeroFactura)