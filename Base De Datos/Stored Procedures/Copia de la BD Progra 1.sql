USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  Table [dbo].[Beneficiario]    Script Date: 17/11/2020 20:58:17 ******/
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
	[Activo] [bit] NULL,
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
/****** Object:  Table [dbo].[CuentaAhorro]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuentaAhorro](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoCuenta] [int] NOT NULL,
	[IdPersona] [int] NOT NULL,
	[IdCuentaObjetivo] [int] NULL,
	[NumeroDeCuenta] [int] NOT NULL,
	[Saldo] [money] NOT NULL,
	[FechaCreacion] [date] NOT NULL,
	[InsertAt] [datetime] NULL,
	[UpdateAt] [datetime] NULL,
	[InsertBy] [varchar](50) NULL,
	[UpdateBy] [varchar](50) NULL,
	[InsertIn] [varchar](50) NULL,
	[UpdateIn] [varchar](50) NULL,
	[TotalPorcentaje] [int] NULL,
 CONSTRAINT [PK_CuentaAhorro] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CuentaObjetivo]    Script Date: 17/11/2020 20:58:18 ******/
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
/****** Object:  Table [dbo].[EstadoCuenta]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoCuenta](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCuentaDeAhorro] [int] NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFinal] [date] NULL,
	[SaldoInicial] [money] NOT NULL,
	[SaldoFinal] [money] NULL,
 CONSTRAINT [PK_EstadoCuenta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movimiento]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movimiento](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoMovimiento] [int] NOT NULL,
	[IdCuentaAhorro] [int] NOT NULL,
	[IdEstadoDeCuenta] [int] NOT NULL,
	[Monto] [money] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Descripcion] [varchar](200) NOT NULL,
	[NuevoSaldo] [money] NOT NULL,
 CONSTRAINT [PK_Movimiento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovimientoCuentaObjetivo]    Script Date: 17/11/2020 20:58:18 ******/
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
/****** Object:  Table [dbo].[MovimientoCuentaObjetivoInteres]    Script Date: 17/11/2020 20:58:18 ******/
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
/****** Object:  Table [dbo].[Persona]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoDocumentoIdentidad] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[ValorDocumentoIdentidad] [varchar](50) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Telefono1] [varchar](50) NOT NULL,
	[Telefono2] [varchar](50) NOT NULL,
	[CorreoElectronico] [varchar](50) NOT NULL,
	[InsertAt] [datetime] NULL,
	[UpdateAt] [datetime] NULL,
	[InsertBy] [varchar](50) NULL,
	[UpdateBy] [varchar](50) NULL,
	[InsertIn] [varchar](50) NULL,
	[UpdateIn] [varchar](50) NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoCuentaAhorro]    Script Date: 17/11/2020 20:58:18 ******/
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
/****** Object:  Table [dbo].[TipoDocumentoIdentidad]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDocumentoIdentidad](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
 CONSTRAINT [PK_TipoDocumentoIdentidad] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMoneda]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMoneda](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Simbolo] [nvarchar](1) NOT NULL,
 CONSTRAINT [PK_Moneda] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMovimiento]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMovimiento](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
 CONSTRAINT [PK_TipoMovimiento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMovimientoCuentaObjetivo]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMovimientoCuentaObjetivo](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoMovimientoCuentaObjetivo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMovimientoCuentaObjetivoInteres]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMovimientoCuentaObjetivoInteres](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoMovimientoCuentaObjetivoInteres] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoParentezco]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoParentezco](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Parentesco] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 17/11/2020 20:58:18 ******/
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
/****** Object:  Table [dbo].[UsuarioPuedeAccesar]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioPuedeAccesar](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCuentaDeAhorros] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
	[InsertAt] [datetime] NULL,
	[UpdateAt] [datetime] NULL,
	[InsertBy] [varchar](50) NULL,
	[UpdateBy] [varchar](50) NULL,
	[InsertIn] [varchar](50) NULL,
	[UpdateIn] [varchar](50) NULL,
 CONSTRAINT [PK_UsuarioPuedeAccesar] PRIMARY KEY CLUSTERED 
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
ALTER TABLE [dbo].[Beneficiario]  WITH CHECK ADD  CONSTRAINT [FK_Beneficiario_Persona] FOREIGN KEY([IdPersona])
REFERENCES [dbo].[Persona] ([Id])
GO
ALTER TABLE [dbo].[Beneficiario] CHECK CONSTRAINT [FK_Beneficiario_Persona]
GO
ALTER TABLE [dbo].[Beneficiario]  WITH CHECK ADD  CONSTRAINT [FK_Beneficiario_TipoParentezco] FOREIGN KEY([IdTipoParentezco])
REFERENCES [dbo].[TipoParentezco] ([Id])
GO
ALTER TABLE [dbo].[Beneficiario] CHECK CONSTRAINT [FK_Beneficiario_TipoParentezco]
GO
ALTER TABLE [dbo].[CuentaAhorro]  WITH CHECK ADD  CONSTRAINT [FK_CuentaAhorro_TipoCuentaAhorro] FOREIGN KEY([IdTipoCuenta])
REFERENCES [dbo].[TipoCuentaAhorro] ([Id])
GO
ALTER TABLE [dbo].[CuentaAhorro] CHECK CONSTRAINT [FK_CuentaAhorro_TipoCuentaAhorro]
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
ALTER TABLE [dbo].[EstadoCuenta]  WITH CHECK ADD  CONSTRAINT [FK_EstadoCuenta_CuentaAhorro] FOREIGN KEY([IdCuentaDeAhorro])
REFERENCES [dbo].[CuentaAhorro] ([Id])
GO
ALTER TABLE [dbo].[EstadoCuenta] CHECK CONSTRAINT [FK_EstadoCuenta_CuentaAhorro]
GO
ALTER TABLE [dbo].[Movimiento]  WITH CHECK ADD  CONSTRAINT [FK_Movimiento_CuentaAhorro1] FOREIGN KEY([IdCuentaAhorro])
REFERENCES [dbo].[CuentaAhorro] ([Id])
GO
ALTER TABLE [dbo].[Movimiento] CHECK CONSTRAINT [FK_Movimiento_CuentaAhorro1]
GO
ALTER TABLE [dbo].[Movimiento]  WITH CHECK ADD  CONSTRAINT [FK_Movimiento_EstadoCuenta] FOREIGN KEY([IdEstadoDeCuenta])
REFERENCES [dbo].[EstadoCuenta] ([Id])
GO
ALTER TABLE [dbo].[Movimiento] CHECK CONSTRAINT [FK_Movimiento_EstadoCuenta]
GO
ALTER TABLE [dbo].[Movimiento]  WITH CHECK ADD  CONSTRAINT [FK_Movimiento_TipoMovimiento1] FOREIGN KEY([IdTipoMovimiento])
REFERENCES [dbo].[TipoMovimiento] ([Id])
GO
ALTER TABLE [dbo].[Movimiento] CHECK CONSTRAINT [FK_Movimiento_TipoMovimiento1]
GO
ALTER TABLE [dbo].[MovimientoCuentaObjetivo]  WITH CHECK ADD  CONSTRAINT [FK_MovimientoCuentaObjetivo_TipoMovimientoCuentaObjetivo] FOREIGN KEY([IdTipoMovimientoCuentaObjetivo])
REFERENCES [dbo].[TipoMovimientoCuentaObjetivo] ([Id])
GO
ALTER TABLE [dbo].[MovimientoCuentaObjetivo] CHECK CONSTRAINT [FK_MovimientoCuentaObjetivo_TipoMovimientoCuentaObjetivo]
GO
ALTER TABLE [dbo].[MovimientoCuentaObjetivoInteres]  WITH CHECK ADD  CONSTRAINT [FK_MovimientoCuentaObjetivoInteres_TipoMovimientoCuentaObjetivoInteres] FOREIGN KEY([IdTipoMovimientoCuentaObjetivoInteres])
REFERENCES [dbo].[TipoMovimientoCuentaObjetivoInteres] ([Id])
GO
ALTER TABLE [dbo].[MovimientoCuentaObjetivoInteres] CHECK CONSTRAINT [FK_MovimientoCuentaObjetivoInteres_TipoMovimientoCuentaObjetivoInteres]
GO
ALTER TABLE [dbo].[Persona]  WITH CHECK ADD  CONSTRAINT [FK_Persona_TipoDocumentoIdentidad1] FOREIGN KEY([IdTipoDocumentoIdentidad])
REFERENCES [dbo].[TipoDocumentoIdentidad] ([Id])
GO
ALTER TABLE [dbo].[Persona] CHECK CONSTRAINT [FK_Persona_TipoDocumentoIdentidad1]
GO
ALTER TABLE [dbo].[TipoCuentaAhorro]  WITH CHECK ADD  CONSTRAINT [FK_TipoCuentaAhorro_TipoMoneda] FOREIGN KEY([IdTipoMoneda])
REFERENCES [dbo].[TipoMoneda] ([Id])
GO
ALTER TABLE [dbo].[TipoCuentaAhorro] CHECK CONSTRAINT [FK_TipoCuentaAhorro_TipoMoneda]
GO
ALTER TABLE [dbo].[UsuarioPuedeAccesar]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioPuedeAccesar_CuentaAhorro] FOREIGN KEY([IdCuentaDeAhorros])
REFERENCES [dbo].[CuentaAhorro] ([Id])
GO
ALTER TABLE [dbo].[UsuarioPuedeAccesar] CHECK CONSTRAINT [FK_UsuarioPuedeAccesar_CuentaAhorro]
GO
ALTER TABLE [dbo].[UsuarioPuedeAccesar]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioPuedeAccesar_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[UsuarioPuedeAccesar] CHECK CONSTRAINT [FK_UsuarioPuedeAccesar_Usuario]
GO
/****** Object:  StoredProcedure [dbo].[SPActualizarBeneficiario]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[SPActualizarBeneficiario]
	(
	   	 @pIdBeneficiario INT
		,@pIdPersona INT
		,@pParentezco VARCHAR(100)
		--,@pIdTipoParentezco INT
		,@pIdCuenta INT
		,@pPorcentaje INT
		,@pNombre VARCHAR(40)
		,@pValorDocumentoIdentidad VARCHAR(50)
		,@pFechaNacimiento DATE
		,@pTelefono1 VARCHAR(50)
		,@pTelefono2 VARCHAR(50)
		,@pCorreoElectronico VARCHAR(50)
		
	)
AS 
BEGIN    
	SET NOCOUNT ON;
	BEGIN TRY
		--DECLARE  @pIDCuentaAhorro INT =
		DECLARE @pIdTipoParentezco INT

		DECLARE @Suma INT;
		DECLARE @Diferencia INT;
		DECLARE @Actual INT;
		SELECT @pIdPersona = Id FROM Persona WHERE ValorDocumentoIdentidad = @pValorDocumentoIdentidad;

		SELECT 
			@pIdTipoParentezco = Id 
		FROM 
			[dbo].[TipoParentezco] 
		WHERE 
			Nombre = @pParentezco;
		SELECT 
			@Actual = Porcentaje 
		FROM 
			[dbo].[Beneficiario] 
		WHERE 
			Id = @pIdBeneficiario;
		SELECT 
			@Diferencia = @pPorcentaje - @Actual; 
		SELECT 
			@Suma = SUM(Porcentaje) 
		FROM 
			[dbo].[Beneficiario] 
		WHERE 
			IdCuentaDeAhorro = @pIdCuenta AND Activo = 1;
		IF @Suma + @Diferencia < 101
			BEGIN
			   Update 
					[dbo].Beneficiario
			   SET		

					 IdTipoParentezco = @pIdTipoParentezco
					,Porcentaje = @pPorcentaje
					

		
			   WHERE 
					ID = @pIdBeneficiario 

				UPDATE [dbo].[Persona]
					SET 
						 Nombre =  @pNombre
						,ValorDocumentoIdentidad  = @pValorDocumentoIdentidad 
						,FechaNacimiento = @pFechaNacimiento
						,Telefono1 = @pTelefono1
						,Telefono2 = @pTelefono2
						,CorreoElectronico = @pCorreoElectronico

				WHERE 
						Id = @pIdPersona;
		
			END
		ELSE
			BEGIN
				PRINT 'SE EXCEDE DEL LÍMITE.'
				PRINT @Suma + @Diferencia
				PRINT @pIdTipoParentezco
				PRINT @pParentezco
			END
	END TRY
	BEGIN CATCH
		PRINT  'Algo salió mal al actualizar el beneficiario.'
		RETURN @@ERROR * - 1;
	END CATCH
	SET NOCOUNT OFF;
		--AND IdPersona = @pIdPersona





--EXEC [dbo].[SPActualizarBeneficiario] 
--@pIdBeneficiario = 1
--,@pIdPersona = 1
--,@pIdTipoParentezco =1
--	,@pIdCuenta = 1
--	,@pPorcentaje= 50
--BEGIN 
----Esto es para saber si existe el IdTipoParentesco que se quiere cambiar en la tabla
--	SELECT CAST(COUNT(*) AS BIT) 
--	FROM 
--		[Beneficiario] 
--	WHERE 
--		(IdPersona = @pIdPersona) AND (Id = @pIdBeneficiario)
--	If COUNT(*) = 1
--		BEGIN TRANSACTION
--		UPDATE Beneficiario
--			SET 
--				IdTipoParentezco = @pIdTipoParentezco,
--				Porcentaje = @pPorcentaje 
--			FROM 
--				[dbo].[Beneficiario]
--			WHERE 
--				Beneficiario.[IdPersona] = @pIdPersona
--		COMMIT TRANSACTION
	
END

------LLamar a ejecutar el SP
--EXEC SPActualizarBeneficiario @pIdBeneficiario = 1, @pIdPersona=1
--		, @pParentezco = 'Madre', @pIdCuenta = 1,@pPorcentaje=95;



		
GO
/****** Object:  StoredProcedure [dbo].[SPActualizarEstadoCuenta]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPActualizarEstadoCuenta]
(		
		 @pId INT
		,@pFechaFinal DATE
		,@pSaldoFinal MONEY
)

AS 
BEGIN 
	SET NOCOUNT ON;
	BEGIN TRY
	   Update 
			[dbo].[EstadoCuenta]
	   SET 
			 FechaFinal = @pFechaFinal
			,SaldoFinal = @pSaldoFinal

	   WHERE 
			Id=@pId   
	END TRY
	BEGIN CATCH
		PRINT  'Algo salió mal con el SP de actualizar estado de cuenta.'
		RETURN @@ERROR * - 1;
	END CATCH
	SET NOCOUNT OFF;
END


--EXEC SPActualizarEstadoCuenta 2020-11-12,145000000;
--SELECT * FROM [dbo].[EstadoCuenta]
--DROP PROCEDURE SPActualizarEstadoCuenta;
GO
/****** Object:  StoredProcedure [dbo].[SPActualizarPersona]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SPActualizarPersona] 
(
	 @pIdPersona INT
	,@pNombre VARCHAR(40)
	,@pValorDocumentoIdentidad VARCHAR(50)
	,@pFechaNacimiento DATE
	,@pTelefono1 VARCHAR(50)
	,@pTelefono2 VARCHAR(50)
	,@pCorreoElectronico VARCHAR(50)
)

AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY

	BEGIN TRANSACTION
		UPDATE [dbo].[Persona]
			SET 
					 Nombre =  @pNombre
					,ValorDocumentoIdentidad  = @pValorDocumentoIdentidad 
					,FechaNacimiento = @pFechaNacimiento
					,Telefono1 = @pTelefono1
					,Telefono2 = @pTelefono2
					,CorreoElectronico = @pCorreoElectronico

			WHERE 
				 Id = @pIdPersona;
	COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		PRINT 'No se actualizó'
	END CATCH

	SET NOCOUNT OFF
END

--EXEC SPActualizarPersona @pIdPersona=2,@pNombre='Osvaldo Aguero Hernandez',@pValorDocumentoIdentidad='12738545',@pFechaNacimiento = '1994-10-24',@pTelefono1='3',@pTelefono2='3',@pCorreoElectronico='osadage@gmail.com';
--SELECT *
--FROM 
--	[dbo].Persona
--WHERE id = 2
GO
/****** Object:  StoredProcedure [dbo].[SPBuscarCuentaAhorro]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  	PROCEDURE [dbo].[SPBuscarCuentaAhorro]
(      
   @Id	INT 
)      
AS
BEGIN     
	SET NOCOUNT ON;
	BEGIN TRY
	   SELECT 
			 Id
			,IdTipoCuenta
			,IdPersona
			,NumeroDeCuenta
			,Saldo
			,FechaCreacion
		FROM 
			[dbo].[CuentaAhorro]
		WHERE 
			Id = @Id
	END TRY
	BEGIN CATCH
		PRINT  'Algo salió mal con buscar cuenta de ahorro.'
		RETURN @@ERROR * - 1;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SPBuscarEstadoCuenta]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE	PROCEDURE [dbo].[SPBuscarEstadoCuenta]
(      
	@pId	INT 
)      
AS
BEGIN 
	SET NOCOUNT ON;
	BEGIN TRY
	   SELECT 
			 IdCuentaDeAhorro
			,FechaInicio
			,FechaFinal
			,SaldoInicial
			,SaldoFinal

		FROM 
			[dbo].[EstadoCuenta]
		WHERE 
			Id=@pId  
	END TRY
	BEGIN CATCH
		PRINT  'Algo salió mal con buscar estado de cuenta.'
		RETURN @@ERROR * - 1;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SPBuscarPersona]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE	PROCEDURE [dbo].[SPBuscarPersona]
(      
   @pIdTipoDocumentoIdentidad	INT 
)      
AS
BEGIN   
	SET NOCOUNT ON;
	BEGIN TRY
	   SELECT 
			 [Nombre]
			,[ValorDocumentoIdentidad]
			,[FechaNacimiento]
			,[Telefono1]
			,[Telefono2]
			,[CorreoElectronico]
		FROM 
			[dbo].[Persona]
		WHERE 
			IdTipoDocumentoIdentidad=@pIdTipoDocumentoIdentidad    
	END TRY
	BEGIN CATCH
		PRINT  'Algo salió mal al buscar persona.'
		RETURN @@ERROR * - 1;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SPBuscarUsuario]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE	PROCEDURE [dbo].[SPBuscarUsuario]
(      
   @pValorDocumentoIdentidad	INT 
)      
AS
BEGIN  
	SET NOCOUNT ON;
	BEGIN TRY
	   SELECT 
			 [Nombre]
			,[FechaNacimiento]
			,[Telefono1]
			,[Telefono2]
			,[CorreoElectronico]
		FROM 
			[dbo].[Persona]
		WHERE 
			ValorDocumentoIdentidad=@pValorDocumentoIdentidad    
	END TRY
	BEGIN CATCH
		PRINT  'Algo salió mal al buscar usuario.'
		RETURN @@ERROR * - 1;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SPCargar_Catalogos]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[SPCargar_Catalogos]
AS
BEGIN

	BEGIN TRY 
		/*    Parsear el XML e insertar datos en la tabla    */
		DECLARE 
				@DocumentoXML XML;
		SELECT 
				@DocumentoXML = DXML
		FROM 
				OPENROWSET(BULK 'D:\S3\bucket-xml\PruebaCatalogo.xml', SINGLE_BLOB) AS DocumentoXML(DXML);  
	END TRY

	BEGIN CATCH
			PRINT 'Problemas al cargar el xml Seccion Catalogo'
			RETURN @@ERROR * - 1;
	END CATCH

	BEGIN TRY
					/* Inserta en las siguientes tablas sus valores correspondientes, según el XML.*/
			INSERT INTO [dbo].[TipoDocumentoIdentidad](
														 [Id]
														 ,[Nombre]
													  )
			SELECT	
					  d.value('@Id', 'INT')
					, d.value('@Nombre', 'VARCHAR(100)')
			FROM 
					@DocumentoXML.nodes('/Tipo_Doc/TipoDocuIdentidad') AS t(d)
	END TRY

	BEGIN CATCH
			PRINT  'ERROR AL INSERTAR DATOS EN LA TABLA [TipoDocumentoIdentidad].'
			RETURN @@ERROR * - 1;
	END CATCH


	BEGIN TRY 
			INSERT INTO [dbo].[TipoMoneda](
											 [Id]
											 ,[Nombre]
											 ,[Simbolo]
										  )
			SELECT	
					  d.value('@Id', 'INT')
					, d.value('@Nombre', 'VARCHAR(100)')
					, d.value('@Simbolo', 'nvarchar(1)')
			FROM 
					@DocumentoXML.nodes('/Tipo_Moneda/TipoMoneda') AS t(d)
	END TRY

	BEGIN CATCH
			PRINT  'ERROR AL INSERTAR DATOS EN LA TABLA [TipoMoneda].'
			RETURN @@ERROR * - 1;
	END CATCH


	BEGIN TRY
			INSERT INTO [dbo].[TipoParentezco](
										 [Id]
										,[Nombre]
									)
			SELECT	
					  d.value('@Id', 'INT')
					, d.value('@Nombre', 'VARCHAR(100)')
			FROM 
					@DocumentoXML.nodes('/Parentezcos/Parentezco') AS t(d)
	END TRY

	BEGIN CATCH
			PRINT  'ERROR AL INSERTAR DATOS EN LA TABLA [TipoParentezco].'
			RETURN @@ERROR * - 1;
	END CATCH


	BEGIN TRY
				INSERT INTO [dbo].[TipoCuentaAhorro](
													 [Id]
													,[Nombre]
													,[IdTipoMoneda]
													,[SaldoMinimo]
													,[MultaSaldoMinimo]
													,[CargoAnual]
													,[MaxcajeroHumano]
													,[MaxCajeroAutomatico]
													,[CobroCajeroHumano]
													,[CobroCajeroAutomatico]
													,[ComisionPorServicio]
													,[Interes]
												)
				SELECT	
						  d.value('@Id', 'INT')
						, d.value('@Nombre', 'VARCHAR(100)')
						, d.value('@IdTipoMoneda', 'INT')
						, d.value('@SaldoMinimo', 'MONEY')
						, d.value('@MultaSaldoMin', 'MONEY')
						, d.value('@CargoAnual', 'MONEY')
						, d.value('@NumRetirosHumano', 'INT')
						, d.value('@NumRetirosAutomatico', 'INT')
						, d.value('@ComisionHumano', 'MONEY')
						, d.value('@ComisionAutomatico', 'MONEY')
						, d.value('@ComisionServicio', 'MONEY')
						, d.value('@Interes', 'INT')
				FROM 
						@DocumentoXML.nodes('/Tipo_Cuenta_Ahorros/TipoCuentaAhorro') AS t(d)
	END TRY

	BEGIN CATCH
			PRINT  'ERROR AL INSERTAR DATOS EN LA TABLA [TipoCuentaAhorro].'
			RETURN @@ERROR * - 1;
	END CATCH



	/*
	--este codigo ve si hay algo en el xml sin ingresar nada en las tablas

	SELECT * FROM OPENROWSET(  
	   BULK 'D:\S3\bucket-xml\PruebaCatalogo.xml',  
	   SINGLE_BLOB) AS x;  

	SELECT CONVERT(XML, BulkColumn) AS BulkColumn, GETDATE() 
	FROM OPENROWSET(BULK 'D:\S3\bucket-xml\PruebaCatalogo.xml', SINGLE_BLOB) AS x;


	*/
