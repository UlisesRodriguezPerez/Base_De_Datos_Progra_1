USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPCargar_Operaciones_Usuarios]    Script Date: 5/12/2020 23:48:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     PROCEDURE [dbo].[SPCargar_Operaciones_Usuarios]
AS
BEGIN 
	SET NOCOUNT ON
	
	BEGIN TRY
		/*    Parsear el XML e insertar datos en la tabla    */
		DECLARE 
				@DocumentoXML XML;
	
		SELECT 
			@DocumentoXML = DXML
		FROM 
			--OPENROWSET(BULK 'D:\S3\bucket-xml\PruebaOperaciones.xml', SINGLE_BLOB) AS DocumentoXML(DXML);
			OPENROWSET(BULK 'C:\Users\ulirp\Desktop\BAses\Base_De_Datos_Progra_1\Base De Datos\XML\PruebaOperacionesUsuarios.xml', SINGLE_BLOB) AS DocumentoXML(DXML);
	
		SELECT 
				@DocumentoXML
	END TRY

	BEGIN CATCH
			PRINT 'ERROR AL PARSEAR EL XML.'
			--RETURN @@ERROR;
	END CATCH



	--BEGIN TRY
		INSERT INTO [dbo].[Usuario]
							(
								 [Nombre]
								,[Password]
								,[EsAdministrador]
								,[InsertAt]
								,[UpdateAt]
								,[InsertBy]
								,[UpdateBy]
								,[InsertIn]
								,[UpdateIn]
							)
		SELECT	  
				  d.value('@User', 'VARCHAR(100)')
				, d.value('@Pass', 'VARCHAR(100)')
				, d.value('@EsAdministrador', 'BIT')
				, GETDATE() AS [InsertAt] --obtiene la fecha del dia de insercion
				, GETDATE() AS [UpdateAt] --obtiene la fecha del dia de actualizacion
				, 'CURRENT_USER' AS [InsertBy] --string de prueba
				, 'CURRENT_USER' AS [UpdateBy] --string de prueba
				, 'amazon-server' AS [InsertIn] --string de prueba
				, 'amazon-server' AS [UpdateIn] --string de prueba
		FROM 
				@DocumentoXML.nodes('/Usuarios/Usuario') AS t(d);
	--END TRY

	--BEGIN CATCH
	--		PRINT 'ERROR AL INSERTAR DATOS EN LA TABLA [Usuario].'
	--		RETURN @@ERROR;
	--END CATCH



	--BEGIN TRY		
		INSERT INTO [dbo].[UsuarioPuedeAccesar]
											(
												 [IdUsuario]
												,[IdCuentaDeAhorros]
												,[Activo]

											)
		
		SELECT	  
				(	
					SELECT 
							U.Id
					FROM 
							[dbo].[Usuario] U
					WHERE 
							d.value('@User', 'VARCHAR(100)') = U.Nombre
				) AS [IdUsuario]

				,(	
					SELECT 
							C.Id
					FROM 
							[dbo].[CuentaAhorro] C
					WHERE 
							d.value('@NumeroCuenta', 'INT') = C.NumeroDeCuenta
					) AS [IdCuentaDeAhorros]
				, 1 AS [Activo]
			
		FROM 
				@DocumentoXML.nodes('/Usuarios_Ver/UsuarioPuedeVer') AS t(d)
			PRINT(d.value('@NumeroCuenta', 'INT'))
	--END TRY

	--BEGIN CATCH
	--		PRINT 'ERROR AL INSERTAR DATOS EN LA TABLA [UsuarioPuedeAccesar].'
	--		RETURN @@ERROR;
	--END CATCH
	--DELETE FROM Usuario
	
END
GO
