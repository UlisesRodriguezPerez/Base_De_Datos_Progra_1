
-- ==============================================================================
-- Author:		Natalia Vargas 
-- Create date: 02/11/2020
-- Description:	Buscar a una persona en la tabla [dbo].[Persona]
-- ==============================================================================

USE [BD_TP1_Cuenta_De_Ahorros]
GO

CREATE	PROCEDURE [dbo].[SPBuscarUsuario]
(      
   @pValorDocumentoIdentidad	INT 
)      
AS
BEGIN      
   SELECT 
		 [Nombre]
		,[FechaNacimiento]
		,[Telefono1]
		,[Telefono2]
		,[CorreoElectronico]
	FROM 
		[dbo].[Persona]
	WHERE 
		ValorDocumentoIdentidad=@pValorDocumentoIdentidad    
END
GO
--DROP PROCEDURE [SPBuscarUsuario]
--GO