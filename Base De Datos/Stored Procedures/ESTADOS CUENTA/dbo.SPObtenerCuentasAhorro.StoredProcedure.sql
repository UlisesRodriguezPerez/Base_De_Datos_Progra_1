
-- ==============================================================================
-- Author:		Natalia Vargas 
-- Create date: 19/10/2020
-- Description:	Devolver una Cuenta en la tabla [dbo].[EstadoCuenta]
-- ==============================================================================

USE [BD_TP1_Cuenta_De_Ahorros]
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

--SELECT * FROM EstadoCuenta
--DROP PROCEDURE SPObtenerBeneficiario;
--GO
--EXEC SPObtenerCuentasAhorro 1;
GO
