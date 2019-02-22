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
 @Email varchar(40),
 @Servicio varchar (20),
 @direccion_url varchar(70) ,
 @Metodo varchar(20) ,
 @Metodo_pago varchar(20) 

)
as
insert into dbo.Concesionaria
        ( id_concesionaria,
		  Nombre ,
          Habilitado ,
          Direccion ,
          Telefono,
		  Email,
		  Servicio,
		  direccion_url,
		  Metodo,
		  Metodo_pago
        )
VALUES  ( @id_concesionaria,
          @Nombre , -- Nombre - varchar(40)
          @Habilitado , -- Habilitado - char(1)
          @Direccion , -- Direccion - varchar(40)
          @Telefono,  -- Telefono - varchar(40)
          @Email,
		  @Servicio,
		  @direccion_url,
		  @Metodo,
		  @Metodo_pago
	    ) 
GO
--------------------------------------------------------------------------------------

create Procedure Update_Concesionaria
(
 @id_concesionaria varchar(40),
 @Nombre VARCHAR(30),
 @Habilitado VARCHAR(1),
 @Direccion VARCHAR(50),
 @Telefono VARCHAR(20),
 @Direccion_url VARCHAR(80),
 @Metodo VARCHAR(20),
 @Metodo_pago VARCHAR(20),
 @Servicio varchar(10)
)

as
UPDATE dbo.Concesionaria
SET Habilitado = @Habilitado,Nombre=@Nombre,Direccion = @Direccion,Telefono=@Telefono,direccion_url=@Direccion_url,Metodo = @Metodo, Metodo_pago =@Metodo_pago,Servicio=@Servicio
WHERE id_concesionaria = @id_concesionaria
GO

------------------------------------------------------------------------------------


INSERT INTO Concesionaria
VALUES
( 'A1A1A1A1A1', 'Mundo Maipu Cordoba', '1', 'Av. Colón 4000, CBA CAPITAL', '0351-4859610', 'maxi.f@live.com.ar',  'REST',  'http://localhost:8080/Concesionaria1/rest/concesionaria1/', 'Planes','Ganador' )
go

INSERT INTO Concesionaria
VALUES
( 'B1B1B1B1B1', 'PETTI FORD RIO TERCERO', '1', 'AVENIDA SAVIO 211', '03571-4347811', 'maxi.f@live.com.ar', 'REST', 'http://localhost:8080/Concesionaria2/rest/concesionaria2/', 'Planes', 'Ganador' )
go

INSERT INTO Concesionaria
VALUES
( 'C1C1C1C1C1', 'TAGLE RENAULT', '1', 'Sagrada Familia 1100', '0351-4334552', 'maxi.f@live.com.ar',  'CXF', 'http://localhost:9090/Concesionaria3Port?wsdl','Planes', 'Ganador' )
go

INSERT INTO Concesionaria
VALUES
( 'D1D1D1D1D1', 'Montironi Fiat', '1', 'Av. Colon 2100', '0351-4333551', 'maxi.f@live.com.ar',  'CXF',  'http://localhost:9091/Concesionaria4Port?wsdl','Planes', 'Ganador' )
go

INSERT INTO Concesionaria
VALUES
( 'E1E1E1E1E1', 'Auto City', '1', 'Av. Colon 3200', '0351-4333456', 'maxi.f@live.com.ar',  'AXIS2', 'http://localhost:8080/Concesionaria5/services/Concesionaria?wsdl', 'Planes', 'Ganador' )

go

insert into concesionarias_actualizaciones
values ('A1A1A1A1A1','1900-01-01','1900-01-01'),
('B1B1B1B1B1','1900-01-01','1900-01-01'),
('C1C1C1C1C1','1900-01-01','1900-01-01'),
('D1D1D1D1D1','1900-01-01','1900-01-01'),
('E1E1E1E1E1','1900-01-01','1900-01-01')

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
if not exists (select id_persona from Personas where id_persona = @id_persona)

 begin
 
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

END
GO


EXEC dbo.Insertar_Persona @id_persona = 111111111, -- int
    @Nombre = 'Administrador', -- varchar(40)
    @Apellido = 'Administrador', -- varchar(40)
    @Direccion = 'Juan del Campillo 779', -- varchar(40)
    @Mail = 'sistemas@live.com.ar', -- varchar(40)
    @nro_identificador = 1, -- int
    @Telefono = '03571-15415853', -- varchar(18)
	@Identificador = 'ADMIN'
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


--*****************************************SORTEO************************************

create Procedure Insertar_Sorteo
(
   @Fecha_Sorteo  DATE,
   @Descripcion  varchar(200),
   @Estado       varchar(1)
   
)
AS
if( @Fecha_Sorteo ) >(dateadd(day,-1,GETDATE()) )
INSERT INTO dbo.Sorteos
        ( Fecha_sorteo, Descripcion, Estado, Fecha_original )
VALUES  ( @Fecha_Sorteo, -- Fecha_sorteo - datetime
          @Descripcion, -- Descripcion - varchar(200)
          @Estado,  -- Estado - char(1)
          @Fecha_Sorteo)
else
RAISERROR ('ERROR',10, 1)
GO

-------------------------------------------------------------------------------------

create PROCEDURE Update_Sorteo
(  @nro_sorteo    INTEGER,
   @Fecha_Sorteo  DATE,
   @Estado  char(1),
   @Descripcion VARCHAR(30)
)
AS
if @Fecha_Sorteo  >= dateadd(day,-1,GETDATE()) 
UPDATE dbo.Sorteos
SET Fecha_sorteo = @Fecha_Sorteo, Estado = @Estado,Descripcion = @Descripcion
WHERE nro_sorteo = @nro_sorteo
else
RAISERROR ('ERROR',10, 1)
GO

-------------------------------------------------------------------------------------

create PROCEDURE Set_Estado_Sorteo
(
   @Estado  char(1)
)
AS

UPDATE dbo.Sorteos
SET Estado = @Estado
WHERE Fecha_sorteo = (select TOP 1 Fecha_sorteo
						from Sorteos
						where Estado IN ('P','E')
						order by Fecha_original ASC)
AND nro_sorteo = (select TOP 1 nro_sorteo
						from Sorteos
						where Estado IN ('P','E')
						order by Fecha_original ASC)

GO


--****************************************ERRORES SORTEO**************************--


create PROCEDURE Insertar_Error_Sorteo
(
    @Descripcion varchar(50)
)
AS

INSERT INTO dbo.Errores_Sorteos
        ( nro_sorteo, Descripcion )
VALUES  (  
(
select TOP 1 S.nro_sorteo
from Sorteos S
where Estado IN ('P','E')
AND Fecha_sorteo IN (
select Fecha_sorteo
from Sorteos
where Estado IN ('P','E')

)
order by S.Fecha_sorteo

), @Descripcion  -- Descripcion - varchar(50)
          )
GO

--*********************** BORRAR ERROR ANTERIOR **********************************
create PROCEDURE Borrar_Error_Sorteo
AS

delete from Errores_Sorteos
where nro_sorteo = 
					(select TOP 1 S.nro_sorteo
					from Sorteos S
					where Estado IN ('P','E')
					AND Fecha_original IN (
					select Fecha_original
					from Sorteos
					where Estado IN ('P','E')
					)
					order by S.Fecha_original
					)

go

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
  
  @Completado  char(1),
  @id_concesionaria  varchar(10)
)
AS

INSERT INTO dbo.Actualizaciones
        ( fecha_actualizacion ,
          Completado ,
          id_concesionaria
        )
