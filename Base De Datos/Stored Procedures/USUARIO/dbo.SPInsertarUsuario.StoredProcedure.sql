USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPInsertarUsuario]    Script Date: 4/12/2020 11:45:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER     PROCEDURE [dbo].[SPInsertarUsuario]
	(
		 @Nombre VARCHAR(100)
		,@Password VARCHAR(100)
		,@TipoUsuario BIT
	)
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		INSERT 
				INTO [dbo].Usuario
					(
						 Nombre
						,Password
						,EsAdministrador
					)
		VALUES 
			(
				 @Nombre
				,@Password
				,@TipoUsuario
			)
	END TRY
	BEGIN CATCH
		PRINT  'Algo salió mal al Insertar Usuario.'
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END
