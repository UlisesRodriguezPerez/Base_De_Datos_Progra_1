USE [BD_TP1_Cuenta_De_Ahorros]
GO

/****** Object:  UserDefinedTableType [dbo].[TablaCOParaMovimientos]    Script Date: 20/1/2021 23:29:53 ******/
CREATE TYPE [dbo].[TableCOParaMovimientos] AS TABLE(
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
	[activo] [bit] NULL,
	[montoMensual] [money] NULL,
	[cantidadDepositosProcesados] [int] NULL,
	[cantidadDepositosTotales] [int] NULL,
	[montoAhorrado] [money] NULL,
	[montoEsperado] [money] NULL,
	[interesAcumuladTotal] [money] NULL
)



