USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPInsertarBeneficiario]    Script Date: 10/11/2020 11:45:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER   PROCEDURE [dbo].[SPInsertarBeneficiario]
		(
			 @pIdTipoParentezco INT
			,@pIdPersona INT
			,@pIdDeCuentaAhorro INT
			,@pPorcentaje INT
			
		)

AS 

BEGIN     
	--DECLARE  @pIDCuentaAhorro INT =
	DECLARE @Suma INT;
	DECLARE @Diferencia INT;
	DECLARE @Cantidad INT;
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
