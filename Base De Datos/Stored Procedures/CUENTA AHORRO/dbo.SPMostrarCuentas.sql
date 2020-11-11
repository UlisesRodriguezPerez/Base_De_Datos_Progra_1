USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPMostrarCuentas]    Script Date: 10/11/2020 19:21:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER   PROCEDURE [dbo].[SPMostrarCuentas]   
AS
BEGIN      
   SELECT 
		 Id
		,IdTipoCuenta
		,IdPersona
		,NumeroDeCuenta
		,Saldo
		,FechaCreacion
	FROM 
		[dbo].[CuentaAhorro]

END
