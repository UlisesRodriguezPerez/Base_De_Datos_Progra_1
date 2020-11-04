
-- ==============================================================================
-- Author:		Natalia Vargas 
-- Create date: 02/11/2020
-- Description:	Buscar de manera ordenada los estados de cuenta
-- ==============================================================================

USE [BD_TP1_Cuenta_De_Ahorros]
GO

CREATE	PROCEDURE [dbo].[SPObtenerEstadosCuenta]
(      
   @pIdCuentaDeAhorro	INT 
)      
AS
BEGIN      
   SELECT 
	TOP 8
		 [Id]
		,[IdCuentaDeAhorro]
		,[FechaInicio]
		,[FechaFinal]
		,[SaldoInicial]
		,[SaldoFinal]
	FROM 
		[dbo].[EstadoCuenta]
	WHERE 

		IdCuentaDeAhorro=@pIdCuentaDeAhorro   
	ORDER BY FechaFinal DESC 
END
GO

--SELECT * FROM [dbo].[EstadoCuenta]
--SELECT * FROM [dbo].[Usuario]
--SELECT * FROM [dbo].[UsuarioPuedeAccesar]
--SELECT * FROM [dbo].[CuentaAhorro]
--DROP PROCEDURE [SPObtenerEstadosCuenta]
--EXEC SPObtenerEstadosCuenta 3;
GO
