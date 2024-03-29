USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPMovimientosCuentasObjetivosSimulacion]    Script Date: 20/1/2021 22:50:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER    PROCEDURE [dbo].[SPMovimientosCuentasObjetivosSimulacion]
		@TablaCuentasObjetivo [dbo].[TablaCOParaMovimientos] READONLY
		,@FechaDeOperacion DATE

AS 
BEGIN
	
	DECLARE @idCuentaObjetivo INT
	DECLARE @idCuentaAhorro INT
	DECLARE @numeroCuentaObjetivo INT
	DECLARE @fechaInicio DATE
	DECLARE @fechaFinal DATE
	DECLARE @objetivo VARCHAR(100)
	DECLARE @montoMensual MONEY
	DECLARE @cantidadDepositosProcesados INT
	DECLARE @cantidadDepositosTotales INT
	DECLARE @montoAhorrado MONEY
	DECLARE @montoEsperado MONEY
	DECLARE @interesAcumuladoTotal MONEY

	DECLARE @saldo MONEY
	DECLARE @diDeAhorro INT

	DECLARE @interesAcumulado INT
	DECLARE @activo BIT

	DECLARE @idMenor INT
	DECLARE @idMayor INT
	
	DECLARE @diaDeFecha INT
	DECLARE @interesPOrDia MONEY

	DECLARE @saldoCuentaAhorro MONEY
	DECLARE @idEstadoCuenta INT

	DECLARE @esProcesada BIT

	SET NOCOUNT ON;
	BEGIN TRY

		SELECT @idMenor = min([id]), @idMayor=max([id]) FROM @TablaCuentasObjetivo
		WHILE @idMenor <= @idMayor
			BEGIN
				SELECT 
				     @idCuentaObjetivo = TCO.idCuentaObjetivo
					,@idCuentaAhorro = TCO.idCuentaAhorro
					,@numeroCuentaObjetivo = TCO.numeroCuentaObjetivo
					,@fechaInicio = TCO.fechaInicio
					,@fechaFinal = TCO.fechaFinal
					,@objetivo = TCO.objetivo
					,@saldo = TCO.saldo
					,@diDeAhorro = TCO.diDeAhorro
					,@interesAcumulado = TCO.interesAcumulado
					,@activo = TCO.activo
					,@montoMensual = TCO.montoMensual

					
				FROM @TablaCuentasObjetivo TCO

				WHERE TCO.id = @idMenor;

				SELECT @interesPOrDia = @montoMensual * (((SELECT DATEDIFF(MONTH,@fechaInicio,@fechaFinal) * 0.5) / 365)/100);
				SELECT @saldoCuentaAhorro = Saldo FROM CuentaAhorro WHERE Id = @idCuentaAhorro;
				SELECT @idEstadoCuenta = Id FROM [dbo].[EstadoCuenta] WHERE IdCuentaDeAhorro = @idCuentaAhorro AND Usado = 1 ;
				SELECT @esProcesada = 1;

				SELECT
					 @cantidadDepositosProcesados = CO.CantidadDepositosProcesados
					,@cantidadDepositosTotales = CO.CantidadDepositosTotales
					,@montoAhorrado	= CO.MontoAhorrado
					,@montoEsperado	= CO.MontoEsperado
					,@interesAcumuladoTotal = CO.InteresAcumuladoTotal
				FROM
					CuentaObjetivo CO

				WHERE
					Id = @idCuentaObjetivo

				IF @fechaFinal = @FechaDeOperacion
					BEGIN
						BEGIN TRANSACTION
							UPDATE 
									CuentaObjetivo 
							SET	
									 Saldo = 0--Saldo + InteresAcumulado
									,Activo = 0
									,InteresAcumulado = 0
									,InteresAcumuladoTotal = 0
							WHERE Id = @idCuentaObjetivo;

							UPDATE
									CuentaAhorro
							SET 
									Saldo = @saldo + @interesAcumulado
							WHERE
									Id = @idCuentaAhorro;
						    SET
								@activo = 0
							--FROM MovimientoCuentaObjetivoInteres MCOI
									
							--INNER JOIN MovimientoCuentaObjetivoInteres ON 
		
								
						COMMIT TRANSACTION 
						INSERT INTO MovimientoCuentaObjetivoInteres 
									(
									  IdCuentaObjetivo
									 ,IdTipoMovimientoCuentaObjetivoInteres
									 ,Fecha
									 ,Monto
									 ,NuevoInteresAcumulado
									 ,Descripcion
									 ,ProcesadaInt
									)
							SELECT
									 @idCuentaObjetivo
									,3 AS IdTipoMovimientoCuentaObjetivoInteres
									,@FechaDeOperacion
									,@interesAcumulado AS Monto
									,0 AS NuevoInteresAcumulado
									,'Debito del Traspaso de intereses a la Cuenta Objetivo por vencimiento del plazo de ahorro.' AS Descripcion
									,@esProcesada;
							
							INSERT INTO MovimientoCuentaObjetivo 
									(
									  IdCuentaObjetivo
									 ,IdTipoMovimientoCuentaObjetivo
									 ,Fecha
									 ,Monto
									 ,NuevoSaldo
									 ,Descripcion
									 ,Procesada
									)
							SELECT
									 @idCuentaObjetivo
									,3 AS IdTipoMovimientoCuentaObjetivo
									,@FechaDeOperacion
									,@interesAcumulado
									,@saldo + @interesAcumulado
									,'Débito de los los intereses y del ahorro programado de la cuenta Objetivo a la Cuentas principal.' AS Descripcion
									,@esProcesada
							INSERT INTO MovimientoCuentaObjetivo 
									(
									  IdCuentaObjetivo
									 ,IdTipoMovimientoCuentaObjetivo
									 ,Fecha
									 ,Monto
									 ,NuevoSaldo
									 ,Descripcion
									 ,Procesada
									)
							SELECT
									 @idCuentaObjetivo
									,3 AS IdTipoMovimientoCuentaObjetivo
									,@FechaDeOperacion
									,@interesAcumulado
									,@saldo + @interesAcumulado
									,'Crédito los intereses del ahorro programado.' AS Descripcion
									,@esProcesada


							INSERT INTO [dbo].[Movimiento]
											(
												 IdTipoMovimiento
												,IdCuentaAhorro
												,IdEstadoDeCuenta
												,Monto
												,Fecha
												,Descripcion
											)
											VALUES(
												 5
												,@idCuentaAhorro
												,@idEstadoCuenta
												,@saldo + @interesAcumulado
												,@FechaDeOperacion
												,'Crédito por finalización del ahorro de la Cuenta Objetivo.'
												);

					END
					IF @diDeAhorro != DAY(@FechaDeOperacion) AND @activo = 1 --AND @saldo >= 0
					BEGIN
						IF @saldo <= 0 
						BEGIN 
							SET @esProcesada = 0   
							--SELECT DAY(@FechaDeOperacion)
							--SELECT DATEDIFF(MONTH,@fechaInicio,@fechaFinal);
							INSERT INTO MovimientoCuentaObjetivoInteres 
										(
										  IdCuentaObjetivo
										 ,IdTipoMovimientoCuentaObjetivoInteres
										 ,Fecha
										 ,Monto
										 ,NuevoInteresAcumulado
										 ,Descripcion
										 ,ProcesadaInt
										)
								SELECT
										 @idCuentaObjetivo
										,2 AS IdTipoMovimientoCuentaObjetivoInteres
										,@FechaDeOperacion
										,@interesPOrDia
										,@interesAcumulado
										,' No se realizó el Crédito diario por intereses.' AS Descripcion
										,@esProcesada;
								UPDATE 
									CuentaObjetivo
								SET 
									InteresAcumuladoTotal = InteresAcumuladoTotal + @interesPOrDia

								WHERE 
									Id = @idCuentaObjetivo;

						END
						ELSE 
							BEGIN
							SET @esProcesada = 1
								INSERT INTO MovimientoCuentaObjetivoInteres 
										(
										  IdCuentaObjetivo
										 ,IdTipoMovimientoCuentaObjetivoInteres
										 ,Fecha
										 ,Monto
										 ,NuevoInteresAcumulado
										 ,Descripcion
										 ,ProcesadaInt
										)
								SELECT
										 @idCuentaObjetivo
										,2 AS IdTipoMovimientoCuentaObjetivoInteres
										,@FechaDeOperacion
										,@interesPOrDia
										,@interesAcumulado + @interesPOrDia
										,'Crédito diario por intereses.' AS Descripcion
										,@esProcesada;

							UPDATE CuentaObjetivo
									SET 
										 InteresAcumulado = InteresAcumulado + @interesPOrDia
										,InteresAcumuladoTotal = InteresAcumuladoTotal + @interesPOrDia
							WHERE Id = @idCuentaObjetivo;
							END
					END
					
						
						
					IF @diDeAhorro = DAY(@FechaDeOperacion) AND @activo = 1 --AND @saldoCuentaAhorro >= @montoMensual
						BEGIN
						IF @saldoCuentaAhorro < @montoMensual BEGIN SET @esProcesada = 0   END
						IF @esProcesada  = 1 
							BEGIN
								BEGIN TRANSACTION
									UPDATE CuentaAhorro
							
									SET 
										Saldo = Saldo - @montoMensual
									WHERE Id = @idCuentaAhorro;
									--PENDIENTE VER MOVIMIENTOS CUENTA AHORRO Y ESTADO CUENTA

									UPDATE CuentaObjetivo

									SET
										Saldo = Saldo + @montoMensual
										,CantidadDepositosProcesados = CantidadDepositosProcesados + 1
										,CantidadDepositosTotales = CantidadDepositosTotales + 1
										,MontoAhorrado = Saldo + @montoMensual + @interesAcumulado
										,MontoEsperado = Saldo + @montoMensual + @interesAcumuladoTotal
									WHERE
										Id = @idCuentaObjetivo

								COMMIT TRANSACTION

								INSERT 
							INTO [dbo].[Movimiento]
							(
								 IdTipoMovimiento
								,IdCuentaAhorro
								,IdEstadoDeCuenta
								,Monto
								,Fecha
								,Descripcion
							)
							VALUES(
								 3
								,@idCuentaAhorro
								,@idEstadoCuenta
								,@montoMensual
								,@FechaDeOperacion
								,'Debito por cuota mensual para Cuenta Objetivo.'
								);
						END
						ELSE
							BEGIN
					
									UPDATE CuentaObjetivo

									SET
										
										
										CantidadDepositosTotales = CantidadDepositosTotales + 1
										,MontoEsperado = Saldo + @montoMensual + @interesAcumuladoTotal
									WHERE
										Id = @idCuentaObjetivo

							END

						INSERT INTO MovimientoCuentaObjetivo 
									(
									  IdCuentaObjetivo
									 ,IdTipoMovimientoCuentaObjetivo
									 ,Fecha
									 ,Monto
									 ,NuevoSaldo
									 ,Descripcion
									 ,Procesada
									)
							SELECT
									 @idCuentaObjetivo
									,1 AS IdTipoMovimientoCuentaObjetivo
									,@FechaDeOperacion
									,@montoMensual
									,@saldo + @montoMensual
									,'Crédito por depósito del ahorro programado.' AS Descripcion
									,@esProcesada

						INSERT INTO MovimientoCuentaObjetivoInteres 
									(
									  IdCuentaObjetivo
									 ,IdTipoMovimientoCuentaObjetivoInteres
									 ,Fecha
									 ,Monto
									 ,NuevoInteresAcumulado
									 ,Descripcion
									 ,ProcesadaInt
									)
							SELECT
									 @idCuentaObjetivo
									,2 AS IdTipoMovimientoCuentaObjetivoInteres
									,@FechaDeOperacion
									,@interesPOrDia
									,@interesAcumulado + @interesPOrDia
									,'Crédito diario por intereses.' AS Descripcion
									,@esProcesada;
						

						END

				SET @idMenor = @idMenor + 1
			END

	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50034, @Descripcion = 'ERROR CON LA ITERACION DE LOS DÍAS Y SUS CALCULOS DE INTRERESES. )[dbo].[SPMovimientosCuentasObjetivosSimulacion]'
		PRINT  'Algo salió mal al INSERTAR Movimiento.'
		RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
	
END


