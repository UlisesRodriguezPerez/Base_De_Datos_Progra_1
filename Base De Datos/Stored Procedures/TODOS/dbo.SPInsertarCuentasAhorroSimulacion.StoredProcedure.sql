USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPInsertarCuentasAhorroSimulacion]    Script Date: 5/12/2020 23:48:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE    PROCEDURE [dbo].[SPInsertarCuentasAhorroSimulacion]
		@tablaCuentasAhorro [dbo].[CuentaAhorroPerTrigger] READONLY
			

AS 
BEGIN -- <Movimientos Tipo="5" CodigoCuenta="11895861" Monto="44438091.00" Descripcion="Banco Central" />
	


	DECLARE @idMenor INT
	DECLARE @idMayor INT

	DECLARE @idDeCuentaAhorro INT
	DECLARE @idEstadoCuenta INT

	DECLARE @idPersona INT
	DECLARE @idTipoCuenta INT
	DECLARE @numeroCuenta INT
	DECLARE @fechaCreacion DATE
	DECLARE @saldo MONEY
	
	

	SET NOCOUNT ON;
	BEGIN TRY
		--BEGIN TRANSACTION
		SELECT @idMenor = min([id]), @idMayor=max([id]) FROM @tablaCuentasAhorro
		WHILE @idMenor <= @idMayor
			BEGIN
				SELECT @idPersona = idPersona FROM @tablaCuentasAhorro WHERE id = @idMenor
				SELECT @idTipoCuenta = idTipoCuenta FROM @tablaCuentasAhorro WHERE id = @idMenor
				SELECT @numeroCuenta = numeroCuenta FROM @tablaCuentasAhorro WHERE id = @idMenor
				SELECT @fechaCreacion = fechaCreacion FROM @tablaCuentasAhorro WHERE id = @idMenor
				SELECT @saldo = saldo FROM @tablaCuentasAhorro WHERE id = @idMenor

				INSERT CuentaAhorro
					(
						 IdPersona
						,IdTipoCuenta
						,[NumeroDeCuenta]
						,[FechaCreacion]
						,[Saldo]
						,[InsertAt]
						,[UpdateAt]
						,[InsertBy]
						,[UpdateBy]
						,[InsertIn]
						,[UpdateIn]
						,[CantidadRetirosHumano]
						,[CantidadRetirosAutomatico]
					)
				VALUES
					(
						 @idPersona
						,@idTipoCuenta
						,@numeroCuenta
						,@fechaCreacion
						,@saldo
						,@fechaCreacion
						,null
						,'CURRENT_USER' 
						,null
						,'DESKTOP-FBGDAQE'
						,null
						,0
						,0
					);
		

				SET @idMenor = @idMenor + 1
			END
		--	SELECT * FROM @tablaCuentasAhorro

		--COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50032, @Descripcion = 'ERROR AL insertar la cuenta de ahorro al recorrer la simulación ([dbo].[SPInsertarCuentasAhorroSimulacion])'
		PRINT  'Algo salió mal al INSERTAR Movimiento.'
		RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
	
END


GO
