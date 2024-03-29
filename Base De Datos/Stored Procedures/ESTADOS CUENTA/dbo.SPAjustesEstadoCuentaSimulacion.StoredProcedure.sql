USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPMovimientosCuentasObjetivosSimulacion]    Script Date: 19/1/2021 20:17:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER    PROCEDURE [dbo].[SPAjustesEstadosCuentaSimulacion]
		@TablaEstadosDeCuenta [dbo].[TableEstadosDeCuenta] READONLY
		,@FechaDeOperacion DATE

AS 
BEGIN 	
	DECLARE @idEstadoCuenta INT
	DECLARE @idCuentaAhorro INT
	DECLARE @fechaInicio DATE
	DECLARE @fechaFinal DATE
	DECLARE @saldoInicial MONEY
	DECLARE @saldoFinal MONEY
	DECLARE @usado BIT

	DECLARE @idMenor INT
	DECLARE @idMayor INT

	SET NOCOUNT ON;
	BEGIN TRY

		SELECT @idMenor = min([id]), @idMayor=max([id]) FROM @TablaEstadosDeCuenta
		WHILE @idMenor <= @idMayor
			BEGIN
				SELECT 
				     @idEstadoCuenta = TEC.idEstadoCuenta
					,@idCuentaAhorro = TEC.idCuentaAhorro
					,@fechaInicio = TEC.fechaInicio
					,@fechaFinal = TEC.fechaFinal
					,@saldoInicial = TEC.saldoInicial
					,@saldoFinal = TEC.saldoFinal
					,@usado = TEC.usado

					
				FROM @TablaEstadosDeCuenta TEC

				WHERE TEC.id = @idMenor;


				IF @fechaFinal = @FechaDeOperacion
					BEGIN
						UPDATE
							EstadoCuenta
						SET
							Usado = 0

						WHERE 
							Id = @idEstadoCuenta

						INSERT INTO [dbo].[EstadoCuenta]
									(
										 IdCuentaDeAhorro
										,FechaInicio
										,FechaFinal
										,SaldoInicial
										,SaldoFinal
										,Usado
									)

						VALUES
								(
								 @idCuentaAhorro
								,@fechaFinal
								,DATEADD(MONTH,1,@fechaFinal)
								,@saldoFinal
								,0
								,1
								);
										
					
					END
				SET @idMenor = @idMenor + 1
			
		END
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50034, @Descripcion = 'ERROR CON la iteración diaria de los estados de cuenta. )[dbo].[SPAjustesEstadosCuentaSimulacion]'
		PRINT  'Algo salió mal al INSERTAR Estado de Cuenta.'
		RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
	
END


