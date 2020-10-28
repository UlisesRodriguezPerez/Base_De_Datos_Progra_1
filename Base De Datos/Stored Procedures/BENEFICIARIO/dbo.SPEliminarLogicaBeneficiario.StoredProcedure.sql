-- ==============================================================================
-- Author:		Natalia Vargas 
-- Create date: 28/10/2020
-- Description:	Eliminar de manera logica un beneficiario, es decir cambiar el campo activo
-- ==============================================================================

USE [BD_TP1_Cuenta_De_Ahorros]
GO


CREATE   PROCEDURE [dbo].[SPEliminarLogicoBeneficiario]
(
	@pIdPersona INT
)

AS  
BEGIN       
   Update 
		[dbo].[Beneficiario]
   SET 
		 Activo = 0
   WHERE 
		IdPersona = @pIdPersona     
END
GO
--DROP PROCEDURE SPEliminarLogicoBeneficiario;
--EXEC SPEliminarLogicoBeneficiario @pIdPersona = 1;