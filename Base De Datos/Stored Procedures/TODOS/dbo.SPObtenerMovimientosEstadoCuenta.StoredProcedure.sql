USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerMovimientosEstadoCuenta]    Script Date: 5/12/2020 23:48:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SPObtenerMovimientosEstadoCuenta]
(
	 --@idCuentaAhorro INT
	@idEstadoCuenta INT
)
AS 
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		SELECT
			  M.Monto
			 ,M.Fecha
			 ,M.Descripcion
			 ,TM.Nombre
			 ,CA.Id
			 ,EC.Id
			 ,TM.Tipo
			 
		FROM [dbo].[Movimiento] M
		INNER JOIN CuentaAhorro CA ON M.IdCuentaAhorro = CA.Id
		INNER JOIN TipoMovimiento TM ON M.IdTipoMovimiento = TM.Id
		INNER JOIN EstadoCuenta EC ON M.IdEstadoDeCuenta = EC.Id
		WHERE  
				EC.Id = @idEstadoCuenta
			AND
				fecha BETWEEN EC.FechaInicio AND EC.FechaFinal
		ORDER BY Fecha DESC 
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50050, @Descripcion = 'ERROR AL obtener los movimientos de los estados de cuenta ([dbo].[SPObtenerMovimientosEstadoCuenta])'
		PRINT  'Algo salió mal al obtener los movimientos del estado de cuenta.'
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END

--exec [SPObtenerMovimientosEstadoCuenta] @idEstadoCuenta = 0
GO
