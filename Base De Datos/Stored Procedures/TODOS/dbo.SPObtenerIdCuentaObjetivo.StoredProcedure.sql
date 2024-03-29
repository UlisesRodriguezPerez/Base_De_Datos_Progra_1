USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerIdCuentaObjetivo]    Script Date: 5/12/2020 23:48:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [dbo].[SPObtenerIdCuentaObjetivo]
(
	@Id INT
)
AS 
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		SELECT
			IdCuentaAhorro

		FROM [dbo].[CuentaObjetivo]
		WHERE  
			Id = @Id;
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50048, @Descripcion = 'ERROR AL obtener id de cuenta objetivo ([dbo].[SPObtenerIdCuentaObjetivo])'
		PRINT  'Algo salió mal al obtener idCuenta CuentaObjetivo.'
		RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
END
GO
