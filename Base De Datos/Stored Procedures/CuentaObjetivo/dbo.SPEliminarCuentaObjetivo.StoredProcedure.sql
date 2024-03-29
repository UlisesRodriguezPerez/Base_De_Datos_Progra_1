USE [BD_TP1_Cuenta_De_Ahorros]
GO


CREATE OR ALTER  PROCEDURE [dbo].[SPEliminarCuentaObjetivo]
(
	@pIdCuentaObjetivo INT
)

AS 
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		DELETE FROM 
				[dbo].[CuentaObjetivo]
		WHERE  
				Id = @pIdCuentaObjetivo;  
	END TRY
	BEGIN CATCH
		PRINT  'Algo salió mal al eliminar CO.'
		RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
END


