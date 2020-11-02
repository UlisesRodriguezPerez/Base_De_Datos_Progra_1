
-- ==============================================================================
-- Author:		Natalia Vargas 
-- Create date: 02/11/2020
-- Description:	Buscar a una persona en la tabla [dbo].[Persona]
-- ==============================================================================

USE [BD_TP1_Cuenta_De_Ahorros]
GO
CREATE PROCEDURE [dbo].[SPActualizarPersona]
(		
		 @pId	INT 
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
		Id=@pId   
END

--LLamar a ejecutar el SP
--EXEC SPActualizarBeneficiario @pIdPersona=2, @pIdTipoParentezco=2,@pPorcentaje=60;
--SELECT * FROM [dbo].[Beneficiario]
--SELECT * FROM [dbo].[Persona]
--DROP PROCEDURE SPActualizarBeneficiario
GO