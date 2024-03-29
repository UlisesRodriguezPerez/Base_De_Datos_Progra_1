USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPEliminarBeneficiario]    Script Date: 4/12/2020 11:39:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==============================================================================
-- Author:		Natalia Vargas /Ulises Rodríguez
-- Update date: 9/11/2020
-- Description:	Borrar un beneficiario en la tabla [dbo].[Beneficiario]
-- ==============================================================================

ALTER  PROCEDURE [dbo].[SPEliminarBeneficiario]
(
	@pIdPersona INT
)

AS 
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		DELETE FROM 
				[dbo].[Beneficiario]
		WHERE  
				Activo=1 AND IdPersona = @pIdPersona;  
	END TRY
	BEGIN CATCH
		PRINT  'Algo salió mal al eliminar beneficiario.'
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END

--SELECT * FROM Beneficiario
--SELECT * FROM CuentaAhorro
--SELECT * FROM Persona
--DROP PROCEDURE SPEliminarBeneficiario;
--GO
--EXEC SPEliminarBeneficiario 1;
