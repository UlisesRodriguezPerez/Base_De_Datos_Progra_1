USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPActualizarCuentaObjetivo]    Script Date: 15/1/2021 17:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





ALTER   PROCEDURE [dbo].[SPActualizarCuentaObjetivo]
	(
	   	 @pIdCuentaObjetivo INT
		,@pNumeroCuentaAhorro INT
		,@pObjetivo VARCHAR(100)
		
		,@pSaldo MONEY
		--,@pInteresAcumulado MONEY
		,@pFechaFinal DATE
		,@pDiaDeAhorro INT
	)
AS 
BEGIN    
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN TRANSACTION
			   Update 
					[dbo].[CuentaObjetivo]
			   SET		

					 Objetivo = @pObjetivo
					,Saldo = @pSaldo
					,FechaFinal = @pFechaFinal
					,DiaDeAhorro = @pDiaDeAhorro
					--,InteresAcumulado = @pInteresAcumulado
					,UpdateBy = 'DESKTOP-FBGDAQE'
					,UpdateIn = 'DESKTOP-FBGDAQE'
					,UpdateAt = GETDATE()

			   WHERE 
					ID = @pIdCuentaObjetivo 
		COMMIT TRANSACTION

	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50001, @Descripcion = 'Problemas al actualizar CuentaObjetivo'
		--PRINT  'Algo salió mal al actualizar CO.'
		--RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;



END



	
