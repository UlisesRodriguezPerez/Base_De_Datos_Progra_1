USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPEliminarCuentaObjetivo]    Script Date: 28/11/2020 18:15:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER    PROCEDURE [dbo].[SPEliminarCuentaObjetivoLog]
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
		PRINT  'Algo salió mal al eliminar CO.'
		RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
END
