-- ==============================================================================
-- Author:		Natalia Vargas 
-- Create date: 19/10/2020
-- Description:	Devolver un beneficiario en la tabla [dbo].[Beneficiario]
-- ==============================================================================

USE [BD_TP1_Cuenta_De_Ahorros]
GO
CREATE PROCEDURE [dbo].[SPObtenerPersona]
(
	@pId INT
)
AS 
BEGIN
	SELECT 
		 Nombre
		,ValorDocumentoIdentidad
		,FechaNacimiento
		,Telefono1
		,Telefono2
		,CorreoElectronico

	FROM [dbo].[Persona]
	WHERE  
		Id = @pId;

END

--SELECT * FROM Persona
--DROP PROCEDURE SPObtenerBeneficiario;
--GO
--EXEC SPObtenerPersona 20;
GO
