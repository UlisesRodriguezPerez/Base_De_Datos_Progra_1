
-- ==============================================================================
-- Author:		Natalia Vargas 
-- Create date: 19/10/2020
-- Description:	Insertar un Estado en la tabla [dbo].[EstadoCuenta]
-- ==============================================================================

USE [BD_TP1_Cuenta_De_Ahorros]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SPActualizarPersona] 
(
	 @pIdPersona INT
	,@pNombre VARCHAR(40)
	,@pValorDocumentoIdentidad INT
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
				[Persona].[Id] = @pIdPersona;
	COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		PRINT 'No se actualizó'
	END CATCH

	SET NOCOUNT OFF
END

------LLamar a ejecutar el SP
--EXEC SPActualizarPersona @pIdPersona=2,@pNombre='Osvaldo Aguero Hernandez',@pValorDocumentoIdentidad=12738545,@pFechaNacimiento = '1994-10-24',@pTelefono1=87541766,@pTelefono2=24731014,@pCorreoElectronico='osadage@gmail.com';
--SELECT * FROM [dbo].[Persona]


		
