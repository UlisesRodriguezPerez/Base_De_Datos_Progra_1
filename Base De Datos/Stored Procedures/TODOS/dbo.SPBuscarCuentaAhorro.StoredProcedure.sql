USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPBuscarCuentaAhorro]    Script Date: 5/12/2020 23:48:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  	PROCEDURE [dbo].[SPBuscarCuentaAhorro]
(      
   @Id	INT 
)      
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
		WHERE 
			Id = @Id
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50004, @Descripcion = 'Problemas al Buscar cuenta de Ahorro'
		--PRINT  'Algo salió mal con buscar cuenta de ahorro.'
		--RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
END
GO
