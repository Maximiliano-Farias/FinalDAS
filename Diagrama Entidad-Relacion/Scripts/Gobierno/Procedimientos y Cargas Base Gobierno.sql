USE GOBIERNO




go
-------------------------------- INSERT POR DEFECTO------------------------------------

INSERT INTO dbo.Identificadores
        ( descripcion )
VALUES  ( 'DNI'  -- descripcion - char(18)
          ),
( 'CUIT'  -- descripcion - char(18)
          ),
( 'CUIL'  -- descripcion - char(18)
          ),
( 'NIE'  -- descripcion - char(18)
          )
go

--********************************CONCESIONARIAS*******************************************--

create Procedure Insertar_Concesionaria
(
 @id_concesionaria  varchar(10),
 @Nombre varchar(40),
 @Habilitado varchar(1),
 @Direccion varchar(40),
 @Telefono  varchar(40),
 @Email varchar(40)

)
as
insert into dbo.Concesionaria
        ( id_concesionaria,
		  Nombre ,
          Habilitado ,
          Direccion ,
          Telefono,
		  Email
        )
VALUES  ( @id_concesionaria,
          @Nombre , -- Nombre - varchar(40)
          @Habilitado , -- Habilitado - char(1)
          @Direccion , -- Direccion - varchar(40)
          @Telefono,  -- Telefono - varchar(40)
          @Email
	    ) 
GO
--------------------------------------------------------------------------------------

create Procedure Update_Concesionaria
(
 @id_concesionaria varchar(40),
 @Nombre VARCHAR(30),
 @Habilitado VARCHAR(1),
 @Direccion VARCHAR(50),
 @Telefono VARCHAR(20)
)

as
UPDATE dbo.Concesionaria
SET Habilitado = @Habilitado,Nombre=@Nombre,Direccion = @Direccion,Telefono=@Telefono
WHERE id_concesionaria = @id_concesionaria
GO

------------------------------------------------------------------------------------


EXEC dbo.Insertar_Concesionaria
    @id_concesionaria = 'A1A1A1A1A1',
    @Nombre = 'Mundo Maipu Cordoba', -- varchar(40)
    @Habilitado = '1', -- char(1)
    @Direccion = 'Av. Colón 4000, CBA CAPITAL', -- varchar(40)
    @Telefono = '0351-4859610', -- varchar(40)
	@Email = 'maxi.f@live.com.ar'
go

EXEC dbo.Insertar_Concesionaria
    @id_concesionaria = 'B1B1B1B1B1',
    @Nombre = 'PETTI FORD RIO TERCERO', -- varchar(40)
    @Habilitado = '1', -- char(1)
    @Direccion = 'AVENIDA SAVIO 211', -- varchar(40)
    @Telefono = '03571-434782', -- varchar(40)
	@Email = 'maxi.f@live.com.ar'
go

--********************************PERSONA*******************************************--
create Procedure Insertar_Persona
(
 @id_persona  INT,
 @Nombre varchar(40),
 @Apellido varchar(40),
 @Direccion varchar(40),
 @Mail varchar(40),
 @nro_identificador INT,
 @Telefono  varchar(18),
 @Identificador varchar(20)
)
as
INSERT INTO dbo.Personas
        ( id_persona ,
          Nombre ,
          Apellido ,
          Direccion ,
          Mail ,
          nro_identificador ,
          Telefono,
		  Identificador
        )
VALUES  ( @id_persona , -- id_persona - int
          @Nombre , -- Nombre - varchar(40)
          @Apellido , -- Apellido - varchar(40)
          @Direccion , -- Direccion - varchar(40)
          @Mail , -- Mail - varchar(40)
          @nro_identificador, -- nro_identificador - int
          @Telefono,  -- Telefono - varchar(18)
		  @Identificador
        )
GO

EXEC dbo.Insertar_Persona @id_persona = 37525605, -- int
    @Nombre = 'Eduardo Martin', -- varchar(40)
    @Apellido = 'Farias', -- varchar(40)
    @Direccion = 'Atahualpa Yupanqui 784', -- varchar(40)
    @Mail = 'edu@live.com.ar', -- varchar(40)
    @nro_identificador = 1, -- int
    @Telefono = '03571-15415853', -- varchar(18)
	@Identificador = 'A1A1A1A1A12'
go





EXEC dbo.Insertar_Persona @id_persona = 20078920, -- int
    @Nombre = 'Gabriela Rosanna', -- varchar(40)
    @Apellido = 'Quiroga', -- varchar(40)
    @Direccion = 'Atahulpa yupanqui 784', -- varchar(40)
    @Mail = 'gabyquiroga1@hotmail.com', -- varchar(40)
    @nro_identificador = 1, -- int
    @Telefono = '03571-15513157', -- varchar(18)
	@Identificador = 'A1A1A1A1A13'
go
EXEC dbo.Insertar_Persona @id_persona = 20345643, -- int
    @Nombre = 'Pedro Ernesto', -- varchar(40)
    @Apellido = 'Fernandez', -- varchar(40)
    @Direccion = 'Av. Colon 222', -- varchar(40)
    @Mail = 'p.fernandez@hotmail.com', -- varchar(40)
    @nro_identificador = 1, -- int
    @Telefono = '03571-153456543', -- varchar(18)
	@Identificador = 'A1A1A1A1A11'
go



EXEC dbo.Insertar_Persona @id_persona = 17834564, -- int
    @Nombre = 'Marcos Jose', -- varchar(40)
    @Apellido = 'Perez', -- varchar(40)
    @Direccion = 'Avenida Savio 211', -- varchar(40)
    @Mail = 'm.perez@live.com.ar', -- varchar(40)
    @nro_identificador = 1, -- int
    @Telefono = '03571-15344333', -- varchar(18)
	@Identificador = 'B1B1B1B1B14'
go



EXEC dbo.Insertar_Persona @id_persona = 33784567, -- int
    @Nombre = 'Manuel Alejandro', -- varchar(40)
    @Apellido = 'Velez', -- varchar(40)
    @Direccion = 'Dean funes 368 1B', -- varchar(40)
    @Mail = 'alejandro.perez@hotmail.com', -- varchar(40)
    @nro_identificador = 1, -- int
    @Telefono = '03571-15663454', -- varchar(18)
	@Identificador = 'B1B1B1B1B12'
go



EXEC dbo.Insertar_Persona @id_persona = 20245920, -- int
    @Nombre = 'Sonia Lorena', -- varchar(40)
    @Apellido = 'Rosaroli', -- varchar(40)
    @Direccion = 'Rio limay 338', -- varchar(40)
    @Mail = 's.rosaroli@hotmail.com', -- varchar(40)
    @nro_identificador = 1, -- int
    @Telefono = '03571-15415758', -- varchar(18)
	@Identificador = 'B1B1B1B1B13'
