USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerTiposParentezco]    Script Date: 5/12/2020 23:48:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE	PROCEDURE [dbo].[SPObtenerTiposParentezco]
     
AS
BEGIN     
	SET NOCOUNT ON;
	BEGIN TRY
	   SELECT 
			 [Id]
			,[Nombre]
		FROM 
			[dbo].[TipoParentezco]
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50052, @Descripcion = 'ERROR AL obtener los tipos de parentezco ([dbo].[SPObtenerTiposParentezco])'
		PRINT  'Algo salió mal al obtener tipos de parentezco.'
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END
GO
