USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPInsertarMovimientoSimulacion]    Script Date: 1/12/2020 03:04:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER  PROCEDURE [dbo].[SPInsertarCuentasAhorroSimulacion]
		@tablaCuentasAhorro [dbo].[CuentaAhorroPerTrigger] READONLY
		 --@idTipoMovimiento INTj
		--,@numeroCuenta INT
		----,@idCuentaAhorro INT
		----,@idEstadoCuenta INT
		--,@monto MONEY
		--,@fecha DATETIME
		--,@descripcion VARCHAR(100)

AS 
BEGIN -- <Movimientos Tipo="5" CodigoCuenta="11895861" Monto="44438091.00" Descripcion="Banco Central" />
	
	DECLARE @idTipoMovimiento INT
	DECLARE @numeroCuenta INT
	DECLARE @monto MONEY
	DECLARE @fecha DATETIME
	DECLARE @descripcion VARCHAR(100)

	DECLARE @idMenor INT
	DECLARE @idMayor INT

	DECLARE @idDeCuentaAhorro INT
	DECLARE @idEstadoCuenta INT


	

	SET NOCOUNT ON;
	--BEGIN TRY
		BEGIN TRANSACTION
		SELECT @idMenor = min([id]), @idMayor=max([id]) FROM @tablaCuentasAhorro
		WHILE @idMenor <= @idMayor
			BEGIN
				--SELECT @idTipoMovimiento = idTipoMovimiento FROM @TablaMovimientoAux WHERE id = @idMenor
		--		SELECT @numeroCuenta = numeroCuenta FROM @TablaMovimientoAux WHERE id = @idMenor
		--		SELECT @monto = monto FROM @TablaMovimientoAux WHERE id = @idMenor
		--		SELECT @fecha = fecha FROM @TablaMovimientoAux WHERE id = @idMenor
		--		SELECT @descripcion = descripcion FROM @TablaMovimientoAux WHERE id = @idMenor
		--		SELECT @idDeCuentaAhorro = Id FROM [dbo].[CuentaAhorro] WHERE NumeroDeCuenta = @numeroCuenta
		--		SELECT @idEstadoCuenta = Id FROM [dbo].[EstadoCuenta] WHERE IdCuentaDeAhorro = @idDeCuentaAhorro
		--		print('idTM')
		--		print(@idTipoMovimiento)
		--		print('numeCuen')
		--		print(@numeroCuenta)
		--		print('monto')
		--		print(@monto)
		--		print('fecha')
		--		print(@fecha)
		--		print('descripcion')
		--		print(@descripcion)
		--		print('id Cuenta ahorro')
		--		print(@idDeCuentaAhorro)
		--		print('id Estado Cuenta')
		--		print(@idEstadoCuenta)
	


		--		-- En caso de ser Debito se le resta a la CA, de lo contrario se le suma.
		--		IF @idTipoMovimiento < 4
		--			BEGIN
		--				Update 
		--					[dbo].[CuentaAhorro]
		--				SET		
		--					Saldo = Saldo - @monto
		--				WHERE 
		--					Id = @idDeCuentaAhorro
		--			END
		--		ELSE
		--			BEGIN
		--				Update 
		--					[dbo].[CuentaAhorro]
		--				SET		
		--					Saldo = Saldo + @monto
		--				WHERE 
		--					Id = @idDeCuentaAhorro
		--			END

		--		INSERT 
		--			INTO [dbo].[Movimiento]
		--			(
		--				 IdTipoMovimiento
		--				,IdCuentaAhorro
		--				,IdEstadoDeCuenta
		--				,Monto
		--				,Fecha
		--				,Descripcion
		--			)
		--			VALUES(
		--				 @idTipoMovimiento
		--				,@idDeCuentaAhorro
		--				,@idEstadoCuenta
		--				,@monto
		--				,@fecha
		--				,@descripcion
		--				);
		--		SET @idMenor = @idMenor + 1
		--	END
		--	SELECT * FROM @TablaMovimientoAux

		--COMMIT TRANSACTION
	--END TRY
	--BEGIN CATCH
	--	PRINT  'Algo salió mal al INSERTAR Movimiento.'
	--	RETURN @@ERROR;
	--END CATCH
	SET NOCOUNT OFF;
	END
END


