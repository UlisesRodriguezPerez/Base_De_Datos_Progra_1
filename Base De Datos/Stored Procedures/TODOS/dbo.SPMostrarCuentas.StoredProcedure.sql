USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPMostrarCuentas]    Script Date: 5/12/2020 23:48:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   PROCEDURE [dbo].[SPMostrarCuentas]   
AS
BEGIN 
	SET NOCOUNT ON;
	BEGIN TRY
	   SELECT 
			 CA.Id
			,TC.Id
			,CA.IdPersona
			,CA.NumeroDeCuenta
			,CA.Saldo
			,CA.FechaCreacion
		FROM 
			[dbo].[CuentaAhorro] CA
		INNER JOIN TipoCuentaAhorro TC ON IdCuentaAhorro = CA.Id
	END TRY
	BEGIN CATCH
		PRINT  'Algo salió mal al mostrar cuentas.'
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END
GO
