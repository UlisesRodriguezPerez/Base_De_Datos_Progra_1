USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPBuscarPersona]    Script Date: 10/11/2020 20:32:14 ******/
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
END
GO