go
EXEC dbo.Insertar_Persona @id_persona = 20356433, -- int
    @Nombre = 'Miguel', -- varchar(40)
    @Apellido = 'Jasni', -- varchar(40)
    @Direccion = 'San Martin 222', -- varchar(40)
    @Mail = 'miguel.j@hotmail.com', -- varchar(40)
    @nro_identificador = 1, -- int
    @Telefono = '03571-15344564', -- varchar(18)
	@Identificador = 'B1B1B1B1B11'
go
EXEC dbo.Insertar_Persona @id_persona = 37525606, -- int
    @Nombre = 'Nahuel', -- varchar(40)
    @Apellido = 'Bustos', -- varchar(40)
    @Direccion = 'Balcarce 331', -- varchar(40)
    @Mail = 'nahubustos@hotmail.com', -- varchar(40)
    @nro_identificador = 1, -- int
    @Telefono = '03571-15456789', -- varchar(18)
    @Identificador = 'B1B1B1B1B15'
go



--*****************************************USUARIOS***************************************--



CREATE Procedure Insertar_Usuario
(
 @Nombre_usuario varchar(18),
 @Clave varchar(18),
 @Identificador varchar(20)
)
as
INSERT INTO dbo.Personas_Usuarios
        ( Nombre_usuario ,
          Clave ,
		  Identificador,
          activo
        )
VALUES  ( @Nombre_usuario , -- Nombre_usuario - varchar(18)
          @Clave , -- Clave - varchar(18)
		  @Identificador ,
          '1'  -- activo - char(1)
        )
GO

------------------------------------------------------------------------------------

create Procedure Set_Estado_Usuario
(
 @Nombre_usuario varchar(18),
 @activo  char(1)
)
as

UPDATE dbo.Personas_Usuarios
SET activo = @activo
WHERE Nombre_usuario = @Nombre_usuario
GO



--************************************* AVISO*********************************--

create Procedure Insertar_Aviso
(
  @titulo varchar(30),
  @descripcion  varchar(1000),
  @prioridad  INT,
  @url  varchar(30),
  @id_concesionaria varchar(10),
  @Identificador  varchar(10)
)
as
INSERT INTO dbo.Avisos
        ( titulo ,
          descripcion ,
          prioridad ,
          url ,
          id_concesionaria ,
          Identificador
        )
VALUES  ( @titulo , -- titulo - varchar(30)
          @descripcion , -- descripcion - varchar(1000)
          @prioridad , -- prioridad - int
          @url , -- url - varchar(30)
          @id_concesionaria , -- id_concesionaria - int
          @Identificador  -- Nombre_usuario - varchar(18)
        )

GO
--------------------------------------------------------------------------------------

create Procedure Borrar_Aviso
(
  @titulo varchar(30)
)
as
DELETE FROM dbo.Avisos
WHERE titulo = @titulo
GO

--*****************************************SORTEO************************************

create Procedure Insertar_Sorteo
(
   @Fecha_Sorteo  DATE,
   @Descripcion  varchar(200),
   @Estado       varchar(1)
   
)
AS

INSERT INTO dbo.Sorteos
        ( Fecha_sorteo, Descripcion, Estado )
VALUES  ( @Fecha_Sorteo, -- Fecha_sorteo - datetime
          @Descripcion, -- Descripcion - varchar(200)
          @Estado  -- Estado - char(1)
          )
GO
-------------------------------------------------------------------------------------

create PROCEDURE Update_Sorteo
(  @nro_sorteo    INTEGER,
   @Fecha_Sorteo  DATE,
   @Estado  char(1),
   @Descripcion VARCHAR(30)
)
AS

UPDATE dbo.Sorteos
SET Fecha_sorteo = @Fecha_Sorteo, Estado = @Estado,Descripcion = @Descripcion
WHERE nro_sorteo = @nro_sorteo
GO

-------------------------------------------------------------------------------------

CREATE PROCEDURE Set_Estado_Sorteo
(
   @Fecha_Sorteo  DATETIME,
   @Estado  char(1)
)
AS

UPDATE dbo.Sorteos
SET Estado = @Estado
WHERE Fecha_sorteo = @Fecha_Sorteo
GO


--****************************************ERRORES SORTEO**************************--


CREATE PROCEDURE Insertar_Error_Sorteo
(
    @nro_sorteo INT,
    @Descripcion varchar(50)
)
AS

INSERT INTO dbo.Errores_Sorteos
        ( nro_sorteo, Descripcion )
VALUES  ( @nro_sorteo, -- nro_sorteo - int
          @Descripcion  -- Descripcion - varchar(50)
          )
GO

--***************************************PERMISOS*********************************
go
INSERT INTO dbo.Permisos
        ( nro_permiso, descripcion )
VALUES  ( 'admin', -- nro_permiso - varchar(18)
          'administrador, con permiso total'  -- descripcion - varchar(50)
          ),
		( 'consulta', -- nro_permiso - varchar(18)
          'usuario de consulta'  -- descripcion - varchar(50)
          ),
		( 'intermedio', -- nro_permiso - varchar(18)
          'usuario con algunos permisos de insert '  -- descripcion - varchar(50)
          )
		  
go
--***************************************USUARIO PERMISOS*************************



CREATE Procedure Insertar_Permisos_Usuarios
(
 @Identificador varchar(20),
 @nro_permiso  varchar(18),
 @detalle  varchar(150)
)
AS

INSERT INTO dbo.Usuarios_Permisos
        ( Identificador ,
          nro_permiso ,
          detalle
        )
VALUES  ( @Identificador , -- Nombre_usuario - varchar(18)
          @nro_permiso , -- nro_permiso - varchar(18)
          @detalle  -- detalle - varchar(150)
        )
GO


--**********************************************ACTULIZACIONES***********************

create Procedure Insertar_Actualizaciones
(
  @fecha_actualizacion  date,
  @Completado  char(1),
  @id_concesionaria  varchar(10)
)
AS

INSERT INTO dbo.Actualizaciones
        ( fecha_actualizacion ,
          Completado ,
          id_concesionaria
        )
VALUES  ( @fecha_actualizacion , -- fecha_actualizacion - datetime
          @Completado , -- Completado - char(1)
          @id_concesionaria  -- id_concesionaria - int
        )
GO

--****************************************SORTEO DETALLES************************************

