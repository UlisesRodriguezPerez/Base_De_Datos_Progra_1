USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerCuentasObjetivoPorCA]    Script Date: 30/11/2020  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER     PROCEDURE [dbo].[SPObtenerCuentasObjetivoPorCA]
(
	@idCuentaAhorro INT
)
AS 
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		SELECT
			 CO.Id
			,CO.IdCuentaAhorro
			,CO.FechaInicio
			--,CO.FechaFinal
			,CO.Objetivo
			,CO.Saldo
			,CO.InteresAcumulado
			,CA.NumeroDeCuenta
		
		FROM [dbo].[CuentaObjetivo] CO
		INNER JOIN CuentaAhorro CA ON CO.IdCuentaAhorro = CA.Id
		WHERE  
			IdCuentaAhorro = @idCuentaAhorro AND Activo = 1;
	END TRY
	BEGIN CATCH
		PRINT  'Algo salió mal al obtener cuenta.'
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END
