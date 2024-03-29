USE [BD_TP1_Cuenta_De_Ahorros]
GO


 CREATE OR ALTER PROCEDURE [dbo].[SPObtenerMovimientosCO]
(      
   @pIdCuentaObjetivo	INT 
)      
AS

BEGIN   
	SET NOCOUNT ON;
	BEGIN TRY
	   SELECT 
			--IdCuentaObjetivo = Convert.ToInt32(read[0].ToString()),
   --           NO          IdCuentaAhorro = Convert.ToInt32(read[1].ToString()),
   --                     Fecha = Convert.ToDateTime(read[2].ToString()),
   --                     Monto = Convert.ToDecimal(read[3].ToString()),
   --                     NuevoMonto = Convert.ToDecimal(read[4].ToString()),
   --                     Descripcion = read[5].ToString(),
   --                     NumeroCuenta = read[6].ToString(),
			 CO.Id
			,CA.Id
			,CO.NumeroCuentaObjetivo
			,MCO.Fecha
			,MCO.Monto
			,MCO.NuevoSaldo
			,MCO.Descripcion
			,CA.NumeroDeCuenta

		FROM 
			[dbo].[CuentaObjetivo] CO
			INNER JOIN MovimientoCuentaObjetivo MCO ON CO.Id = MCO.IdCuentaObjetivo
			INNER JOIN CuentaAhorro CA ON CO.IdCuentaAhorro = CA.Id
			
		WHERE 

			IdCuentaObjetivo = @pIdCuentaObjetivo  
	
		ORDER BY FechaFinal DESC 
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50100, @Descripcion = 'ERROR al obtener los movimientos de ceunta objetivo -> ([dbo].[SPObtenerMovimientosCuentaObjetivo])'
		PRINT  'Algo salió mal al obtener estados de cuenta.'
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
	
END


--EXEC [SPObtenerEstadosCuenta] @pIdCuentaDeAhorro = 1
