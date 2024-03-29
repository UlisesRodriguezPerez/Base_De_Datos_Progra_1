USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPMostrarCuentas]    Script Date: 4/12/2020 11:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER   PROCEDURE [dbo].[SPMostrarCuentas]   
AS
BEGIN 
	SET NOCOUNT ON;
	BEGIN TRY
	   SELECT 
			 Id
			,IdTipoCuenta
			,IdPersona
			,NumeroDeCuenta
			,Saldo
			,FechaCreacion
		FROM 
			[dbo].[CuentaAhorro]
	END TRY
	BEGIN CATCH
		PRINT  'Algo salió mal al mostrar cuentas.'
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END
