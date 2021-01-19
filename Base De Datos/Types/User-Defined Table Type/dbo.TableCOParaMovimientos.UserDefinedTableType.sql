USE [BD_TP1_Cuenta_De_Ahorros]
GO


CREATE TYPE [dbo].[TableCOParaMovimientos] AS TABLE(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idCuentaAhorro] [int] NULL,
	[numeroCuentaObjetivo] [int] NULL,
	[fechaInicio] [date] NULL,
	[fechaFinal] [date] NULL,
	[objetivo] [varchar](100) NULL,
	[saldo] [money] NULL,
	[diDeAhorro] [int] NULL,
	[interesAcumulado] [money] NULL,
	[activo] [bit] NULL

)



