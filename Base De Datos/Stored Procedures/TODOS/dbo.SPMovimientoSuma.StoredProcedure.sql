USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPMovimientoSuma]    Script Date: 5/12/2020 23:48:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE    PROCEDURE [dbo].[SPMovimientoSuma]
		@monto MONEY
		,@idDeCuentaAhorro INT


AS 
BEGIN 
	BEGIN TRY 
		BEGIN TRANSACTION
		Update 
			[dbo].[CuentaAhorro]
		SET		
			Saldo = Saldo + @monto
		WHERE 
			Id = @idDeCuentaAhorro

		UPDATE
			EstadoCuenta
		SET 
			SaldoFinal = SaldoFinal + @monto
		WHERE 
			IdCuentaDeAhorro = @idDeCuentaAhorro

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50040, @Descripcion = 'ERROR AL realizar movimiento para sumar en CA ([dbo].[SPMovimientoSuma])'
		PRINT  'Algo salió mal al realizar la suma.'
		RETURN @@ERROR;
	END CATCH
END


GO
