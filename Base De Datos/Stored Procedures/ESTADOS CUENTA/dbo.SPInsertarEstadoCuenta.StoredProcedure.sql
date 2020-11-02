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
		,@pSaldoInicial MONEY

AS 
BEGIN
	INSERT 
	INTO [dbo].[EstadoCuenta]
	(
		 IdCuentaDeAhorro
		,FechaInicio
		,SaldoInicial
	)

	VALUES(
		 @pIdCuentaDeAhorro
		,@pFechaInicio
		,@pSaldoInicial
		);

END

--DROP PROCEDURE SPInsertarPersona;
GO
