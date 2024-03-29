USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPActualizarEstadoCuenta]    Script Date: 5/12/2020 23:48:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPActualizarEstadoCuenta]
(		
		 @pId INT
		,@pFechaFinal DATE
		,@pSaldoFinal MONEY
)

AS 
BEGIN 
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN TRANSACTION
		   Update 
				[dbo].[EstadoCuenta]
		   SET 
				 FechaFinal = @pFechaFinal
				,SaldoFinal = @pSaldoFinal

		   WHERE 
				Id=@pId   
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50002, @Descripcion = 'Problemas al actualizar EstadoCuenta'
		--PRINT  'Algo salió mal con el SP de actualizar estado de cuenta.'
		--RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
END


--EXEC SPActualizarEstadoCuenta 2020-11-12,145000000;
--SELECT * FROM [dbo].[EstadoCuenta]
--DROP PROCEDURE SPActualizarEstadoCuenta;
GO
