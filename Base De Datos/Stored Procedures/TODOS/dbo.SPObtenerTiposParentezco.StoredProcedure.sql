USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerTiposParentezco]    Script Date: 10/11/2020 20:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE	PROCEDURE [dbo].[SPObtenerTiposParentezco]
     
AS
BEGIN      
   SELECT 
		 [Id]
		,[Nombre]
	FROM 
		[dbo].[TipoParentezco]
	
END
GO
