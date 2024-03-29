USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPEliminarLogicoBeneficiario]    Script Date: 5/12/2020 23:48:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   PROCEDURE [dbo].[SPEliminarLogicoBeneficiario]
(
	@Id INT
)

AS  
BEGIN  
	SET NOCOUNT ON;
	BEGIN TRY
	   UPDATE 
			[dbo].[Beneficiario]
	   SET 
			 Activo = 0
	   WHERE 
			Id = @Id     
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50025, @Descripcion = 'ERROR AL Eliminar Log Beneficiario ([dbo].[SPEliminarLogicoBeneficiario])'
		--PRINT  'Algo salió mal al eliminar beneficiario.'
		RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
END
GO