create Procedure Insertar_Detalle_Sorteo
(
     @nro_sorteo  INT,
     @id_persona  INT,
	 @Identificador varchar(20),
	 @id_consecionaria  varchar(10),
	 @Nombre_Auto varchar(20),
     @Notificado  char(1),
	 @Nro_Marca  INT,
	 @Tipo_Modelo varchar(20),
     @Fecha_notificacion  datetime
	 

)
AS


INSERT INTO dbo.Sorteo_detalles
        (  nro_sorteo,
			id_persona  ,
			Identificador ,
			Id_Consesionaria  ,
			Nombre_Auto ,
			Notificado  ,
			Nro_Marca  ,
			Tipo_Modelo ,
			Fecha_notificacion  
        )
VALUES  ( @nro_sorteo  ,
     @id_persona  ,
	 @Identificador ,
	 @id_consecionaria  ,
	 @Nombre_Auto ,
     @Notificado  ,
	 @Nro_Marca  ,
	 @Tipo_Modelo,
     @Fecha_notificacion         )
GO



--***********************************CONCESIONARIAS_ACTUALLIZACIONES***********

alter Procedure Insertar_Concesionaria_Actualizacion
(
    @id_concesionaria  varchar(10),
    @Fecha_actualizacion  date
)
AS


INSERT INTO dbo.concesionarias_actualizaciones
        ( id_concesionaria ,
          Fecha_actualizacion
        )
VALUES  ( @id_concesionaria , -- id_concesionaria - int
          @Fecha_actualizacion  -- Fecha_actualizacion - datetime
        )

GO

--********************************MARCAS************************************

CREATE Procedure Insertar_Marca
(
    @Nombre varchar(18)
)
AS

INSERT INTO dbo.Marcas
        ( Nombre )
VALUES  ( @Nombre  -- Nombre - varchar(18)
          )
GO



---------------------------------------------------------------------------
EXEC dbo.Insertar_Marca @Nombre = 'FIAT' -- varchar(18)
go
EXEC dbo.Insertar_Marca @Nombre = 'FORD' -- varchar(18)
go
EXEC dbo.Insertar_Marca @Nombre = 'VOLKSWAGEN' -- varchar(18)
go
EXEC dbo.Insertar_Marca @Nombre = 'RENAULT' -- varchar(18)
go
EXEC dbo.Insertar_Marca @Nombre = 'CHEVROLET' -- varchar(18)
go

--*************************************AUTOS-------------------------------

CREATE Procedure Insertar_Auto
(
     @Nombre_Auto  varchar(20),
     @Tipo_modelo  varchar(20),
     @nro_marca  int
)
AS

INSERT INTO dbo.Autos
        ( Nombre_Auto ,
          Tipo_modelo ,
          nro_marca
        )
VALUES  ( @Nombre_Auto , -- Nombre_Auto - varchar(20)
          @Tipo_modelo , -- Tipo_modelo - varchar(20)
          @nro_marca  -- nro_marca - int
        )
GO

----------------------------------------------------------------------------


EXEC dbo.Insertar_Auto @Nombre_Auto = 'PALIO', -- varchar(20)
    @Tipo_modelo = 'FIRE 1.4 3P', -- varchar(20)
    @nro_marca = 1 -- int
go
EXEC dbo.Insertar_Auto @Nombre_Auto = 'IDEA', -- varchar(20)
    @Tipo_modelo = 'ADVENTURE 1.4 5P', -- varchar(20)
    @nro_marca = 1 -- int
go
EXEC dbo.Insertar_Auto @Nombre_Auto = 'IDEA', -- varchar(20)
    @Tipo_modelo = 'ADVENTURE LOOK 1.4 5P', -- varchar(20)
    @nro_marca = 1 -- int
go
EXEC dbo.Insertar_Auto @Nombre_Auto = 'SIENA', -- varchar(20)
    @Tipo_modelo = 'FIRE 1.4 TOP', -- varchar(20)
    @nro_marca = 1 -- int
go
EXEC dbo.Insertar_Auto @Nombre_Auto = 'SIENA', -- varchar(20)
    @Tipo_modelo = 'FIRE 1.4 LS', -- varchar(20)
    @nro_marca = 1 -- int
go
EXEC dbo.Insertar_Auto @Nombre_Auto = 'SIENA', -- varchar(20)
    @Tipo_modelo = 'FIRE 1.4 LX', -- varchar(20)
    @nro_marca = 1 -- int
go
EXEC dbo.Insertar_Auto @Nombre_Auto = 'ARGO', -- varchar(20)
    @Tipo_modelo = '1.4 TOP', -- varchar(20)
    @nro_marca = 1 -- int
go
EXEC dbo.Insertar_Auto @Nombre_Auto = 'ARGO', -- varchar(20)
    @Tipo_modelo = '1.4 LS', -- varchar(20)
    @nro_marca = 1 -- int
go
EXEC dbo.Insertar_Auto @Nombre_Auto = 'ARGO', -- varchar(20)
    @Tipo_modelo = '1.4 LX', -- varchar(20)
    @nro_marca = 1 -- int
go


EXEC dbo.Insertar_Auto @Nombre_Auto = 'FIESTA', -- varchar(20)
    @Tipo_modelo = 'MAX 1.6 NAFTA', -- varchar(20)
    @nro_marca = 2 -- int
go
EXEC dbo.Insertar_Auto @Nombre_Auto = 'KA', -- varchar(20)
    @Tipo_modelo = 'KINETIC 1.3', -- varchar(20)
    @nro_marca = 2 -- int
go
EXEC dbo.Insertar_Auto @Nombre_Auto = 'KA', -- varchar(20)
    @Tipo_modelo = 'KINETIC LS 1.3', -- varchar(20)
    @nro_marca = 2 -- int
go
EXEC dbo.Insertar_Auto @Nombre_Auto = 'KA', -- varchar(20)
    @Tipo_modelo = 'KINETIC LX 1.3', -- varchar(20)
    @nro_marca = 2 -- int
go

EXEC dbo.Insertar_Auto @Nombre_Auto = 'Ecosport', -- varchar(20)
    @Tipo_modelo = 'KINETIC LS 1.3', -- varchar(20)
    @nro_marca = 2 -- int
go
EXEC dbo.Insertar_Auto @Nombre_Auto = 'Ecosport', -- varchar(20)
    @Tipo_modelo = 'KINETIC LX 1.3', -- varchar(20)
    @nro_marca = 2 -- int
go
EXEC dbo.Insertar_Auto @Nombre_Auto = 'Ecosport', -- varchar(20)
    @Tipo_modelo = 'KINETIC LT 1.3', -- varchar(20)
    @nro_marca = 2 -- int
