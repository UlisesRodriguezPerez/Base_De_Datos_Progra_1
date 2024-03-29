USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerIdCuentaObjetivo]    Script Date: 28/11/2020 17:47:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE [dbo].[SPObtenerIdCuentaObjetivo]
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
		PRINT  'Algo salió mal al obtener idCuenta CuentaObjetivo.'
		RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
END
