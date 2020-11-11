USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerCuentasAhorro]    Script Date: 10/11/2020 20:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPObtenerCuentasAhorro]
(
	@pIdCuentaDeAhorro INT
)
AS 
BEGIN
	SELECT 
		 FechaInicio
		,FechaFinal
		,SaldoInicial
		,SaldoFinal

	FROM [dbo].[EstadoCuenta]
	WHERE  
		IdCuentaDeAhorro  = @pIdCuentaDeAhorro;

END

--SELECT * FROM Persona
--DROP PROCEDURE SPObtenerBeneficiario;
--GO
--EXEC SPObtenerPersona 20;
GO
