USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerEstadosCuenta]    Script Date: 10/11/2020 19:05:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER	PROCEDURE [dbo].[SPObtenerEstadosCuenta]
(      
   @pIdCuentaDeAhorro	INT 
)      
AS

BEGIN      
   SELECT 
	TOP 8
		 EC.Id
		,EC.IdCuentaDeAhorro
		,EC.FechaInicio
		,EC.FechaFinal
		,EC.SaldoInicial
		,EC.SaldoFinal
		,CA.NumeroDeCuenta

	FROM 
		[dbo].[EstadoCuenta] EC
		INNER JOIN CuentaAhorro CA ON EC.IdCuentaDeAhorro = CA.Id
	WHERE 

		IdCuentaDeAhorro=@pIdCuentaDeAhorro  
	
	ORDER BY FechaFinal DESC 
	
	
END


--EXEC [SPObtenerEstadosCuenta] @pIdCuentaDeAhorro = 1
