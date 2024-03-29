USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPInsertarCuentasAhorroSimulacion]    Script Date: 21/1/2021 15:59:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER    PROCEDURE [dbo].[SPInsertarBeneficiariosSimulacion]
		@TablaBeneficiarios [dbo].[BeneficiarioPerTrigger] READONLY
			

AS 
BEGIN 
	


	DECLARE @idMenor INT
	DECLARE @idMayor INT

	DECLARE @idTipoParentezco INT
	DECLARE @idPersona INT
	DECLARE @idDeCuentaAhorro INT
	DECLARE @porcentaje INT
	DECLARE @activo BIT
	DECLARE @insertAt DATETIME
	DECLARE @updateAt DATETIME
	DECLARE @insertBy VARCHAR(50)
	DECLARE @updateBy VARCHAR(50)
	DECLARE @insertIn VARCHAR(50)
	DECLARE @updateIn VARCHAR(50)
	


	SET NOCOUNT ON;
	BEGIN TRY
		SELECT @idMenor = min([id]), @idMayor=max([id]) FROM @TablaBeneficiarios
		WHILE @idMenor <= @idMayor
			BEGIN
				
				SELECT 
					 @idTipoParentezco = idTipoParentezco
					,@idPersona = idPersona
					,@idDeCuentaAhorro = idCuentaAhorro
					,@porcentaje = porcentaje
					,@activo = activo
					,@insertAt = insertAt
					,@updateAt = updateAt
					,@insertBy = insertBy
					,@updateBy = updateBy
					,@insertIn = insertIn
					,@updateIn = updateIn
				FROM 
					@TablaBeneficiarios
				WHERE
					id = @idMenor


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
			
					 @idTipoParentezco
					,@idPersona
					,@idDeCuentaAhorro
					,@porcentaje
					,@activo
					,@insertAt
					,@updateAt
					,@insertBy
					,@updateBy
					,@insertIn
					,@updateIn
				)
		

				SET @idMenor = @idMenor + 1
			END

	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50122, @Descripcion = 'ERROR AL insertar los beneficiarios al recorrer la simulación ([dbo].[SPInsertarBeneficiarioSimulacion])'
		RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
	
END


