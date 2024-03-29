USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPFindIdCA]    Script Date: 5/12/2020 23:48:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  	PROCEDURE [dbo].[SPFindIdCA]
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
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50028, @Descripcion = 'ERROR AL buscar idCA ([dbo].[SPFindIdCA])'
		PRINT  'Algo salió mal al buscar cuenta de ahorro.'
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
	
END


--EXEC [SPObtenerEstadosCuenta] @pIdCuentaDeAhorro = 1
GO
