USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPBuscarPersona]    Script Date: 5/12/2020 23:48:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE	PROCEDURE [dbo].[SPBuscarPersona]
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
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50006, @Descripcion = 'Problemas al BuscarPersona'
		--PRINT  'Algo salió mal al buscar persona.'
		--RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
END
GO
