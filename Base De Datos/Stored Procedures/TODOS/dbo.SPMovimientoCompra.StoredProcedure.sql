USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPMovimientoCompra]    Script Date: 5/12/2020 23:48:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE    PROCEDURE [dbo].[SPMovimientoCompra]
		@monto MONEY
		,@idDeCuentaAhorro INT


AS 
BEGIN 
	
	BEGIN TRY
		SET NOCOUNT ON;
		BEGIN TRANSACTION
		Update 
			[dbo].[CuentaAhorro]
		SET		
			Saldo = Saldo - @monto
		WHERE 
			Id = @idDeCuentaAhorro

		UPDATE
			EstadoCuenta
		SET 
			SaldoFinal = SaldoFinal - @monto
		WHERE 
			IdCuentaDeAhorro = @idDeCuentaAhorro
		COMMIT TRANSACTION
		SET NOCOUNT OFF;
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50038, @Descripcion = 'ERROR AL realizar movimiento Compra ([dbo].[SPMovimientoCompra])'
		PRINT  'Algo salió al mostrar usuarios.'
		RETURN @@ERROR ;
	END CATCH
	
END


GO
