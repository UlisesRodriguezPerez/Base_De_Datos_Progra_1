USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPEliminarCuentaObjetivo]    Script Date: 5/12/2020 23:48:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE    PROCEDURE [dbo].[SPEliminarCuentaObjetivo]
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
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50023, @Descripcion = 'ERROR AL Eliminar CuentaObjetivo ([dbo].[SPEliminarCuentaObjetivo])'
		--PRINT  'Algo salió mal al eliminar CO.'
		RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
END


GO
