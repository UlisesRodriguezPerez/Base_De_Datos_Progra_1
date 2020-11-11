USE [BD_TP1_Cuenta_De_Ahorros]
GO

CREATE OR ALTER	PROCEDURE [dbo].[SPFindIdCA]
(      
   @pNumeroCuentaDeAhorro	INT 
)      
AS

BEGIN      
   SELECT 
		 Id

	FROM 
		[dbo].[CuentaAhorro] 

	WHERE 

		NumeroDeCuenta = @pNumeroCuentaDeAhorro
		
	
END


--EXEC [SPObtenerEstadosCuenta] @pIdCuentaDeAhorro = 1