VALUES  ( 

    (select top 1 S.Fecha_original
	from Sorteos S
	where Estado IN ('P','E')
	AND Fecha_sorteo IN (
						select Fecha_sorteo=convert(varchar(10), Fecha_sorteo, 103)
						from Sorteos
						where Estado IN ('P','E')						
      )
    order by S.Fecha_sorteo  -- fecha_actualizacion - datetime
	),
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

create Procedure Insertar_Concesionaria_Actualizacion
(
    @id_concesionaria  varchar(10)
)
AS


INSERT INTO dbo.concesionarias_actualizaciones
        ( id_concesionaria ,
          Fecha_actualizacion,
		  Fecha_Notificada
        )
VALUES  ( @id_concesionaria , -- id_concesionaria - int
          (select top 1 S.Fecha_original
			from Sorteos S
			where Estado IN ('P','E')
			AND Fecha_sorteo IN (
								select Fecha_sorteo=convert(varchar(10), Fecha_sorteo, 103)
								from Sorteos
								where Estado IN ('P','E')						
			  )
			order by S.Fecha_sorteo  
			),
			'1900-01-01'   
        )

GO


create Procedure Borrar_actualizacion_concesionaria
(
    @id_concesionaria  varchar(10)
)
AS
delete from concesionarias_actualizaciones
        where id_concesionaria =@id_concesionaria 
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


create Procedure Insertar_Planes
(   @Identificador  varchar(20),
    @id_concesionaria  varchar(10),
	@id_persona integer ,
    @Nombre_Auto  varchar(20),
    @nro_marca  int,
	@Tipo_modelo  varchar(20),
	@Dominio varchar(7) = NULL,
	@Chasis varchar(20) = NULL,
	@Motor varchar(20) = NULL
)
AS
if NOT exists (select Identificador from Planes_detalles where Identificador = @identificador)
 begin 

INSERT INTO dbo.Planes_detalles
        ( Identificador,
		  id_concesionaria ,
		  id_persona ,
          Nombre_Auto ,
          nro_marca,
		  Tipo_modelo,
		  Dominio,
		  Chasis,
		  Motor
        )
VALUES  ( 
          @Identificador  ,
          @id_concesionaria , -- id_concesionaria - int
		  @id_persona,
          @Nombre_Auto , -- Nombre_Auto - varchar(20)
          @nro_marca,  -- nro_marca - int
		  @Tipo_modelo,
		  @Dominio,
		  @Chasis,
		  @Motor
        )
  end     
GO


exec Insertar_Planes 'ADMIN','A1A1A1A1A1','111111111','GOL','3','TREND PACK II'

go

--******************************************FACTURAS****************************

create Procedure Insertar_Facturas
(    @nro_factura INT,
     @Estado char(1),
     @Monto  money,
     @Identificador varchar(20),
     @Fecha  DATE,
	 @Cobro  DATE
)
AS

INSERT INTO dbo.Facturas
        ( nro_factura ,
          Estado ,
          Monto ,
          Identificador ,
          Fecha,
		  Cobro 
        )
VALUES  ( @nro_factura , -- nro_factura - int
          @Estado , -- Estado - char(1)
          @Monto , -- Monto - money
          @Identificador, --  Varchar(20)
          @Fecha,  -- Fecha - datetime
		  @Cobro
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
where Identificador <> 'ADMIN'
GO

--***************************OBTENER CANTIDAD DE AUTOS VENDIDOS******************
Create PROCEDURE Autos_Vendidos
AS
select TOP 10 M.Nombre,Nombre_Auto,Tipo_modelo,COUNT(*) AS Cantidad
from Planes_detalles PD JOIN Marcas M
ON M.nro_marca = PD.nro_marca
AND PD.Identificador <> 'ADMIN'
group by Nombre_Auto,Tipo_modelo,M.Nombre
order by COUNT(*) DESC
GO
/********************PROCEDIMIENTO PARA SORTEOS ANTERIORES**************/

create PROCEDURE Detalle_Sorteo
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
/*******************OBTENER SORTEO PARA CABECERA ANTERIORES********************************/
create procedure Obtener_Sorteos
AS
select nro_sorteo,Fecha=convert(varchar(10), Fecha_original, 103),Descripcion
from Sorteos
where Fecha_original < GETDATE()
AND Estado <>'P'
order by Fecha_original DESC


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
select TOP 1 C.Nombre,C.id_concesionaria,Habilitado,Direccion,Telefono,Fecha_actualizacion=convert(varchar(10), Fecha_actualizacion, 103),Metodo,direccion_url,Metodo_pago,Servicio
from Concesionaria C  LEFT JOIN concesionarias_actualizaciones CA
ON C.id_concesionaria = CA.id_concesionaria
where C.id_concesionaria = @id_concesionaria
ORDER BY Fecha_actualizacion DESC
go 


/*******************CREAR OBTENER SORTEOS PENDIENTES *************/

create procedure SORTEOS_PENDIENTES
AS
select nro_sorteo,Fecha_sorteo=convert(varchar(10), Fecha_sorteo, 103),Descripcion,Estado
from Sorteos
where Estado IN ('P','A','E')
order by convert (date,Fecha_sorteo) ASC
go



/*******************DETALLES DEL SORTEO PROGRAMADO ****************/


create procedure SORTEOS_PENDIENTES_DETALLES
(@nro_sorteo integer)
AS
select nro_sorteo,Fecha_sorteo = convert(varchar(10), Fecha_sorteo, 103), Descripcion,Estado, Fecha_original
from Sorteos
where Estado IN ('P','A','E')
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



/************************* OBTENER ESTADO DE CUENTA *****************/

create procedure Obtener_Estado_Cuenta 
(
@Identificador varchar(20)
)
AS
select F.nro_factura, Estado = case when F.Estado = '0' then 'ADEUDADO' when F.Estado = '1' then 'PAGADA'END, convert(varchar(10), F.Fecha, 103)AS Fecha,F.Monto,case when F.Cobro IS NULL then '-' when F.Cobro IS NOT NULL then  convert(varchar(10), F.Cobro, 103) END AS Cobro
from Planes_detalles PD  JOIN Facturas F
ON PD.Identificador = F.Identificador
JOIN Personas P
ON P.id_persona = PD.id_persona
where P.Identificador = @Identificador
AND P.Identificador <>'ADMIN'
ORDER BY F.Fecha 

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


select TOP 1 Nombre_Auto,Tipo_modelo,C.Nombre,c.id_concesionaria,convert(varchar(10),CA.Fecha_actualizacion, 103)AS  Fecha_actualizacion,Dominio=ISNULL(PD.Dominio,'-'),PD.Chasis,PD.Motor
from planes_detalles PD
JOIN CONCESIONARIA C
ON C.id_concesionaria = PD.id_concesionaria
JOIN concesionarias_actualizaciones CA
ON CA.id_concesionaria = C.id_concesionaria
WHERE Identificador = @Identificador
order by CA.Fecha_actualizacion DESC

GO

/************************************DATOS CONCESIONARIAS ****************************/

create procedure Obtener_Concesionarias_habilitadas
AS
select Nombre, Direccion,Telefono,Email,direccion_url,Metodo,Servicio,id_concesionaria
from concesionaria
where habilitado = 1
order by Nombre ASC
GO

-------------------------------------------------------------------------------------


EXECUTE dbo.Insertar_Usuario @Nombre_usuario = 'maxi', -- varchar(18)
    @Clave = 'maxi', -- varchar(18)
	@Identificador = 'ADMIN'
go


----------------------------------------------------------------------------

EXEC dbo.Insertar_Permisos_Usuarios @Identificador = 'ADMIN', -- varchar(18)
    @nro_permiso = 'admin', -- varchar(18)
    @detalle = 'propietario del sistema y administrador' -- varchar(150)
go



-------------------------------------------------------------------------------------

/*select TOP 1 Nombre_Auto,Tipo_modelo,C.Nombre,c.id_concesionaria,CA.Fecha_actualizacion
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
*/


--***********************ALTA DE USUARIO INEXISTENTE***********************
go
CREATE PROCEDURE EXISTE_PERSONA(

@Identificador Varchar(20),
@id_persona Varchar(20)

)AS
select EXISTE = case when COUNT(*) > 0 Then 'SI' Else 'NO' End 
from Personas
where id_persona = @id_persona
AND Identificador = @Identificador
group by id_persona,Identificador

go

CREATE PROCEDURE EXISTE_USUARIO(
@Identificador Varchar(20)
)AS
select EXISTE = case when COUNT(*) > 0 Then 'SI' Else 'NO' End 
from Personas_Usuarios
where Identificador = @Identificador
group by Identificador

go

--**********************************BUSCADOR DE PLANES PARA ADMIN******************
create Procedure Buscador_Planes(
@texto varchar(30),
@id_concesionaria varchar(30)

)
AS
select P.id_persona,P.Identificador,P.Apellido,P.Nombre,PD.Nombre_Auto,PD.Tipo_modelo,PD.Dominio
from Personas P join Planes_detalles PD
ON P.Identificador = PD.Identificador
where (P.id_persona like '%'+@texto+'%'
OR Nombre like '%'+@texto+'%'
OR Apellido like '%'+@texto+'%'
OR P.Identificador like '%'+@texto+'%')
AND PD.id_concesionaria like '%'+@id_concesionaria+'%'
AND PD.Identificador <>'ADMIN'

go

--***********************************VALIDAR USUARIO **********************************/

create Procedure Valida_Usuario(
@usuario varchar(20)
)
AS
select Existe=CASE WHEN SUM(1) IS NULL THEN 0 ELSE 1 END
from Personas_Usuarios
where Nombre_usuario = @usuario

go

--******************************OBTIENE SORTEO PARA HACER****************************************/

create procedure A_Sortear
AS
select TOP 1 nro_sorteo,Fecha_sorteo=convert(varchar(10), Fecha_sorteo, 103),Descripcion,Estado
from Sorteos S
where Estado IN ('P','E')
AND Fecha_sorteo IN (
select Fecha_sorteo=convert(varchar(10), Fecha_sorteo, 103)
from Sorteos
where Estado IN ('P','E')

)
order by S.Fecha_sorteo,S.Descripcion,S.nro_sorteo,S.Estado 
go


-- *****************************VER SI EL SORTEO ES EL DIA ACTUAL*************************************/

create PROCEDURE En_Fecha
AS
	select top 1 HOY =case when CONVERT(varchar(10), Fecha_sorteo, 103) = CONVERT(varchar(10), GETDATE(), 103) THEN 'SI' ELSE 'NO' END 
	from Sorteos S
	where Estado IN ('P','E')
	AND Fecha_sorteo IN (
			select Fecha_sorteo=convert(varchar(10), Fecha_sorteo, 103)
			from Sorteos
			where Estado IN ('P','E')						
      )
    order by S.Fecha_sorteo

 
 go

/****************************CONCESIONARIAS CON MENOS DE 15 DIAS ACTUALIZADAS************************************/

create PROCEDURE concesionarias_en_condiciones 
AS
	select CO.id_concesionaria,actualizada = case when  CA.Fecha_actualizacion = (
	                                                                               select TOP 1 Fecha_sorteo=convert(varchar(10), Fecha_original, 103)
																					from Sorteos S
																					where Estado IN ('P','E')
																					order by S.Fecha_original
	                                                                              )
	
	
	 Then 'SI' ELSE 'NO' END
	from concesionarias_actualizaciones CA
	FULL JOIN Concesionaria CO
	ON CO.id_concesionaria = CA.id_concesionaria
	WHERE Habilitado = 1
go

/*******************************Ver si hay pendiente con error para continuar***********************************/

CREATE procedure CON_ERROR
AS 
select HOY =case when  COUNT(*) = 1 then 'SI' else 'NO'END
from Sorteos
where estado = 'E'
group by ESTADO 

go


/*****************************VERIFICA QUE EL ULTIMO GANADOR TENGA TODO PAGO*************************************/

create PROCEDURE ULTIMO_GANADOR 
AS
	SELECT actualizada= case when COUNT(*)> 0 then 'NO'ELSE 'SI' END
	FROM Facturas F1
	WHERE Identificador IN (
							SELECT TOP 1 Identificador
							FROM Sorteo_detalles SD
							order by Fecha DESC
							)
	AND ESTADO = '0'
GO


--******************************PROCEDIMIENTO DE LOS PARTICIPANTES PARA EL SORTEO***************************************

create PROCEDURE Planes_Sorteo
AS
		select PD.Identificador,P.Apellido,P.Nombre,PD.Nombre_Auto,PD.Tipo_modelo
		from Planes_detalles PD 
		JOIN Personas P
		ON PD.id_persona = P.id_persona
		WHERE PD.Identificador NOT IN (
									  select Identificador-- YA NO SEA UN GANADOR ANTERIOR
									  from Sorteo_detalles
								   )

		AND PD.Identificador NOT IN  (
									  select Identificador-- VERIFICO QUE NO TENGA ADEUDADAS AL DIA ORIGINAL DEL SORTEO
									  from Facturas FA
									  where Fecha < (select TOP 1 S.Fecha_sorteo
													from Sorteos S
													where Estado IN ('P','E')
													order by S.fecha_original ASC
													)
									  AND Estado = 0
									  GROUP BY Identificador
								   )
 GO                          

--******************************** OBTENER EL GANADOR DE MANERA ALEATORIA *****************************************

create procedure Ganador_Sorteo 
AS
		select TOP 1 PD.Identificador,Ganador = P.Apellido +' ' +P.Nombre,PD.Nombre_Auto,PD.Tipo_modelo,C.Nombre,C.Email,P.Mail,P.Telefono,P.Direccion As Direccion_Ganador,C.Direccion As Direccion_Concesionaria
		from Planes_detalles PD 
		JOIN Personas P
		ON PD.id_persona = P.id_persona
		JOIN Concesionaria C
		ON C.id_concesionaria = PD.id_concesionaria
		WHERE PD.Identificador NOT IN (
									  select Identificador-- YA NO SEA UN GANADOR ANTERIOR
									  from Sorteo_detalles
								   )

		AND PD.Identificador NOT IN  (
									  select Identificador-- VERIFICO QUE NO TENGA ADEUDADAS AL DIA DE HOY
									  from Facturas FA
									  where Fecha < (select top 1 CONVERT(varchar(10), Fecha_sorteo, 103) 
													from Sorteos S
													where Estado IN ('P','E')
													AND Fecha_sorteo IN (
													select Fecha_sorteo=convert(varchar(10), Fecha_sorteo, 103)
													from Sorteos
													where Estado IN ('P','E')
							
													  )
													order by S.Fecha_sorteo
													)
									  AND Estado = 0
									  GROUP BY Identificador
								   )
		AND PD.identificador <>'ADMIN'
		ORDER BY NEWID()
go
--******************************** INSERTAR GANADOR DEL SORTEO********************
create procedure Insertar_resultado (

@identificador VARCHAR(20)
)
AS
insert into Sorteo_detalles
select nro_sorteo=(select TOP 1 nro_sorteo
					from Sorteos
					where Estado IN ('P','E')
					AND Fecha_sorteo >= (dateadd(day,-1,GETDATE()) )
					order by Fecha_original ),
	    id_persona,Identificador,id_concesionaria,Nombre_Auto,'N',nro_marca AS Nro_Marca,Tipo_modelo,NULL
from Planes_detalles 
where Identificador = @identificador
go
--*********************************INSERTAR NOTIFICACION*************************************

create procedure Set_Notificado(
@identificador varchar(29)
)
AS
update Sorteo_detalles
set Notificado = 'S',Fecha_notificacion = GETDATE()
where Identificador = @identificador
go
--***********************************LIMPIAR FACTURAS***********************************

CREATE procedure Limpiar_Facturas(

@id_concesionaria varchar(10)
)
AS
delete from Facturas
where Identificador IN(

select Identificador
from Planes_detalles
where id_concesionaria = @id_concesionaria
)
go
--**********************************BORRAR Actualizacion*******************************

create procedure Borrar_Actualizacion(
@id_concesionaria varchar(20)
)
AS
delete from Actualizaciones
where id_concesionaria =@id_concesionaria
GO


--*********************************CONCESIONARIAS CON ERRORES **************************

create procedure Concesionarias_Desactualizadas
AS
select *
from concesionarias_actualizaciones CA
JOIN Concesionaria C
ON C.id_concesionaria = CA.id_concesionaria
AND C.Habilitado = 1
where Fecha_actualizacion <> (
select TOP 1 Fecha_original=convert(varchar(10), Fecha_original, 103)
from Sorteos S
where Estado IN ('P','E')
AND Fecha_original IN (
select Fecha_original=convert(varchar(10), Fecha_original, 103)
from Sorteos
where Estado IN ('P','E')

)
order by S.Fecha_original,S.Descripcion,S.nro_sorteo,S.Estado 
)

go
--**************************** HAY GANADOR ************************************

create procedure Hay_ganador
AS
select TOP 1 Respuesta = case when nro_sorteo IN (select nro_sorteo
                                                   from Sorteo_detalles
                                                  ) Then 'SI' ELSE 'NO' END
from Sorteos
where Estado IN ('P','E')
order by Fecha_original ASC

go

--*************************** GANADOR DEL SORTEO ***************************
create PROCEDURE datos_ganador
AS
select TOP 1 PD.Identificador,Ganador = P.Apellido +' ' +P.Nombre,PD.Nombre_Auto,PD.Tipo_modelo,C.Nombre,C.Email,P.Mail,P.Telefono,P.Direccion As Direccion_Ganador,C.Direccion As Direccion_Concesionaria
		from Planes_detalles PD 
		JOIN Personas P
		ON PD.id_persona = P.id_persona
		JOIN Concesionaria C
		ON C.id_concesionaria = PD.id_concesionaria
		JOIN Sorteo_detalles SD
		ON SD.Identificador = PD.Identificador
		JOIN Sorteos S
		ON S.nro_sorteo = SD.nro_sorteo
		where S.Estado  IN ('P','E')
		ORDER BY S.Fecha_original ASC
GO


--*********************** CONCESIONARIA NOTIFICADA DEL GANADOR **********************
create procedure Concesionarias_Sin_Notificar
AS
select *
from concesionarias_actualizaciones CA
JOIN Concesionaria C
ON C.id_concesionaria = CA.id_concesionaria
AND C.Habilitado = 1
where convert(varchar(10), CA.Fecha_notificada, 103) <> (
select TOP 1 Fecha_original=convert(varchar(10), Fecha_original, 103)
from Sorteos S
where Estado IN ('P','E')
AND Fecha_original IN (
select Fecha_original=convert(varchar(10), Fecha_original, 103)
from Sorteos
where Estado IN ('P','E')
                      ) 
order by S.Fecha_original,S.Descripcion,S.nro_sorteo,S.Estado 
)

go


--*********************** CONCESIONARIA NOTIFICADA DEL GANADOR **********************
create procedure Datos_Ganador_Concesionarias
AS
select TOP 1 S.nro_sorteo,P.id_persona, PD.Identificador, P.Apellido,P.Nombre,PD.Nombre_Auto,PD.Tipo_modelo,PD.nro_marca,SD.Id_Consesionaria
		from Planes_detalles PD 
		JOIN Personas P
		ON PD.id_persona = P.id_persona
		JOIN Concesionaria C
		ON C.id_concesionaria = PD.id_concesionaria
		JOIN Sorteo_detalles SD
		ON SD.Identificador = PD.Identificador
		JOIN Sorteos S
		ON S.nro_sorteo = SD.nro_sorteo
		where S.Estado  IN ('P','E')
		ORDER BY S.Fecha_original ASC

go

--*********************** GUARDAR LA NOTIFICACION DEL GANADOR *********************

create procedure notificada_con_ganador (
@id_concesionaria VARCHAR(20)
)
AS
update  concesionarias_actualizaciones
set Fecha_Notificada = Fecha_actualizacion
where id_concesionaria = @id_concesionaria

go

--////////////////////////////////////////////////////////////////////////////////////////



USE CONCESIONARIA1




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
    @id_concesionaria = 'A1A1A1A1A1',
    @Nombre = 'Mundo Maipu Cordoba', -- varchar(40)
    @Habilitado = '1', -- char(1)
    @Direccion = 'Av. Colón 4000, CBA CAPITAL', -- varchar(40)
    @Telefono = '0351-4859610', -- varchar(40)
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

EXEC dbo.Insertar_Persona @id_persona = 13461983, -- int
    @Nombre = 'Eduardo Martin', -- varchar(40)
    @Apellido = 'Farias', -- varchar(40)
    @Direccion = 'Atahualpa Yupanqui 784', -- varchar(40)
    @Mail = 'edu@live.com.ar', -- varchar(40)
    @nro_identificador = 1, -- int
    @Telefono = '03571-15415853', -- varchar(18)
	@Identificador = 'A1A1A1A1A11' -- varchar(20)

go



EXEC dbo.Insertar_Persona @id_persona = 37628231, -- int
    @Nombre = 'Leonel Nicolas Alejandro', -- varchar(40)
    @Apellido = 'Puertas', -- varchar(40)
    @Direccion = 'Caseroas 368 1B', -- varchar(40)
    @Mail = 'leopuertas@live.com.ar', -- varchar(40)
    @nro_identificador = 1, -- int
    @Telefono = '03571-15665427', -- varchar(18)
	@Identificador = 'A1A1A1A1A12' -- varchar(20)
go



EXEC dbo.Insertar_Persona @id_persona = 20078920, -- int
    @Nombre = 'Gabriela Rosanna', -- varchar(40)
    @Apellido = 'Quiroga', -- varchar(40)
    @Direccion = 'Atahulpa yupanqui 784', -- varchar(40)
    @Mail = 'gabyquiroga1@hotmail.com', -- varchar(40)
    @nro_identificador = 1, -- int
    @Telefono = '03571-15513157', -- varchar(18)
	@Identificador = 'A1A1A1A1A13' -- varchar(20)

go
EXEC dbo.Insertar_Persona @id_persona = 20345643, -- int
    @Nombre = 'Pedro Ernesto', -- varchar(40)
    @Apellido = 'Fernandez', -- varchar(40)
    @Direccion = 'Av. Colon 222', -- varchar(40)
    @Mail = 'p.fernandez@hotmail.com', -- varchar(40)
    @nro_identificador = 1, -- int
    @Telefono = '03571-153456543', -- varchar(18)
	@Identificador = 'A1A1A1A1A14' -- varchar(20)
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


create Procedure Insertar_Planes
(   @Identificador  varchar(20),
    @id_concesionaria  varchar(10),
	@id_persona integer ,
    @Nombre_Auto  varchar(20),
    @nro_marca  int,
	@Tipo_modelo  varchar(20),
	@Dominio varchar(7) = NULL,
	@Chasis varchar(20) = NULL,
	@Motor varchar(20) = NULL
)
AS
if NOT exists (select Identificador from Planes_detalles where Identificador = @identificador)
 begin 

INSERT INTO dbo.Planes_detalles
        ( Identificador,
		  id_concesionaria ,
		  id_persona ,
          Nombre_Auto ,
          nro_marca,
		  Tipo_modelo,
		  Dominio,
		  Chasis,
		  Motor
        )
VALUES  ( 
          @Identificador  ,
          @id_concesionaria , -- id_concesionaria - int
		  @id_persona,
          @Nombre_Auto , -- Nombre_Auto - varchar(20)
          @nro_marca,  -- nro_marca - int
		  @Tipo_modelo,
		  @Dominio,
		  @Chasis,
		  @Motor
        )
  end     
GO

--******************************************FACTURAS****************************


create Procedure Insertar_Facturas
(    @nro_factura INT,
     @Estado char(1),
     @Monto  money,
     @Identificador varchar(20),
     @Fecha  DATE,
	 @Cobro  DATE
)
AS

INSERT INTO dbo.Facturas
        ( nro_factura ,
          Estado ,
          Monto ,
          Identificador ,
          Fecha,
		  Cobro 
        )
VALUES  ( @nro_factura , -- nro_factura - int
          @Estado , -- Estado - char(1)
          @Monto , -- Monto - money
          @Identificador, --  Varchar(20)
          @Fecha,  -- Fecha - datetime
		  @Cobro
        )
GO



--**********************INSERTAR PLAN DETALLE--********************

exec Insertar_Planes 'A1A1A1A1A11','A1A1A1A1A1',13461983,'GOL',3,'TREND PACK III'
exec Insertar_Planes 'A1A1A1A1A12','A1A1A1A1A1',37628231,'CRUZE',5,'LTZ','AA345AD','A2345F584F56859606066','A2345F584FG3456S323'
exec Insertar_Planes 'A1A1A1A1A13','A1A1A1A1A1',20078920,'ARGO',1,'1.4 LX'
exec Insertar_Planes 'A1A1A1A1A14','A1A1A1A1A1',20345643,'AGILE',5,'LTZ'

go


--**********************INSERTAR FACTURAS ****************************

DECLARE @nro_factura BIGINT
DECLARE @cantidad INT
DECLARE @fecha DATE
SET @nro_factura = 0000345981
SET @cantidad = 1
SET @fecha ='2016-11-10'
WHILE (@cantidad <=84)
BEGIN
INSERT INTO Facturas
SELECT @nro_factura + 1,case when @cantidad <30 THEN '1' else '0' END,7055.25, 'A1A1A1A1A11',@fecha,case when @cantidad <30 THEN case when DATEADD(day, -1, @fecha) > GETDATE() then DATEADD(day, -5, GETDATE())ELSE DATEADD(day, -1, @fecha) END   ELSE NULL END
SET @cantidad = @cantidad + 1
SET @nro_factura = @nro_factura + 1
SET @fecha = DATEADD(month, 1, @fecha);
END
GO

/************************************************************************/

DECLARE @nro_factura BIGINT
DECLARE @cantidad INT
DECLARE @fecha DATE
SET @nro_factura = 0440345785
SET @cantidad = 1
SET @fecha ='2016-10-10'
WHILE (@cantidad <=84)
BEGIN
INSERT INTO Facturas
SELECT @nro_factura + 1,case when @cantidad <20 THEN '1' else '0' END,2850.30, 'A1A1A1A1A12',@fecha,case when @cantidad <30 THEN case when DATEADD(day, -1, @fecha) > GETDATE() then DATEADD(day, -5, GETDATE())ELSE DATEADD(day, -1, @fecha) END   ELSE NULL END
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
SET @fecha ='2015-11-10'
WHILE (@cantidad <=84)
BEGIN
INSERT INTO Facturas
SELECT @nro_factura + 1,case when @cantidad <40 THEN '1' else '0' END,5460.30, 'A1A1A1A1A13',@fecha,case when @cantidad <30 THEN case when DATEADD(day, -1, @fecha) > GETDATE() then DATEADD(day, -5, GETDATE())ELSE DATEADD(day, -1, @fecha) END   ELSE NULL END
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
SET @fecha ='2017-11-10'
WHILE (@cantidad <=84)
BEGIN
INSERT INTO Facturas
SELECT @nro_factura + 1,case when @cantidad <40 THEN '1' else '0' END,7643.00, 'A1A1A1A1A14',@fecha,case when @cantidad <30 THEN case when DATEADD(MONTH, -1, @fecha) > GETDATE() then DATEADD(day, -5, GETDATE())ELSE DATEADD(day, -1, @fecha) END   ELSE NULL END
SET @cantidad = @cantidad + 1
SET @nro_factura = @nro_factura + 1
SET @fecha = DATEADD(month, 1, @fecha);
END
GO

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
set Estado = 1,Cobro=GETDATE()
where Identificador = @Identificador

go
--****************************Ganador Sorteo *************************

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

--/////////////////////////////////////////////////////////////////////////////////////////


USE CONCESIONARIA2




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


EXEC dbo.Insertar_Persona @id_persona = 17834564, -- int
    @Nombre = 'Marcos Jose', -- varchar(40)
    @Apellido = 'Perez', -- varchar(40)
    @Direccion = 'Avenida Savio 211', -- varchar(40)
    @Mail = 'm.perez@live.com.ar', -- varchar(40)
    @nro_identificador = 1, -- int
    @Telefono = '03571-15344333', -- varchar(18)
	@Identificador= 'B1B1B1B1B11'

go



EXEC dbo.Insertar_Persona @id_persona = 33784567, -- int
    @Nombre = 'Manuel Alejandro', -- varchar(40)
    @Apellido = 'Velez', -- varchar(40)
    @Direccion = 'Dean funes 368 1B', -- varchar(40)
    @Mail = 'alejandro.perez@hotmail.com', -- varchar(40)
    @nro_identificador = 1, -- int
    @Telefono = '03571-15663454', -- varchar(18)
	@Identificador= 'B1B1B1B1B12'
go



EXEC dbo.Insertar_Persona @id_persona = 20245920, -- int
    @Nombre = 'Sonia Lorena', -- varchar(40)
    @Apellido = 'Rosaroli', -- varchar(40)
    @Direccion = 'Rio limay 338', -- varchar(40)
    @Mail = 's.rosaroli@hotmail.com', -- varchar(40)
    @nro_identificador = 1, -- int
    @Telefono = '03571-15415758', -- varchar(18)
	@Identificador= 'B1B1B1B1B13'

go
EXEC dbo.Insertar_Persona @id_persona = 20356433, -- int
    @Nombre = 'Miguel', -- varchar(40)
    @Apellido = 'Jasni', -- varchar(40)
    @Direccion = 'San Martin 222', -- varchar(40)
    @Mail = 'miguel.j@hotmail.com', -- varchar(40)
    @nro_identificador = 1, -- int
    @Telefono = '03571-15344564', -- varchar(18)
	@Identificador= 'B1B1B1B1B14'
go
EXEC dbo.Insertar_Persona @id_persona = 37525606, -- int
    @Nombre = 'Nahuel', -- varchar(40)
    @Apellido = 'Bustos', -- varchar(40)
    @Direccion = 'Balcarce 331', -- varchar(40)
    @Mail = 'nahubustos@hotmail.com', -- varchar(40)
    @nro_identificador = 1, -- int
    @Telefono = '03571-15456789', -- varchar(18)
	@Identificador= 'B1B1B1B1B15'
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


create Procedure Insertar_Planes
(   @Identificador  varchar(20),
    @id_concesionaria  varchar(10),
	@id_persona integer ,
    @Nombre_Auto  varchar(20),
    @nro_marca  int,
	@Tipo_modelo  varchar(20),
	@Dominio varchar(7) = NULL,
	@Chasis varchar(20) = NULL,
	@Motor varchar(20) = NULL
)
AS
if NOT exists (select Identificador from Planes_detalles where Identificador = @identificador)
 begin 

INSERT INTO dbo.Planes_detalles
        ( Identificador,
		  id_concesionaria ,
		  id_persona ,
          Nombre_Auto ,
          nro_marca,
		  Tipo_modelo,
		  Dominio,
		  Chasis,
		  Motor
        )
VALUES  ( 
          @Identificador  ,
          @id_concesionaria , -- id_concesionaria - int
		  @id_persona,
          @Nombre_Auto , -- Nombre_Auto - varchar(20)
          @nro_marca,  -- nro_marca - int
		  @Tipo_modelo,
		  @Dominio,
		  @Chasis,
		  @Motor
        )
  end     
GO


exec Insertar_Planes 'B1B1B1B1B11','B1B1B1B1B1',20356433,'KA',2,'KINETIC LX 1.3'
go
exec Insertar_Planes 'B1B1B1B1B12','B1B1B1B1B1',33784567,'KA',2,'KINETIC LX 1.3','AA455AA','A2345F5844585846066','A2345FRTGFDDDFF323'
go
exec Insertar_Planes 'B1B1B1B1B13','B1B1B1B1B1',20245920,'Ecosport',2,'KINETIC LT 1.3'
go
exec Insertar_Planes 'B1B1B1B1B14','B1B1B1B1B1',17834564,'Fiesta',2,'MAX 1.6 NAFTA'
go
exec Insertar_Planes 'B1B1B1B1B15','B1B1B1B1B1',37525606,'KA',2,'KINETIC LX 1.3'
go


--******************************************FACTURAS****************************



create Procedure Insertar_Facturas
(    @nro_factura INT,
     @Estado char(1),
     @Monto  money,
     @Identificador varchar(20),
     @Fecha  DATE,
	 @Cobro  DATE
)
AS

INSERT INTO dbo.Facturas
        ( nro_factura ,
          Estado ,
          Monto ,
          Identificador ,
          Fecha,
		  Cobro 
        )
VALUES  ( @nro_factura , -- nro_factura - int
          @Estado , -- Estado - char(1)
          @Monto , -- Monto - money
          @Identificador, --  Varchar(20)
          @Fecha,  -- Fecha - datetime
		  @Cobro
        )
GO



--**********************INSERTAR FACTURAS ****************************

DECLARE @nro_factura BIGINT
DECLARE @cantidad INT
DECLARE @fecha DATE
SET @nro_factura = 0000345981
SET @cantidad = 1
SET @fecha ='2016-11-10'
WHILE (@cantidad <=84)
BEGIN
INSERT INTO Facturas
SELECT @nro_factura + 1,case when @cantidad <34 THEN '1' else '0' END,7055.25, 'B1B1B1B1B11',@fecha,case when @cantidad <30 THEN case when DATEADD(day, -4, @fecha) > GETDATE() then DATEADD(day, -5, GETDATE())ELSE DATEADD(day, -1, @fecha) END   ELSE NULL END
SET @cantidad = @cantidad + 1
SET @nro_factura = @nro_factura + 1
SET @fecha = DATEADD(month, 1, @fecha);
END
GO

/************************************************************************/


DECLARE @nro_factura BIGINT
DECLARE @cantidad INT
DECLARE @fecha DATE
SET @nro_factura = 0023345565
SET @cantidad = 1
SET @fecha ='2016-05-10'
WHILE (@cantidad <=84)
BEGIN
INSERT INTO Facturas
SELECT @nro_factura + 1,case when @cantidad <20 THEN '1' else '0' END,5700.00, 'B1B1B1B1B12',@fecha,case when @cantidad <30 THEN case when DATEADD(day, -10, @fecha) > GETDATE() then DATEADD(day, -5, GETDATE())ELSE DATEADD(day, -3, @fecha) END   ELSE NULL END
SET @cantidad = @cantidad + 1
SET @nro_factura = @nro_factura + 1
SET @fecha = DATEADD(month, 1, @fecha);
END
GO

/************************************************************************/


DECLARE @nro_factura BIGINT
DECLARE @cantidad INT
DECLARE @fecha DATE
SET @nro_factura = 0023456783
SET @cantidad = 1
SET @fecha ='2016-05-10'
WHILE (@cantidad <=84)
BEGIN
INSERT INTO Facturas
SELECT @nro_factura + 1,case when @cantidad <35 THEN '1' else '0' END,7055.25, 'B1B1B1B1B13',@fecha,case when @cantidad <30 THEN case when DATEADD(day, -15, @fecha) > GETDATE() then DATEADD(day, -5, GETDATE())ELSE DATEADD(day, -6, @fecha) END   ELSE NULL END
SET @cantidad = @cantidad + 1
SET @nro_factura = @nro_factura + 1
SET @fecha = DATEADD(month, 1, @fecha);
END
GO




go
/************************************************************************/



DECLARE @nro_factura BIGINT
DECLARE @cantidad INT
DECLARE @fecha DATE
SET @nro_factura = 0023456387
SET @cantidad = 1
SET @fecha ='2017-01-10'
WHILE (@cantidad <=84)
BEGIN
INSERT INTO Facturas
SELECT @nro_factura + 1,case when @cantidad <32 THEN '1' else '0' END,6500.20, 'B1B1B1B1B14',@fecha,case when @cantidad <30 THEN case when DATEADD(day, -10, @fecha) > GETDATE() then DATEADD(day, -5, GETDATE())ELSE DATEADD(day, -10, @fecha) END   ELSE NULL END
SET @cantidad = @cantidad + 1
SET @nro_factura = @nro_factura + 1
SET @fecha = DATEADD(month, 1, @fecha);
END
GO


/************************************************************************/



DECLARE @nro_factura BIGINT
DECLARE @cantidad INT
DECLARE @fecha DATE
SET @nro_factura = 0023456783
SET @cantidad = 1
SET @fecha ='2017-01-10'
WHILE (@cantidad <=84)
BEGIN
INSERT INTO Facturas
SELECT @nro_factura + 1,case when @cantidad <15 THEN '1' else '0' END,6500.80, 'B1B1B1B1B15',@fecha,case when @cantidad <30 THEN case when DATEADD(day, -10, @fecha) > GETDATE() then DATEADD(day, -5, GETDATE())ELSE DATEADD(day, -1, @fecha) END   ELSE NULL END
SET @cantidad = @cantidad + 1
SET @nro_factura = @nro_factura + 1
SET @fecha = DATEADD(month, 1, @fecha);
END
GO


/***************************************************************************/



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
set Estado = 1,Cobro=GETDATE()
where Identificador = @Identificador

go
--****************************Ganador Sorteo *************************

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

--////////////////////////////////////////////////////////////////////////////////////////

USE CONCESIONARIA3




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
    @id_concesionaria = 'C1C1C1C1C1',
    @Nombre = 'TAGLE RENAULT', -- varchar(40)
    @Habilitado = '1', -- char(1)
    @Direccion = 'Sagrada Familia 1100', -- varchar(40)
    @Telefono = '0351-4334552', -- varchar(40)
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


EXEC dbo.Insertar_Persona @id_persona = 17456432, -- int
    @Nombre = 'Emanuel Jose', -- varchar(40)
    @Apellido = 'Sosa', -- varchar(40)
    @Direccion = 'Avenida Savio 341', -- varchar(40)
    @Mail = 'e.sosa@live.com.ar', -- varchar(40)
    @nro_identificador = 1, -- int
    @Telefono = '03571-15344533', -- varchar(18)
	@Identificador='C1C1C1C1C11'

go



EXEC dbo.Insertar_Persona @id_persona = 33454567, -- int
    @Nombre = 'Fernando Alejandro', -- varchar(40)
    @Apellido = 'Gonzalez', -- varchar(40)
    @Direccion = 'Dean funes 368 ', -- varchar(40)
    @Mail = 'f.gonzalez@hotmail.com', -- varchar(40)
    @nro_identificador = 1, -- int
    @Telefono = '03521-15643454', -- varchar(18)
	@Identificador='C1C1C1C1C12'
go



EXEC dbo.Insertar_Persona @id_persona = 20245524, -- int
    @Nombre = 'Carla Lorena', -- varchar(40)
    @Apellido = 'Lerda', -- varchar(40)
    @Direccion = 'Rio limay 338', -- varchar(40)
    @Mail = 'carlal@hotmail.com', -- varchar(40)
    @nro_identificador = 1, -- int
    @Telefono = '0351-15485758', -- varchar(18)
	@Identificador='C1C1C1C1C13'

go
EXEC dbo.Insertar_Persona @id_persona = 21354433, -- int
    @Nombre = 'Daniel', -- varchar(40)
    @Apellido = 'Bruno', -- varchar(40)
    @Direccion = 'Rivera Indarte 222', -- varchar(40)
    @Mail = 'd.bruno@hotmail.com', -- varchar(40)
    @nro_identificador = 1, -- int
    @Telefono = '03571-15344564', -- varchar(18)
	@Identificador='C1C1C1C1C14'
go
EXEC dbo.Insertar_Persona @id_persona = 23333706, -- int
    @Nombre = 'Carlos Gaston', -- varchar(40)
    @Apellido = 'Bustos', -- varchar(40)
    @Direccion = 'Balcarce 331', -- varchar(40)
    @Mail = 'cgbustos@hotmail.com', -- varchar(40)
    @nro_identificador = 1, -- int
    @Telefono = '0351-15433789', -- varchar(18)
	@Identificador='C1C1C1C1C15'
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


create Procedure Insertar_Planes
(   @Identificador  varchar(20),
    @id_concesionaria  varchar(10),
	@id_persona integer ,
    @Nombre_Auto  varchar(20),
    @nro_marca  int,
	@Tipo_modelo  varchar(20),
	@Dominio varchar(7) = NULL,
	@Chasis varchar(20) = NULL,
	@Motor varchar(20) = NULL
)
AS
if NOT exists (select Identificador from Planes_detalles where Identificador = @identificador)
 begin 

INSERT INTO dbo.Planes_detalles
        ( Identificador,
		  id_concesionaria ,
		  id_persona ,
          Nombre_Auto ,
          nro_marca,
		  Tipo_modelo,
		  Dominio,
		  Chasis,
		  Motor
        )
VALUES  ( 
          @Identificador  ,
          @id_concesionaria , -- id_concesionaria - int
		  @id_persona,
          @Nombre_Auto , -- Nombre_Auto - varchar(20)
          @nro_marca,  -- nro_marca - int
		  @Tipo_modelo,
		  @Dominio,
		  @Chasis,
		  @Motor
        )
  end     
GO

--******************************************FACTURAS****************************



create Procedure Insertar_Facturas
(    @nro_factura INT,
     @Estado char(1),
     @Monto  money,
     @Identificador varchar(20),
     @Fecha  DATE,
	 @Cobro  DATE
)
AS

INSERT INTO dbo.Facturas
        ( nro_factura ,
          Estado ,
          Monto ,
          Identificador ,
          Fecha,
		  Cobro 
        )
VALUES  ( @nro_factura , -- nro_factura - int
          @Estado , -- Estado - char(1)
          @Monto , -- Monto - money
          @Identificador, --  Varchar(20)
          @Fecha,  -- Fecha - datetime
		  @Cobro
        )
GO




--**********************INSERTAR PLAN DETALLE--********************

exec Insertar_Planes 'C1C1C1C1C11','C1C1C1C1C1',17456432,'FLUENCE',4,'CONFORT'
go
exec Insertar_Planes 'C1C1C1C1C12','C1C1C1C1C1',33454567,'FLUENCE',4,'CONFORT'
go
exec Insertar_Planes 'C1C1C1C1C13','C1C1C1C1C1',20245524,'FLUENCE',4,'Expression','AB345AA','A2345F4593939ER45W','A2345FRTGSGRTK5LD'
go
exec Insertar_Planes 'C1C1C1C1C14','C1C1C1C1C1',21354433,'CLIO MIO',4,'CONFORT 5p'
go
exec Insertar_Planes 'C1C1C1C1C15','C1C1C1C1C1',23333706,'CLIO MIO',4,'CONFORT 3p'
go


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
SELECT @nro_factura + 1,case when @cantidad <32 THEN '1' else '0' END,7055.25, 'C1C1C1C1C11',@fecha,case when @cantidad <30 THEN case when DATEADD(day, -4, @fecha) > GETDATE() then DATEADD(day, -5, GETDATE())ELSE DATEADD(day, -3, @fecha) END   ELSE NULL END
SET @cantidad = @cantidad + 1
SET @nro_factura = @nro_factura + 1
SET @fecha = DATEADD(month, 1, @fecha);
END
GO

/************************************************************************/


DECLARE @nro_factura BIGINT
DECLARE @cantidad INT
DECLARE @fecha DATE
SET @nro_factura = 001123452
SET @cantidad = 1
SET @fecha ='2015-11-10'
WHILE (@cantidad <=84)
BEGIN
INSERT INTO Facturas
SELECT @nro_factura + 1,case when @cantidad <40 THEN '1' else '0' END,7055.25, 'C1C1C1C1C12',@fecha,case when @cantidad <30 THEN case when DATEADD(day, -4, @fecha) > GETDATE() then DATEADD(day, -10, GETDATE())ELSE DATEADD(day, -5, @fecha) END   ELSE NULL END
SET @cantidad = @cantidad + 1
SET @nro_factura = @nro_factura + 1
SET @fecha = DATEADD(month, 1, @fecha);
END
GO

/************************************************************************/


DECLARE @nro_factura BIGINT
DECLARE @cantidad INT
DECLARE @fecha DATE
SET @nro_factura = 0233454322
SET @cantidad = 1
SET @fecha ='2017-10-10'
WHILE (@cantidad <=84)
BEGIN
INSERT INTO Facturas
SELECT @nro_factura + 1,case when @cantidad <10 THEN '1' else '0' END,5678.00, 'C1C1C1C1C13',@fecha,case when @cantidad <30 THEN case when DATEADD(day, -4, @fecha) > GETDATE() then DATEADD(day, -7, GETDATE())ELSE DATEADD(day, -2, @fecha) END   ELSE NULL END
SET @cantidad = @cantidad + 1
SET @nro_factura = @nro_factura + 1
SET @fecha = DATEADD(month, 1, @fecha);
END
GO


/************************************************************************/


DECLARE @nro_factura BIGINT
DECLARE @cantidad INT
DECLARE @fecha DATE
SET @nro_factura = 0374747372
SET @cantidad = 1
SET @fecha ='2016-11-10'
WHILE (@cantidad <=84)
BEGIN
INSERT INTO Facturas
SELECT @nro_factura + 1,case when @cantidad <27 THEN '1' else '0' END,8456.00, 'C1C1C1C1C14',@fecha,case when @cantidad <30 THEN case when DATEADD(day, -4, @fecha) > GETDATE() then DATEADD(day, -3, GETDATE())ELSE DATEADD(day, -5, @fecha) END   ELSE NULL END
SET @cantidad = @cantidad + 1
SET @nro_factura = @nro_factura + 1
SET @fecha = DATEADD(month, 1, @fecha);
END
GO



/************************************************************************/


DECLARE @nro_factura BIGINT
DECLARE @cantidad INT
DECLARE @fecha DATE
SET @nro_factura = 0747383883
SET @cantidad = 1
SET @fecha ='2017-04-10'
WHILE (@cantidad <=84)
BEGIN
INSERT INTO Facturas
SELECT @nro_factura + 1,case when @cantidad <32 THEN '1' else '0' END,8956.00, 'C1C1C1C1C15',@fecha,case when @cantidad <30 THEN case when DATEADD(day, -4, @fecha) > GETDATE() then DATEADD(day, -20, GETDATE())ELSE DATEADD(day, -10, @fecha) END   ELSE NULL END
SET @cantidad = @cantidad + 1
SET @nro_factura = @nro_factura + 1
SET @fecha = DATEADD(month, 1, @fecha);
END
GO


/************************************************************************/

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
set Estado = 1,Cobro=GETDATE()
where Identificador = @Identificador

go
--**************************Ganador Sorteo *************************

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

--/////////////////////////////////////////////////////////////////////////////////////////


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


EXEC dbo.Insertar_Persona @id_persona = 17456433, -- int
    @Nombre = 'Pedro Jose', -- varchar(40)
    @Apellido = 'Centeno', -- varchar(40)
    @Direccion = 'Avenida Savio 341', -- varchar(40)
    @Mail = 'p.centeno@live.com.ar', -- varchar(40)
    @nro_identificador = 1, -- int
    @Telefono = '03571-15344533', -- varchar(18)
	@Identificador = 'D1D1D1D1D11'

go



EXEC dbo.Insertar_Persona @id_persona = 33454568, -- int
    @Nombre = 'Alejandro', -- varchar(40)
    @Apellido = 'Gonzalez', -- varchar(40)
    @Direccion = 'Dean funes 368 ', -- varchar(40)
    @Mail = 'A.gonzalez@hotmail.com', -- varchar(40)
    @nro_identificador = 1, -- int
    @Telefono = '03521-14543454', -- varchar(18)
	@Identificador = 'D1D1D1D1D12'
go



EXEC dbo.Insertar_Persona @id_persona = 20245525, -- int
    @Nombre = 'Patricia', -- varchar(40)
    @Apellido = 'Perez', -- varchar(40)
    @Direccion = 'Sagrada Familia 338', -- varchar(40)
    @Mail = 'peperez@hotmail.com', -- varchar(40)
    @nro_identificador = 1, -- int
    @Telefono = '0351-15445758', -- varchar(18)
	@Identificador = 'D1D1D1D1D14'

go
EXEC dbo.Insertar_Persona @id_persona = 21354436, -- int
    @Nombre = 'Nicolas', -- varchar(40)
    @Apellido = 'Rivera', -- varchar(40)
    @Direccion = 'Rivera Indarte 222', -- varchar(40)
    @Mail = 'nico.rivera@hotmail.com', -- varchar(40)
    @nro_identificador = 1, -- int
    @Telefono = '03571-14454566', -- varchar(18)
	@Identificador = 'D1D1D1D1D15'
go
EXEC dbo.Insertar_Persona @id_persona = 23333707, -- int
    @Nombre = 'Nestor Daniel', -- varchar(40)
    @Apellido = 'Ceballos', -- varchar(40)
    @Direccion = 'Juan del Campillo 779', -- varchar(40)
    @Mail = 'nceballos@hotmail.com', -- varchar(40)
    @nro_identificador = 1, -- int
    @Telefono = '0351-15445789', -- varchar(18)
	@Identificador = 'D1D1D1D1D16'
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


create Procedure Insertar_Planes
(   @Identificador  varchar(20),
    @id_concesionaria  varchar(10),
	@id_persona integer ,
    @Nombre_Auto  varchar(20),
    @nro_marca  int,
	@Tipo_modelo  varchar(20),
	@Dominio varchar(7) = NULL,
	@Chasis varchar(20) = NULL,
	@Motor varchar(20) = NULL
)
AS
if NOT exists (select Identificador from Planes_detalles where Identificador = @identificador)
 begin 

INSERT INTO dbo.Planes_detalles
        ( Identificador,
		  id_concesionaria ,
		  id_persona ,
          Nombre_Auto ,
          nro_marca,
		  Tipo_modelo,
		  Dominio,
		  Chasis,
		  Motor
        )
VALUES  ( 
          @Identificador  ,
          @id_concesionaria , -- id_concesionaria - int
		  @id_persona,
          @Nombre_Auto , -- Nombre_Auto - varchar(20)
          @nro_marca,  -- nro_marca - int
		  @Tipo_modelo,
		  @Dominio,
		  @Chasis,
		  @Motor
        )
  end     
GO


--******************************************FACTURAS****************************


create Procedure Insertar_Facturas
(    @nro_factura INT,
     @Estado char(1),
     @Monto  money,
     @Identificador varchar(20),
     @Fecha  DATE,
	 @Cobro  DATE
)
AS

INSERT INTO dbo.Facturas
        ( nro_factura ,
          Estado ,
          Monto ,
          Identificador ,
          Fecha,
		  Cobro 
        )
VALUES  ( @nro_factura , -- nro_factura - int
          @Estado , -- Estado - char(1)
          @Monto , -- Monto - money
          @Identificador, --  Varchar(20)
          @Fecha,  -- Fecha - datetime
		  @Cobro
        )
GO





--**********************INSERTAR PLAN DETALLE--********************

exec Insertar_Planes 'D1D1D1D1D11','D1D1D1D1D1',17456433,'PALIO',1,'FIRE 1.4 3P'
go
exec Insertar_Planes 'D1D1D1D1D12','D1D1D1D1D1',33454568,'PALIO',1,'FIRE 1.4 3P'
go
exec Insertar_Planes 'D1D1D1D1D13','D1D1D1D1D1',20245525,'SIENA',1,'FIRE 1.4 LS','AA876AB','A2345F58474896066','A2345FRTSHSHSK23453222'
go
exec Insertar_Planes 'D1D1D1D1D14','D1D1D1D1D1',21354436,'SIENA',1,'FIRE 1.4 LS'
go
exec Insertar_Planes 'D1D1D1D1D15','D1D1D1D1D1',23333707,'ARGO',1,'1.4 TOP'
go




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
SELECT @nro_factura + 1,case when @cantidad <32 THEN '1' else '0' END,7055.25, 'D1D1D1D1D11',@fecha,case when @cantidad <30 THEN case when DATEADD(day, -4, @fecha) > GETDATE() then DATEADD(day, -5, GETDATE())ELSE DATEADD(day, -3, @fecha) END   ELSE NULL END
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
SELECT @nro_factura + 1,case when @cantidad <12 THEN '1' else '0' END,8150.25, 'D1D1D1D1D12',@fecha,case when @cantidad <30 THEN case when DATEADD(day, -4, @fecha) > GETDATE() then DATEADD(day, -5, GETDATE())ELSE DATEADD(day, -3, @fecha) END   ELSE NULL END
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
SELECT @nro_factura + 1,case when @cantidad <28 THEN '1' else '0' END,8150.25, 'D1D1D1D1D13',@fecha,case when @cantidad <30 THEN case when DATEADD(day, -4, @fecha) > GETDATE() then DATEADD(day, -8, GETDATE())ELSE DATEADD(day, -5, @fecha) END   ELSE NULL END
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
SELECT @nro_factura + 1,case when @cantidad <34 THEN '1' else '0' END,4550.25, 'D1D1D1D1D14',@fecha,case when @cantidad <30 THEN case when DATEADD(day, -4, @fecha) > GETDATE() then DATEADD(day, -8, GETDATE())ELSE DATEADD(day, -5, @fecha) END   ELSE NULL END
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
SELECT @nro_factura + 1,case when @cantidad <37 THEN '1' else '0' END,6550.50, 'D1D1D1D1D15',@fecha,case when @cantidad <30 THEN case when DATEADD(day, -4, @fecha) > GETDATE() then DATEADD(day, -10, GETDATE())ELSE DATEADD(day, -3, @fecha) END   ELSE NULL END
SET @cantidad = @cantidad + 1
SET @nro_factura = @nro_factura + 1
SET @fecha = DATEADD(month, 1, @fecha);
END
GO

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


--/////////////////////////////////////////////////////////////////////////////////////////

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


create Procedure Insertar_Planes
(   @Identificador  varchar(20),
    @id_concesionaria  varchar(10),
	@id_persona integer ,
    @Nombre_Auto  varchar(20),
    @nro_marca  int,
	@Tipo_modelo  varchar(20),
	@Dominio varchar(7) = NULL,
	@Chasis varchar(20) = NULL,
	@Motor varchar(20) = NULL
)
AS
if NOT exists (select Identificador from Planes_detalles where Identificador = @identificador)
 begin 

INSERT INTO dbo.Planes_detalles
        ( Identificador,
		  id_concesionaria ,
		  id_persona ,
          Nombre_Auto ,
          nro_marca,
		  Tipo_modelo,
		  Dominio,
		  Chasis,
		  Motor
        )
VALUES  ( 
          @Identificador  ,
          @id_concesionaria , -- id_concesionaria - int
		  @id_persona,
          @Nombre_Auto , -- Nombre_Auto - varchar(20)
          @nro_marca,  -- nro_marca - int
		  @Tipo_modelo,
		  @Dominio,
		  @Chasis,
		  @Motor
        )
  end     

GO


exec Insertar_Planes 'E1E1E1E1E11','E1E1E1E1E1',17456438,'PALIO',1,'FIRE 1.4 3P'
go
exec Insertar_Planes 'E1E1E1E1E12','E1E1E1E1E1',33454573,'AGILE',5,'LTZ','AA234AD','2344GH5JN5663WSS485858','7792929838383829H'
go
exec Insertar_Planes 'E1E1E1E1E13','E1E1E1E1E1',20245530,'FLUENCE',4,'CONFORT'
go
exec Insertar_Planes 'E1E1E1E1E14','E1E1E1E1E1',21354441,'SPIN',5,'LTZ'
go
exec Insertar_Planes 'E1E1E1E1E15','E1E1E1E1E1',23333712,'ARGO',1,'1.4 TOP'
go
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
































































