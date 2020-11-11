USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPActualizarPersona]    Script Date: 10/11/2020 20:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPActualizarPersona]
(			
		 @pValorDocumentoIdentidad	INT 
		,@pNombre  VARCHAR
		,@pFechaNacimiento  DATE
		,@pTelefono1	VARCHAR
		,@pTelefono2	VARCHAR
		,@pCorreoElectronico	VARCHAR
)

AS 
BEGIN       
   Update 
		[dbo].[Persona]
   SET 
		 Nombre=@pNombre
		,FechaNacimiento=@pFechaNacimiento
		,Telefono1=@pTelefono1
		,Telefono2=@pTelefono1
		,CorreoElectronico=@pCorreoElectronico

   WHERE 
		ValorDocumentoIdentidad=@pValorDocumentoIdentidad     
END

--LLamar a ejecutar el SP
--EXEC SPActualizarBeneficiario @pIdPersona=2, @pIdTipoParentezco=2,@pPorcentaje=60;
--SELECT * FROM [dbo].[Beneficiario]
--SELECT * FROM [dbo].[Persona]
--DROP PROCEDURE SPActualizarBeneficiario
GO
