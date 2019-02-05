USE CONCESIONARIA4




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
    @id_concesionaria = 'D1D1D1D1D1',
    @Nombre = 'Montironi Fiat', -- varchar(40)
    @Habilitado = '1', -- char(1)
    @Direccion = 'Av. Colon 2100', -- varchar(40)
    @Telefono = '0351-4333551', -- varchar(40)
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
 @Telefono  varchar(18)
)
as
INSERT INTO dbo.Personas
        ( id_persona ,
          Nombre ,
          Apellido ,
          Direccion ,
          Mail ,
          nro_identificador ,
          Telefono
        )
VALUES  ( @id_persona , -- id_persona - int
          @Nombre , -- Nombre - varchar(40)
          @Apellido , -- Apellido - varchar(40)
          @Direccion , -- Direccion - varchar(40)
          @Mail , -- Mail - varchar(40)
          @nro_identificador, -- nro_identificador - int
          @Telefono  -- Telefono - varchar(18)
        )
GO


EXEC dbo.Insertar_Persona @id_persona = 17456433, -- int
    @Nombre = 'Pedro Jose', -- varchar(40)
    @Apellido = 'Centeno', -- varchar(40)
    @Direccion = 'Avenida Savio 341', -- varchar(40)
    @Mail = 'p.centeno@live.com.ar', -- varchar(40)
    @nro_identificador = 1, -- int
    @Telefono = '03571-15344533' -- varchar(18)

go



EXEC dbo.Insertar_Persona @id_persona = 33454568, -- int
    @Nombre = 'Alejandro', -- varchar(40)
    @Apellido = 'Gonzalez', -- varchar(40)
    @Direccion = 'Dean funes 368 ', -- varchar(40)
    @Mail = 'A.gonzalez@hotmail.com', -- varchar(40)
    @nro_identificador = 1, -- int
    @Telefono = '03521-14543454' -- varchar(18)
go



EXEC dbo.Insertar_Persona @id_persona = 20245525, -- int
    @Nombre = 'Patricia', -- varchar(40)
    @Apellido = 'Perez', -- varchar(40)
    @Direccion = 'Sagrada Familia 338', -- varchar(40)
    @Mail = 'peperez@hotmail.com', -- varchar(40)
    @nro_identificador = 1, -- int
    @Telefono = '0351-15445758' -- varchar(18)

go
EXEC dbo.Insertar_Persona @id_persona = 21354436, -- int
    @Nombre = 'Nicolas', -- varchar(40)
    @Apellido = 'Rivera', -- varchar(40)
    @Direccion = 'Rivera Indarte 222', -- varchar(40)
    @Mail = 'nico.rivera@hotmail.com', -- varchar(40)
    @nro_identificador = 1, -- int
    @Telefono = '03571-14454566' -- varchar(18)
go
EXEC dbo.Insertar_Persona @id_persona = 23333707, -- int
    @Nombre = 'Nestor Daniel', -- varchar(40)
    @Apellido = 'Ceballos', -- varchar(40)
    @Direccion = 'Juan del Campillo 779', -- varchar(40)
    @Mail = 'nceballos@hotmail.com', -- varchar(40)
    @nro_identificador = 1, -- int
    @Telefono = '0351-15445789' -- varchar(18)
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



--**********************INSERTAR PLAN DETALLE--********************

exec Insertar_Planes 'D1D1D1D1D11','D1D1D1D1D1',17456433,'PALIO',1,'FIRE 1.4 3P'
go
exec Insertar_Planes 'D1D1D1D1D12','D1D1D1D1D1',33454568,'PALIO',1,'FIRE 1.4 3P'
go
exec Insertar_Planes 'D1D1D1D1D13','D1D1D1D1D1',20245525,'SIENA',1,'FIRE 1.4 LS'
go
exec Insertar_Planes 'D1D1D1D1D14','D1D1D1D1D1',21354436,'SIENA',1,'FIRE 1.4 LS'
go
exec Insertar_Planes 'D1D1D1D1D15','D1D1D1D1D1',23333707,'ARGO',1,'1.4 TOP'
go



