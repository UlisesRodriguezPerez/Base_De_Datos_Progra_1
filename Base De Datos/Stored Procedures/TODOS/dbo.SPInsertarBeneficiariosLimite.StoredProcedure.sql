USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPInsertarBeneficiariosLimite]    Script Date: 5/12/2020 23:48:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   PROCEDURE [dbo].[SPInsertarBeneficiariosLimite]
		@pIdTipoParentezco INT,
		@pValorDocumentoIdentidad INT,
		@pIdDeCuentaAhorro INT,
		@pPorcentaje INT
		
AS

DECLARE  @pIdPersona INT;
SELECT   
	@pIdPersona = [Id] 
FROM 
	[dbo].[Persona] 
AS 
	P 
WHERE  
	P.ValorDocumentoIdentidad = @pValorDocumentoIdentidad;

		BEGIN TRY

		INSERT INTO [dbo].[Beneficiario]
			(
						 IdTipoParentezco
						,IdPersona
						,IdCuentaDeAhorro
						,Porcentaje
						,Activo
						,InsertAt
						,UpdateAt
						,InsertBy
						,UpdateBy
						,InsertIn
						,UpdateIn
			)
				
			 VALUES(
			 @pIdTipoParentezco
			,@pIdPersona
			,@pIdDeCuentaAhorro
			,@pPorcentaje
			,1
			,GETDATE()
			,GETDATE()
			,'DB Admin'
			,'DB Admin'
			,'Costa Rica'
			,'Costa Rica'
		);


	END TRY

	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50031, @Descripcion = 'ERROR AL insertar Beneficiario al limite ([dbo].[SPInsertarBeneficiariosLimite])'
			PRINT 'ERROR AL INSERTAR DATOS EN LA TABLA Beneficiario.'
			RETURN @@ERROR ;
	END CATCH




--EXEC SPInsertarBeneficiario @pIdTipoParentezco=4,@pValorDocumentoIdentidad=1,@pIdDeCuentaAhorro=1,@pPorcentaje=20;
--SELECT * FROM Persona
--SELECT * FROM Beneficiario
--SELECT * FROM CuentaAhorro
--DROP PROCEDURE SPInsertarBeneficiario;
GO
