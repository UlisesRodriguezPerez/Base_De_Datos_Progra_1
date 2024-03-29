USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPBuscarEstadoCuenta]    Script Date: 5/12/2020 23:48:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE	PROCEDURE [dbo].[SPBuscarEstadoCuenta]
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
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50005, @Descripcion = 'Problemas al BuscarEstadoCuenta'
		--PRINT  'Algo salió mal con buscar estado de cuenta.'
		--RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
END
GO
