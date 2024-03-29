USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  Table [dbo].[TipoCuentaAhorro]    Script Date: 26/10/2020 18:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoCuentaAhorro](
	[Id] [int] NOT NULL,
	[IdTipoMoneda] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[SaldoMinimo] [money] NOT NULL,
	[MultaSaldoMinimo] [money] NOT NULL,
	[CargoAnual] [money] NOT NULL,
	[MaxCajeroAutomatico] [int] NOT NULL,
	[MaxcajeroHumano] [int] NOT NULL,
	[CobroCajeroAutomatico] [money] NOT NULL,
	[CobroCajeroHumano] [money] NOT NULL,
	[ComisionPorServicio] [money] NOT NULL,
	[Interes] [int] NOT NULL,
 CONSTRAINT [PK_TipoCuentaAhorro] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TipoCuentaAhorro]  WITH CHECK ADD  CONSTRAINT [FK_TipoCuentaAhorro_TipoMoneda] FOREIGN KEY([IdTipoMoneda])
REFERENCES [dbo].[TipoMoneda] ([Id])
GO
ALTER TABLE [dbo].[TipoCuentaAhorro] CHECK CONSTRAINT [FK_TipoCuentaAhorro_TipoMoneda]
GO
