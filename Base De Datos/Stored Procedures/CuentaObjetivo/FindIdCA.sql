USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPFindIdCA]    Script Date: 4/12/2020 11:42:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER  	PROCEDURE [dbo].[SPFindIdCA]
(      
   @pNumeroCuentaDeAhorro	INT 
)      
AS

BEGIN   
	SET NOCOUNT ON;
	BEGIN TRY
	   SELECT 
			 Id

		FROM 
			[dbo].[CuentaAhorro] 

		WHERE 

			NumeroDeCuenta = @pNumeroCuentaDeAhorro
	END TRY
	BEGIN CATCH
		PRINT  'Algo salió mal al buscar cuenta de ahorro.'
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
	
END


--EXEC [SPObtenerEstadosCuenta] @pIdCuentaDeAhorro = 1
