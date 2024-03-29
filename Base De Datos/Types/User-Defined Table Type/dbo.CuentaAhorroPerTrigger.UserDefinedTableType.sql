USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  UserDefinedTableType [dbo].[CuentaAhorroPerTrigger]    Script Date: 5/12/2020 23:49:49 ******/
CREATE TYPE [dbo].[CuentaAhorroPerTrigger] AS TABLE(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idPersona] [int] NULL,
	[idTipoCuenta] [int] NULL,
	[numeroCuenta] [int] NULL,
	[fechaCreacion] [date] NULL,
	[saldo] [money] NULL
)
GO
