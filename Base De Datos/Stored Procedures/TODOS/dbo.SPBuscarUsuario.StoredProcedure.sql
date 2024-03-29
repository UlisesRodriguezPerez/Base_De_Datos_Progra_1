USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPBuscarUsuario]    Script Date: 5/12/2020 23:48:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE	PROCEDURE [dbo].[SPBuscarUsuario]
(      
   @pValorDocumentoIdentidad	INT 
)      
AS
BEGIN  
	SET NOCOUNT ON;
	BEGIN TRY
	   SELECT 
			 [Nombre]
			,[FechaNacimiento]
			,[Telefono1]
			,[Telefono2]
			,[CorreoElectronico]
		FROM 
			[dbo].[Persona]
		WHERE 
			ValorDocumentoIdentidad=@pValorDocumentoIdentidad    
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50007, @Descripcion = 'Problemas al BuscarUsuario'
		--PRINT  'Algo salió mal al buscar usuario.'
		--RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
END
GO
