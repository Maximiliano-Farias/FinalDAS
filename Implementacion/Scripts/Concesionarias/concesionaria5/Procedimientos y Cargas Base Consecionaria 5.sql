USE CONCESIONARIA5




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

--********************************CONCESIONARIA*******************************************--

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

------------------------------------------------------------------------------------


EXEC dbo.Insertar_Concesionaria
    @id_concesionaria = 'E1E1E1E1E1',
    @Nombre = 'Auto City', -- varchar(40)
    @Habilitado = '1', -- char(1)
    @Direccion = 'Av. Colon 3200', -- varchar(40)
    @Telefono = '0351-4333456', -- varchar(40)
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
 @Identificador  varchar(20)
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



EXEC dbo.Insertar_Persona @id_persona = 17456438, -- int
    @Nombre = 'Jorge Miguel', -- varchar(40)
    @Apellido = 'Cuadrado', -- varchar(40)
    @Direccion = 'Avenida Savio 341', -- varchar(40)
    @Mail = 'j.cuadrado@live.com.ar', -- varchar(40)
    @nro_identificador = 1, -- int
    @Telefono = '03571-15344533', -- varchar(18)
	@identificador='E1E1E1E1E11'

go



EXEC dbo.Insertar_Persona @id_persona = 33454573, -- int
    @Nombre = 'Miguel Ricardo', -- varchar(40)
    @Apellido = 'Juarez', -- varchar(40)
    @Direccion = 'Dean funes 368 ', -- varchar(40)
    @Mail = 'mrjuarez@hotmail.com', -- varchar(40)
    @nro_identificador = 1, -- int
    @Telefono = '03521-14543454', -- varchar(18)
	@identificador='E1E1E1E1E12'
go



EXEC dbo.Insertar_Persona @id_persona = 20245530, -- int
    @Nombre = 'Sonia Leandra', -- varchar(40)
    @Apellido = 'Perez', -- varchar(40)
    @Direccion = 'Sagrada Familia 338', -- varchar(40)
    @Mail = 'slperez@hotmail.com', -- varchar(40)
    @nro_identificador = 1, -- int
    @Telefono = '0351-15445758', -- varchar(18)
	@identificador='E1E1E1E1E13'

go
EXEC dbo.Insertar_Persona @id_persona = 21354441, -- int
    @Nombre = 'Ariel', -- varchar(40)
    @Apellido = 'Mitre', -- varchar(40)
    @Direccion = 'Rivera Indarte 222', -- varchar(40)
    @Mail = 'a.mitre@hotmail.com', -- varchar(40)
    @nro_identificador = 1, -- int
    @Telefono = '03571-14454566', -- varchar(18)
	@identificador='E1E1E1E1E14'
go
EXEC dbo.Insertar_Persona @id_persona = 23333712, -- int
    @Nombre = 'Milton Daniel', -- varchar(40)
    @Apellido = 'Ferreyra', -- varchar(40)
    @Direccion = 'Juan del Campillo 779', -- varchar(40)
    @Mail = 'mferreyra@hotmail.com', -- varchar(40)
    @nro_identificador = 1, -- int
    @Telefono = '0351-15445789', -- varchar(18)
	@identificador='E1E1E1E1E15'
go
--*********************ACTUALIZACIONES**************************************---

