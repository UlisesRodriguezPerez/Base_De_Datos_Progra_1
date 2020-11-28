USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPCrearCuentaObjetivo]    Script Date: 28/11/2020 13:36:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[SPCrearCuentaObjetivo]    Script Date: 28/11/2020 12:56:42 ******/


ALTER       PROCEDURE [dbo].[SPCrearCuentaObjetivo]
		(
			 @pNumeroCuentaAhorro INT
			,@pObjetivo VARCHAR (100)
			,@pSaldo MONEY
			,@pInteresAcumulado MONEY
		)

AS 

BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		DECLARE @pIdDeCuentaAhorro INT

		DECLARE @idCuentaObjetivo INT
		SET @idCuentaObjetivo = 0

		SELECT 
			@pIdDeCuentaAhorro = Id 
		FROM 
			[dbo].[CuentaAhorro] 
		WHERE 
			NumeroDeCuenta = @pNumeroCuentaAhorro;

		-- Para saber si ya existe o no y si está en activo = 0
		--SELECT 
		--	@idCuentaObjetivo = CO.Id 
		--FROM 
		--	[CuentaObjetivo] CO
		--	INNER JOIN CuentaAhorro CA ON IdCuentaAhorro = CA.Id
		--WHERE 
		--	CA.Id = @pIdDeCuentaAhorro
			

		--IF @idCuentaObjetivo = 0
		--	BEGIN
				INSERT 
					INTO [dbo].[CuentaObjetivo]
						(
							 IdCuentaAhorro
							,FechaInicio
							,FechaFinal
							,Objetivo
							,Saldo
							,InteresAcumulado
							,Activo
							,InsertAt
							,UpdateAt
							,InsertBy
							,UpdateBy
							,InsertIn
							,UpdateIn
						)

					VALUES(
			
							 @pIdDeCuentaAhorro
							,GETDATE()
							,null
							,@pObjetivo
							,@pSaldo
							,@pInteresAcumulado
							,1
							,GETDATE()
							,null
							,'DESKTOP-FBGDAQE\ulirp'
							,''
							,'DESKTOP-FBGDAQE\ulirp'
							,''
						)
		
			--END

			--ELSE
			--	BEGIN
			--		Update 
			--			[dbo].[CuentaObjetivo]
			--		SET		
			--				Activo = 1
							
			--		WHERE 
			--			Id = @idCuentaObjetivo
			--	END
					
			
	END TRY
	BEGIN CATCH
		PRINT  'Algo salió mal al insertar beneficiario.'
		RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
END


--EXEC [SPCrearCuentaObjetivo] @pNumeroCuentaAhorro = 11013939,@pObjetivo = 'PRUEBA',@pSaldo = 5000,@pInteresAcumulado = 200
