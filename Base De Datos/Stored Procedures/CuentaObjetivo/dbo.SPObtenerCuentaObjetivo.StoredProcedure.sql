USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerBeneficiario]    Script Date: 28/11/2020 14:10:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE [dbo].[SPObtenerCuentaObjetivo]
(
	@Id INT
)
AS 
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		SELECT
			 CO.Id
			,CO.IdCuentaAhorro
			,CO.FechaInicio
			,CO.Objetivo
			,CO.Saldo
			,CO.InteresAcumulado
			,CA.NumeroDeCuenta

		FROM [dbo].[CuentaObjetivo] CO
		INNER JOIN CuentaAhorro CA ON CO.IdCuentaAhorro = CA.Id
		WHERE  
			CO.Id = @Id 
	END TRY
	BEGIN CATCH
		PRINT  'Algo salió mal al obtener beneficiarios.'
		RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
END
