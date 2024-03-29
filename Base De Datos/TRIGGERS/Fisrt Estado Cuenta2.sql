USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  Trigger [dbo].[FirstEstadoCuenta]    Script Date: 20/1/2021 01:17:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   TRIGGER [dbo].[FirstEstadoCuenta] ON [dbo].[CuentaAhorro]
AFTER INSERT--, UPDATE
AS

BEGIN
	
	SET NOCOUNT ON;
	DECLARE @idCuentaAhorro INT
	DECLARE @fechaInicio DATE
	DECLARE @fechaFinal DATE
	DECLARE @saldoInicial MONEY
	DECLARE @saldoFinal MONEY
	DECLARE @cantidadRetirosAutomatico INT
	DECLARE @cantidadRetirosHumano INT

	SELECT @idCuentaAhorro = Id FROM [CuentaAhorro]
	SELECT @fechaInicio = FechaCreacion FROM [CuentaAhorro] 
	SELECT @fechaFinal = DATEADD(MONTH,1,@fechaInicio);
	SELECT @saldoInicial = Saldo FROM [CuentaAhorro]
	SELECT @saldoFinal = Saldo FROM [CuentaAhorro]



	BEGIN TRY
		INSERT 
		INTO [dbo].[EstadoCuenta]
		(
			 IdCuentaDeAhorro
			,FechaInicio
			,FechaFinal
			,SaldoInicial
			,SaldoFinal
			,Usado
			,CantidadRetirosAutomatico
			,CantidadRetirosHumano
		)

		VALUES(
			 @idCuentaAhorro
			,@fechaInicio
			,@fechaFinal
			,@saldoInicial
			,@saldoFinal
			,1 
			,0
			,0
			);
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50064, @Descripcion = 'ERROR AL  ejecutarse el TRIGGER DE CuentaAhorro para insertar estado de cuenta ([FirstEstadoCuenta])'
		PRINT  'Algo salió mal al insertar estado de cuenta.'


	END CATCH
	SET NOCOUNT OFF;

END
--DECLARE @fecha  DATE 
--SELECT @fecha = '2017-12-28'
--DECLARE @Otra DATE
--SELEct @Otra = DATEADD(MONTH,1,@fecha);
--print(@otra)
