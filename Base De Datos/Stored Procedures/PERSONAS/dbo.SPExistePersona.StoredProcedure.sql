USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPExistePersona]    Script Date: 4/12/2020 11:42:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SPExistePersona]
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
		PRINT  'Algo salió mal al validar si existe persona.'
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END

--SELECT * FROM [dbo].[Persona]
--DROP PROCEDURE SPObtenerBeneficiario;
--GO
--EXEC SPObtenerPersona 20;
