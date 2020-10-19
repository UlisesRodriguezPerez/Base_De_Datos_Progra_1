USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPCargar_Operaciones]    Script Date: 19/10/2020 11:18:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER       PROCEDURE [dbo].[SPCargar_Operaciones]
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
			OPENROWSET(BULK 'D:\S3\bucket-xml\PruebaOperaciones.xml', SINGLE_BLOB) AS DocumentoXML(DXML);
	
		SELECT 
				@DocumentoXML
	END TRY

	BEGIN CATCH
			PRINT 'ERROR AL PARSEAR EL XML.'
			RETURN @@ERROR * - 1;
	END CATCH


		
	BEGIN TRY
		/* Inserta en las siguientes tablas sus valores correspondientes, según el XML.*/
		INSERT INTO [dbo].[Persona]
			(
				 [IdTipoDocumentoIdentidad]
				,[Nombre]
				,[ValorDocumentoIdentidad]
				,[FechaNacimiento]
				,[CorreoElectronico]
				,[Telefono1]
				,[Telefono2]
				,[InsertAt]
				,[UpdateAt]
				,[InsertBy]
				,[UpdateBy]
				,[InsertIn]
				,[UpdateIn]
			)
		SELECT	
				d.value('@TipoDocuIdentidad', 'INT')
				, d.value('@Nombre', 'VARCHAR(100)')
				, d.value('@ValorDocumentoIdentidad', 'VARCHAR(50)')
				, d.value('@FechaNacimiento', 'DATETIME')
				, d.value('@Email', 'VARCHAR(50)')
				, d.value('@telefono1', 'VARCHAR(50)')
				, d.value('@telefono2', 'VARCHAR(50)')
				, GETDATE() AS [InsertAt] --obtiene la fecha del dia de insercion
				, GETDATE() AS [UpdateAt] --obtiene la fecha del dia de actualizacion
				, 'DB Admin' AS [InsertBy] --string de prueba
				, 'DB Admin' AS [UpdateBy] --string de prueba
				, 'Costa Rica' AS [InsertIn] --string de prueba
				, 'Costa Rica' AS [UpdateIn] --string de prueba
		FROM 
				@DocumentoXML.nodes('/Personas/Persona') AS t(d);
	END TRY

	BEGIN CATCH
			PRINT 'ERROR AL INSERTAR DATOS EN LA TABLA [Persona].'
			RETURN @@ERROR * - 1;
	END CATCH


	BEGIN TRY
		INSERT INTO [dbo].[CuentaAhorro]
			(
				 [IdPersona]
				,[IdTipoCuenta]
				,[NumeroDeCuenta]
				,[FechaCreacion]
				,[Saldo]
				,[InsertAt]
				,[UpdateAt]
				,[InsertBy]
				,[UpdateBy]
				,[InsertIn]
				,[UpdateIn]
			)
		SELECT	
				(	
					SELECT 
							P.Id
					FROM 
							[dbo].[Persona] P
					WHERE 
							C.value('@ValorDocumentoIdentidadDelCliente', 'INT') = P.ValorDocumentoIdentidad
				) AS 
						[IdPersona]

				, C.value('@TipoCuentaId', 'INT')
				, C.value('@NumeroCuenta', 'INT')
				, C.value('@FechaCreacion', 'DATETIME')
				, C.value('@Saldo', 'MONEY')
				, GETDATE() AS [InsertAt] --obtiene la fecha del dia de insercion
				, GETDATE() AS [UpdateAt] --obtiene la fecha del dia de actualizacion
				, 'DB Admin' AS [InsertBy] --string de prueba
				, 'DB Admin' AS [UpdateBy] --string de prueba
				, 'Costa Rica' AS [InsertIn] --string de prueba
				, 'Costa Rica' AS [UpdateIn] --string de prueba
		FROM 
				@DocumentoXML.nodes('/Cuentas/Cuenta') AS S(C)
	END TRY

	BEGIN CATCH
			PRINT 'ERROR AL INSERTAR DATOS EN LA TABLA [CuentaAhorro].'
			RETURN @@ERROR * - 1;
	END CATCH


	BEGIN TRY
		INSERT INTO [dbo].[Beneficiario]
								(
									 [IdPersona]
									,[IdCuentaDeAhorro]
									,[IdTipoParentezco]
									,[Porcentaje]
									,[InsertAt]
									,[UpdateAt]
									,[InsertBy]
									,[UpdateBy]
									,[InsertIn]
									,[UpdateIn]
								)
		SELECT	 
					-- Con esta fracción de código logramos enlazar el documento de identidad del beneficiario, junto con el IdPersona.
				(	
					SELECT 
							P.Id
					FROM 
							[dbo].[Persona] P
					WHERE 
							d.value('@ValorDocumentoIdentidadBeneficiario', 'INT') = P.ValorDocumentoIdentidad
				) AS [IdPersona]
				
					-- Aquí enlazamos el número de cuenta con su respectiva cuenta xD.
				,(	
					SELECT 
							C.Id
					FROM 
							[dbo].[CuentaAhorro] C
					WHERE 
							d.value('@NumeroCuenta', 'INT') = C.NumeroDeCuenta
				) AS [IdCuentaDeAhorro]

				, d.value('@ParentezcoId', 'INT')
				, d.value('@Porcentaje', 'INT')
				, GETDATE() AS [InsertAt] --obtiene la fecha del dia de insercion
				, GETDATE() AS [UpdateAt] --obtiene la fecha del dia de actualizacion
				, 'DB Admin' AS [InsertBy] --string de prueba
				, 'DB Admin' AS [UpdateBy] --string de prueba
				, 'Costa Rica' AS [InsertIn] --string de prueba
				, 'Costa Rica' AS [UpdateIn] --string de prueba
		FROM 
				@DocumentoXML.nodes('/Beneficiarios/Beneficiario') AS t(d);
	END TRY

	BEGIN CATCH
			PRINT 'ERROR AL INSERTAR DATOS EN LA TABLA [Beneficiario].'
			RETURN @@ERROR * - 1;
	END CATCH



	BEGIN TRY
		INSERT INTO [dbo].EstadoCuenta
				(
					 [IdCuentaDeAhorro]
					,[FechaInicio]
					,[FechaFinal]
					,[SaldoInicial]
					,[SaldoFinal]
				)
				SELECT	  
					(	
						SELECT 
								C.Id
						FROM 
								[dbo].[CuentaAhorro] C
						WHERE 
								d.value('@NumeroCuenta', 'INT') = C.NumeroDeCuenta
					) AS [IdCuentaDeAhorro]
					, d.value('@fechaInicio', 'DATETIME')
					, d.value('@fechafin', 'DATETIME')
					, d.value('@saldoinicial', 'MONEY')
					, d.value('@saldo_final', 'MONEY')
		FROM 
				@DocumentoXML.nodes('/Estados_de_Cuenta/Estado_de_Cuenta') AS t(d);
	END TRY

	BEGIN CATCH
			PRINT 'ERROR AL INSERTAR DATOS EN LA TABLA [EstadoCeunta].'
			RETURN @@ERROR * - 1;
	END CATCH

	BEGIN TRY
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
				, 'DB Admin' AS [InsertBy] --string de prueba
				, 'DB Admin' AS [UpdateBy] --string de prueba
				, 'Costa Rica' AS [InsertIn] --string de prueba
				, 'Costa Rica' AS [UpdateIn] --string de prueba
		FROM 
				@DocumentoXML.nodes('/Usuarios/Usuario') AS t(d);
	END TRY

	BEGIN CATCH
			PRINT 'ERROR AL INSERTAR DATOS EN LA TABLA [Usuario].'
			RETURN @@ERROR * - 1;
	END CATCH



	BEGIN TRY		
		INSERT INTO [dbo].[UsuarioPuedeAccesar]
											(
												 [IdUsuario]
												,[IdCuentaDeAhorros]
												,[Activo]
												,[InsertAt]
												,[UpdateAt]
												,[InsertBy]
												,[UpdateBy]
												,[InsertIn]
												,[UpdateIn]
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
					) AS [IdCuentaDeAhorro]
				, '1' AS [Activo]
				, GETDATE() AS [InsertAt] --obtiene la fecha del dia de insercion
				, GETDATE() AS [UpdateAt] --obtiene la fecha del dia de actualizacion
				, 'DB Admin' AS [InsertBy] --string de prueba
				, 'DB Admin' AS [UpdateBy] --string de prueba
				, 'Costa Rica' AS [InsertIn] --string de prueba
				, 'Costa Rica' AS [UpdateIn] --string de prueba
		FROM 
				@DocumentoXML.nodes('/Usuarios_Ver/UsuarioPuedeVer') AS t(d)
	END TRY

	BEGIN CATCH
			PRINT 'ERROR AL INSERTAR DATOS EN LA TABLA [UsuarioPuedeAccesar].'
			RETURN @@ERROR * - 1;
	END CATCH
	



	/*
	--este codigo ve si hay algo en el xml sin ingresar nada en las tablas

	SELECT * FROM OPENROWSET(  
	   BULK 'D:\S3\bucket-xml\PruebaCatalogo.xml',  
	   SINGLE_BLOB) AS x;  

	SELECT CONVERT(XML, BulkColumn) AS BulkColumn, GETDATE() 
	FROM OPENROWSET(BULK 'D:\S3\bucket-xml\PruebaCatalogo.xml', SINGLE_BLOB) AS x;


	*/

	
END