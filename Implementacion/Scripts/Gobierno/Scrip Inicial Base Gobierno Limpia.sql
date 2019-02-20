--SCRIPT PARA EJECUTAR DIRECTAMENTE

use GOBIERNO

/*
DROP TABLE Facturas
DROP TABLE concesionarias_actualizaciones
DROP TABLE Actualizaciones
DROP TABLE Usuarios_Permisos
DROP TABLE Permisos
DROP TABLE Errores_Sorteos
DROP TABLE Sorteo_detalles
DROP TABLE Sorteos
DROP TABLE Personas_Usuarios
DROP TABLE Personas
DROP TABLE Identificadores
DROP TABLE Planes_detalles
DROP TABLE Autos
DROP TABLE Marcas
DROP TABLE Concesionaria

--********** BORRAR PROCEDIMINETOS*********************

declare @procName varchar(500)

declare cur cursor 



for select [name] from sys.objects where type = 'p'

open cur

fetch next from cur into @procName

while @@fetch_status = 0

begin

    exec('drop procedure ' + @procName)

    fetch next from cur into @procName

end

close cur

deallocate cur

*/

CREATE TABLE Concesionaria
(
	id_concesionaria  varchar(10) ,
	Nombre  varchar(40)  NOT NULL ,
	Habilitado  varchar(1)  NOT NULL ,
	Direccion  varchar(40) NOT NULL ,
	Telefono  varchar(40) NOT NULL ,
	Email  varchar(40) NOT NULL ,
	Servicio varchar (20) NOT NULL,
	direccion_url varchar(70) NOT NULL,
	Metodo varchar(20) NOT NULL,
	Metodo_pago varchar(20) NOT NULL
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
	Identificador varchar(20)  NOT NULL ,
	CONSTRAINT  PK_Documento_Personas PRIMARY KEY (Identificador  ASC),
	CONSTRAINT  FK_Tipo_Identificador FOREIGN KEY (nro_identificador) REFERENCES Identificadores(nro_identificador)
)
go




CREATE TABLE Sorteos
(
	nro_sorteo  integer  NOT NULL identity (1,1),
	Fecha_sorteo  date NOT NULL ,
	Fecha_original date NOT NULL ,
	Descripcion  varchar(200) NOT NULL ,
	Estado  char(1)  NOT NULL ,
	CONSTRAINT  PK_nro_sorteo PRIMARY KEY (nro_sorteo  ASC)
)
go



CREATE TABLE Errores_Sorteos
(
	nro_sorteo  integer  NOT NULL ,
	Descripcion  varchar(50)  NULL ,
	CONSTRAINT  PK_Errores_Sorteos PRIMARY KEY (nro_sorteo  ASC),
	CONSTRAINT  FK_nro_sorteo FOREIGN KEY (nro_sorteo) REFERENCES Sorteos(nro_sorteo)

)
go


CREATE TABLE Permisos
(
	nro_permiso  varchar(18)  NOT NULL  ,
	descripcion  varchar(50)  NOT NULL ,
	CONSTRAINT  PK_Permisos PRIMARY KEY (nro_permiso  ASC)
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
    
	id_concesionaria varchar(10)  NOT NULL ,
	Identificador varchar(20) NOT NULL,
	Nombre_Auto  varchar(20) NOT NULL ,
	nro_marca  integer  NOT NULL ,
	id_persona integer NOT NULL,
	Tipo_modelo  varchar(20) NOT NULL,
	CONSTRAINT  PK_Planes_detalles PRIMARY KEY (  Identificador  ASC),
	CONSTRAINT  FK_Id_concesionaria_Planes_detalles FOREIGN KEY (id_concesionaria) REFERENCES concesionaria(id_concesionaria),
    CONSTRAINT  FK_Nombre_Auto_o_Nro_Marca FOREIGN KEY (Nombre_Auto,Tipo_modelo,nro_marca) REFERENCES Autos(Nombre_Auto,Tipo_modelo,nro_marca)
	
)
go


create TABLE Personas_Usuarios 
(
	Clave  varchar(18)  NOT NULL ,
	activo  char(1) NOT NULL,
	Identificador varchar(20) NOT NULL,
	Nombre_usuario varchar(20) NOT NULL,
	CONSTRAINT  PK_Personas_Usuarios PRIMARY KEY (Nombre_usuario ),
	CONSTRAINT  FK_Id_Plan_Permisos FOREIGN KEY (Identificador) REFERENCES Planes_detalles(Identificador)
)
go





create TABLE Usuarios_Permisos
(
	Identificador varchar(20) NOT NULL, 
	nro_permiso  varchar(18)  NOT NULL ,
	detalle  varchar(150)  NULL default NULL ,
	CONSTRAINT  PK_Usuarios_Permisos PRIMARY KEY (Identificador  ASC,nro_permiso  ASC),
   CONSTRAINT  FK_Nro_Permiso FOREIGN KEY (nro_permiso) REFERENCES Permisos(nro_permiso)

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




CREATE TABLE concesionarias_actualizaciones
(
	id_concesionaria varchar(10)  NOT NULL ,
	Fecha_actualizacion  date NOT  NULL ,
	Fecha_Notificada  date NOT  NULL ,
	CONSTRAINT  PK_concesionarias_actualizaciones PRIMARY KEY (id_concesionaria  ASC , Fecha_actualizacion ASC),
	CONSTRAINT  FK_Id_concesionarias_actualizaciones FOREIGN KEY (id_concesionaria) REFERENCES concesionaria(id_concesionaria)
)
go




CREATE TABLE Sorteo_detalles
(
	nro_sorteo  integer  NOT NULL ,
	id_persona  integer  NOT NULL ,
	Identificador varchar(20)  NOT NULL ,
	Id_Consesionaria varchar(10) NOT NULL,
	Nombre_Auto   varchar(20) NOT NULL,
	Notificado  char(1)  NOT NULL default 'N' ,
	Nro_Marca   Integer  NOT NULL,
	Tipo_Modelo varchar(20) NOT NULL,
	Fecha_notificacion  date   NULL ,
	CONSTRAINT  PK_Sorteo_detalles PRIMARY KEY (nro_sorteo  ASC),
	CONSTRAINT  FK_Nro_Sorteo_detalle FOREIGN KEY (nro_sorteo) REFERENCES Sorteos(nro_sorteo),
    CONSTRAINT  FK_Id_plan_sorteo_detalle FOREIGN KEY (Identificador) REFERENCES Planes_detalles(Identificador),
	CONSTRAINT  FK_Id_Consesionaria_sorteo_detalle FOREIGN KEY (Id_Consesionaria) REFERENCES  Concesionaria(id_concesionaria),

)
go



CREATE TABLE Facturas
(
	nro_factura  integer  NOT NULL ,
	Estado  char(1)  NOT NULL ,
	Monto  money  NOT NULL ,
	Identificador varchar(20) NOT NULL,
	Fecha  date  NOT NULL ,
	Cobro  date  NULL ,
	CONSTRAINT  PK_Facturas PRIMARY KEY (nro_factura  ASC,Identificador  ASC),

)
go









