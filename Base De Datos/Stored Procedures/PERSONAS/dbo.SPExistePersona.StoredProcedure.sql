-- ==============================================================================
-- Author:		Natalia Vargas 
-- Create date: 19/10/2020
-- Description:	Devolver true o false si existe una persona en la tabla Persona 
-- ==============================================================================

USE [BD_TP1_Cuenta_De_Ahorros]
GO
CREATE PROCEDURE [dbo].[SPExistePersona]
(
	@pValorDocumentoIdentidad INT
)
AS 
BEGIN
	IF EXISTS 
	(
	SELECT Id 
	FROM [dbo].[Persona] 
	WHERE ValorDocumentoIdentidad = @pValorDocumentoIdentidad
	)

		RETURN CAST(1 AS bit);
	ELSE 
		RETURN CAST(0 AS bit);

END

--SELECT * FROM [dbo].[Persona]
--DROP PROCEDURE SPObtenerBeneficiario;
--GO
--EXEC SPExistePersona 169618231;
GO
