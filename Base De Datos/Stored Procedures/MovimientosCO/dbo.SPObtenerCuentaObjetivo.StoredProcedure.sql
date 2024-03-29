USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerCuentaObjetivo]    Script Date: 15/1/2021 16:43:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[SPObtenerCuentaObjetivo]
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
			,CO.FechaFinal
			--,CO.InteresAcumulado
			,CA.NumeroDeCuenta
			,CO.DiaDeAhorro
			,CO.NumeroCuentaObjetivo

		FROM [dbo].[CuentaObjetivo] CO
		INNER JOIN CuentaAhorro CA ON CO.IdCuentaAhorro = CA.Id
		WHERE  
			CO.Id = @Id AND Activo = 1
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50043, @Descripcion = 'ERROR AL obtener cuenta objetivo ([dbo].[SPObtenerCuentaObjetivo])'
		PRINT  'Algo salió mal al obtener beneficiarios.'
		RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
END
