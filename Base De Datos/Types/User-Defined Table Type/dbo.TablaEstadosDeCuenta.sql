USE [BD_TP1_Cuenta_De_Ahorros]
GO

/****** Object:  UserDefinedTableType [dbo].[TableEstadosDeCuenta]    Script Date: 20/1/2021 01:20:08 ******/
CREATE TYPE [dbo].[TablaEstadosDeCuenta] AS TABLE(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idEstadoCuenta] [int] NULL,
	[idCuentaAhorro] [int] NULL,
	[fechaInicio] [date] NULL,
	[fechaFinal] [date] NULL,
	[saldoInicial] [money] NULL,
	[saldoFinal] [money] NULL,
	[usado] [bit] NULL,
	[cantidadRetiroAutomatico] [int] NULL,
	[cantidadRetiroHumano] [int] NULL
)



