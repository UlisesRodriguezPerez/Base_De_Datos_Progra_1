USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPSimulacion]    Script Date: 16/1/2021 15:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER     PROCEDURE [dbo].[SPSimulacion]
AS

BEGIN
	SET NOCOUNT ON


	DECLARE @tablaCuentasAhorro AS [dbo].[CuentaAhorroPerTrigger];
	DECLARE @TablaMovimientoAux AS [dbo].[TableMovimiento];
	DECLARE @FechaDeOperacion DATE

	-- Tabla para almacenas las fechas según el XML.
	DECLARE @FechasPorIterar TABLE
		(
			 iterador INT IDENTITY(1,1) PRIMARY KEY
			,fecha DATE
		)

	-- Sección para cargar las fechas desde el XML y parsearlo antes.

	BEGIN TRY
		--Parsear el XML e insertar datos en la tabla
		DECLARE 
				@DocumentoXML XML;
	
		SELECT 
			@DocumentoXML = DXML
		FROM 
			--OPENROWSET(BULK 'D:\S3\bucket-xml\PruebaOperaciones.xml', SINGLE_BLOB) AS DocumentoXML(DXML);
			OPENROWSET(BULK 'C:\Users\ulirp\Desktop\BAses\Base_De_Datos_Progra_1\Base De Datos\XML\Datos_Tarea_222.xml', SINGLE_BLOB) AS DocumentoXML(DXML);
		INSERT 
			@FechasPorIterar (fecha)

		SELECT 
			f.value('@Fecha','DATE')
		FROM 
			@DocumentoXML.nodes('/Operaciones/FechaOperacion')AS t(f);

	END TRY

	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50055, @Descripcion = 'ERROR AL parsear el archivo de la simulación  ([dbo].[SPSimulacion])'
			PRINT 'ERROR AL PARSEAR EL XML EN LA SIMULACIÓN.'
			RETURN @@ERROR;
	END CATCH
	


	-- Sección donde vamos a declarar las variables para poder iterar por día.
	DECLARE @primerDia INT
	DECLARE @ultimoDia INT
	DECLARE @fechaMinima DATETIME
	DECLARE @fechaMaxima DATETIME
	DECLARE @fechaNodo DATE
	-- Asignamos las fechas a cada variable con MIN y MAX (funciones agregadas)
	BEGIN TRY
		SELECT 
			@fechaMinima = MIN(F.fecha)
		FROM @FechasPorIterar F
	
		SELECT 
			@fechaMaxima = MAX(F.fecha)
		FROM @FechasPorIterar F
	
		-- Inicializamos las variables inicio y fin de fechas con las cuales se va a recorrer la simulación.
		SELECT 
			@primerDia = F.iterador
		FROM
			@FechasPorIterar F
		WHERE
			F.fecha = @fechaMinima
	
		SELECT 
			@ultimoDia = F.iterador
		FROM
			@FechasPorIterar F
		WHERE
			F.fecha = @fechaMaxima
		--PRINT(@primerDia)
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50056, @Descripcion = 'ERROR AL inicializar las variable principales para recorrer la simulación ([dbo].[SPSimulacion])'
		RETURN @@ERROR;
	END CATCH
		--SELECT * FROM @FechasPorIterar
		-- Comezamo la simulación con un WHILE iniciando desde @primerDia hasta @ultimoDia.
		WHILE 
			@primerDia <= @ultimoDia

			BEGIN
				BEGIN TRY
				-- Obtenemos la fecha según el índice de la tabla fechas.
				SELECT 
					@FechaDeOperacion = F.fecha
				FROM
					@FechasPorIterar F
				WHERE 
					iterador = @primerDia

				SET @fechaNodo = @DocumentoXML.value('(/Operaciones/FechaOperacion/@Fecha)[1]','DATE')
				--PRINT(@primerDia)

			END TRY
			BEGIN CATCH
				EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50057, @Descripcion = 'ERROR AL obtener la fecha para ir iterando Simulación ([dbo].[SPSimulacion])'
				RETURN @@ERROR;
			END CATCH
				-- COMENZAMOS A PROCESAR LOS NODOS PRINCIPALES.
				
			BEGIN TRY
				-- PERSONAs
				INSERT INTO
					[dbo].[Persona]
								(
									 IdTipoDocumentoIdentidad
									,Nombre
									,ValorDocumentoIdentidad
									,FechaNacimiento
									,CorreoElectronico
									,Telefono1
									,Telefono2
									,InsertAt
									,UpdateAt
									,InsertBy
									,UpdateBy
									,InsertIn
									,UpdateIn
								)
				SELECT 
					 p.value('@TipoDocuIdentidad','INT')
					,p.value('@Nombre','VARCHAR(100)')
					,p.value('@ValorDocumentoIdentidad','INT')
					,p.value('@FechaNacimiento','DATE')
					,p.value('@Email','VARCHAR(50)')
					,p.value('@Telefono1','VARCHAR(50)')
					,p.value('@Telefono2','VARCHAR(50)')
					, @FechaDeOperacion AS [InsertAt] --obtiene la fecha del dia de insercion
					, null AS [UpdateAt] --obtiene la fecha del dia de actualizacion
					, CURRENT_USER AS [InsertBy] --string de prueba
					, '' AS [UpdateBy] --string de prueba
					, 'DESKTOP-FBGDAQE' AS [InsertIn] --string de prueba
					, '' AS [UpdateIn] --string de prueba

				FROM
					@DocumentoXML.nodes('/Operaciones/FechaOperacion[@Fecha eq sql:variable("@FechaDeOperacion")]/Persona')
				AS
					t(p);
				--WHERE		-- Esto para poder obtener sólo cuando es la fecha correcta.
				--	@DocumentoXML.value('(/Operaciones/FechaOperacion/@Fecha)[1]','DATE') = @FechaDeOperacion	--REVISAR NO FILTRA

			END TRY
			BEGIN CATCH
				EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50058, @Descripcion = 'ERROR AL Insertar Personas Simulación  ([dbo].[SPSimulacion])'
				RETURN @@ERROR;
			END CATCH



			BEGIN TRY
				DELETE 
					@tablaCuentasAhorro
				INSERT INTO 
					@tablaCuentasAhorro(idPersona,idTipoCuenta,numeroCuenta,fechaCreacion,saldo)
				SELECT 
					(	
						SELECT 
								P.Id
						FROM 
								[dbo].[Persona] P
						WHERE 
								CA.value('@ValorDocumentoIdentidadDelCliente', 'INT') = P.ValorDocumentoIdentidad
					) AS 
							[IdPersona]

					, CA.value('@TipoCuentaId', 'INT')
					, CA.value('@NumeroCuenta', 'INT')
					, @FechaDeOperacion AS [FechaCreacion]
					, 0 AS [Saldo]
				FROM 
					@DocumentoXML.nodes('/Operaciones/FechaOperacion[@Fecha eq sql:variable("@FechaDeOperacion")]/Cuenta') AS t(CA);
				EXEC SPInsertarCuentasAhorroSimulacion @tablaCuentasAhorro;

			END TRY
			BEGIN CATCH
				EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50059, @Descripcion = 'ERROR AL insertar los valores en la variable tabal cuenta AHorro Simulación ([dbo].[SPSimulacion])'
				RETURN @@ERROR;
			END CATCH
				--INSERT INTO [dbo].[CuentaAhorro]
				--(
				--	 [IdPersona]
				--	,[IdTipoCuenta]
				--	,[NumeroDeCuenta]
				--	,[FechaCreacion]
				--	,[Saldo]
				--	,[InsertAt]
				--	,[UpdateAt]
				--	,[InsertBy]
				--	,[UpdateBy]
				--	,[InsertIn]
				--	,[UpdateIn]
				--)
				--SELECT	
				--	(	
				--		SELECT 
				--				P.Id
				--		FROM 
				--				[dbo].[Persona] P
				--		WHERE 
				--				CA.value('@ValorDocumentoIdentidadDelCliente', 'INT') = P.ValorDocumentoIdentidad
				--	) AS 
				--			[IdPersona]

				--	, CA.value('@TipoCuentaId', 'INT')
				--	, CA.value('@NumeroCuenta', 'INT')
				--	, @FechaDeOperacion AS [FechaCreacion]
				--	, 0 AS [Saldo]
				--	, @FechaDeOperacion AS [InsertAt] --obtiene la fecha del dia de insercion
				--	, null AS [UpdateAt] --obtiene la fecha del dia de actualizacion
				--	, 'CURRENT_USER' AS [InsertBy] --string de prueba
				--	, 'CURRENT_USER' AS [UpdateBy] --string de prueba
				--	, 'DESKTOP-FBGDAQE' AS [InsertIn] --string de prueba
				--	, ' ' AS [UpdateIn] --string de prueba
			
				--FROM
				--	@DocumentoXML.nodes('/Operaciones/FechaOperacion[@Fecha eq sql:variable("@FechaDeOperacion")]/Cuenta')

				--AS
				--	t(CA);
				
				--WHERE		-- Esto para poder obtener sólo cuando es la fecha correcta.
				--	@DocumentoXML.value('(/Operaciones/FechaOperacion/@Fecha)[1]','DATE') = @FechaDeOperacion	--REVISAR NO FILTRA

			

			
				--**************************************************************
				--**************************************************************
				--**************************************************************
				--**************************************************************
				--AQUÍ DEBERÍA DE ENTRAR A FUNCIONAR EL TRIGGER DE ESTADO CUENTA.
				--**************************************************************
				--**************************************************************
				--**************************************************************
				--**************************************************************
				--**************************************************************

			--AQUÍ VA LA CUENTA OBJETIVO EN LA SIMULACIón.

			BEGIN TRY
		INSERT INTO [dbo].[CuentaObjetivo]
							(
								 [IdCuentaAhorro]
								,[NumeroCuentaObjetivo]
								,[FechaInicio]
								,[FechaFinal]
								,[Objetivo]
								,[Saldo]
								,[DiaDeAhorro]
								,[InteresAcumulado]
								,[Activo]
								,[InsertAt]
								,[UpdateAt]
								,[InsertBy]
								,[UpdateBy]
								,[InsertIn]
								,[UpdateIn]
							)
		SELECT	  
				  --d.value('@User', 'VARCHAR(100)')
				  (	
						SELECT 
								C.Id
						FROM 
								[dbo].[CuentaAhorro] C
						WHERE 
								d.value('@NumeroCuentaPrimaria', 'INT') = C.NumeroDeCuenta
					) AS [IdCuentaDeAhorro]
				, d.value('@NumeroCuentaAhorro', 'INT')
				, @FechaDeOperacion AS [FechaInicio]
				, d.value('@FechaFinal', 'DATE')
				, d.value('@Descripcion','VARCHAR(100)')
				, d.value('@MontoAhorro','MONEY')
				, d.value('@DiaAhorro','INT')
				, 0 AS [InteresAcumulado]
				, 1 AS [Activo]
				, GETDATE() AS [InsertAt] --obtiene la fecha del dia de insercion
				, GETDATE() AS [UpdateAt] --obtiene la fecha del dia de actualizacion
				, 'CURRENT_USER' AS [InsertBy] --string de prueba
				, 'CURRENT_USER' AS [UpdateBy] --string de prueba
				, 'Mi PC' AS [InsertIn] --string de prueba
				, 'Mi PC' AS [UpdateIn] --string de prueba
		FROM 
				@DocumentoXML.nodes('/Operaciones/FechaOperacion[@Fecha eq sql:variable("@FechaDeOperacion")]/CuentaAhorro') AS t(d);

	END TRY

	BEGIN CATCH
			EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50106, @Descripcion = 'ERROR AL insertar las cuentas objetivo en simulación  ([dbo].[SPSimulacion])'
				RETURN @@ERROR;
	END CATCH

			BEGIN TRY

				INSERT INTO [dbo].[Beneficiario]
									(
										 [IdPersona]
										,[IdCuentaDeAhorro]
										,[IdTipoParentezco]
										,[Porcentaje]
										,[Activo]
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
					--,  1 AS [IdTipoParentezco] 
					, d.value('@ParentezcoId', 'INT')
					, d.value('@Porcentaje', 'INT')

					, 1 AS [Activo]

					, @FechaDeOperacion AS [InsertAt] --obtiene la fecha del dia de insercion
					, null AS [UpdateAt] --obtiene la fecha del dia de actualizacion
					, 'CURRENT_USER' AS [InsertBy] --string de prueba
					, '' AS [UpdateBy] --string de prueba
					, 'DESKTOP-FBGDAQE' AS [InsertIn] --string de prueba
					, '' AS [UpdateIn] --string de prueba
			
				FROM
					@DocumentoXML.nodes('/Operaciones/FechaOperacion[@Fecha eq sql:variable("@FechaDeOperacion")]/Beneficiario')
			
				AS 
					t(d);

				--WHERE		-- Esto para poder obtener sólo cuando es la fecha correcta.
				--	@DocumentoXML.value('(/Operaciones/FechaOperacion/@Fecha)[1]','DATE') = @FechaDeOperacion	--REVISAR NO FILTRA
			END TRY
			BEGIN CATCH
				EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50060, @Descripcion = 'ERROR AL insertar beneficiarios en simulación  ([dbo].[SPSimulacion])'
				RETURN @@ERROR;
			END CATCH


			BEGIN TRY
				DELETE 
					@TablaMovimientoAux
				INSERT INTO 
					@TablaMovimientoAux(idTipoMovimiento,numeroCuenta,monto,fecha,descripcion)
				SELECT 
					  m.value('@Tipo', 'INT')
					, m.value('@CodigoCuenta', 'INT')
					, m.value('@Monto', 'MONEY')
					, @FechaDeOperacion AS fecha
					, m.value('@Descripcion','VARCHAR(100)')
				FROM 
					@DocumentoXML.nodes('/Operaciones/FechaOperacion[@Fecha eq sql:variable("@FechaDeOperacion")]/Movimientos') AS t(m);
				EXEC SPInsertarMovimientoSimulacion @TablaMovimientoAux;
			END TRY
			BEGIN CATCH
				EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50061, @Descripcion = 'ERROR AL Insertar los valores en la variable tabla movimiento en simulación  ([dbo].[SPSimulacion])'
				RETURN @@ERROR;
			END CATCH

	
	BEGIN TRY
		INSERT INTO [dbo].[Usuario]
							(
								 [Nombre]
								,[Password]
								,[EsAdministrador]
								,[Email]
								,[ValorDocumentoIdentidad]
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
				, d.value('@Email','VARCHAR(50)')
				, d.value('@ValorDocumentoIdentidad','VARCHAR(50)')
				, GETDATE() AS [InsertAt] --obtiene la fecha del dia de insercion
				, GETDATE() AS [UpdateAt] --obtiene la fecha del dia de actualizacion
				, 'CURRENT_USER' AS [InsertBy] --string de prueba
				, 'CURRENT_USER' AS [UpdateBy] --string de prueba
				, 'amazon-server' AS [InsertIn] --string de prueba
				, 'amazon-server' AS [UpdateIn] --string de prueba
		FROM 
				@DocumentoXML.nodes('/Operaciones/FechaOperacion[@Fecha eq sql:variable("@FechaDeOperacion")]/Usuario') AS t(d);
				--@DocumentoXML.nodes('/Usuarios/Usuario') AS t(d);
	END TRY

	BEGIN CATCH
			EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50062, @Descripcion = 'ERROR AL insertar los usuarios en simulación  ([dbo].[SPSimulacion])'
				RETURN @@ERROR;
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
				(SELECT U.Id FROM [dbo].[Usuario] U WHERE d.value('@User', 'VARCHAR(100)') = U.Nombre) AS [IdUsuario]
				,(SELECT C.Id FROM [dbo].[CuentaAhorro] C WHERE d.value('@NumeroCuenta', 'INT') = C.NumeroDeCuenta) AS [IdCuentaDeAhorro]
				, '1' AS [Activo]
				, GETDATE() AS [InsertAt] --obtiene la fecha del dia de insercion
				, GETDATE() AS [UpdateAt] --obtiene la fecha del dia de actualizacion
				, CURRENT_USER AS [InsertBy] --string de prueba
				, CURRENT_USER AS [UpdateBy] --string de prueba
				, 'amazon-server' AS [InsertIn] --string de prueba
				, 'amazon-server' AS [UpdateIn] --string de prueba
		FROM 
				@DocumentoXML.nodes('/Operaciones/FechaOperacion[@Fecha eq sql:variable("@FechaDeOperacion")]/UsuarioPuedeVer') AS t(d)
				--@DocumentoXML.nodes('/Usuarios_Ver/UsuarioPuedeVer') AS t(d)
		
	END TRY

	BEGIN CATCH
			EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50063, @Descripcion = 'ERROR AL Insertar los UPA(Usuario puede accesar) en simulación.  ([dbo].[SPSimulacion])'
				RETURN @@ERROR;
	END CATCH





























			--INSERT INTO [dbo].[Movimiento]
			--					(
									 
			--						 [IdTipoMovimiento]
			--						,[IdCuentaAhorro]
			--						,[IdEstadoDeCuenta]
			--						,[Monto]
			--						,[Fecha]
			--						,[Descripcion]
			--					)
			--SELECT	 
				
			--	 d.value('@Tipo', 'INT')
			--	,(SELECT C.Id FROM [dbo].[CuentaAhorro] C WHERE d.value('@CodigoCuenta', 'INT') = C.NumeroDeCuenta) AS [IdCuentaAhorro]
			--	,(SELECT EC.Id FROM [dbo].[EstadoCuenta] EC WHERE IdCuentaDeAhorro = 
			--	INNER JOIN Cuen
			--	) AS [IdCuentaAhorro]				

			--	, 1 AS [Activo]

			--	, @FechaDeOperacion AS [InsertAt] --obtiene la fecha del dia de insercion
			--	, null AS [UpdateAt] --obtiene la fecha del dia de actualizacion
			--	, 'CURRENT_USER' AS [InsertBy] --string de prueba
			--	, '' AS [UpdateBy] --string de prueba
			--	, 'DESKTOP-FBGDAQE' AS [InsertIn] --string de prueba
			--	, '' AS [UpdateIn] --string de prueba
			--FROM 
			--	@DocumentoXML.nodes('/Operaciones/FechaOperacion/Beneficiario') 
			--AS 
			--	t(d)

			--WHERE		-- Esto para poder obtener sólo cuando es la fecha correcta.
			--	@DocumentoXML.value('(/Operaciones/FechaOperacion/@Fecha)[1]','DATE') = @FechaDeOperacion	--REVISAR NO FILTRA




			--SELECT * FROM @TablaMovimientoAux
			SET @primerDia = @primerDia + 1;
		END --Fin WHILE

		

END