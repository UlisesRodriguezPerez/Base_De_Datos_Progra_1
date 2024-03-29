USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPInsertarPersona]    Script Date: 5/12/2020 23:48:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
	SET NOCOUNT ON;
	BEGIN TRY
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
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50035, @Descripcion = 'ERROR AL insertar persona ([dbo].[SPInsertarPersona])'
		PRINT  'Algo salió mal al insertar Persona.'
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END

--DROP PROCEDURE SPInsertarPersona;
GO
