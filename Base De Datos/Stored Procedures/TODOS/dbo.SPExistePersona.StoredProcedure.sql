USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPExistePersona]    Script Date: 5/12/2020 23:48:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPExistePersona]
(
	@pValorDocumentoIdentidad INT
)
AS 
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		IF EXISTS 
		(
		SELECT Id 
		FROM [dbo].[Persona] 
		WHERE ValorDocumentoIdentidad = @pValorDocumentoIdentidad
		)

			RETURN CAST(1 AS bit);
		ELSE 
			RETURN CAST(0 AS bit);
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50027, @Descripcion = 'ERROR al verificar Persona ([dbo].[SPExistePersona])'
		PRINT  'Algo salió mal al validar si existe persona.'
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END

--SELECT * FROM [dbo].[Persona]
--DROP PROCEDURE SPObtenerBeneficiario;
--GO
--EXEC SPObtenerPersona 20;
GO
