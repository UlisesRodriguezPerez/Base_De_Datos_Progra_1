USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPInsertarEstadoCuenta]    Script Date: 10/11/2020 20:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
--EXEC SPInsertarEstadoCuenta 1,'2020-11-12','2019-4-12',5000,9000;
GO