END
GO
/****** Object:  StoredProcedure [dbo].[SPCargar_Operaciones]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[SPCargar_Operaciones]
AS
BEGIN 
	SET NOCOUNT ON
	
	BEGIN TRY
		/*    Parsear el XML e insertar datos en la tabla    */
		DECLARE 
				@DocumentoXML XML;
	
		SELECT 
			@DocumentoXML = DXML
		FROM 
			OPENROWSET(BULK 'D:\S3\bucket-xml\PruebaOperaciones.xml', SINGLE_BLOB) AS DocumentoXML(DXML);
	
		SELECT 
				@DocumentoXML
	END TRY

	BEGIN CATCH
			PRINT 'ERROR AL PARSEAR EL XML.'
			RETURN @@ERROR * - 1;
	END CATCH


		
	BEGIN TRY
		/* Inserta en las siguientes tablas sus valores correspondientes, según el XML.*/
		INSERT INTO [dbo].[Persona]
			(
				 [IdTipoDocumentoIdentidad]
				,[Nombre]
				,[ValorDocumentoIdentidad]
				,[FechaNacimiento]
				,[CorreoElectronico]
				,[Telefono1]
				,[Telefono2]
				,[InsertAt]
				,[UpdateAt]
				,[InsertBy]
				,[UpdateBy]
				,[InsertIn]
				,[UpdateIn]
			)
		SELECT	
				d.value('@TipoDocuIdentidad', 'INT')
				, d.value('@Nombre', 'VARCHAR(100)')
				, d.value('@ValorDocumentoIdentidad', 'VARCHAR(50)')
				, d.value('@FechaNacimiento', 'DATETIME')
				, d.value('@Email', 'VARCHAR(50)')
				, d.value('@Telefono1', 'VARCHAR(50)')
				, d.value('@Telefono2', 'VARCHAR(50)')
				, GETDATE() AS [InsertAt] --obtiene la fecha del dia de insercion
				, GETDATE() AS [UpdateAt] --obtiene la fecha del dia de actualizacion
				, CURRENT_USER AS [InsertBy] --string de prueba
				, 'CURRENT_USER' AS [UpdateBy] --string de prueba
				, 'amazon-server' AS [InsertIn] --string de prueba
				, 'amazon-server' AS [UpdateIn] --string de prueba
		FROM 
				@DocumentoXML.nodes('/Personas/Persona') AS t(d);
	END TRY

	BEGIN CATCH
			PRINT 'ERROR AL INSERTAR DATOS EN LA TABLA [Persona].'
			RETURN @@ERROR * - 1;
	END CATCH


	BEGIN TRY
		INSERT INTO [dbo].[CuentaAhorro]
			(
				 [IdPersona]
				,[IdTipoCuenta]
				,[NumeroDeCuenta]
				,[FechaCreacion]
				,[Saldo]
				,[InsertAt]
				,[UpdateAt]
				,[InsertBy]
				,[UpdateBy]
				,[InsertIn]
				,[UpdateIn]
			)
		SELECT	
				(	
					SELECT 
							P.Id
					FROM 
							[dbo].[Persona] P
					WHERE 
							C.value('@ValorDocumentoIdentidadDelCliente', 'INT') = P.ValorDocumentoIdentidad
				) AS 
						[IdPersona]

				, C.value('@TipoCuentaId', 'INT')
				, C.value('@NumeroCuenta', 'INT')
				, C.value('@FechaCreacion', 'DATETIME')
				, C.value('@Saldo', 'MONEY')
				, GETDATE() AS [InsertAt] --obtiene la fecha del dia de insercion
				, GETDATE() AS [UpdateAt] --obtiene la fecha del dia de actualizacion
				, 'CURRENT_USER' AS [InsertBy] --string de prueba
				, 'CURRENT_USER' AS [UpdateBy] --string de prueba
				, 'amazon-server' AS [InsertIn] --string de prueba
				, 'amazon-server' AS [UpdateIn] --string de prueba
		FROM 
				@DocumentoXML.nodes('/Cuentas/Cuenta') AS S(C)
	END TRY

	BEGIN CATCH
			PRINT 'ERROR AL INSERTAR DATOS EN LA TABLA [CuentaAhorro].'
			RETURN @@ERROR * - 1;
	END CATCH


	BEGIN TRY
		INSERT INTO [dbo].[Beneficiario]
								(
									 [IdPersona]
									,[IdCuentaDeAhorro]
									,[IdTipoParentezco]
									,[Porcentaje]
									,[Activo]
									,[InsertAt]
									,[UpdateAt]
									,[InsertBy]
									,[UpdateBy]
									,[InsertIn]
									,[UpdateIn]
								)
		SELECT	 
					-- Con esta fracción de código logramos enlazar el documento de identidad del beneficiario, junto con el IdPersona.
				(	
					SELECT 
							P.Id
					FROM 
							[dbo].[Persona] P
					WHERE 
							d.value('@ValorDocumentoIdentidadBeneficiario', 'INT') = P.ValorDocumentoIdentidad
				) AS [IdPersona]
				
					-- Aquí enlazamos el número de cuenta con su respectiva cuenta xD.
				,(	
					SELECT 
							C.Id
					FROM 
							[dbo].[CuentaAhorro] C
					WHERE 
							d.value('@NumeroCuenta', 'INT') = C.NumeroDeCuenta
				) AS [IdCuentaDeAhorro]

				, d.value('@ParentezcoId', 'INT')
				, d.value('@Porcentaje', 'INT')

				, 1 AS [Activo]

				, GETDATE() AS [InsertAt] --obtiene la fecha del dia de insercion
				, GETDATE() AS [UpdateAt] --obtiene la fecha del dia de actualizacion
				, 'CURRENT_USER' AS [InsertBy] --string de prueba
				, 'CURRENT_USER' AS [UpdateBy] --string de prueba
				, 'amazon-server' AS [InsertIn] --string de prueba
				, 'amazon-server' AS [UpdateIn] --string de prueba
		FROM 
				@DocumentoXML.nodes('/Beneficiarios/Beneficiario') AS t(d);
	END TRY

	BEGIN CATCH
			PRINT 'ERROR AL INSERTAR DATOS EN LA TABLA [Beneficiario].'
			RETURN @@ERROR * - 1;
	END CATCH



	BEGIN TRY
		INSERT INTO [dbo].EstadoCuenta
				(
					 [IdCuentaDeAhorro]
					,[FechaInicio]
					,[FechaFinal]
					,[SaldoInicial]
					,[SaldoFinal]
				)
				SELECT	  
					(	
						SELECT 
								C.Id
						FROM 
								[dbo].[CuentaAhorro] C
						WHERE 
								d.value('@NumeroCuenta', 'INT') = C.NumeroDeCuenta
					) AS [IdCuentaDeAhorro]
					, d.value('@fechaInicio', 'DATETIME')
					, d.value('@fechaFin', 'DATETIME')
					, d.value('@saldoInicial', 'MONEY')
					, d.value('@saldoFinal', 'MONEY')
		FROM 
				@DocumentoXML.nodes('/Estados_de_Cuenta/Estado_de_Cuenta') AS t(d);
	END TRY

	BEGIN CATCH
			PRINT 'ERROR AL INSERTAR DATOS EN LA TABLA [EstadoCeunta].'
			RETURN @@ERROR * - 1;
	END CATCH

	BEGIN TRY
		INSERT INTO [dbo].[Usuario]
							(
								 [Nombre]
								,[Password]
								,[EsAdministrador]
								,[InsertAt]
								,[UpdateAt]
								,[InsertBy]
								,[UpdateBy]
								,[InsertIn]
								,[UpdateIn]
							)
		SELECT	  
				  d.value('@User', 'VARCHAR(100)')
				, d.value('@Pass', 'VARCHAR(100)')
				, d.value('@EsAdministrador', 'BIT')
				, GETDATE() AS [InsertAt] --obtiene la fecha del dia de insercion
				, GETDATE() AS [UpdateAt] --obtiene la fecha del dia de actualizacion
				, 'CURRENT_USER' AS [InsertBy] --string de prueba
				, 'CURRENT_USER' AS [UpdateBy] --string de prueba
				, 'amazon-server' AS [InsertIn] --string de prueba
				, 'amazon-server' AS [UpdateIn] --string de prueba
		FROM 
				@DocumentoXML.nodes('/Usuarios/Usuario') AS t(d);
	END TRY

	BEGIN CATCH
			PRINT 'ERROR AL INSERTAR DATOS EN LA TABLA [Usuario].'
			RETURN @@ERROR * - 1;
	END CATCH



	BEGIN TRY		
		INSERT INTO [dbo].[UsuarioPuedeAccesar]
											(
												 [IdUsuario]
												,[IdCuentaDeAhorros]
												,[Activo]
												,[InsertAt]
												,[UpdateAt]
												,[InsertBy]
												,[UpdateBy]
												,[InsertIn]
												,[UpdateIn]
											)
		
		SELECT	  
				(	
					SELECT 
							U.Id
					FROM 
							[dbo].[Usuario] U
					WHERE 
							d.value('@User', 'VARCHAR(100)') = U.Nombre
				) AS [IdUsuario]

				,(	
					SELECT 
							C.Id
					FROM 
							[dbo].[CuentaAhorro] C
					WHERE 
							d.value('@NumeroCuenta', 'INT') = C.NumeroDeCuenta
					) AS [IdCuentaDeAhorro]
				, '1' AS [Activo]
				, GETDATE() AS [InsertAt] --obtiene la fecha del dia de insercion
				, GETDATE() AS [UpdateAt] --obtiene la fecha del dia de actualizacion
				, CURRENT_USER AS [InsertBy] --string de prueba
				, CURRENT_USER AS [UpdateBy] --string de prueba
				, 'amazon-server' AS [InsertIn] --string de prueba
				, 'amazon-server' AS [UpdateIn] --string de prueba
		FROM 
				@DocumentoXML.nodes('/Usuarios_Ver/UsuarioPuedeVer') AS t(d)
	END TRY

	BEGIN CATCH
			PRINT 'ERROR AL INSERTAR DATOS EN LA TABLA [UsuarioPuedeAccesar].'
			RETURN @@ERROR * - 1;
	END CATCH
	



	/*
	--este codigo ve si hay algo en el xml sin ingresar nada en las tablas

	SELECT * FROM OPENROWSET(  
	   BULK 'D:\S3\bucket-xml\PruebaCatalogo.xml',  
	   SINGLE_BLOB) AS x;  

	SELECT CONVERT(XML, BulkColumn) AS BulkColumn, GETDATE() 
	FROM OPENROWSET(BULK 'D:\S3\bucket-xml\PruebaCatalogo.xml', SINGLE_BLOB) AS x;


	*/

	
