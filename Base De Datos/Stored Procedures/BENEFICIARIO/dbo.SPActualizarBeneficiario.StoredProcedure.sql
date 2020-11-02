-- ==============================================================================
-- Author:		Natalia Vargas 
-- Create date: 19/10/2020
-- Description:	Insertar un beneficiario en la tabla [dbo].[Beneficiario]
-- ==============================================================================
USE [BD_TP1_Cuenta_De_Ahorros]
GO
CREATE PROCEDURE [dbo].[SPActualizarBeneficiario]
@pIdPersona INT,
@pIdTipoParentezco INT,
@pPorcentaje INT

AS 
BEGIN 
--Esto es para saber si existe el IdTipoParentesco que se quiere cambiar en la tabla
	SELECT CAST(COUNT(*) AS BIT) 
	FROM 
		[Beneficiario] 
	WHERE 
		(IdPersona = @pIdPersona)
	If COUNT(*) = 1
		BEGIN TRANSACTION
		UPDATE Beneficiario
			SET 
				IdTipoParentezco = @pIdTipoParentezco,
				Porcentaje = @pPorcentaje 
			FROM 
				[dbo].[Beneficiario]
			WHERE 
				Beneficiario.[IdPersona] = @pIdPersona
		COMMIT TRANSACTION
	
END

--LLamar a ejecutar el SP
--EXEC SPActualizarBeneficiario @pIdPersona=2, @pIdTipoParentezco=2,@pPorcentaje=60;
--SELECT * FROM [dbo].[Beneficiario]
--SELECT * FROM [dbo].[Persona]
--DROP PROCEDURE SPActualizarBeneficiario
GO
