-- ==============================================================================
-- Author:		Natalia Vargas 
-- Create date: 19/10/2020
-- Description:	Insertar un beneficiario en la tabla [dbo].[Beneficiario]
-- ==============================================================================

USE [BD_TP1_Cuenta_De_Ahorros]
GO


CREATE   PROCEDURE [dbo].[SPInsertarPersona]
		 @pIdTipoDocumentoIdentidad INT
		,@pNombre VARCHAR
		,@pValorDocumentoIdentidad INT
		,@pFechaNacimiento DATE
		,@pTelefono1 VARCHAR
		,@pTelefono2 VARCHAR
		,@pCorreoElectronico VARCHAR

AS 
BEGIN
	INSERT 
	INTO [dbo].[Persona]
					(
						 IdTipoDocumentoIdentidad
						,Nombre
						,ValorDocumentoIdentidad
						,FechaNacimiento
						,Telefono1
						,Telefono2
						,CorreoElectronico
						,InsertAt
						,UpdateAt
						,InsertBy
						,UpdateBy
						,InsertIn
						,UpdateIn
					)

	VALUES(
			 @pIdTipoDocumentoIdentidad
			,@pNombre
			,@pValorDocumentoIdentidad
			,@pFechaNacimiento
			,@pTelefono1
			,@pTelefono2
			,@pCorreoElectronico
			,GETDATE()
			,GETDATE()
			,'DB Admin'
			,'DB Admin'
			,'Costa Rica'
			,'Costa Rica'
		);

END

--DROP PROCEDURE SPInsertarPersona;
GO
