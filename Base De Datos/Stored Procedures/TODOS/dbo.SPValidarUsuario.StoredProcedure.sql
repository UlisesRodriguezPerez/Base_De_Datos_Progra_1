USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPValidarUsuario]    Script Date: 5/12/2020 23:48:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- SP para verificar usuarios

CREATE  
	PROCEDURE 
		[dbo].[SPValidarUsuario]
			(      
				@Nombre varchar(100),
				@Password varchar(100)
			)      
AS       
BEGIN     
	--SET NOCOUNT ON;
	BEGIN TRY
	   SELECT 
			 Id
			,Nombre
			,Password
			,EsAdministrador 
		FROM 
			[dbo].Usuario 
		WHERE 
				Nombre=@Nombre 
			AND 
				Password=@Password 
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50054, @Descripcion = 'ERROR AL validar Usuario ()'
		PRINT  'Algo salió mal al validar al usuario.'
		RETURN @@ERROR ;
	END CATCH
	--SET NOCOUNT OFF;
END
GO
