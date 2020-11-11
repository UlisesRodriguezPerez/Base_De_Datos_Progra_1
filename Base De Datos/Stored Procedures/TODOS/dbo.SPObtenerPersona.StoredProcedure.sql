USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerPersona]    Script Date: 10/11/2020 20:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPObtenerPersona]
(
	@pId INT
)
AS 
BEGIN
	SELECT 
		 Nombre
		,ValorDocumentoIdentidad
		,FechaNacimiento
		,Telefono1
		,Telefono2
		,CorreoElectronico

	FROM [dbo].[Persona]
	WHERE  
		Id = @pId;

END

--SELECT * FROM Persona
--DROP PROCEDURE SPObtenerBeneficiario;
--GO
--EXEC SPObtenerPersona 20;
GO
