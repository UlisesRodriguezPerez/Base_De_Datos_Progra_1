USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPInsertarBeneficiario]    Script Date: 10/11/2020 20:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   PROCEDURE [dbo].[SPInsertarBeneficiario]
		(
			 @pParentezco VARCHAR(100)
			,@pIdPersona INT
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
	DECLARE @pIdTipoParentezco INT
	DECLARE @pIdDeCuentaAhorro INT
	--DECLARE  @pIDCuentaAhorro INT =
	DECLARE @Suma INT;
	DECLARE @Diferencia INT;
	DECLARE @Cantidad INT;

	SELECT @pIdDeCuentaAhorro = Id FROM [dbo].[CuentaAhorro] WHERE NumeroDeCuenta = @pNumeroCuentaAhorro;

	SELECT @pIdTipoParentezco = Id FROM [dbo].[TipoParentezco] WHERE Nombre = @pParentezco;
	SELECT @Cantidad = COUNT(*) FROM [dbo].[Beneficiario] WHERE IdCuentaDeAhorro = @pIdDeCuentaAhorro AND Activo = 1;
	SELECT @Suma = SUM(Porcentaje) FROM [dbo].[Beneficiario] WHERE IdCuentaDeAhorro = @pIdDeCuentaAhorro AND Activo = 1;
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

--EXEC SPInsertarBeneficiario @pIdTipoParentezco=1,@pIdPersona=1,@pIdDeCuentaAhorro=1,@pPorcentaje=1020;
--SELECT * FROM Beneficiario
--DROP PROCEDURE SPInsertarBeneficiario;
GO
