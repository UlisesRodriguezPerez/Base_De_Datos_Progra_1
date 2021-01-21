USE [BD_TP1_Cuenta_De_Ahorros]
GO

/****** Object:  UserDefinedTableType [dbo].[BeneficiarioPerTrigger]    Script Date: 21/1/2021 15:39:01 ******/
CREATE TYPE [dbo].[BeneficiarioPerTrigger] AS TABLE(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idBeneficiario] [int] NULL,
	[idTipoParentezco] [int] NULL,
	[idPersona] [int] NULL,
	[idCuentaAhorro] [int] NULL,
	[porcentaje] [int] NULL,
	[activo] [bit] NULL,
	[insertAt] [datetime] NULL,
	[updateAt] [datetime] NULL,
	[insertBy] [varchar](50) NULL,
	[updateBy] [varchar](50) NULL,
	[insertIn] [varchar](50) NULL,
	[updateIn] [varchar](50) NULL

)



