USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  Table [dbo].[CuentaObjetivo]    Script Date: 26/10/2020 18:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuentaObjetivo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdMovimientoCuentaObjetivo] [int] NOT NULL,
	[IdMovimientoCuentaObjetivoInteres] [int] NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFinal] [date] NOT NULL,
	[Objetivo] [varchar](100) NOT NULL,
	[Saldo] [money] NOT NULL,
	[InteresAcumulado] [money] NOT NULL,
	[InsertAt] [datetime] NOT NULL,
	[UpdateAt] [datetime] NOT NULL,
	[InsertBy] [varchar](50) NOT NULL,
	[UpdateBy] [varchar](50) NOT NULL,
	[InsertIn] [varchar](50) NOT NULL,
	[UpdateIn] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CuentaObjetivo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CuentaObjetivo]  WITH CHECK ADD  CONSTRAINT [FK_CuentaObjetivo_MovimientoCuentaObjetivo] FOREIGN KEY([IdMovimientoCuentaObjetivo])
REFERENCES [dbo].[MovimientoCuentaObjetivo] ([Id])
GO
ALTER TABLE [dbo].[CuentaObjetivo] CHECK CONSTRAINT [FK_CuentaObjetivo_MovimientoCuentaObjetivo]
GO
ALTER TABLE [dbo].[CuentaObjetivo]  WITH CHECK ADD  CONSTRAINT [FK_CuentaObjetivo_MovimientoCuentaObjetivoInteres] FOREIGN KEY([IdMovimientoCuentaObjetivoInteres])
REFERENCES [dbo].[MovimientoCuentaObjetivoInteres] ([Id])
GO
ALTER TABLE [dbo].[CuentaObjetivo] CHECK CONSTRAINT [FK_CuentaObjetivo_MovimientoCuentaObjetivoInteres]
GO