--**********************INSERTAR FACTURAS--********************
exec Insertar_Facturas '0024561914','1','8150.25','D1D1D1D1D11','2018-07-30'
go
exec Insertar_Facturas '0024561919','1','8150.25','D1D1D1D1D11','2018-08-30'
go
exec Insertar_Facturas '0029831919','1','8200.25','D1D1D1D1D11','2018-09-30'
go
exec Insertar_Facturas '0029291919','0','8500.25','D1D1D1D1D11','2018-10-30'
go
exec Insertar_Facturas '0029291230','0','8400.85','D1D1D1D1D11','2018-11-30'
go
exec Insertar_Facturas '0029291402','0','8400.85','D1D1D1D1D11','2018-12-30'
go
exec Insertar_Facturas '0029923302','0','8450.85','D1D1D1D1D11','2019-01-30'
go
exec Insertar_Facturas '0029295678','0','5600.85','D1D1D1D1D11','2019-02-28'
go
exec Insertar_Facturas '0029293345','0','5700.20','D1D1D1D1D11','2019-03-30'
go
exec Insertar_Facturas '0029291432','0','8400.85','D1D1D1D1D11','2019-04-29'
go
exec Insertar_Facturas '0027923302','0','8450.85','D1D1D1D1D11','2019-05-30'
go
exec Insertar_Facturas '0029295978','0','5600.85','D1D1D1D1D11','2019-06-29'
go
exec Insertar_Facturas '0029295345','0','5700.20','D1D1D1D1D11','2019-07-30'
go
/************************************************************************/

exec Insertar_Facturas '0024561919','1','8150.25','D1D1D1D1D12','2018-07-30'
go
exec Insertar_Facturas '0035561919','1','8150.25','D1D1D1D1D12','2018-08-30'
go
exec Insertar_Facturas '0024831919','1','8200.25','D1D1D1D1D12','2018-09-30'
go
exec Insertar_Facturas '0025291919','1','8500.25','D1D1D1D1D12','2018-10-30'
go
exec Insertar_Facturas '0023491230','1','8400.85','D1D1D1D1D12','2018-11-30'
go
exec Insertar_Facturas '0039291402','1','8400.85','D1D1D1D1D12','2018-12-30'
go
exec Insertar_Facturas '0042923302','1','8450.85','D1D1D1D1D12','2019-01-30'
go
exec Insertar_Facturas '0044295678','0','5600.85','D1D1D1D1D12','2019-02-28'
go
exec Insertar_Facturas '0012293345','0','5700.20','D1D1D1D1D12','2019-03-30'
go
exec Insertar_Facturas '0030291432','0','8400.85','D1D1D1D1D12','2019-04-29'
go
exec Insertar_Facturas '0030923302','0','8450.85','D1D1D1D1D12','2019-05-30'
go
exec Insertar_Facturas '0030295978','0','5600.85','D1D1D1D1D12','2019-06-29'
go
exec Insertar_Facturas '0031295345','0','5700.20','D1D1D1D1D12','2019-07-30'
go
/*******************************************************************/


exec Insertar_Facturas '0011561913','1','8130.25','D1D1D1D1D13','2018-07-30'
go
exec Insertar_Facturas '0011561919','0','8150.25','D1D1D1D1D13','2018-08-30'
go
exec Insertar_Facturas '0011831919','0','8200.25','D1D1D1D1D13','2018-09-30'
go
exec Insertar_Facturas '0011291919','0','8500.25','D1D1D1D1D13','2018-10-30'
go
exec Insertar_Facturas '0011491230','0','8400.85','D1D1D1D1D13','2018-11-30'
go
exec Insertar_Facturas '0011291402','0','8400.85','D1D1D1D1D13','2018-12-30'
go
exec Insertar_Facturas '0011923302','0','8450.85','D1D1D1D1D13','2019-01-30'
go
exec Insertar_Facturas '0011295678','0','5600.85','D1D1D1D1D13','2019-02-28'
go
exec Insertar_Facturas '0011293345','0','5700.20','D1D1D1D1D13','2019-03-30'
go
exec Insertar_Facturas '0011291432','0','8400.85','D1D1D1D1D13','2019-04-29'
go
exec Insertar_Facturas '0011923307','0','8450.85','D1D1D1D1D13','2019-05-30'
go
exec Insertar_Facturas '0011295978','0','5600.85','D1D1D1D1D13','2019-06-29'
go
exec Insertar_Facturas '0011295345','0','5700.20','D1D1D1D1D13','2019-07-30'
go

