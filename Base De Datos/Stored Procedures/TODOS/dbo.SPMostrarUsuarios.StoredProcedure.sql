USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPMostrarUsuarios]    Script Date: 5/12/2020 23:48:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SPMostrarUsuarios]
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		SELECT 
				 ID
				,Nombre
				,Password
				,EsAdministrador
		FROM 
				[dbo].Usuario
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50037, @Descripcion = 'ERROR AL mostrar Usuarios ()'
		PRINT  'Algo salió al mostrar usuarios.'
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END
GO
