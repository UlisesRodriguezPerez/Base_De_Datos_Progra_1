USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPEliminarUsuario]    Script Date: 4/12/2020 11:41:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER     PROCEDURE [dbo].[SPEliminarUsuario]
(
	@ID int
)
AS 
BEGIN 
	SET NOCOUNT ON;
	BEGIN TRY
		DELETE 
			FROM 
				[dbo].[Usuario]
			WHERE 
				@ID = Id
	END TRY
	BEGIN CATCH
		PRINT  'Algo salió mal al eliminar beneficiario.'
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END 
