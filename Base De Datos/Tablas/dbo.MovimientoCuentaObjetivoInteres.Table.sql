USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  Table [dbo].[MovimientoCuentaObjetivoInteres]    Script Date: 26/10/2020 18:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovimientoCuentaObjetivoInteres](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoMovimientoCuentaObjetivoInteres] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Monto] [money] NOT NULL,
 CONSTRAINT [PK_MovimientoCuentaObjetivoInteres] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MovimientoCuentaObjetivoInteres]  WITH CHECK ADD  CONSTRAINT [FK_MovimientoCuentaObjetivoInteres_TipoMovimientoCuentaObjetivoInteres] FOREIGN KEY([IdTipoMovimientoCuentaObjetivoInteres])
REFERENCES [dbo].[TipoMovimientoCuentaObjetivoInteres] ([Id])
GO
ALTER TABLE [dbo].[MovimientoCuentaObjetivoInteres] CHECK CONSTRAINT [FK_MovimientoCuentaObjetivoInteres_TipoMovimientoCuentaObjetivoInteres]
GO
