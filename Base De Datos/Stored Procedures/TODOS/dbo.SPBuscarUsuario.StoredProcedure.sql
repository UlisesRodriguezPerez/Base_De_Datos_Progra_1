USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPBuscarUsuario]    Script Date: 10/11/2020 20:32:14 ******/
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
END
GO
