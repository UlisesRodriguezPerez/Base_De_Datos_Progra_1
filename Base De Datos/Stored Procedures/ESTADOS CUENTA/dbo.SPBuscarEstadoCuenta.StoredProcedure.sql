
-- ==============================================================================
-- Author:		Natalia Vargas 
-- Create date: 02/11/2020
-- Description:	Buscar a un Estado en la tabla [dbo].[EstadoCuenta]
-- ==============================================================================

USE [BD_TP1_Cuenta_De_Ahorros]
GO

CREATE	PROCEDURE [dbo].[SPBuscarEstadoCuenta]
(      
	@pId	INT 
)      
AS
BEGIN      
   SELECT 
		 IdCuentaDeAhorro
		,FechaInicio
		,FechaFinal
		,SaldoInicial
		,SaldoFinal

	FROM 
		[dbo].[EstadoCuenta]
	WHERE 
		Id=@pId  
END
GO
--DROP PROCEDURE [SPBuscarEstadoCuenta]
--GO
--SELECT * FROM EstadoCuenta
-- EXEC SPBuscarEstadoCuenta @pIdCuentaDeAhorro=1;