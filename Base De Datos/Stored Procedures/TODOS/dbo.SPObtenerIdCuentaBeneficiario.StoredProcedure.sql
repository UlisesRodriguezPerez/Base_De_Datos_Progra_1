USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerIdCuentaBeneficiario]    Script Date: 5/12/2020 23:48:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SPObtenerIdCuentaBeneficiario]
(
	@Id INT
)
AS 
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		SELECT
			IdCuentaDeAhorro

		FROM [dbo].[Beneficiario]
		WHERE  
			Id = @Id;
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50047, @Descripcion = 'ERROR AL obtener el id de cuenta del beneficiario ([dbo].[SPObtenerIdCuentaBeneficiario])'
		PRINT  'Algo salió mal al obtener idCuenta beneficiario.'
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END
GO
