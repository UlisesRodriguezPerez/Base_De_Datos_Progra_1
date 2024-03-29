USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  Table [dbo].[Beneficiario]    Script Date: 26/10/2020 18:10:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Beneficiario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoParentezco] [int] NOT NULL,
	[IdPersona] [int] NOT NULL,
	[IdCuentaDeAhorro] [int] NOT NULL,
	[Porcentaje] [int] NOT NULL,
	[InsertAt] [datetime] NULL,
	[UpdateAt] [datetime] NULL,
	[InsertBy] [varchar](50) NULL,
	[UpdateBy] [varchar](50) NULL,
	[InsertIn] [varchar](50) NULL,
	[UpdateIn] [varchar](50) NULL,
 CONSTRAINT [PK_Beneficiario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Beneficiario]  WITH CHECK ADD  CONSTRAINT [FK_Beneficiario_CuentaAhorro] FOREIGN KEY([IdCuentaDeAhorro])
REFERENCES [dbo].[CuentaAhorro] ([Id])
GO
ALTER TABLE [dbo].[Beneficiario] CHECK CONSTRAINT [FK_Beneficiario_CuentaAhorro]
GO
ALTER TABLE [dbo].[Beneficiario]  WITH CHECK ADD  CONSTRAINT [FK_Beneficiario_Persona1] FOREIGN KEY([IdPersona])
REFERENCES [dbo].[Persona] ([Id])
GO
ALTER TABLE [dbo].[Beneficiario] CHECK CONSTRAINT [FK_Beneficiario_Persona1]
GO
ALTER TABLE [dbo].[Beneficiario]  WITH CHECK ADD  CONSTRAINT [FK_Beneficiario_TipoParentesco] FOREIGN KEY([IdTipoParentezco])
REFERENCES [dbo].[TipoParentezco] ([Id])
GO
ALTER TABLE [dbo].[Beneficiario] CHECK CONSTRAINT [FK_Beneficiario_TipoParentesco]
GO
