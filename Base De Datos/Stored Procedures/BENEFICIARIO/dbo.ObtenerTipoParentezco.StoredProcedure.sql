USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerTiposParentezco]    Script Date: 4/12/2020 11:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER	PROCEDURE [dbo].[SPObtenerTiposParentezco]
     
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
		PRINT  'Algo salió mal al obtener tipos de parentezco.'
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END
