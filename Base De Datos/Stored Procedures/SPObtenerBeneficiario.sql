
-- ==============================================================================
-- Author:		Natalia Vargas 
-- Create date: 19/10/2020
-- Description:	Devolver un beneficiario en la tabla [dbo].[Beneficiario]
-- ==============================================================================

USE [BD_TP1_Cuenta_De_Ahorros]
GO

CREATE PROCEDURE [dbo].[SPObtenerBeneficiario]
@pIdPersona INT
AS 
BEGIN
	SELECT * FROM [dbo].[Beneficiario]
	WHERE  IdPersona = @pIdPersona;

END

--SELECT * FROM Beneficiario
--SELECT * FROM CuentaAhorro
--SELECT * FROM Persona
--DROP PROCEDURE SPObtenerBeneficiario;
--GO
--EXEC SPObtenerBeneficiario 1;