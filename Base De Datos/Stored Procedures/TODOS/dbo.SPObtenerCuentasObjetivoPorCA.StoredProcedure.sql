USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerCuentasObjetivoPorCA]    Script Date: 5/12/2020 23:48:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE     PROCEDURE [dbo].[SPObtenerCuentasObjetivoPorCA]
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
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50045, @Descripcion = 'ERROR AL obtener las cuentas Objetivo de Cuenta Ahorro ([dbo].[SPObtenerCuentasObjetivoPorCA])'
		PRINT  'Algo salió mal al obtener cuenta.'
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END
GO
