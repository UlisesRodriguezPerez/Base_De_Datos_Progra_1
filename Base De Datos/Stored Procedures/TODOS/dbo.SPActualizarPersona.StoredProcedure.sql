USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPActualizarPersona]    Script Date: 5/12/2020 23:48:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SPActualizarPersona] 
(
	 @pIdPersona INT
	,@pNombre VARCHAR(40)
	,@pValorDocumentoIdentidad VARCHAR(50)
	,@pFechaNacimiento DATE
	,@pTelefono1 VARCHAR(50)
	,@pTelefono2 VARCHAR(50)
	,@pCorreoElectronico VARCHAR(50)
)

AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY

	BEGIN TRANSACTION
		UPDATE [dbo].[Persona]
			SET 
					 Nombre =  @pNombre
					,ValorDocumentoIdentidad  = @pValorDocumentoIdentidad 
					,FechaNacimiento = @pFechaNacimiento
					,Telefono1 = @pTelefono1
					,Telefono2 = @pTelefono2
					,CorreoElectronico = @pCorreoElectronico

			WHERE 
				 Id = @pIdPersona;
	COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50003, @Descripcion = 'Problemas al actualizar Persona'
		--PRINT 'No se actualizó'
	END CATCH

	SET NOCOUNT OFF
END

--EXEC SPActualizarPersona @pIdPersona=2,@pNombre='Osvaldo Aguero Hernandez',@pValorDocumentoIdentidad='12738545',@pFechaNacimiento = '1994-10-24',@pTelefono1='3',@pTelefono2='3',@pCorreoElectronico='osadage@gmail.com';
--SELECT *
--FROM 
--	[dbo].Persona
--WHERE id = 2
GO
