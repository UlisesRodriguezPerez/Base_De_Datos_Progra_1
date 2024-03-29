USE [BD_TP1_Cuenta_De_Ahorros]
GO



CREATE OR ALTER  PROCEDURE [dbo].[SPMovimientosCuentasObjetivosSimulacion]
		@TablaCuentasObjetivo [dbo].[TableCOParaMovimientos] READONLY

AS 
BEGIN -- <Movimientos Tipo="5" CodigoCuenta="11895861" Monto="44438091.00" Descripcion="Banco Central" />
	

	DECLARE @idCuentaAhorro INT
	DECLARE @numeroCuentaObjetivo INT
	DECLARE @fechaInicio DATE
	DECLARE @fechaFinal DATE
	DECLARE @objetivo VARCHAR(100)

	DECLARE @saldo MONEY
	DECLARE @diDeAhorro INT

	DECLARE @interesAcumulado INT
	DECLARE @activo BIT

	DECLARE @idMenor INT
	DECLARE @idMayor INT



	SET NOCOUNT ON;
	BEGIN TRY

		SELECT @idMenor = min([id]), @idMayor=max([id]) FROM @TablaCuentasObjetivo
		WHILE @idMenor <= @idMayor
			BEGIN
				
				--SELECT @idTipoMovimiento = idTipoMovimiento FROM @TablaMovimientoAux WHERE id = @idMenor
				--SELECT @numeroCuenta = numeroCuenta FROM @TablaMovimientoAux WHERE id = @idMenor
				--SELECT @monto = monto FROM @TablaMovimientoAux WHERE id = @idMenor
				--SELECT @fecha = fecha FROM @TablaMovimientoAux WHERE id = @idMenor
				--SELECT @descripcion = descripcion FROM @TablaMovimientoAux WHERE id = @idMenor
				--SELECT @idDeCuentaAhorro = Id FROM [dbo].[CuentaAhorro] WHERE NumeroDeCuenta = @numeroCuenta
				--SELECT @idEstadoCuenta = Id FROM [dbo].[EstadoCuenta] WHERE IdCuentaDeAhorro = @idDeCuentaAhorro

				--SELECT @MaxRetiroHumano = TCA.MaxCajeroAutomatico FROM TipoCuentaAhorro TCA INNER JOIN CuentaAhorro CA ON IdTipoCuenta = TCA.Id
				--SELECT @MaxRetiroAutomatico = TCA.MaxCajeroAutomatico FROM TipoCuentaAhorro TCA INNER JOIN CuentaAhorro CA ON IdTipoCuenta = TCA.Id
				
				--SELECT @retiroHumanoActual = CA.CantidadRetirosHumano FROM CuentaAhorro CA WHERE Id = @idDeCuentaAhorro
				--SELECT @retiroAutomaticoActual = CA.CantidadRetirosAutomatico FROM CuentaAhorro CA WHERE Id = @idDeCuentaAhorro

				--SELECT @comisionHumano = TCA.CobroCajeroHumano FROM TipoCuentaAhorro TCA INNER JOIN CuentaAhorro CA ON IdTipoCuenta = TCA.Id
				--SELECT @comisionAutomatico = TCA.CobroCajeroAutomatico FROM TipoCuentaAhorro TCA INNER JOIN CuentaAhorro CA ON IdTipoCuenta = TCA.Id
				

				---- En caso de ser Debito se le resta a la CA, de lo contrario se le suma.
				--IF @idTipoMovimiento = 1
				--	BEGIN
				--		EXEC SPMovimientoSuma @monto,@idDeCuentaAhorro
				--	END
				--IF @idTipoMovimiento = 2 
				--	BEGIN
				--		BEGIN TRANSACTION
				--		update CuentaAhorro SET CantidadRetirosAutomatico = CantidadRetirosAutomatico + 1 WHERE Id = @idDeCuentaAhorro;
				--		COMMIT TRANSACTION
				--		IF @retiroAutomaticoActual + 1 > @MaxRetiroAutomatico
				--			BEGIN
				--				INSERT 
				--					INTO [dbo].[Movimiento]
				--					(
				--						 IdTipoMovimiento
				--						,IdCuentaAhorro
				--						,IdEstadoDeCuenta
				--						,Monto
				--						,Fecha
				--						,Descripcion
				--					)
				--					VALUES(
				--						 9 --Id 9 porque así viene en el XML.
				--						,@idDeCuentaAhorro
				--						,@idEstadoCuenta
				--						,@comisionAutomatico
				--						,@fecha
				--						,'Comision exceso de operacion en CA'
				--						);
				--					EXEC SPMovimientoResta @monto,@idDeCuentaAhorro
				--			END

				--	END
				--	IF @idTipoMovimiento = 3 
				--	BEGIN
				--		BEGIN TRANSACTION 
				--		update CuentaAhorro SET CantidadRetirosHumano = CantidadRetirosHumano + 1 WHERE Id = @idDeCuentaAhorro;
				--		COMMIT TRANSACTION 

				--		IF @retiroHumanoActual + 1 > @MaxRetiroHumano
				--			BEGIN
				--				INSERT 
				--					INTO [dbo].[Movimiento]
				--					(
				--						 IdTipoMovimiento
				--						,IdCuentaAhorro
				--						,IdEstadoDeCuenta
				--						,Monto
				--						,Fecha
				--						,Descripcion
				--					)
				--					VALUES(
				--						 8 --Id 8 porque así viene en el XML.
				--						,@idDeCuentaAhorro
				--						,@idEstadoCuenta
				--						,@comisionAutomatico
				--						,@fecha
				--						,'Comision exceso de operacion en CH'
				--						);
				--					EXEC SPMovimientoResta @monto,@idDeCuentaAhorro
				--			END

				--	END
				--	IF @idTipoMovimiento = 4 OR @idTipoMovimiento = 5 OR @idTipoMovimiento = 6
				--	BEGIN
				--		EXEC SPMovimientoSuma @monto,@idDeCuentaAhorro 
				--	END


				

				--INSERT 
				--	INTO [dbo].[Movimiento]
				--	(
				--		 IdTipoMovimiento
				--		,IdCuentaAhorro
				--		,IdEstadoDeCuenta
				--		,Monto
				--		,Fecha
				--		,Descripcion
				--	)
				--	VALUES(
				--		 @idTipoMovimiento
				--		,@idDeCuentaAhorro
				--		,@idEstadoCuenta
				--		,@monto
				--		,@fecha
				--		,@descripcion
						--);
				SET @idMenor = @idMenor + 1
			END
			--SELECT * FROM @TablaMovimientoAux

	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50034, @Descripcion = 'ERROR AL insertar movimiento de la simulación ([dbo].[SPInsertarMovimientoSimulacion])'
		PRINT  'Algo salió mal al INSERTAR Movimiento.'
		RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
	
END


