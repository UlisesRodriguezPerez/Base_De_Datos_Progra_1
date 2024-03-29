USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerIdCuentaBeneficiario]    Script Date: 4/12/2020 11:47:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[SPObtenerIdCuentaBeneficiario]
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
		PRINT  'Algo salió mal al obtener idCuenta beneficiario.'
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END