go
EXEC dbo.Insertar_Auto @Nombre_Auto = 'GOL', -- varchar(20)
    @Tipo_modelo = 'TREND PACK III', -- varchar(20)
    @nro_marca = 3 -- int
go
EXEC dbo.Insertar_Auto @Nombre_Auto = 'GOL', -- varchar(20)
    @Tipo_modelo = 'TREND PACK II', -- varchar(20)
    @nro_marca = 3 -- int
go
EXEC dbo.Insertar_Auto @Nombre_Auto = 'GOL', -- varchar(20)
    @Tipo_modelo = 'TREND PACK I', -- varchar(20)
    @nro_marca = 3 -- int
go
EXEC dbo.Insertar_Auto @Nombre_Auto = 'SURAN', -- varchar(20)
    @Tipo_modelo = 'CONFORTLINE', -- varchar(20)
    @nro_marca = 3 -- int
go

EXEC dbo.Insertar_Auto @Nombre_Auto = 'FOX', -- varchar(20)
    @Tipo_modelo = 'CONFORTLINE', -- varchar(20)
    @nro_marca = 3 -- int
go

EXEC dbo.Insertar_Auto @Nombre_Auto = 'FOX', -- varchar(20)
    @Tipo_modelo = 'HIGLINE', -- varchar(20)
    @nro_marca = 3 -- int
go

EXEC dbo.Insertar_Auto @Nombre_Auto = 'SPIN', -- varchar(20)
    @Tipo_modelo = 'LT', -- varchar(20)
    @nro_marca = 5 -- int
go
EXEC dbo.Insertar_Auto @Nombre_Auto = 'SPIN', -- varchar(20)
    @Tipo_modelo = 'Ls', -- varchar(20)
    @nro_marca = 5 -- int
go
EXEC dbo.Insertar_Auto @Nombre_Auto = 'SPIN', -- varchar(20)
    @Tipo_modelo = 'LTZ', -- varchar(20)
    @nro_marca = 5 -- int
go
EXEC dbo.Insertar_Auto @Nombre_Auto = 'CRUZE', -- varchar(20)
    @Tipo_modelo = 'LT', -- varchar(20)
    @nro_marca = 5 -- int
go
EXEC dbo.Insertar_Auto @Nombre_Auto = 'CRUZE', -- varchar(20)
    @Tipo_modelo = 'Ls', -- varchar(20)
    @nro_marca = 5 -- int
go
EXEC dbo.Insertar_Auto @Nombre_Auto = 'CRUZE', -- varchar(20)
    @Tipo_modelo = 'LTZ', -- varchar(20)
    @nro_marca = 5 -- int
go
EXEC dbo.Insertar_Auto @Nombre_Auto = 'AGILE', -- varchar(20)
    @Tipo_modelo = 'LT', -- varchar(20)
    @nro_marca = 5 -- int
go
EXEC dbo.Insertar_Auto @Nombre_Auto = 'AGILE', -- varchar(20)
    @Tipo_modelo = 'Ls', -- varchar(20)
    @nro_marca = 5 -- int
go
EXEC dbo.Insertar_Auto @Nombre_Auto = 'AGILE', -- varchar(20)
    @Tipo_modelo = 'LTZ', -- varchar(20)
    @nro_marca = 5 -- int
go

EXEC dbo.Insertar_Auto @Nombre_Auto = 'CLIO MIO', -- varchar(20)
    @Tipo_modelo = 'BASE', -- varchar(20)
    @nro_marca = 4 -- int
go

EXEC dbo.Insertar_Auto @Nombre_Auto = 'CLIO MIO', -- varchar(20)
    @Tipo_modelo = 'Expression 3p', -- varchar(20)
    @nro_marca = 4 -- int
go

EXEC dbo.Insertar_Auto @Nombre_Auto = 'CLIO MIO', -- varchar(20)
    @Tipo_modelo = 'CONFORT 3p', -- varchar(20)
    @nro_marca = 4 -- int
go
EXEC dbo.Insertar_Auto @Nombre_Auto = 'CLIO MIO', -- varchar(20)
    @Tipo_modelo = 'Expression 5p', -- varchar(20)
    @nro_marca = 4 -- int
go

EXEC dbo.Insertar_Auto @Nombre_Auto = 'CLIO MIO', -- varchar(20)
    @Tipo_modelo = 'CONFORT 5p', -- varchar(20)
    @nro_marca = 4 -- int
go

EXEC dbo.Insertar_Auto @Nombre_Auto = 'FLUENCE', -- varchar(20)
    @Tipo_modelo = 'Expression ', -- varchar(20)
    @nro_marca = 4 -- int
go

EXEC dbo.Insertar_Auto @Nombre_Auto = 'FLUENCE', -- varchar(20)
    @Tipo_modelo = 'CONFORT ', -- varchar(20)
    @nro_marca = 4 -- int
go





--*******************************PLANES DETALLES***********************************


CREATE Procedure Insertar_Planes
(   @Identificador  varchar(20),
    @id_concesionaria  varchar(10),
	@id_persona integer ,
    @Nombre_Auto  varchar(20),
    @nro_marca  int,
	@Tipo_modelo  varchar(20)
)
AS

INSERT INTO dbo.Planes_detalles
        ( Identificador,
		  id_concesionaria ,
		  id_persona ,
          Nombre_Auto ,
          nro_marca,
		  Tipo_modelo
        )
VALUES  ( 
          @Identificador  ,
          @id_concesionaria , -- id_concesionaria - int
		  @id_persona,
          @Nombre_Auto , -- Nombre_Auto - varchar(20)
          @nro_marca,  -- nro_marca - int
		  @Tipo_modelo
        )
       
GO


--******************************************FACTURAS****************************

CREATE Procedure Insertar_Facturas
(    @nro_factura INT,
     @Estado char(1),
     @Monto  money,
     @Identificador varchar(20),
     @Fecha  DATE
)
AS

INSERT INTO dbo.Facturas
        ( nro_factura ,
          Estado ,
          Monto ,
          Identificador ,
          Fecha 
        )
VALUES  ( @nro_factura , -- nro_factura - int
          @Estado , -- Estado - char(1)
          @Monto , -- Monto - money
          @Identificador, --  Varchar(20)
          @Fecha  -- Fecha - datetime
        )
GO
--******************************************ITEMS FACTURA***************************

CREATE Procedure Insertar_Items_Facturas
(    @nro_item  INT,
     @Descripcion  varchar(20)
)
AS

INSERT INTO dbo.Items
        ( nro_item, Descripcion )
VALUES  ( @nro_item, -- nro_item - int
          @Descripcion  -- Descripcion - varchar(20)
          )   
GO




--***********************DATOS USUARIO LOGUEO*********************************

