USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerCuentasAhorro]    Script Date: 5/12/2020 23:48:32 ******/
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
	SET NOCOUNT ON;
	BEGIN TRY
		SELECT 
			 FechaInicio
			,FechaFinal
			,SaldoInicial
			,SaldoFinal

		FROM [dbo].[EstadoCuenta]
		WHERE  
			IdCuentaDeAhorro  = @pIdCuentaDeAhorro;
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50044, @Descripcion = 'ERROR AL obtener cuenta de ahorro ([dbo].[SPObtenerCuentasAhorro])'
		PRINT  'Algo salió mal al obtener cuentas de ahorro.'
		RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
END

--SELECT * FROM Persona
--DROP PROCEDURE SPObtenerBeneficiario;
--GO
--EXEC SPObtenerPersona 20;
GO
