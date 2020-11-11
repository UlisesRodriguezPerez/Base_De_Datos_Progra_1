USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPEditarUsuario]    Script Date: 10/11/2020 20:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     procedure [dbo].[SPEditarUsuario]
 (      
	 @id int
	,@Nombre varchar(100)
	,@Password varchar(100)
	,@TipoUsuario BIT 
 )      
AS  
BEGIN       
   Update 
		[dbo].Usuario
   SET 
		 Nombre=@Nombre
		,Password=@Password
		,EsAdministrador=@TipoUsuario
   WHERE 
		ID=@id      
END
GO
