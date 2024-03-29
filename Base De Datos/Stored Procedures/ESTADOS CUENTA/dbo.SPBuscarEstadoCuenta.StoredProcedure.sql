USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPBuscarEstadoCuenta]    Script Date: 4/12/2020 11:35:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER	PROCEDURE [dbo].[SPBuscarEstadoCuenta]
(      
	@pId	INT 
)      
AS
BEGIN 
	SET NOCOUNT ON;
	BEGIN TRY
	   SELECT 
			 IdCuentaDeAhorro
			,FechaInicio
			,FechaFinal
			,SaldoInicial
			,SaldoFinal

		FROM 
			[dbo].[EstadoCuenta]
		WHERE 
			Id=@pId  
	END TRY
	BEGIN CATCH
		PRINT  'Algo salió mal con buscar estado de cuenta.'
		RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
END
