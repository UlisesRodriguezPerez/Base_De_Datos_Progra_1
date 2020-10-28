
-- ==============================================================================
-- Author:		Natalia Vargas 
-- Create date: 19/10/2020
-- Description:	Devolver un beneficiario en la tabla [dbo].[Beneficiario]
-- ==============================================================================

USE [BD_TP1_Cuenta_De_Ahorros]
GO
CREATE PROCEDURE [dbo].[SPObtenerBeneficiariosCuenta]
(
	@pIdCuentaDeAhorro INT
)
AS 
BEGIN
	SELECT 
		IdTipoParentezco
		,IdPersona
		,Porcentaje
	FROM [dbo].[Beneficiario]
	WHERE  
		IdCuentaDeAhorro = @pIdCuentaDeAhorro ;

END

--SELECT * FROM Beneficiario
--SELECT * FROM CuentaAhorro
--SELECT * FROM Persona
--DROP PROCEDURE SPObtenerBeneficiario;
--GO
--EXEC SPObtenerBeneficiariosCuenta 1;
GO
