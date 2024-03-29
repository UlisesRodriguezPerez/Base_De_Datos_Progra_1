USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPActualizarBeneficiario]    Script Date: 28/11/2020 14:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE OR ALTER PROCEDURE [dbo].[SPActualizarCuentaObjetivo]
	(
	   	 @pIdCuentaObjetivo INT
		,@pNumeroCuentaAhorro INT
		,@pObjetivo VARCHAR(100)
		
		,@pSaldo MONEY
		,@pInteresAcumulado MONEY
		
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
					,InteresAcumulado = @pInteresAcumulado

			   WHERE 
					ID = @pIdCuentaObjetivo 
		COMMIT TRANSACTION

	END TRY
	BEGIN CATCH
		PRINT  'Algo salió mal al actualizar CO.'
		RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;



END



	
