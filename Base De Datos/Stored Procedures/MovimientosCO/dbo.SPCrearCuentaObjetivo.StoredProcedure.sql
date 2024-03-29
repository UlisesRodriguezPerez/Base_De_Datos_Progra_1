USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPCrearCuentaObjetivo]    Script Date: 15/1/2021 15:25:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[SPCrearCuentaObjetivo]    Script Date: 28/11/2020 12:56:42 ******/



ALTER       PROCEDURE [dbo].[SPCrearCuentaObjetivo]
		(
			 @pNumeroCuentaAhorro INT
			,@pNumeroCuentaObjetivo INT
			,@pObjetivo VARCHAR (100)
			,@pSaldo MONEY
			--,@pInteresAcumulado MONEY
			,@pFechaFinal DATE
			,@pDiaDeAhorro INT
		)

AS 

BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		DECLARE @pIdDeCuentaAhorro INT

		DECLARE @idCuentaObjetivo INT
		SET @idCuentaObjetivo = 0


		--Obtenenemos id de la cuenta AHorro gracias al número de cuenta.
		SELECT 
			@pIdDeCuentaAhorro = Id 
		FROM 
			[dbo].[CuentaAhorro] 
		WHERE 
			NumeroDeCuenta = @pNumeroCuentaAhorro;


		---- Para saber si ya existe o no y si está en activo = 0
		--SELECT 
		--	@idCuentaObjetivo = CO.Id
		--FROM 
		--	[CuentaObjetivo] CO
		--	INNER JOIN CuentaAhorro CA ON IdCuentaAhorro = CA.Id
		--WHERE 
		--	CO.IdCuentaAhorro = @pIdDeCuentaAhorro 
		SELECT 
			@idCuentaObjetivo = CO.Id
		FROM
			[CuentaObjetivo] CO
			INNER JOIN CuentaAhorro CA ON IdCuentaAhorro = CA.Id
		WHERE
			CO.NumeroCuentaObjetivo = @pNumeroCuentaObjetivo AND CA.Id = CO.IdCuentaAhorro
		--PENDIENTE -> Chequear validacion del número de cuenta principal.


		IF @idCuentaObjetivo = 0
			BEGIN
				INSERT 
					INTO [dbo].[CuentaObjetivo]
						(
							 IdCuentaAhorro
							,[NumeroCuentaObjetivo]
							,FechaInicio
							,FechaFinal
							,Objetivo
							,Saldo
							,DiaDeAhorro
							--,InteresAcumulado
							,Activo
							,InsertAt
							,UpdateAt
							,InsertBy
							,UpdateBy
							,InsertIn
							,UpdateIn
						)

					VALUES(
			
							 @pIdDeCuentaAhorro
							,@pNumeroCuentaObjetivo
							,GETDATE()
							,@pFechaFinal
							,@pObjetivo
							,@pSaldo
							,@pDiaDeAhorro
							--,@pInteresAcumulado
							,1
							,GETDATE()
							,null
							,'DESKTOP-FBGDAQE\ulirp'
							,''
							,'DESKTOP-FBGDAQE\ulirp'
							,''
						)
		
			END

			ELSE
				BEGIN
					BEGIN TRANSACTION
					Update 
						[dbo].[CuentaObjetivo]
					SET		
							 Activo = 1
							,Saldo = @pSaldo
							--,InteresAcumulado = @pInteresAcumulado
							,Objetivo = @pObjetivo
							,FechaInicio = GETDATE()
							,FechaFinal = @pFechaFinal
							,DiaDeAhorro = @pDiaDeAhorro
							
					WHERE 
						Id = @idCuentaObjetivo
					COMMIT TRANSACTION
				END
					
			
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50021, @Descripcion = 'ERROR AL CREAR CUENTA OBJETIVO (SPCrearCuentaObjetivo)'
		--PRINT  'Algo salió mal al insertar Cuenta Objetivo.'
		--RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
END

--EXEC SPCrearCuentaObjetivo @pNumeroCuentaAhorro = 11435357,@pNumeroCuentaObjetivo = 55,@pObjetivo = '5',@pSaldo = 5, @pFechaFinal = '12-10-2025', @pDiaDeAhorro = 5;
--EXEC [SPCrearCuentaObjetivo] @pNumeroCuentaAhorro = 11013939,@pObjetivo = 'PRUEBA',@pSaldo = 5000,@pInteresAcumulado = 200
--SELECT * FROM ErrorLog