create PROCEDURE Logueo
(
     @Usuario  VARCHAR(20),
     @Clave  VARCHAR(20)
)
AS
SELECT  usuario = p.Apellido + ', '+ P.Nombre,user_name=PU.Nombre_usuario,permiso=UP.nro_permiso,PU.Identificador,P.id_persona
FROM dbo.Personas_Usuarios PU JOIN dbo.Personas P
ON P.Identificador = PU.Identificador
JOIN Usuarios_Permisos UP
ON UP.Identificador = PU.Identificador
WHERE pu.Nombre_usuario = @Usuario
AND PU.Clave = @Clave
GROUP BY P.Nombre,P.Apellido,P.id_persona,PU.Nombre_usuario,UP.nro_permiso,PU.Identificador


GO





--**********************INSERTAR PLAN DETALLE--********************

exec Insertar_Planes 'A1A1A1A1A11','A1A1A1A1A1',20345643,'GOL',3,'TREND PACK III'
go
exec Insertar_Planes 'A1A1A1A1A12','A1A1A1A1A1',37525605,'CRUZE',5,'LTZ'
go
exec Insertar_Planes 'A1A1A1A1A13','A1A1A1A1A1',20078920,'ARGO',1,'1.4 LX'
go
exec Insertar_Planes 'B1B1B1B1B11','B1B1B1B1B1',20356433,'KA',2,'KINETIC LX 1.3'
go
exec Insertar_Planes 'B1B1B1B1B12','B1B1B1B1B1',33784567,'KA',2,'KINETIC LX 1.3'
go
exec Insertar_Planes 'B1B1B1B1B13','B1B1B1B1B1',20245920,'Ecosport',2,'KINETIC LT 1.3'
go
exec Insertar_Planes 'B1B1B1B1B14','B1B1B1B1B1',17834564,'Fiesta',2,'MAX 1.6 NAFTA'
go
exec Insertar_Planes 'B1B1B1B1B15','B1B1B1B1B1',37525606,'KA',2,'KINETIC LX 1.3'
go



-----------------INSERTAR SORTEO PRUEBA----------------------------

insert into Sorteos values ('05-09-2018','Primer Sorteo','F')
go
insert into Sorteos values ('10-09-2018','Segundo Sorteo','E')
go

exec Insertar_Detalle_Sorteo '1','37525605','A1A1A1A1A12','A1A1A1A1A1','Gol','S','3','TREND PACK III','05-09-2018'


insert into Errores_Sorteos values ('2','NO todas las concesionarias fueron actualizadas')
go

--**********************OBTENER ULTIMO SORTEO**********************

create PROCEDURE Ultimo_Sorteo
AS
select TOP 1 Fecha_sorteo=convert(varchar(10), S.Fecha_sorteo, 103),S.Descripcion,Estado = case when S.Estado = 'F' then 'FINALIZADO' WHEN S.Estado = 'N' then 'NO NOTIFICADO'  WHEN S.Estado = 'P'then 'PROGRAMADO' WHEN S.Estado = 'E'then 'CON ERROR' END,Ganador = P.Apellido +', '+P.Nombre,Nombre_Auto,C.Nombre AS Consesionaria,M.Nombre AS Marca,SD.Tipo_Modelo
from Sorteo_detalles SD JOIN Personas P
ON P.id_persona = SD.id_persona
JOIN Concesionaria C
ON C.id_concesionaria = SD.Id_Consesionaria
JOIN Sorteos S
ON SD.nro_sorteo = S.nro_sorteo
JOIN Marcas M
ON M.nro_marca = SD.nro_marca
order by Fecha_sorteo DESC
GO

--***********************OBTENER CANTIDAD DE CONCESIONARIOS************************
create PROCEDURE Cantidad_Concesionarios
AS
select habilitado,Cantidad= COUNT(*)
from Concesionaria
group by Habilitado
GO

--***********************OBTENER CANTIDAD DE PLANES************************
create PROCEDURE Cantidad_Planes
AS
select Count(*) Cantidad_Planes
from Planes_detalles
GO

--***************************OBTENER CANTIDAD DE AUTOS VENDIDOS******************
create PROCEDURE Autos_Vendidos
AS
select TOP 10 M.Nombre,Nombre_Auto,Tipo_modelo,COUNT(*) AS Cantidad
from Planes_detalles PD JOIN Marcas M
ON M.nro_marca = PD.nro_marca
group by Nombre_Auto,Tipo_modelo,M.Nombre
GO
/********************PROCEDIMIENTO PARA SORTEOS ANTERIORES**************/

alter PROCEDURE Detalle_Sorteo
(@nro_sorteo  Integer)
AS
select  Fecha_sorteo=convert(varchar(10), Fecha_sorteo, 103),S.Descripcion,Estado,ISNULL(C.Nombre,'-') AS Concesionaria,ISNULL(SD.Nombre_Auto,'-')AS Nombre_Auto,ISNULL(SD.Tipo_Modelo,'-')As Tipo_Modelo,ISNULL(convert(varchar(10), Fecha_notificacion, 103),'-')As Fecha_Notificacion,ISNULL(P.Nombre+' '+P.Apellido,'-')AS Ganador,ISNULL(ES.Descripcion,'-')AS Error
from Sorteos S
FULL JOIN Sorteo_detalles SD
ON S.nro_sorteo = SD.nro_sorteo
FULL JOIN Errores_Sorteos ES
ON ES.nro_sorteo = S.nro_sorteo
FULL JOIN Personas P
ON p.id_persona = SD.id_persona
FULL JOIN Concesionaria C
ON C.id_concesionaria =SD.Id_Consesionaria
WHERE S.nro_sorteo = @nro_sorteo

go
/*******************OBTENER SORTEO PARA CABECERA********************************/
create procedure Obtener_Sorteos
AS
select nro_sorteo,Fecha=convert(varchar(10), Fecha_sorteo, 103),Descripcion
from Sorteos
where Estado <> 'P'
order by Fecha_sorteo DESC

go

/***********************OBTENER CONCESIONARIAS HABILITADAS************************/

create procedure Obtener_Concesionarias
AS
select id_concesionaria,Nombre
from Concesionaria
order by Nombre

go


/*******************PROCEDIMIENTO PARA DATOS DE  LA CONCESIONARIA**************/
create procedure Detalles_Concesionaria
(
    @id_concesionaria varchar(10)
)
AS
select TOP 1 C.Nombre,C.id_concesionaria,Habilitado,Direccion,Telefono,Fecha_actualizacion=convert(varchar(10), Fecha_actualizacion, 103)
from Concesionaria C  LEFT JOIN concesionarias_actualizaciones CA
ON C.id_concesionaria = CA.id_concesionaria
where C.id_concesionaria = @id_concesionaria
ORDER BY Fecha_actualizacion DESC
go 


