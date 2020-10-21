
-- ==============================================================================
-- Author:		Natalia Vargas 
-- Create date: 19/10/2020
-- Description:	Borrar un beneficiario en la tabla [dbo].[Beneficiario]
-- ==============================================================================

USE [BD_TP1_Cuenta_De_Ahorros]
GO

CREATE PROCEDURE [dbo].[SPEliminarBeneficiario]
@pIdPersona INT

AS 
BEGIN
	DELETE FROM [dbo].[Beneficiario]
	WHERE  IdPersona = @pIdPersona;

END

--SELECT * FROM Beneficiario
--SELECT * FROM CuentaAhorro
--SELECT * FROM Persona
--DROP PROCEDURE SPEliminarBeneficiario;
--GO
EXEC SPEliminarBeneficiario 1;