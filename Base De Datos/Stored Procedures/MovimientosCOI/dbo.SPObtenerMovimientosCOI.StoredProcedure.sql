USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerMovimientosCO]    Script Date: 1/15/2021 11:20:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


 CREATE OR ALTER   PROCEDURE [dbo].[SPObtenerMovimientosCOI]
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
			,MCOI.Fecha
			,MCOI.Monto
			,MCOI.NuevoInteresAcumulado
			,MCOI.Descripcion
			,CA.NumeroDeCuenta

		FROM 
			[dbo].[CuentaObjetivo] CO
			INNER JOIN MovimientoCuentaObjetivoInteres MCOI ON CO.Id = MCOI.IdCuentaObjetivo
			INNER JOIN CuentaAhorro CA ON CO.IdCuentaAhorro = CA.Id
			
		WHERE 

			IdCuentaObjetivo = @pIdCuentaObjetivo  
	
		ORDER BY FechaFinal DESC 
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50101, @Descripcion = 'ERROR al obtener los movimientos de cuenta objetivo interes -> ([dbo].[SPObtenerMovimientosCuentaObjetivoInteres])'
		PRINT  'Algo salió mal al obtener estados de cuenta.'
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
	
END


--EXEC [SPObtenerEstadosCuenta] @pIdCuentaDeAhorro = 1
