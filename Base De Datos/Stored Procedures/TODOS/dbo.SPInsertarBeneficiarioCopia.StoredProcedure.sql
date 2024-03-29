USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPInsertarBeneficiarioCopia]    Script Date: 5/12/2020 23:48:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPInsertarBeneficiarioCopia]
		(
			 @pIdTipoParentezco INT
			--,@pIdPersona INT
			,@pDocumentoIdentidadPersona VARCHAR(50)
		--	,@pIdTipoParentezco INT
			--,@pIdDeCuentaAhorro INT
			,@pNumeroCuentaAhorro INT
			,@pPorcentaje INT
			-- @pIdTipoParentezco INT
			--,@pIdPersona INT
			--,@pIdDeCuentaAhorro INT
			--,@pPorcentaje INT
			
		)

AS 

BEGIN     
	
	DECLARE @pIdDeCuentaAhorro INT
	DECLARE @pIdPersona INT
	DECLARE @existePersona BIT
	--DECLARE  @pIDCuentaAhorro INT =
	DECLARE @Suma INT;
	DECLARE @Diferencia INT;
	DECLARE @Cantidad INT;
	SET @pIdPersona = 0
	SELECT @pIdPersona = Id FROM [dbo].[Persona] WHERE ValorDocumentoIdentidad = @pDocumentoIdentidadPersona;
	SELECT @pIdDeCuentaAhorro = Id FROM [dbo].[CuentaAhorro] WHERE NumeroDeCuenta = @pNumeroCuentaAhorro;

	SELECT @Cantidad = COUNT(*) FROM [dbo].[Beneficiario] WHERE IdCuentaDeAhorro = @pIdDeCuentaAhorro AND Activo = 1;
	SELECT @Suma = SUM(Porcentaje) FROM [dbo].[Beneficiario] WHERE IdCuentaDeAhorro = @pIdDeCuentaAhorro AND Activo = 1;
	IF @pIdPersona = 0
		BEGIN
			SET @existePersona = 0
			SELECT @existePersona
			
		END
	ELSE
		BEGIN
			SET @existePersona = 1
			SELECT @existePersona
			IF @Suma + @pPorcentaje < 101 AND @Cantidad < 3
				BEGIN
				   INSERT 
						INTO [dbo].[Beneficiario]
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
							)
		
				END
			ELSE
				BEGIN
					PRINT 'SE EXCEDE DEL LÍMITE.'
					PRINT @Suma + @pPorcentaje
					PRINT @Cantidad
				END
		END
		return @existePersona
END

--EXEC SPInsertarBeneficiario @pIdTipoParentezco=1,@pIdPersona=1,@pIdDeCuentaAhorro=1,@pPorcentaje=1020;
--SELECT * FROM Beneficiario
--DROP PROCEDURE SPInsertarBeneficiario;
GO
