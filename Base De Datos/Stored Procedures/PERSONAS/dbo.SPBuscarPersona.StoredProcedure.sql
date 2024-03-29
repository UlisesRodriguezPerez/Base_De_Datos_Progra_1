USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPBuscarPersona]    Script Date: 4/12/2020 11:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER	PROCEDURE [dbo].[SPBuscarPersona]
(      
   @pIdTipoDocumentoIdentidad	INT 
)      
AS
BEGIN   
	SET NOCOUNT ON;
	BEGIN TRY
	   SELECT 
			 [Nombre]
			,[ValorDocumentoIdentidad]
			,[FechaNacimiento]
			,[Telefono1]
			,[Telefono2]
			,[CorreoElectronico]
		FROM 
			[dbo].[Persona]
		WHERE 
			IdTipoDocumentoIdentidad=@pIdTipoDocumentoIdentidad    
	END TRY
	BEGIN CATCH
		PRINT  'Algo salió mal al buscar persona.'
		RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
END
