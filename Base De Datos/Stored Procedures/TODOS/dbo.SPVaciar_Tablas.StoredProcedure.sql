USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPVaciar_Tablas]    Script Date: 10/11/2020 20:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     PROCEDURE [dbo].[SPVaciar_Tablas]
AS
BEGIN

	DELETE FROM  [dbo].[TipoMovimiento]
	DELETE FROM  [dbo].[Beneficiario]
		DBCC CHECKIDENT ('[Beneficiario]', RESEED, 0) --para los identity
	DELETE FROM	 [dbo].[TipoParentezco]
	DELETE FROM  [dbo].[EstadoCuenta]
		DBCC CHECKIDENT ('[EstadoCuenta]', RESEED, 0) --para los identity
	DELETE FROM  [dbo].[UsuarioPuedeAccesar]
		DBCC CHECKIDENT ('[UsuarioPuedeAccesar]', RESEED, 0) --para los identity
	DELETE FROM  [dbo].[CuentaAhorro]
		DBCC CHECKIDENT ('[CuentaAhorro]', RESEED, 0) --para los identity
	DELETE FROM  [dbo].[Persona]
		DBCC CHECKIDENT ('[Persona]', RESEED, 0) --para los identity
	DELETE FROM  [dbo].[TipoDocumentoIdentidad]
	DELETE FROM  [dbo].[TipoMovimientoCuentaObjetivo]
	DELETE FROM  [dbo].[TipoMovimientoCuentaObjetivoInteres]
	DELETE FROM  [dbo].[MovimientoCuentaObjetivo]
		DBCC CHECKIDENT ('[MovimientoCuentaObjetivo]', RESEED, 0) --para los identity
	DELETE FROM  [dbo].[MovimientoCuentaObjetivoInteres]
		DBCC CHECKIDENT ('[MovimientoCuentaObjetivoInteres]', RESEED, 0) --para los identity
	DELETE FROM  [dbo].[CuentaObjetivo]
		DBCC CHECKIDENT ('[CuentaObjetivo]', RESEED, 0) --para los identity
	DELETE FROM  [dbo].[TipoCuentaAhorro]
	DELETE FROM  [dbo].[TipoMoneda]
	DELETE FROM  [dbo].[Usuario]
		DBCC CHECKIDENT ('[Usuario]', RESEED, 0) --para los identity
	DELETE FROM  [dbo].[Movimiento]
		DBCC CHECKIDENT ('[Movimiento]', RESEED, 0) --para los identity
	
	

END
GO
