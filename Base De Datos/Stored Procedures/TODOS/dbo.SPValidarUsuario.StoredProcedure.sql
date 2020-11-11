USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPValidarUsuario]    Script Date: 10/11/2020 20:32:14 ******/
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
END
GO
