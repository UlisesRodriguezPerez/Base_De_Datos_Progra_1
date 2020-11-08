
-- ==============================================================================
-- Author:		Natalia Vargas 
-- Create date: 08/11/2020
-- Description:	Buscar de manera ordenada los estados de cuenta
-- ==============================================================================

USE [BD_TP1_Cuenta_De_Ahorros]
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

--SELECT * FROM [dbo].[TipoParentezco]
--DROP PROCEDURE SPObtenerTiposParentezco
--EXEC SPObtenerTiposParentezco;
GO