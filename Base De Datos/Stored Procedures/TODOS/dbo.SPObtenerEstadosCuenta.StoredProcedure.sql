USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerEstadosCuenta]    Script Date: 5/12/2020 23:48:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE	PROCEDURE [dbo].[SPObtenerEstadosCuenta]
(      
   @pIdCuentaDeAhorro	INT 
)      
AS

BEGIN   
	SET NOCOUNT ON;
	BEGIN TRY
	   SELECT 
		--TOP 8
			 EC.Id
			,EC.IdCuentaDeAhorro
			,EC.FechaInicio
			,EC.FechaFinal
			,EC.SaldoInicial
			,EC.SaldoFinal
			,CA.NumeroDeCuenta
			,CA.CantidadRetirosHumano
			,CA.CantidadRetirosAutomatico
			,TCA.SaldoMinimo

		FROM 
			[dbo].[EstadoCuenta] EC
			INNER JOIN CuentaAhorro CA ON EC.IdCuentaDeAhorro = CA.Id
			INNER JOIN TipoCuentaAhorro TCA ON IdTipoCuenta = TCA.Id
			
		WHERE 

			IdCuentaDeAhorro=@pIdCuentaDeAhorro  
	
		ORDER BY FechaFinal DESC 
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50046, @Descripcion = 'ERROR AL obtener el estado de cuenta ([dbo].[SPObtenerEstadosCuenta])'
		PRINT  'Algo salió mal al obtener estados de cuenta.'
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
	
END


--EXEC [SPObtenerEstadosCuenta] @pIdCuentaDeAhorro = 1
GO
