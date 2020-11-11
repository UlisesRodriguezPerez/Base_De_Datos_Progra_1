USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPInsertarUsuario]    Script Date: 10/11/2020 20:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [dbo].[SPInsertarUsuario]
	(
		 @Nombre VARCHAR(100)
		,@Password VARCHAR(100)
		,@TipoUsuario BIT
	)
AS
BEGIN
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
END
GO