/*******************CREAR OBTENER SORTEOS PENDIENTES *************/

EXEC Insertar_Sorteo '2018-10-05', 'SORTEO PENDIENTE','P'
go
create procedure SORTEOS_PENDIENTES
AS
select nro_sorteo,Fecha_sorteo=convert(varchar(10), Fecha_sorteo, 103),Descripcion,Estado
from Sorteos
where Estado IN ('P','A')
order by Fecha_sorteo DESC
go



/*******************DETALLES DEL SORTEO PROGRAMADO ****************/


create procedure SORTEOS_PENDIENTES_DETALLES
(@nro_sorteo integer)
AS
select nro_sorteo,Fecha_sorteo = convert(varchar(10), Fecha_sorteo, 103), Descripcion,Estado
from Sorteos
where Estado IN ('P','A')
AND nro_sorteo = @nro_sorteo
go



/*******************OBTENER DATOS PERSONALES******************************/

create procedure Obtener_Datos_personales
(@Identificador varchar(20))
AS
select *
from Personas
where Identificador = @Identificador

go

/*****************ACTUALIZAR DATOS PERSONALES*****************************/

create procedure Actualizar_Datos_personales
(
 @Identificador varchar(20),
 @Direccion varchar(50),
 @Mail varchar(50),
 @Telefono varchar(50)
 )
AS
update personas
set direccion = @Direccion, Mail = @Mail, Telefono = @Telefono
where Identificador = @Identificador
GO

/*************************** DATOS PARA INSERTAR DESDE CONCESIONARIA **********/



SELECT *
FROM Facturas

SELECT *
FROM Facturas_detalles

select *
from Planes_detalles

select *
from Planes_detalles

select *
from Autos

select *
from Marcas


select *
from Concesionaria

select *
from Facturas



--**********************INSERTAR FACTURAS--********************
exec Insertar_Facturas '0024561914','1','8150.25','A1A1A1A1A11','2018-07-30'
go
exec Insertar_Facturas '0024561919','1','8150.25','A1A1A1A1A11','2018-08-30'
go
exec Insertar_Facturas '0029831919','1','8200.25','A1A1A1A1A11','2018-09-30'
go
exec Insertar_Facturas '0029291919','0','8500.25','A1A1A1A1A11','2018-10-30'
go
exec Insertar_Facturas '0029291230','0','8400.85','A1A1A1A1A11','2018-11-30'
go
exec Insertar_Facturas '0029291402','0','8400.85','A1A1A1A1A11','2018-12-30'
go
exec Insertar_Facturas '0029923302','0','8450.85','A1A1A1A1A11','2019-01-30'
go
exec Insertar_Facturas '0029295678','0','5600.85','A1A1A1A1A11','2019-02-28'
go
exec Insertar_Facturas '0029293345','0','5700.20','A1A1A1A1A11','2019-03-30'
go
exec Insertar_Facturas '0029291432','0','8400.85','A1A1A1A1A11','2019-04-29'
go
exec Insertar_Facturas '0027923302','0','8450.85','A1A1A1A1A11','2019-05-30'
go
exec Insertar_Facturas '0029295978','0','5600.85','A1A1A1A1A11','2019-06-29'
go
exec Insertar_Facturas '0029295345','0','5700.20','A1A1A1A1A11','2019-07-30'
go
/************************************************************************/

exec Insertar_Facturas '0024561919','1','8150.25','A1A1A1A1A12','2018-07-30'
go
exec Insertar_Facturas '0035561919','1','8150.25','A1A1A1A1A12','2018-08-30'
go
exec Insertar_Facturas '0024831919','1','8200.25','A1A1A1A1A12','2018-09-30'
go
exec Insertar_Facturas '0025291919','1','8500.25','A1A1A1A1A12','2018-10-30'
go
exec Insertar_Facturas '0023491230','1','8400.85','A1A1A1A1A12','2018-11-30'
go
exec Insertar_Facturas '0039291402','1','8400.85','A1A1A1A1A12','2018-12-30'
go
exec Insertar_Facturas '0042923302','1','8450.85','A1A1A1A1A12','2019-01-30'
go
exec Insertar_Facturas '0044295678','0','5600.85','A1A1A1A1A12','2019-02-28'
go
exec Insertar_Facturas '0012293345','0','5700.20','A1A1A1A1A12','2019-03-30'
go
exec Insertar_Facturas '0030291432','0','8400.85','A1A1A1A1A12','2019-04-29'
go
exec Insertar_Facturas '0030923302','0','8450.85','A1A1A1A1A12','2019-05-30'
go
exec Insertar_Facturas '0030295978','0','5600.85','A1A1A1A1A12','2019-06-29'
go
exec Insertar_Facturas '0031295345','0','5700.20','A1A1A1A1A12','2019-07-30'
go
/*******************************************************************/


exec Insertar_Facturas '0011561913','1','8130.25','A1A1A1A1A13','2018-07-30'
go
exec Insertar_Facturas '0011561919','0','8150.25','A1A1A1A1A13','2018-08-30'
go
exec Insertar_Facturas '0011831919','0','8200.25','A1A1A1A1A13','2018-09-30'
go
exec Insertar_Facturas '0011291919','0','8500.25','A1A1A1A1A13','2018-10-30'
go
exec Insertar_Facturas '0011491230','0','8400.85','A1A1A1A1A13','2018-11-30'
go
exec Insertar_Facturas '0011291402','0','8400.85','A1A1A1A1A13','2018-12-30'
go
exec Insertar_Facturas '0011923302','0','8450.85','A1A1A1A1A13','2019-01-30'
go
exec Insertar_Facturas '0011295678','0','5600.85','A1A1A1A1A13','2019-02-28'
go
exec Insertar_Facturas '0011293345','0','5700.20','A1A1A1A1A13','2019-03-30'
go
exec Insertar_Facturas '0011291432','0','8400.85','A1A1A1A1A13','2019-04-29'
go
exec Insertar_Facturas '0011923307','0','8450.85','A1A1A1A1A13','2019-05-30'
go
exec Insertar_Facturas '0011295978','0','5600.85','A1A1A1A1A13','2019-06-29'
go
exec Insertar_Facturas '0011295345','0','5700.20','A1A1A1A1A13','2019-07-30'

