USE [BD_TP1_Cuenta_De_Ahorros]
GO

/****** Object:  UserDefinedTableType [dbo].[TableMovimiento]    Script Date: 19/1/2021 20:07:51 ******/
CREATE TYPE [dbo].[TableEstadosDeCuenta] AS TABLE(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idEstadoCuenta] [int] NULL,
	[idCuentaAhorro] [int] NULL,
	[fechaInicio] [date] NULL,
	[fechaFinal] [date] NULL,
	[saldoInicial] [money] NULL,
	[saldoFinal] [money] NULL,
	[usado] [bit] NULL
)



