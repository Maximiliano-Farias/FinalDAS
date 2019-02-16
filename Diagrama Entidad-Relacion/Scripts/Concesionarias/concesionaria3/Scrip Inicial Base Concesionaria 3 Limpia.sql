--SCRIPT PARA EJECUTAR DIRECTAMENTE

use CONCESIONARIA3

/*
DROP TABLE Facturas
DROP TABLE Planes_detalles
DROP TABLE Autos
DROP TABLE Marcas
DROP TABLE Actualizaciones
DROP TABLE Personas
DROP TABLE Identificadores
DROP TABLE Concesionaria


*/


CREATE TABLE Concesionaria
(
	id_concesionaria  varchar(10) ,
	Nombre  varchar(40)  NOT NULL ,
	Habilitado  varchar(1)  NOT NULL ,
	Direccion  varchar(40) NOT NULL ,
	Telefono  varchar(40) NOT NULL ,
	Email  varchar(40) NOT NULL ,
	CONSTRAINT  PK_id_concesionarias PRIMARY KEY (id_concesionaria  ASC)
)
go


CREATE TABLE Identificadores
(
	nro_identificador  integer  NOT NULL IDENTITY(1,1) ,
	descripcion  char(18)  NOT NULL ,
	CONSTRAINT  PK_Identificadores_DOCUMENTOS PRIMARY KEY (nro_identificador  ASC)
)
go


CREATE TABLE Personas
(
	id_persona  INTEGER  NOT NULL ,
	Nombre  varchar(40)  NOT NULL ,
	Apellido  varchar(40) NOT NULL ,
	Direccion  varchar(40) NOT NULL ,
	Mail  varchar(40)  NOT NULL ,
	nro_identificador  integer  NOT NULL ,
	Telefono  varchar(18)  NULL ,
	CONSTRAINT  PK_Documento_Personas PRIMARY KEY (id_persona  ASC),
	CONSTRAINT  FK_Tipo_Identificador FOREIGN KEY (nro_identificador) REFERENCES Identificadores(nro_identificador)
)
go



CREATE TABLE Actualizaciones
(
	fecha_actualizacion  date  NOT NULL ,
	Completado  char(1)  NOT NULL ,
	id_concesionaria  varchar(10)  NOT NULL ,
	CONSTRAINT  PK_Actualizaciones PRIMARY KEY (id_concesionaria  ASC),
	CONSTRAINT  FK_Id_concesionaria_Atualizaciones FOREIGN KEY (id_concesionaria) REFERENCES concesionaria(id_concesionaria)
	
)
go




CREATE TABLE Marcas
(
	nro_marca  integer  NOT NULL identity (1,1) ,
	Nombre  varchar(18)  NOT NULL ,
	CONSTRAINT  PK_Marcas PRIMARY KEY (nro_marca  ASC)
)
go


CREATE TABLE Autos
(
	Nombre_Auto  varchar(20)  NOT NULL ,
	Tipo_modelo  varchar(20)  NOT NULL ,
	nro_marca  integer  NOT NULL ,
	CONSTRAINT  PK_Autos PRIMARY KEY (Nombre_Auto  ASC,Tipo_modelo ASC,nro_marca  ASC),
	CONSTRAINT  FK_Nro_Marca FOREIGN KEY (nro_marca) REFERENCES Marcas(nro_marca)
)
go


CREATE TABLE Planes_detalles
(  
    
	Id_plan  integer  NOT NULL identity(1,1),
	id_concesionaria varchar(10)  NOT NULL ,
	Identificador varchar(20) NOT NULL,
	id_persona  integer  NOT NULL ,
	Nombre_Auto  varchar(20) NOT NULL ,
	nro_marca  integer  NOT NULL ,
	Tipo_modelo  varchar(20) NOT NULL,
	CONSTRAINT  PK_Planes_detalles PRIMARY KEY (Id_plan  ASC,Identificador  ASC),
	CONSTRAINT  FK_Id_concesionaria_Planes_detalles FOREIGN KEY (id_concesionaria) REFERENCES concesionaria(id_concesionaria),
    CONSTRAINT  FK_Id_Persona_Planes_Detalles FOREIGN KEY (id_persona) REFERENCES Personas(id_persona),
    CONSTRAINT  FK_Nombre_Auto_o_Nro_Marca FOREIGN KEY (Nombre_Auto,Tipo_modelo,nro_marca) REFERENCES Autos(Nombre_Auto,Tipo_modelo,nro_marca)
	
)
go


CREATE TABLE Facturas
(
	nro_factura  integer  NOT NULL ,
	Estado  char(1)  NOT NULL ,
	Monto  money  NOT NULL ,
	Identificador varchar(20) NOT NULL,
	Fecha  date  NOT NULL ,
	Cobro  date  NOT NULL ,
	CONSTRAINT  PK_Facturas PRIMARY KEY (nro_factura  ASC,Identificador  ASC),

)
go



create TABLE Sorteo_detalles
(
	nro_sorteo  integer  NOT NULL ,
	id_persona  integer  NOT NULL ,
	Nombre  Varchar(30) NOT NULL,
	Apellido Varchar(30) NOT NULL,
	Identificador varchar(20)  NOT NULL ,
	Id_Consesionaria varchar(10) NOT NULL,
	Nombre_Auto   varchar(20) NOT NULL,
	Nro_Marca   Integer  NOT NULL,
	Tipo_Modelo varchar(20) NOT NULL,
	CONSTRAINT  PK_Sorteo_detalles PRIMARY KEY (nro_sorteo  ASC)

)
go