END
GO
/****** Object:  StoredProcedure [dbo].[SPDescargar_XMLS]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPDescargar_XMLS]
AS

/*
Cargar archivos XML en AWS RSD
*/
--como descargar archivos en la nube S3 AWS

exec msdb.dbo.rds_download_from_s3
 @s3_arn_of_file='arn:aws:s3:::bucket-xml/PruebaCatalogo.xml', --nombre del archivo
 @rds_file_path='D:\S3\bucket-xml\PruebaCatalogo.xml', --nombre donde se guarda
 @overwrite_file=1;

exec msdb.dbo.rds_download_from_s3
 @s3_arn_of_file='arn:aws:s3:::bucket-xml/PruebaOperaciones.xml', --nombre del archivo
 @rds_file_path='D:\S3\bucket-xml\PruebaOperaciones.xml', --nombre donde se guarda
 @overwrite_file=1;

GO
/****** Object:  StoredProcedure [dbo].[SPEditarUsuario]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     procedure [dbo].[SPEditarUsuario]
 (      
	 @id int
	,@Nombre varchar(100)
	,@Password varchar(100)
	,@TipoUsuario BIT 
 )      
AS  
BEGIN       
	SET NOCOUNT ON;
	BEGIN TRY
	   Update 
			[dbo].Usuario
	   SET 
			 Nombre=@Nombre
			,Password=@Password
			,EsAdministrador=@TipoUsuario
	   WHERE 
			ID=@id      
	END TRY
	BEGIN CATCH
		PRINT  'Algo salió mal al editar usuario.'
		RETURN @@ERROR * - 1;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SPEliminarBeneficiario]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==============================================================================
-- Author:		Natalia Vargas /Ulises Rodríguez
-- Update date: 9/11/2020
-- Description:	Borrar un beneficiario en la tabla [dbo].[Beneficiario]
-- ==============================================================================

CREATE  PROCEDURE [dbo].[SPEliminarBeneficiario]
(
	@pIdPersona INT
)

AS 
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		DELETE FROM 
				[dbo].[Beneficiario]
		WHERE  
				Activo=1 AND IdPersona = @pIdPersona;  
	END TRY
	BEGIN CATCH
		PRINT  'Algo salió mal al eliminar beneficiario.'
		RETURN @@ERROR * - 1;
	END CATCH
	SET NOCOUNT OFF;
END

--SELECT * FROM Beneficiario
--SELECT * FROM CuentaAhorro
--SELECT * FROM Persona
--DROP PROCEDURE SPEliminarBeneficiario;
--GO
--EXEC SPEliminarBeneficiario 1;
GO
/****** Object:  StoredProcedure [dbo].[SPEliminarLogicoBeneficiario]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   PROCEDURE [dbo].[SPEliminarLogicoBeneficiario]
(
	@Id INT
)

AS  
BEGIN  
	SET NOCOUNT ON;
	BEGIN TRY
	   UPDATE 
			[dbo].[Beneficiario]
	   SET 
			 Activo = 0
	   WHERE 
			Id = @Id     
	END TRY
	BEGIN CATCH
		PRINT  'Algo salió mal al eliminar beneficiario.'
		RETURN @@ERROR * - 1;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SPEliminarUsuario]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [dbo].[SPEliminarUsuario]
(
	@ID int
)
AS 
BEGIN 
	SET NOCOUNT ON;
	BEGIN TRY
		DELETE 
			FROM 
				[dbo].[Usuario]
			WHERE 
				@ID = Id
	END TRY
	BEGIN CATCH
		PRINT  'Algo salió mal al eliminar beneficiario.'
		RETURN @@ERROR * - 1;
	END CATCH
	SET NOCOUNT OFF;
END 
GO
/****** Object:  StoredProcedure [dbo].[SPExisteBeneficiarioEnDB]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[SPExisteBeneficiarioEnDB]
(
		@pDocumentoIdentidadPersona VARCHAR(50)
			
)

AS 

BEGIN

BEGIN TRY
		DECLARE @pIdPersona INT
		DECLARE @outResultCode INT 
		SET @pIdPersona = 0;
		SET @outResultCode = 0;

		SELECT 
			@pIdPersona = Id 
		FROM 
			[dbo].[Persona] 
		WHERE 
			ValorDocumentoIdentidad = @pDocumentoIdentidadPersona;
		
		IF @pIdPersona = 0
			BEGIN
				PRINT  'No existe'
				SET @outResultCode = 50001;
				SELECT @outResultCode
			
			END
		ELSE
			BEGIN
				PRINT  'Existe'
				SELECT @pIdPersona
			END
	
	END TRY

	BEGIN CATCH
		PRINT  'Algo salió mal al insertar beneficiario.'
		RETURN @@ERROR * - 1;
	END CATCH
	SET NOCOUNT OFF;
END


--SELECT * FROM [dbo].[Persona] 
--DROP PROC  SPExisteBeneficiarioEnDB

EXEC SPExisteBeneficiarioEnDB @pDocumentoIdentidadPersona= 123244567;
GO
/****** Object:  StoredProcedure [dbo].[SPExistePersona]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPExistePersona]
(
	@pValorDocumentoIdentidad INT
)
AS 
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		IF EXISTS 
		(
		SELECT Id 
		FROM [dbo].[Persona] 
		WHERE ValorDocumentoIdentidad = @pValorDocumentoIdentidad
		)

			RETURN CAST(1 AS bit);
		ELSE 
			RETURN CAST(0 AS bit);
	END TRY
	BEGIN CATCH
		PRINT  'Algo salió mal al validar si existe persona.'
		RETURN @@ERROR * - 1;
	END CATCH
	SET NOCOUNT OFF;
END

--SELECT * FROM [dbo].[Persona]
--DROP PROCEDURE SPObtenerBeneficiario;
--GO
--EXEC SPObtenerPersona 20;
GO
/****** Object:  StoredProcedure [dbo].[SPFindIdCA]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  	PROCEDURE [dbo].[SPFindIdCA]
(      
   @pNumeroCuentaDeAhorro	INT 
)      
AS

BEGIN   
	SET NOCOUNT ON;
	BEGIN TRY
	   SELECT 
			 Id

		FROM 
			[dbo].[CuentaAhorro] 

		WHERE 

			NumeroDeCuenta = @pNumeroCuentaDeAhorro
	END TRY
	BEGIN CATCH
		PRINT  'Algo salió mal al buscar cuenta de ahorro.'
		RETURN @@ERROR * - 1;
	END CATCH
	SET NOCOUNT OFF;
	
END


--EXEC [SPObtenerEstadosCuenta] @pIdCuentaDeAhorro = 1
GO
/****** Object:  StoredProcedure [dbo].[SPInsertarBeneficiario]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   PROCEDURE [dbo].[SPInsertarBeneficiario]
		(
			 @pParentezco VARCHAR(100)
			--,@pIdPersona INT
			,@pDocumentoIdentidadPersona VARCHAR(50)
		--	,@pIdTipoParentezco INT
			--,@pIdDeCuentaAhorro INT
			,@pNumeroCuentaAhorro INT
			,@pPorcentaje INT
			-- @pIdTipoParentezco INT
			--,@pIdPersona INT
			--,@pIdDeCuentaAhorro INT
			--,@pPorcentaje INT
			
		)

AS 

BEGIN
	--SET NOCOUNT ON;
	BEGIN TRY
		DECLARE @pIdTipoParentezco INT
		DECLARE @pIdDeCuentaAhorro INT
		DECLARE @pIdPersona INT
		DECLARE @existePersona BIT
		--DECLARE  @pIDCuentaAhorro INT =
		DECLARE @Suma INT;
		DECLARE @Diferencia INT;
		DECLARE @Cantidad INT;
		DECLARE @idBeneficiario INT

		SET @idBeneficiario = 0
		-- Para saber si ya existe o no y si está en activo = 0
		SELECT @idBeneficiario = B.Id FROM [Beneficiario] B
			INNER JOIN Persona P ON IdPersona = P.Id
			INNER JOIN CuentaAhorro CA ON IdCuentaDeAhorro = CA.Id
		WHERE P.ValorDocumentoIdentidad = @pDocumentoIdentidadPersona AND CA.NumeroDeCuenta = @pNumeroCuentaAhorro
			

		SET @pIdPersona = 0
		SELECT 
			@pIdPersona = Id 
		FROM 
			[dbo].[Persona] 
		WHERE 
			ValorDocumentoIdentidad = @pDocumentoIdentidadPersona;
		SELECT 
			@pIdDeCuentaAhorro = Id 
		FROM 
			[dbo].[CuentaAhorro] 
		WHERE 
			NumeroDeCuenta = @pNumeroCuentaAhorro;

		SELECT 
			@pIdTipoParentezco = Id 
		FROM 
			[dbo].[TipoParentezco] 
		WHERE 
			Nombre = @pParentezco;
		SELECT 
			@Cantidad = COUNT(*) 
		FROM 
			[dbo].[Beneficiario] 
		WHERE 
			IdCuentaDeAhorro = @pIdDeCuentaAhorro AND Activo = 1;
		SELECT 
			@Suma = SUM(Porcentaje) 
		FROM 
			[dbo].[Beneficiario] 
		WHERE 
			IdCuentaDeAhorro = @pIdDeCuentaAhorro AND Activo = 1;
		IF @pIdPersona = 0
			BEGIN
				SET @existePersona = 0
				SELECT @existePersona
			
			END
		ELSE
			BEGIN
				SET @existePersona = 1
				SELECT @existePersona
				IF @Suma + @pPorcentaje < 101 AND @Cantidad < 3 
					BEGIN
						IF @idBeneficiario = 0
							BEGIN
							   INSERT 
									INTO [dbo].[Beneficiario]
										(
											 IdTipoParentezco
											,IdPersona
											,IdCuentaDeAhorro
											,Porcentaje
											,Activo
											,InsertAt
											,UpdateAt
											,InsertBy
											,UpdateBy
											,InsertIn
											,UpdateIn
										)

									VALUES(
			
											 @pIdTipoParentezco
											,@pIdPersona
											,@pIdDeCuentaAhorro
											,@pPorcentaje
											,1
											,GETDATE()
											,GETDATE()
											,'DB Admin'
											,'DB Admin'
											,'Costa Rica'
											,'Costa Rica'
										)
		
							END

							ELSE
								BEGIN
									Update 
										[dbo].Beneficiario
									SET		
										  Activo = 1
										 ,Porcentaje = @pPorcentaje
								   WHERE 
										Id = @idBeneficiario
								END
					END
				ELSE
					BEGIN
						PRINT 'SE EXCEDE DEL LÍMITE.'
						PRINT @Suma + @pPorcentaje
						PRINT @Cantidad
					END
			END
			return @existePersona
	END TRY
	BEGIN CATCH
		PRINT  'Algo salió mal al insertar beneficiario.'
		RETURN @@ERROR * - 1;
	END CATCH
	--SET NOCOUNT OFF;
END

--EXEC SPInsertarBeneficiario @pIdTipoParentezco=1,@pIdPersona=1,@pIdDeCuentaAhorro=1,@pPorcentaje=1020;
--SELECT * FROM Beneficiario
--DROP PROCEDURE SPInsertarBeneficiario;
GO
/****** Object:  StoredProcedure [dbo].[SPInsertarBeneficiarioCopia]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPInsertarBeneficiarioCopia]
		(
			 @pIdTipoParentezco INT
			--,@pIdPersona INT
			,@pDocumentoIdentidadPersona VARCHAR(50)
		--	,@pIdTipoParentezco INT
			--,@pIdDeCuentaAhorro INT
			,@pNumeroCuentaAhorro INT
			,@pPorcentaje INT
			-- @pIdTipoParentezco INT
			--,@pIdPersona INT
			--,@pIdDeCuentaAhorro INT
			--,@pPorcentaje INT
			
		)

AS 

BEGIN     
	
	DECLARE @pIdDeCuentaAhorro INT
	DECLARE @pIdPersona INT
	DECLARE @existePersona BIT
	--DECLARE  @pIDCuentaAhorro INT =
	DECLARE @Suma INT;
	DECLARE @Diferencia INT;
	DECLARE @Cantidad INT;
	SET @pIdPersona = 0
	SELECT @pIdPersona = Id FROM [dbo].[Persona] WHERE ValorDocumentoIdentidad = @pDocumentoIdentidadPersona;
	SELECT @pIdDeCuentaAhorro = Id FROM [dbo].[CuentaAhorro] WHERE NumeroDeCuenta = @pNumeroCuentaAhorro;

	SELECT @Cantidad = COUNT(*) FROM [dbo].[Beneficiario] WHERE IdCuentaDeAhorro = @pIdDeCuentaAhorro AND Activo = 1;
	SELECT @Suma = SUM(Porcentaje) FROM [dbo].[Beneficiario] WHERE IdCuentaDeAhorro = @pIdDeCuentaAhorro AND Activo = 1;
	IF @pIdPersona = 0
		BEGIN
			SET @existePersona = 0
			SELECT @existePersona
			
		END
	ELSE
		BEGIN
			SET @existePersona = 1
			SELECT @existePersona
			IF @Suma + @pPorcentaje < 101 AND @Cantidad < 3
				BEGIN
				   INSERT 
						INTO [dbo].[Beneficiario]
							(
								 IdTipoParentezco
								,IdPersona
								,IdCuentaDeAhorro
								,Porcentaje
								,Activo
								,InsertAt
								,UpdateAt
								,InsertBy
								,UpdateBy
								,InsertIn
								,UpdateIn
							)

						VALUES(
			
								 @pIdTipoParentezco
								,@pIdPersona
								,@pIdDeCuentaAhorro
								,@pPorcentaje
								,1
								,GETDATE()
								,GETDATE()
								,'DB Admin'
								,'DB Admin'
								,'Costa Rica'
								,'Costa Rica'
							)
		
				END
			ELSE
				BEGIN
					PRINT 'SE EXCEDE DEL LÍMITE.'
					PRINT @Suma + @pPorcentaje
					PRINT @Cantidad
				END
		END
		return @existePersona
END

--EXEC SPInsertarBeneficiario @pIdTipoParentezco=1,@pIdPersona=1,@pIdDeCuentaAhorro=1,@pPorcentaje=1020;
--SELECT * FROM Beneficiario
--DROP PROCEDURE SPInsertarBeneficiario;
GO
/****** Object:  StoredProcedure [dbo].[SPInsertarBeneficiariosLimite]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   PROCEDURE [dbo].[SPInsertarBeneficiariosLimite]
		@pIdTipoParentezco INT,
		@pValorDocumentoIdentidad INT,
		@pIdDeCuentaAhorro INT,
		@pPorcentaje INT
		
AS

DECLARE  @pIdPersona INT;
SELECT   
	@pIdPersona = [Id] 
FROM 
	[dbo].[Persona] 
AS 
	P 
WHERE  
	P.ValorDocumentoIdentidad = @pValorDocumentoIdentidad;

		BEGIN TRY

		INSERT INTO [dbo].[Beneficiario]
			(
						 IdTipoParentezco
						,IdPersona
						,IdCuentaDeAhorro
						,Porcentaje
						,Activo
						,InsertAt
						,UpdateAt
						,InsertBy
						,UpdateBy
						,InsertIn
						,UpdateIn
			)
				
			 VALUES(
			 @pIdTipoParentezco
			,@pIdPersona
			,@pIdDeCuentaAhorro
			,@pPorcentaje
			,1
			,GETDATE()
			,GETDATE()
			,'DB Admin'
			,'DB Admin'
			,'Costa Rica'
			,'Costa Rica'
		);


	END TRY

	BEGIN CATCH
			PRINT 'ERROR AL INSERTAR DATOS EN LA TABLA Beneficiario.'
			RETURN @@ERROR * - 1;
	END CATCH




--EXEC SPInsertarBeneficiario @pIdTipoParentezco=4,@pValorDocumentoIdentidad=1,@pIdDeCuentaAhorro=1,@pPorcentaje=20;
--SELECT * FROM Persona
--SELECT * FROM Beneficiario
--SELECT * FROM CuentaAhorro
--DROP PROCEDURE SPInsertarBeneficiario;
GO
/****** Object:  StoredProcedure [dbo].[SPInsertarEstadoCuenta]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   PROCEDURE [dbo].[SPInsertarEstadoCuenta]
		 @pIdCuentaDeAhorro INT
		,@pFechaInicio DATE
		,@pFechaFinal DATE
		,@pSaldoInicial MONEY
		,@pSaldoFinal MONEY

AS 
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		INSERT 
		INTO [dbo].[EstadoCuenta]
		(
			 IdCuentaDeAhorro
			,FechaInicio
			,FechaFinal
			,SaldoInicial
			,SaldoFinal
		)

		VALUES(
			 @pIdCuentaDeAhorro
			,@pFechaInicio
			,@pFechaFinal
			,@pSaldoInicial
			,@pSaldoFinal
			);
	END TRY
	BEGIN CATCH
		PRINT  'Algo salió mal al insertar estado de cuenta.'
		RETURN @@ERROR * - 1;
	END CATCH
	SET NOCOUNT OFF;
END

--DROP PROCEDURE SPInsertarEstadoCuenta;
--EXEC SPInsertarEstadoCuenta 1,'2020-11-12','2019-4-12',5000,9000;
GO
/****** Object:  StoredProcedure [dbo].[SPInsertarPersona]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   PROCEDURE [dbo].[SPInsertarPersona]
		 @pIdTipoDocumentoIdentidad INT
		,@pNombre VARCHAR
		,@pValorDocumentoIdentidad INT
		,@pFechaNacimiento DATE
		,@pTelefono1 VARCHAR
		,@pTelefono2 VARCHAR
		,@pCorreoElectronico VARCHAR

AS 
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		INSERT 
		INTO [dbo].[Persona]
						(
							 IdTipoDocumentoIdentidad
							,Nombre
							,ValorDocumentoIdentidad
							,FechaNacimiento
							,Telefono1
							,Telefono2
							,CorreoElectronico
							,InsertAt
							,UpdateAt
							,InsertBy
							,UpdateBy
							,InsertIn
							,UpdateIn
						)

		VALUES(
				 @pIdTipoDocumentoIdentidad
				,@pNombre
				,@pValorDocumentoIdentidad
				,@pFechaNacimiento
				,@pTelefono1
				,@pTelefono2
				,@pCorreoElectronico
				,GETDATE()
				,GETDATE()
				,'DB Admin'
				,'DB Admin'
				,'Costa Rica'
				,'Costa Rica'
			);
	END TRY
	BEGIN CATCH
		PRINT  'Algo salió mal al insertar Persona.'
		RETURN @@ERROR * - 1;
	END CATCH
	SET NOCOUNT OFF;
END

--DROP PROCEDURE SPInsertarPersona;
GO
/****** Object:  StoredProcedure [dbo].[SPInsertarUsuario]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [dbo].[SPInsertarUsuario]
	(
		 @Nombre VARCHAR(100)
		,@Password VARCHAR(100)
		,@TipoUsuario BIT
	)
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		INSERT 
				INTO [dbo].Usuario
					(
						 Nombre
						,Password
						,EsAdministrador
					)
		VALUES 
			(
				 @Nombre
				,@Password
				,@TipoUsuario
			)
	END TRY
	BEGIN CATCH
		PRINT  'Algo salió mal al Insertar Usuario.'
		RETURN @@ERROR * - 1;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SPMostrarCuentas]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   PROCEDURE [dbo].[SPMostrarCuentas]   
AS
BEGIN 
	SET NOCOUNT ON;
	BEGIN TRY
	   SELECT 
			 Id
			,IdTipoCuenta
			,IdPersona
			,NumeroDeCuenta
			,Saldo
			,FechaCreacion
		FROM 
			[dbo].[CuentaAhorro]
	END TRY
	BEGIN CATCH
		PRINT  'Algo salió mal al mostrar cuentas.'
		RETURN @@ERROR * - 1;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SPMostrarCuentasUsuario]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE       PROCEDURE [dbo].[SPMostrarCuentasUsuario]   
(
	@id int
)
AS
BEGIN      
	SET NOCOUNT ON;
	BEGIN TRY
	   SELECT 
			 @id
			,IdTipoCuenta
			,IdPersona
			,NumeroDeCuenta
			,Saldo
			,FechaCreacion
			,U.Nombre
			,TC.Nombre
		
		FROM 
			[dbo].[CuentaAhorro] CA
		INNER JOIN UsuarioPuedeAccesar UPA ON UPA.IdCuentaDeAhorros = CA.Id
		INNER JOIN Usuario U ON UPA.Id = U.id
		INNER JOIN TipoCuentaAhorro TC ON CA.IdTipoCuenta = TC.Id
		WHERE 
			UPA.IdUsuario = @id
	END TRY
	BEGIN CATCH
		PRINT  'Algo salió mal al mostrar cuentas usuario.'
		RETURN @@ERROR * - 1;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SPMostrarUsuarios]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SPMostrarUsuarios]
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		SELECT 
				 ID
				,Nombre
				,Password
				,EsAdministrador
		FROM 
				[dbo].Usuario
	END TRY
	BEGIN CATCH
		PRINT  'Algo salió al mostrar usuarios.'
		RETURN @@ERROR * - 1;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerBeneficiario]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPObtenerBeneficiario]
(
	@Id INT
)
AS 
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		SELECT
			 B.Id
			,B.IdPersona
			,B.IdTipoParentezco
			,B.IdCuentaDeAhorro
			,B.Porcentaje
			,P.Nombre
			,TP.Nombre
			,CA.NumeroDeCuenta
			,P.FechaNacimiento
			,P.Telefono1
			,P.Telefono2
			,P.CorreoElectronico
			,P.ValorDocumentoIdentidad
		FROM [dbo].[Beneficiario] B
		INNER JOIN CuentaAhorro CA ON B.IdCuentaDeAhorro = CA.Id
		INNER JOIN Persona P ON B.IdPersona = P.Id
		INNER JOIN TipoParentezco TP ON B.IdTipoParentezco = TP.Id 
		WHERE  
			B.Id = @Id 
	END TRY
	BEGIN CATCH
		PRINT  'Algo salió mal al obtener beneficiarios.'
		RETURN @@ERROR * - 1;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerBeneficiariosCuenta]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPObtenerBeneficiariosCuenta]
(
	@idCuentaAhorro INT
)
AS 
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		SELECT
			 B.Id
			,B.IdPersona
			,B.IdTipoParentezco
			,B.IdCuentaDeAhorro
			,B.Porcentaje
			,P.Nombre
			,TP.Nombre
			,CA.NumeroDeCuenta
		
		FROM [dbo].[Beneficiario] B
		INNER JOIN CuentaAhorro CA ON B.IdCuentaDeAhorro = CA.Id
		INNER JOIN Persona P ON B.IdPersona = P.Id
		INNER JOIN TipoParentezco TP ON B.IdTipoParentezco = TP.Id 
		WHERE  
			IdCuentaDeAhorro = @idCuentaAhorro AND Activo = 1;
	END TRY
	BEGIN CATCH
		PRINT  'Algo salió mal al obtener beneficiarios por cuenta.'
		RETURN @@ERROR * - 1;
	END CATCH
	SET NOCOUNT OFF;
END

--SELECT * FROM Beneficiario
--SELECT * FROM CuentaAhorro
--SELECT * FROM Persona
--DROP PROCEDURE SPObtenerBeneficiario;
--GO
--EXEC SPObtenerBeneficiariosCuenta 1;
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerCuentasAhorro]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPObtenerCuentasAhorro]
(
	@pIdCuentaDeAhorro INT
)
AS 
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		SELECT 
			 FechaInicio
			,FechaFinal
			,SaldoInicial
			,SaldoFinal

		FROM [dbo].[EstadoCuenta]
		WHERE  
			IdCuentaDeAhorro  = @pIdCuentaDeAhorro;
	END TRY
	BEGIN CATCH
		PRINT  'Algo salió mal al obtener cuentas de ahorro.'
		RETURN @@ERROR * - 1;
	END CATCH
	SET NOCOUNT OFF;
END

--SELECT * FROM Persona
--DROP PROCEDURE SPObtenerBeneficiario;
--GO
--EXEC SPObtenerPersona 20;
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerEstadosCuenta]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE	PROCEDURE [dbo].[SPObtenerEstadosCuenta]
(      
   @pIdCuentaDeAhorro	INT 
)      
AS

BEGIN   
	SET NOCOUNT ON;
	BEGIN TRY
	   SELECT 
		TOP 8
			 EC.Id
			,EC.IdCuentaDeAhorro
			,EC.FechaInicio
			,EC.FechaFinal
			,EC.SaldoInicial
			,EC.SaldoFinal
			,CA.NumeroDeCuenta

		FROM 
			[dbo].[EstadoCuenta] EC
			INNER JOIN CuentaAhorro CA ON EC.IdCuentaDeAhorro = CA.Id
		WHERE 

			IdCuentaDeAhorro=@pIdCuentaDeAhorro  
	
		ORDER BY FechaFinal DESC 
	END TRY
	BEGIN CATCH
		PRINT  'Algo salió mal al obtener estados de cuenta.'
		RETURN @@ERROR * - 1;
	END CATCH
	SET NOCOUNT OFF;
	
END


--EXEC [SPObtenerEstadosCuenta] @pIdCuentaDeAhorro = 1
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerIdCuentaBeneficiario]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SPObtenerIdCuentaBeneficiario]
(
	@Id INT
)
AS 
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		SELECT
			IdCuentaDeAhorro

		FROM [dbo].[Beneficiario]
		WHERE  
			Id = @Id;
	END TRY
	BEGIN CATCH
		PRINT  'Algo salió mal al obtener idCuenta beneficiario.'
		RETURN @@ERROR * - 1;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerPersona]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPObtenerPersona]
(
	@pId INT
)
AS 
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		SELECT 
			 Nombre
			,ValorDocumentoIdentidad
			,FechaNacimiento
			,Telefono1
			,Telefono2
			,CorreoElectronico

		FROM [dbo].[Persona]
		WHERE  
			Id = @pId;
	END TRY
	BEGIN CATCH
		PRINT  'Algo salió mal al obtener persona.'
		RETURN @@ERROR * - 1;
	END CATCH
	SET NOCOUNT OFF;
END

--SELECT * FROM Persona
--DROP PROCEDURE SPObtenerBeneficiario;
--GO
--EXEC SPObtenerPersona 20;
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerTiposParentezco]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE	PROCEDURE [dbo].[SPObtenerTiposParentezco]
     
AS
BEGIN     
	SET NOCOUNT ON;
	BEGIN TRY
	   SELECT 
			 [Id]
			,[Nombre]
		FROM 
			[dbo].[TipoParentezco]
	END TRY
	BEGIN CATCH
		PRINT  'Algo salió mal al obtener tipos de parentezco.'
		RETURN @@ERROR * - 1;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SPRellenar_Tablas]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPRellenar_Tablas]
AS
DECLARE	@return_value int

EXEC    @return_value = [dbo].[SPVaciar_Tablas]
EXEC	@return_value = [dbo].[SPCargar_Catalogos]
EXEC	@return_value = [dbo].[SPCargar_Operaciones]
		

SELECT	'Return Value' = @return_value
GO
/****** Object:  StoredProcedure [dbo].[SPVaciar_Tablas]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     PROCEDURE [dbo].[SPVaciar_Tablas]
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		DELETE FROM  [dbo].[TipoMovimiento]
		DELETE FROM  [dbo].[Beneficiario]
			DBCC CHECKIDENT ('[Beneficiario]', RESEED, 0) --para los identity
		DELETE FROM	 [dbo].[TipoParentezco]
		DELETE FROM  [dbo].[EstadoCuenta]
			DBCC CHECKIDENT ('[EstadoCuenta]', RESEED, 0) --para los identity
		DELETE FROM  [dbo].[UsuarioPuedeAccesar]
			DBCC CHECKIDENT ('[UsuarioPuedeAccesar]', RESEED, 0) --para los identity
		DELETE FROM  [dbo].[CuentaAhorro]
			DBCC CHECKIDENT ('[CuentaAhorro]', RESEED, 0) --para los identity
		DELETE FROM  [dbo].[Persona]
			DBCC CHECKIDENT ('[Persona]', RESEED, 0) --para los identity
		DELETE FROM  [dbo].[TipoDocumentoIdentidad]
		DELETE FROM  [dbo].[TipoMovimientoCuentaObjetivo]
		DELETE FROM  [dbo].[TipoMovimientoCuentaObjetivoInteres]
		DELETE FROM  [dbo].[MovimientoCuentaObjetivo]
			DBCC CHECKIDENT ('[MovimientoCuentaObjetivo]', RESEED, 0) --para los identity
		DELETE FROM  [dbo].[MovimientoCuentaObjetivoInteres]
			DBCC CHECKIDENT ('[MovimientoCuentaObjetivoInteres]', RESEED, 0) --para los identity
		DELETE FROM  [dbo].[CuentaObjetivo]
			DBCC CHECKIDENT ('[CuentaObjetivo]', RESEED, 0) --para los identity
		DELETE FROM  [dbo].[TipoCuentaAhorro]
		DELETE FROM  [dbo].[TipoMoneda]
		DELETE FROM  [dbo].[Usuario]
			DBCC CHECKIDENT ('[Usuario]', RESEED, 0) --para los identity
		DELETE FROM  [dbo].[Movimiento]
			DBCC CHECKIDENT ('[Movimiento]', RESEED, 0) --para los identity
	END TRY
	BEGIN CATCH
		PRINT  'Algo salió mal al limpiar las tablas.'
		RETURN @@ERROR * - 1;
	END CATCH
	SET NOCOUNT OFF;
	

END
GO
/****** Object:  StoredProcedure [dbo].[SPValidarUsuario]    Script Date: 17/11/2020 20:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- SP para verificar usuarios

CREATE  
	PROCEDURE 
		[dbo].[SPValidarUsuario]
			(      
				@Nombre varchar(100),
				@Password varchar(100)
			)      
AS       
BEGIN     
	--SET NOCOUNT ON;
	BEGIN TRY
	   SELECT 
			 Id
			,Nombre
			,Password
			,EsAdministrador 
		FROM 
			[dbo].Usuario 
		WHERE 
				Nombre=@Nombre 
			AND 
				Password=@Password 
	END TRY
	BEGIN CATCH
		PRINT  'Algo salió mal al validar al usuario.'
		RETURN @@ERROR * - 1;
	END CATCH
	--SET NOCOUNT OFF;
END
GO
