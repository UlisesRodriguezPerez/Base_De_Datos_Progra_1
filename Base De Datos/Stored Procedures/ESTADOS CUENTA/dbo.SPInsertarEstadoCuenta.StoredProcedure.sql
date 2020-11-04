-- ==============================================================================
-- Author:		Natalia Vargas 
-- Create date: 19/10/2020
-- Description:	Insertar un Estado en la tabla [dbo].[EstadoCuenta]
-- ==============================================================================

USE [BD_TP1_Cuenta_De_Ahorros]
GO


CREATE   PROCEDURE [dbo].[SPInsertarEstadoCuenta]
		 @pIdCuentaDeAhorro INT
		,@pFechaInicio DATE
		,@pFechaFinal DATE
		,@pSaldoInicial MONEY
		,@pSaldoFinal MONEY

AS 
BEGIN
	INSERT 
	INTO [dbo].[EstadoCuenta]
	(
		 IdCuentaDeAhorro
		,FechaInicio
		,FechaFinal
		,SaldoInicial
		,SaldoFinal
	)

	VALUES(
		 @pIdCuentaDeAhorro
		,@pFechaInicio
		,@pFechaFinal
		,@pSaldoInicial
		,@pSaldoFinal
		);

END

--DROP PROCEDURE SPInsertarEstadoCuenta;
--EXEC SPInsertarEstadoCuenta 3,'2020-2-2','2020-3-3',560,129000;
GO