exec Insertar_Facturas '0024561914','1','8150.25','B1B1B1B1B11','2018-07-30'
go
exec Insertar_Facturas '0024561919','1','8150.25','B1B1B1B1B11','2018-08-30'
go
exec Insertar_Facturas '0029831919','1','8200.25','B1B1B1B1B11','2018-09-30'
go
exec Insertar_Facturas '0029291919','0','8500.25','B1B1B1B1B11','2018-10-30'
go
exec Insertar_Facturas '0029291230','0','8400.85','B1B1B1B1B11','2018-11-30'
go
exec Insertar_Facturas '0029291402','0','8400.85','B1B1B1B1B11','2018-12-30'
go
exec Insertar_Facturas '0029923302','0','8450.85','B1B1B1B1B11','2019-01-30'
go
exec Insertar_Facturas '0029295678','0','5600.85','B1B1B1B1B11','2019-02-28'
go
exec Insertar_Facturas '0029293345','0','5700.20','B1B1B1B1B11','2019-03-30'
go
exec Insertar_Facturas '0029291432','0','8400.85','B1B1B1B1B11','2019-04-29'
go
exec Insertar_Facturas '0027923302','0','8450.85','B1B1B1B1B11','2019-05-30'
go
exec Insertar_Facturas '0029295978','0','5600.85','B1B1B1B1B11','2019-06-29'
go
exec Insertar_Facturas '0029295345','0','5700.20','B1B1B1B1B11','2019-07-30'
go
/************************************************************************/

exec Insertar_Facturas '0024561919','1','8150.25','B1B1B1B1B12','2018-07-30'
go
exec Insertar_Facturas '0035561919','1','8150.25','B1B1B1B1B12','2018-08-30'
go
exec Insertar_Facturas '0024831919','1','8200.25','B1B1B1B1B12','2018-09-30'
go
exec Insertar_Facturas '0025291919','1','8500.25','B1B1B1B1B12','2018-10-30'
go
exec Insertar_Facturas '0023491230','1','8400.85','B1B1B1B1B12','2018-11-30'
go
exec Insertar_Facturas '0039291402','1','8400.85','B1B1B1B1B12','2018-12-30'
go
exec Insertar_Facturas '0042923302','1','8450.85','B1B1B1B1B12','2019-01-30'
go
exec Insertar_Facturas '0044295678','0','5600.85','B1B1B1B1B12','2019-02-28'
go
exec Insertar_Facturas '0012293345','0','5700.20','B1B1B1B1B12','2019-03-30'
go
exec Insertar_Facturas '0030291432','0','8400.85','B1B1B1B1B12','2019-04-29'
go
exec Insertar_Facturas '0030923302','0','8450.85','B1B1B1B1B12','2019-05-30'
go
exec Insertar_Facturas '0030295978','0','5600.85','B1B1B1B1B12','2019-06-29'
go
exec Insertar_Facturas '0031295345','0','5700.20','B1B1B1B1B12','2019-07-30'
go
/*******************************************************************/


exec Insertar_Facturas '0011561913','1','8130.25','B1B1B1B1B13','2018-07-30'
go
exec Insertar_Facturas '0011561919','0','8150.25','B1B1B1B1B13','2018-08-30'
go
exec Insertar_Facturas '0011831919','0','8200.25','B1B1B1B1B13','2018-09-30'
go
exec Insertar_Facturas '0011291919','0','8500.25','B1B1B1B1B13','2018-10-30'
go
exec Insertar_Facturas '0011491230','0','8400.85','B1B1B1B1B13','2018-11-30'
go
exec Insertar_Facturas '0011291402','0','8400.85','B1B1B1B1B13','2018-12-30'
go
exec Insertar_Facturas '0011923302','0','8450.85','B1B1B1B1B13','2019-01-30'
go
exec Insertar_Facturas '0011295678','0','5600.85','B1B1B1B1B13','2019-02-28'
go
exec Insertar_Facturas '0011293345','0','5700.20','B1B1B1B1B13','2019-03-30'
go
exec Insertar_Facturas '0011291432','0','8400.85','B1B1B1B1B13','2019-04-29'
go
exec Insertar_Facturas '0011923307','0','8450.85','B1B1B1B1B13','2019-05-30'
go
exec Insertar_Facturas '0011295978','0','5600.85','B1B1B1B1B13','2019-06-29'
go
exec Insertar_Facturas '0011295345','0','5700.20','B1B1B1B1B13','2019-07-30'
go

/******************************************************************************/
exec Insertar_Facturas '0011561913','1','6500.25','B1B1B1B1B14','2018-07-30'
go
exec Insertar_Facturas '0011561919','1','6510.25','B1B1B1B1B14','2018-08-30'
go
exec Insertar_Facturas '0011831919','1','6700.25','B1B1B1B1B14','2018-09-30'
go
exec Insertar_Facturas '0011291919','1','7100.25','B1B1B1B1B14','2018-10-30'
go
exec Insertar_Facturas '0011491230','1','7100.85','B1B1B1B1B14','2018-11-30'
go
exec Insertar_Facturas '0011291402','1','7150.85','B1B1B1B1B14','2018-12-30'
go
exec Insertar_Facturas '0011923302','1','7250.85','B1B1B1B1B14','2019-01-30'
go
exec Insertar_Facturas '0011295678','0','7250.85','B1B1B1B1B14','2019-02-28'
go
exec Insertar_Facturas '0011293345','0','7250.20','B1B1B1B1B14','2019-03-30'
go
exec Insertar_Facturas '0011291432','0','7260.85','B1B1B1B1B14','2019-04-29'
go
exec Insertar_Facturas '0011923307','0','7450.85','B1B1B1B1B14','2019-05-30'
go
exec Insertar_Facturas '0011295978','0','7700.85','B1B1B1B1B14','2019-06-29'
go
exec Insertar_Facturas '0011295345','0','7700.20','B1B1B1B1B14','2019-07-30'
go
exec Insertar_Facturas '0011291433','0','7260.85','B1B1B1B1B14','2019-08-29'
go
exec Insertar_Facturas '0011923308','0','7450.85','B1B1B1B1B14','2019-09-30'
go
exec Insertar_Facturas '0011295979','0','7700.85','B1B1B1B1B14','2019-10-29'
go
exec Insertar_Facturas '0011295346','0','7700.20','B1B1B1B1B14','2019-11-30'
go

