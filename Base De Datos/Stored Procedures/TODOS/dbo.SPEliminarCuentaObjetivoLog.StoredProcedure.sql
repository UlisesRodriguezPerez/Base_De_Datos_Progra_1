USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPEliminarCuentaObjetivoLog]    Script Date: 5/12/2020 23:48:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE      PROCEDURE [dbo].[SPEliminarCuentaObjetivoLog]
(
	@pIdCuentaObjetivo INT
)

AS  
BEGIN  
	SET NOCOUNT ON;
	BEGIN TRY
	   UPDATE 
			[dbo].[CuentaObjetivo]
	   SET 
			  Activo = 0
			 ,FechaFinal = GETDATE()
	   WHERE 
			Id = @pIdCuentaObjetivo    
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50024, @Descripcion = 'ERROR AL Eliminar CuentaObjetivoLogico ([dbo].[SPEliminarCuentaObjetivoLog])'
		--PRINT  'Algo salió mal al eliminar CO.'
		RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
END
GO
