USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 26/10/2020 18:10:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[EsAdministrador] [bit] NOT NULL,
	[InsertAt] [datetime] NULL,
	[UpdateAt] [datetime] NULL,
	[InsertBy] [varchar](50) NULL,
	[UpdateBy] [varchar](50) NULL,
	[InsertIn] [varchar](50) NULL,
	[UpdateIn] [varchar](50) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