/***************************************************************************/
exec Insertar_Facturas '0011561913','1','6500.25','B1B1B1B1B15','2018-07-30'
go
exec Insertar_Facturas '0011561919','1','6510.25','B1B1B1B1B15','2018-08-30'
go
exec Insertar_Facturas '0011831919','1','6700.25','B1B1B1B1B15','2018-09-30'
go
exec Insertar_Facturas '0011291919','1','7100.25','B1B1B1B1B15','2018-10-30'
go
exec Insertar_Facturas '0011491230','1','7100.85','B1B1B1B1B15','2018-11-30'
go
exec Insertar_Facturas '0011291402','1','7150.85','B1B1B1B1B15','2018-12-30'
go
exec Insertar_Facturas '0011923302','1','7250.85','B1B1B1B1B15','2019-01-30'
go
exec Insertar_Facturas '0011295678','0','7250.85','B1B1B1B1B15','2019-02-28'
go
exec Insertar_Facturas '0011293345','0','7250.20','B1B1B1B1B15','2019-03-30'
go
exec Insertar_Facturas '0011291432','0','7260.85','B1B1B1B1B15','2019-04-29'
go
exec Insertar_Facturas '0011923307','0','7450.85','B1B1B1B1B15','2019-05-30'
go
exec Insertar_Facturas '0011295978','0','7700.85','B1B1B1B1B15','2019-06-29'
go
exec Insertar_Facturas '0011295345','0','7700.20','B1B1B1B1B15','2019-07-30'
go
exec Insertar_Facturas '0011291433','0','7260.85','B1B1B1B1B15','2019-08-29'
go
exec Insertar_Facturas '0011923308','0','7450.85','B1B1B1B1B15','2019-09-30'
go
exec Insertar_Facturas '0011295979','0','7700.85','B1B1B1B1B15','2019-10-29'
go
exec Insertar_Facturas '0011295346','0','7700.20','B1B1B1B1B15','2019-11-30'



/************************* OBTENER ESTADO DE CUENTA *****************/

create procedure Obtener_Estado_Cuenta 
(
@Identificador varchar(20)
)
AS
select F.nro_factura, Estado = case when F.Estado = '0' then 'ADEUDADO' when F.Estado = '1' then 'PAGADA'END, F.Fecha,F.Monto
from Planes_detalles PD  JOIN Facturas F
ON PD.Identificador = F.Identificador
JOIN Personas P
ON P.id_persona = PD.id_persona
where P.Identificador = @Identificador
ORDER BY FECHA ASC

GO


/*********************************OBTENER DEUDA*************************************/

create procedure Obtener_Monto_Adeudado
(
@Identificador Varchar(20)
)
AS
select SUM (F.Monto) AS Monto_Adeudado
from Planes_detalles PD  JOIN Facturas F
ON PD.Identificador = F.Identificador
JOIN Personas P
ON P.id_persona = PD.id_persona
where P.Identificador = @Identificador
AND F.ESTADO = 0
GO

/***********************************DATOS PLAN ***************************************/

create procedure Obtener_DATOS_PLAN
(
@Identificador varchar(20)
)
AS


select TOP 1 Nombre_Auto,Tipo_modelo,C.Nombre,c.id_concesionaria,CA.Fecha_actualizacion
from planes_detalles PD
JOIN CONCESIONARIA C
ON C.id_concesionaria = PD.id_concesionaria
JOIN concesionarias_actualizaciones CA
ON CA.id_concesionaria = C.id_concesionaria
WHERE Identificador = @Identificador
order by CA.Fecha_actualizacion DESC

GO

/************************************DATOS CONCESIONARIAS ****************************/

alter procedure Obtener_Concesionarias_habilitadas
AS
select Nombre, Direccion,Telefono
from concesionaria
where habilitado = 1
order by Nombre ASC
GO

-------------------------------------------------------------------------------------

EXECUTE dbo.Insertar_Usuario @Nombre_usuario = 'maxi', -- varchar(18)
    @Clave = 'maxi', -- varchar(18)
	@Identificador = 'A1A1A1A1A12'
go

----------------------------------------------------------------------------

EXEC dbo.Insertar_Permisos_Usuarios @Identificador = 'A1A1A1A1A12', -- varchar(18)
    @nro_permiso = 'admin', -- varchar(18)
    @detalle = 'propietario del sistema y administrador' -- varchar(150)
go


-------------------------------------------------------------------------------------

select TOP 1 Nombre_Auto,Tipo_modelo,C.Nombre,c.id_concesionaria,CA.Fecha_actualizacion
from planes_detalles PD
JOIN CONCESIONARIA C
ON C.id_concesionaria = PD.id_concesionaria
JOIN concesionarias_actualizaciones CA
ON CA.id_concesionaria = C.id_concesionaria
ORDER BY Fecha_actualizacion DESC

--------------------------------------------------------------------------------------

select TOP 1 Nombre_Auto,Tipo_modelo,C.Nombre,c.id_concesionaria,CA.Fecha_actualizacion
from planes_detalles PD
JOIN CONCESIONARIA C
ON C.id_concesionaria = PD.id_concesionaria
JOIN concesionarias_actualizaciones CA
ON CA.id_concesionaria = C.id_concesionaria
WHERE Identificador = @Identificador
order by CA.Fecha_actualizacion DESC



--***********************ALTA DE USUARIO INEXISTENTE***********************

CREATE PROCEDURE EXISTE_PERSONA(

@Identificador Varchar(20),
@id_persona Varchar(20)

)AS
select EXISTE = case when COUNT(*) > 0 Then 'SI' Else 'NO' End 
from Personas
where id_persona = @id_persona
AND Identificador = @Identificador
group by id_persona,Identificador



CREATE PROCEDURE EXISTE_USUARIO(
@Identificador Varchar(20)
)AS
select EXISTE = case when COUNT(*) > 0 Then 'SI' Else 'NO' End 
from Personas_Usuarios
where Identificador = @Identificador
group by Identificador

//**********************************BUSCADOR DE PLANES PARA ADMIN******************//
create Procedure Buscador_Planes(
@texto varchar(30)
)
AS
select P.id_persona,P.Identificador,P.Apellido,P.Nombre,PD.Nombre_Auto,PD.Tipo_modelo
from Personas P join Planes_detalles PD
ON P.Identificador = PD.Identificador
where P.id_persona like '%'+@texto+'%'
OR Nombre like '%'+@texto+'%'
OR Apellido like '%'+@texto+'%'
OR P.Identificador like '%'+@texto+'%'


//***********************************VALIDAR USUARIO **********************************/

create Procedure Valida_Usuario(
@usuario varchar(20)
)
AS
select Existe=CASE WHEN SUM(1) IS NULL THEN 0 ELSE 1 END
from Personas_Usuarios
where Nombre_usuario = @usuario



//******************************OBTIENE SORTEO PARA HACER****************************************/

create procedure A_Sortear
AS
select top 1 nro_sorteo,Fecha_sorteo=convert(varchar(10), Fecha_sorteo, 103),Descripcion,Estado
from Sorteos
where Estado = 'P'
order by Fecha_sorteo ASC
go


























