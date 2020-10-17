USE [BD_TP1_Cuenta_De_Ahorros]

GO 
CREATE PROCEDURE [dbo].[SPBeneficiario]
@pIdTipoParentesco INT,
@pPorcentaje INT
--@pFechaNacimiento DATE,
--@pValorDocumentoIdentidad,
--@pCorreoElectronico,
--@pTelefono1,
--@pTelefono2

AS 
BEGIN 
--Esto es para saber si existe el IdTipoParentesco que se quiere cambiar en la tabla
	SELECT CAST(COUNT(*) AS BIT) FROM [Beneficiario] WHERE (IdTipoParentesco = @pIdTipoParentesco)
	If COUNT(*) = 1
		BEGIN TRANSACTION
		UPDATE Beneficiario
			SET 
			IdTipoParentesco = @pIdTipoParentesco,
			Porcentaje = @pPorcentaje 
			FROM [dbo].[Beneficiario]
			WHERE Beneficiario.[Id] = 1
		COMMIT TRANSACTION
	
END

DROP PROCEDURE [dbo].[SPBeneficiario]

--PARA VER TODOS LOS DATOS DE LA TABLA
SELECT * FROM [dbo].[Beneficiario]