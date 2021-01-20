USE [BD_TP1_Cuenta_De_Ahorros]
GO

/****** Object:  UserDefinedTableType [dbo].[TableCOParaMovimientos]    Script Date: 19/1/2021 14:19:00 ******/
CREATE TYPE [dbo].[TableCOParaMovimiento] AS TABLE(
	
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idCuentaObjetivo] [int] NULL,
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



