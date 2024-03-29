USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPManejoDeErrores]    Script Date: 5/12/2020 23:48:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[SPManejoDeErrores]
	 @ErrorLogId [int]  OUTPUT
	,@CodigoDeError INT
	,@Descripcion VARCHAR(500)
AS
BEGIN
	SET NOCOUNT ON;

	SET @ErrorLogId = 0;

	BEGIN TRY

		IF ERROR_NUMBER() IS NULL
			RETURN;

		IF XACT_STATE() = -1
		BEGIN
			PRINT('No se puede registrar el error ya que la transacción está en proceso.') --COMMIT TRANSACTION
		END

		INSERT [dbo].[ErrorLog]
			(
			 [UserName]
			,[CodigoDeError]
			,[ErrorNumber]
			,[ErrorSeverity]
			,[ErrorState]
			,[ErrorProcedure]
			,[ErrorLine]
			,[ErrorMessege]
			)
			VALUES
				(
				 CURRENT_USER
				,@CodigoDeError
				,ERROR_NUMBER()
				,ERROR_SEVERITY()
				,ERROR_STATE()
				,ERROR_PROCEDURE()
				,ERROR_LINE()
				,@Descripcion
				);
			SET @ErrorLogId = @@IDENTITY;
	END TRY
	BEGIN CATCH
		PRINT('Ocurrió un error en el Stored procedure de errores xD.');

		RETURN -1;

	END CATCH
END
GO
