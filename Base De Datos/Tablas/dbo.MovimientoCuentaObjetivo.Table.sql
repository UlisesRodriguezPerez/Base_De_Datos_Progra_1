USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  Table [dbo].[MovimientoCuentaObjetivo]    Script Date: 26/10/2020 18:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovimientoCuentaObjetivo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoMovimientoCuentaObjetivo] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Monto] [money] NOT NULL,
 CONSTRAINT [PK_MovimientoCuentaObjetivo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MovimientoCuentaObjetivo]  WITH CHECK ADD  CONSTRAINT [FK_MovimientoCuentaObjetivo_TipoMovimientoCuentaObjetivo] FOREIGN KEY([IdTipoMovimientoCuentaObjetivo])
REFERENCES [dbo].[TipoMovimientoCuentaObjetivo] ([Id])
GO
ALTER TABLE [dbo].[MovimientoCuentaObjetivo] CHECK CONSTRAINT [FK_MovimientoCuentaObjetivo_TipoMovimientoCuentaObjetivo]
GO
