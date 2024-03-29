USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  Trigger [dbo].[BitacoraCuentaObjetivoInsert]    Script Date: 21/1/2021 19:07:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE or ALTER     TRIGGER [dbo].[BitacoraCuentaObjetivoUpdate] ON [dbo].[CuentaObjetivo]
AFTER UPDATE --, DElETE
AS

BEGIN
	
	SET NOCOUNT ON;
	DECLARE @idTipoDeEvento INT
	DECLARE @idUser VARCHAR(50)
	DECLARE @ip VARCHAR(50)
	DECLARE @fecha DATE
	DECLARE @xmlAntes VARCHAR(1000)
	DECLARE @xmlDespues VARCHAR(1000)
	DECLARE @LineCode VARCHAR(1000)

	DECLARE @idCuentaObjetivo INT
	DECLARE @idCuentaAhorro INT
	DECLARE @numeroCuenta INT
	DECLARE @fechaInicio DATE
	DECLARE @fechaFinal DATE
	DECLARE @objetivo VARCHAR(100)
	DECLARE @saldo MONEY
	DECLARE @diaDeAhorro INT
	DEClARE @interesAcumulado MONEY
	DECLARE @activo BIT

	DECLARE @insertAt DATETIME
	DECLARE @insertBy VARCHAR(50)
	DECLARE @insertIn VARCHAR(50)

	DECLARE @updateAt DATETIME
	DECLARE @updateBy VARCHAR(50)
	DECLARE @updateIn VARCHAR(50)
	
	DECLARE @montoMensual MONEY
	



	SELECT 
		 @idCuentaObjetivo = Id
		,@idCuentaAhorro = IdCuentaAhorro
		,@numeroCuenta = NumeroCuentaObjetivo
		,@fechaInicio = FechaInicio
		,@fechaFinal = FechaFinal
		,@objetivo = Objetivo
		,@saldo = Saldo
		,@diaDeAhorro = DiaDeAhorro
		,@interesAcumulado = InteresAcumulado
		,@activo = Activo
		,@insertAt = InsertAt
		,@insertBy = InsertBy
		,@insertIn = InsertIn
		,@updateAt = UpdateAt
		,@updateBy = UpdateBy
		,@updateIn = UpdateIn
		,@montoMensual = MontoMensual


	FROM CuentaObjetivo 
	

	--SET @xmlAntes = (SELECT * FROM inserted for XML PATH('NuevoBeneficiario'),ROOT ('Beneficiario'))
	--PRINT(@xmlAntes)

	SELECT @idTipoDeEvento = 5
	SELECT @idUser = InsertBy FROM CuentaObjetivo
	SELECT @ip = '192.168.1.1'
	SELECT @fecha = InsertAt FROM CuentaObjetivo

	SELECT @xmlAntes = '<CuentaObjetivo Id = '+CONVERT(VARCHAR(50),@idCuentaObjetivo)+' IdCuentaAhorro = '+CONVERT(VARCHAR(50),@idCuentaAhorro)+' FechaInicio = '+CONVERT(VARCHAR(50),@fechaInicio)+' FechaFinal ='+CONVERT(VARCHAR(50),@fechaFinal)+' Objetivo = '+CONVERT(VARCHAR(50),@objetivo)+' Saldo = '+CONVERT(VARCHAR(50),@saldo)+' DiaDeAhorro = '+CONVERT(VARCHAR(50),@diaDeAhorro)+' InteresAcumulado ='+CONVERT(VARCHAR(50),@interesAcumulado)+' Activo = '+CONVERT(VARCHAR(50),@activo)+'  InsertAt = '+CONVERT(VARCHAR(50),@insertAt)+' InsertBy = '+CONVERT(VARCHAR(50),@insertBy)+' InsertIn = '+CONVERT(VARCHAR(50),@insertIn)+' UpdateAt = '+CONVERT(VARCHAR(50),@updateAt)+' UpdateBy = '+CONVERT(VARCHAR(50),@updateBy)+' UpdateIn = '+CONVERT(VARCHAR(50),@updateIn)+' />'
	SET @xmlDespues = @xmlAntes

	BEGIN TRY
	IF @activo = 0
	BEGIN
		INSERT 
		INTO [dbo].[Evento]
		(
			 IdTipoEvento
			,Ip
			,IdUser
			,Fecha
			,XMLAntes
			,XMLDespues
		)

		VALUES(
			 6
			,@ip
			,1
			,@fecha
			,@xmlAntes
			,' '
			);
	END
	ELSE
	BEGIN
		INSERT 
		INTO [dbo].[Evento]
		(
			 IdTipoEvento
			,Ip
			,IdUser
			,Fecha
			,XMLAntes
			,XMLDespues
		)

		VALUES(
			 @idTipoDeEvento
			,@ip
			,1
			,@fecha
			,@xmlAntes
			,@xmlDespues
			);
	
	END
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50128, @Descripcion = 'ERROR AL  ejecutarse el TRIGGER de Update Cuenta Objetivo para insertar evento CO ([[BitacoraCuentaObjetivoUpdate]])'
		

	END CATCH
	SET NOCOUNT OFF;



END