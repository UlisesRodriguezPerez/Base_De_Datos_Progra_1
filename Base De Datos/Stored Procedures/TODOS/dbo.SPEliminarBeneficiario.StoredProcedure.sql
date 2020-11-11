USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPEliminarBeneficiario]    Script Date: 10/11/2020 20:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==============================================================================
-- Author:		Natalia Vargas /Ulises Rodríguez
-- Update date: 9/11/2020
-- Description:	Borrar un beneficiario en la tabla [dbo].[Beneficiario]
-- ==============================================================================

CREATE  PROCEDURE [dbo].[SPEliminarBeneficiario]
(
	@pIdPersona INT
)

AS 
BEGIN
	DELETE FROM 
			[dbo].[Beneficiario]
	WHERE  
			Activo=1 AND IdPersona = @pIdPersona;  

END

--SELECT * FROM Beneficiario
--SELECT * FROM CuentaAhorro
--SELECT * FROM Persona
--DROP PROCEDURE SPEliminarBeneficiario;
--GO
--EXEC SPEliminarBeneficiario 1;
GO
