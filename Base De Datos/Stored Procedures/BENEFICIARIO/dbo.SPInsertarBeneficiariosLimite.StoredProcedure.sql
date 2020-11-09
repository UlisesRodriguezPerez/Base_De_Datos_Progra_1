-- ==============================================================================
-- Author:		Natalia Vargas 
-- Create date: 19/10/2020
-- Description:	Insertar un beneficiario en la tabla [dbo].[Beneficiario]
-- ==============================================================================

USE [BD_TP1_Cuenta_De_Ahorros]
GO


CREATE   PROCEDURE [dbo].[SPInsertarBeneficiariosLimite]
		@pIdTipoParentezco INT,
		@pValorDocumentoIdentidad INT,
		@pIdDeCuentaAhorro INT,
		@pPorcentaje INT
		
AS

DECLARE  @pIdPersona INT;
SELECT   @pIdPersona = [Id] FROM [dbo].[Persona] AS P WHERE  P.ValorDocumentoIdentidad = @pValorDocumentoIdentidad;

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
			PRINT 'ERROR AL INSERTAR DATOS EN LA TABLA Beneficiario.'
			RETURN @@ERROR * - 1;
	END CATCH




--EXEC SPInsertarBeneficiariosLimite @pIdTipoParentezco=4,@pValorDocumentoIdentidad=117370445,@pIdDeCuentaAhorro=1,@pPorcentaje=24;
--SELECT * FROM Persona
--SELECT * FROM Beneficiario
--SELECT * FROM CuentaAhorro
--DROP PROCEDURE SPInsertarBeneficiario;
GO