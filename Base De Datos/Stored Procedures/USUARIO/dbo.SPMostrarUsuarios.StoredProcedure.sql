USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPMostrarUsuarios]    Script Date: 4/12/2020 11:46:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[SPMostrarUsuarios]
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
		PRINT  'Algo salió al mostrar usuarios.'
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END