/******************************************************************************/
exec Insertar_Facturas '0011561913','1','6500.25','D1D1D1D1D14','2018-07-30'
go
exec Insertar_Facturas '0011561919','1','6510.25','D1D1D1D1D14','2018-08-30'
go
exec Insertar_Facturas '0011831919','1','6700.25','D1D1D1D1D14','2018-09-30'
go
exec Insertar_Facturas '0011291919','1','7100.25','D1D1D1D1D14','2018-10-30'
go
exec Insertar_Facturas '0011491230','1','7100.85','D1D1D1D1D14','2018-11-30'
go
exec Insertar_Facturas '0011291402','1','7150.85','D1D1D1D1D14','2018-12-30'
go
exec Insertar_Facturas '0011923302','1','7250.85','D1D1D1D1D14','2019-01-30'
go
exec Insertar_Facturas '0011295678','0','7250.85','D1D1D1D1D14','2019-02-28'
go
exec Insertar_Facturas '0011293345','0','7250.20','D1D1D1D1D14','2019-03-30'
go
exec Insertar_Facturas '0011291432','0','7260.85','D1D1D1D1D14','2019-04-29'
go
exec Insertar_Facturas '0011923307','0','7450.85','D1D1D1D1D14','2019-05-30'
go
exec Insertar_Facturas '0011295978','0','7700.85','D1D1D1D1D14','2019-06-29'
go
exec Insertar_Facturas '0011295345','0','7700.20','D1D1D1D1D14','2019-07-30'
go
exec Insertar_Facturas '0011291433','0','7260.85','D1D1D1D1D14','2019-08-29'
go
exec Insertar_Facturas '0011923308','0','7450.85','D1D1D1D1D14','2019-09-30'
go
exec Insertar_Facturas '0011295979','0','7700.85','D1D1D1D1D14','2019-10-29'
go
exec Insertar_Facturas '0011295346','0','7700.20','D1D1D1D1D14','2019-11-30'
go

/***************************************************************************/
exec Insertar_Facturas '0011561913','1','6500.25','D1D1D1D1D15','2018-07-30'
go
exec Insertar_Facturas '0011561919','1','6510.25','D1D1D1D1D15','2018-08-30'
go
exec Insertar_Facturas '0011831919','1','6700.25','D1D1D1D1D15','2018-09-30'
go
exec Insertar_Facturas '0011291919','1','7100.25','D1D1D1D1D15','2018-10-30'
go
exec Insertar_Facturas '0011491230','1','7100.85','D1D1D1D1D15','2018-11-30'
go
exec Insertar_Facturas '0011291402','1','7150.85','D1D1D1D1D15','2018-12-30'
go
exec Insertar_Facturas '0011923302','1','7250.85','D1D1D1D1D15','2019-01-30'
go
exec Insertar_Facturas '0011295678','1','7250.85','D1D1D1D1D15','2019-02-28'
go
exec Insertar_Facturas '0011293345','1','7250.20','D1D1D1D1D15','2019-03-30'
go
exec Insertar_Facturas '0011291432','1','7260.85','D1D1D1D1D15','2019-04-29'
go
exec Insertar_Facturas '0011923307','1','7450.85','D1D1D1D1D15','2019-05-30'
go
exec Insertar_Facturas '0011295978','0','7700.85','D1D1D1D1D15','2019-06-29'
go
exec Insertar_Facturas '0011295345','0','7700.20','D1D1D1D1D15','2019-07-30'
go
exec Insertar_Facturas '0011291433','0','7260.85','D1D1D1D1D15','2019-08-29'
go
exec Insertar_Facturas '0011923308','0','7450.85','D1D1D1D1D15','2019-09-30'
go
exec Insertar_Facturas '0011295979','0','7700.85','D1D1D1D1D15','2019-10-29'
go
exec Insertar_Facturas '0011295346','0','7700.20','D1D1D1D1D15','2019-11-30'
go
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
select  P.*,PD.Identificador
from personas P JOIN Planes_detalles PD
ON P.id_persona = PD.id_persona 
GO

--****************************ACTUALIZAR  GANADOR*********************
CREATE Procedure Ganador
(   
     @Identificador varchar(20)
    
)
AS
update Facturas 
set Estado = 1
where Identificador = @Identificador



















