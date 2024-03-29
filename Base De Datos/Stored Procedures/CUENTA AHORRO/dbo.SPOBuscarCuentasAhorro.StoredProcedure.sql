USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPBuscarCuentaAhorro]    Script Date: 4/12/2020 11:34:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER  	PROCEDURE [dbo].[SPBuscarCuentaAhorro]
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
		PRINT  'Algo salió mal con buscar cuenta de ahorro.'
		RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
END