CREATE Procedure Insertar_Actualizaciones
(
  @fecha_actualizacion  datetime,
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
    @id_persona  int,
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
          @id_persona , -- id_persona - int
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




--**********************INSERTAR FACTURAS ****************************

DECLARE @nro_factura BIGINT
DECLARE @cantidad INT
DECLARE @fecha DATE
SET @nro_factura = 00112345231
SET @cantidad = 1
SET @fecha ='2016-11-10'
WHILE (@cantidad <=84)
BEGIN
INSERT INTO Facturas
SELECT @nro_factura + 1,case when @cantidad <32 THEN '1' else '0' END,7055.25, 'E1E1E1E1E11',@fecha,case when @cantidad <30 THEN case when DATEADD(day, -4, @fecha) > GETDATE() then DATEADD(day, -5, GETDATE())ELSE DATEADD(day, -3, @fecha) END   ELSE NULL END
SET @cantidad = @cantidad + 1
SET @nro_factura = @nro_factura + 1
SET @fecha = DATEADD(month, 1, @fecha);
END
GO



/************************************************************************/


DECLARE @nro_factura BIGINT
DECLARE @cantidad INT
DECLARE @fecha DATE
SET @nro_factura = 00114574643
SET @cantidad = 1
SET @fecha ='2016-05-10'
WHILE (@cantidad <=84)
BEGIN
INSERT INTO Facturas
SELECT @nro_factura + 1,case when @cantidad <12 THEN '1' else '0' END,8150.25, 'E1E1E1E1E12',@fecha,case when @cantidad <30 THEN case when DATEADD(day, -4, @fecha) > GETDATE() then DATEADD(day, -5, GETDATE())ELSE DATEADD(day, -3, @fecha) END   ELSE NULL END
SET @cantidad = @cantidad + 1
SET @nro_factura = @nro_factura + 1
SET @fecha = DATEADD(month, 1, @fecha);
END
GO


/*******************************************************************/

DECLARE @nro_factura BIGINT
DECLARE @cantidad INT
DECLARE @fecha DATE
SET @nro_factura = 0011455674
SET @cantidad = 1
SET @fecha ='2016-10-10'
WHILE (@cantidad <=84)
BEGIN
INSERT INTO Facturas
SELECT @nro_factura + 1,case when @cantidad <28 THEN '1' else '0' END,8150.25, 'E1E1E1E1E13',@fecha,case when @cantidad <30 THEN case when DATEADD(day, -4, @fecha) > GETDATE() then DATEADD(day, -8, GETDATE())ELSE DATEADD(day, -5, @fecha) END   ELSE NULL END
SET @cantidad = @cantidad + 1
SET @nro_factura = @nro_factura + 1
SET @fecha = DATEADD(month, 1, @fecha);
END
GO


/*******************************************************************/

DECLARE @nro_factura BIGINT
DECLARE @cantidad INT
DECLARE @fecha DATE
SET @nro_factura = 00112356344
SET @cantidad = 1
SET @fecha ='2016-08-10'
WHILE (@cantidad <=84)
BEGIN
INSERT INTO Facturas
SELECT @nro_factura + 1,case when @cantidad <34 THEN '1' else '0' END,4550.25, 'E1E1E1E1E14',@fecha,case when @cantidad <30 THEN case when DATEADD(day, -4, @fecha) > GETDATE() then DATEADD(day, -8, GETDATE())ELSE DATEADD(day, -5, @fecha) END   ELSE NULL END
SET @cantidad = @cantidad + 1
SET @nro_factura = @nro_factura + 1
SET @fecha = DATEADD(month, 1, @fecha);
END
GO


/*******************************************************************/

DECLARE @nro_factura BIGINT
DECLARE @cantidad INT
DECLARE @fecha DATE
SET @nro_factura = 0011561913
SET @cantidad = 1
SET @fecha ='2016-09-10'
WHILE (@cantidad <=84)
BEGIN
INSERT INTO Facturas
SELECT @nro_factura + 1,case when @cantidad <37 THEN '1' else '0' END,6550.50, 'E1E1E1E1E15',@fecha,case when @cantidad <30 THEN case when DATEADD(day, -4, @fecha) > GETDATE() then DATEADD(day, -10, GETDATE())ELSE DATEADD(day, -3, @fecha) END   ELSE NULL END
SET @cantidad = @cantidad + 1
SET @nro_factura = @nro_factura + 1
SET @fecha = DATEADD(month, 1, @fecha);
END
GO

--**************************Datos_Concesionaria************************

create procedure datos_concesionaria
AS
select *
from Concesionaria
GO

--**************************Datos_Planes************************

create procedure datos_planes
AS
select  *
from Planes_detalles
GO

--***************************Datos_Facturas**********************

create procedure datos_facturas
AS
select  *
from Facturas
GO

--****************************Datos_Personas***********************

create procedure datos_personas
AS
select  *
from personas
GO

--****************************ACTUALIZAR  GANADOR*********************
CREATE Procedure Ganador
(   
     @Identificador varchar(20)
    
)
AS
update Facturas 
set Estado = 1,Cobro=GETDATE()
where Identificador = @Identificador

go


--************************ INSERTAR GANADOR **************************

create Procedure Insertar_Detalle_Sorteo
(
     @nro_sorteo  INT,
     @id_persona  INT,
	 @Nombre Varchar(30),
	 @Apellido Varchar(30),
	 @Identificador varchar(20),
	 @id_consecionaria  varchar(10),
	 @Nombre_Auto varchar(20),
	 @Nro_Marca  INT,
	 @Tipo_Modelo varchar(20)
	 

)
AS


INSERT INTO dbo.Sorteo_detalles
        (  nro_sorteo,
			id_persona  ,
			Nombre,
			Apellido,
			Identificador ,
			Id_Consesionaria  ,
			Nombre_Auto ,
			Nro_Marca  ,
			Tipo_Modelo 
        )
VALUES  ( @nro_sorteo  ,
     @id_persona  ,
	 @Nombre,
	 @Apellido,
	 @Identificador ,
	 @id_consecionaria  ,
	 @Nombre_Auto ,
	 @Nro_Marca  ,
	 @Tipo_Modelo     )
GO





















