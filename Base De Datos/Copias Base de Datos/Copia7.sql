USE [master]
GO
/****** Object:  Database [BD_TP1_Cuenta_De_Ahorros]    Script Date: 18/1/2021 17:19:40 ******/
CREATE DATABASE [BD_TP1_Cuenta_De_Ahorros]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BD_TP1_Cuenta_De_Ahorros', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BD_TP1_Cuenta_De_Ahorros.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BD_TP1_Cuenta_De_Ahorros_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BD_TP1_Cuenta_De_Ahorros_log.ldf' , SIZE = 270336KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BD_TP1_Cuenta_De_Ahorros] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BD_TP1_Cuenta_De_Ahorros].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BD_TP1_Cuenta_De_Ahorros] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BD_TP1_Cuenta_De_Ahorros] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BD_TP1_Cuenta_De_Ahorros] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BD_TP1_Cuenta_De_Ahorros] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BD_TP1_Cuenta_De_Ahorros] SET ARITHABORT OFF 
GO
ALTER DATABASE [BD_TP1_Cuenta_De_Ahorros] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BD_TP1_Cuenta_De_Ahorros] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BD_TP1_Cuenta_De_Ahorros] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BD_TP1_Cuenta_De_Ahorros] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BD_TP1_Cuenta_De_Ahorros] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BD_TP1_Cuenta_De_Ahorros] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BD_TP1_Cuenta_De_Ahorros] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BD_TP1_Cuenta_De_Ahorros] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BD_TP1_Cuenta_De_Ahorros] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BD_TP1_Cuenta_De_Ahorros] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BD_TP1_Cuenta_De_Ahorros] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BD_TP1_Cuenta_De_Ahorros] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BD_TP1_Cuenta_De_Ahorros] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BD_TP1_Cuenta_De_Ahorros] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BD_TP1_Cuenta_De_Ahorros] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BD_TP1_Cuenta_De_Ahorros] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BD_TP1_Cuenta_De_Ahorros] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BD_TP1_Cuenta_De_Ahorros] SET RECOVERY FULL 
GO
ALTER DATABASE [BD_TP1_Cuenta_De_Ahorros] SET  MULTI_USER 
GO
ALTER DATABASE [BD_TP1_Cuenta_De_Ahorros] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BD_TP1_Cuenta_De_Ahorros] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BD_TP1_Cuenta_De_Ahorros] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BD_TP1_Cuenta_De_Ahorros] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BD_TP1_Cuenta_De_Ahorros] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BD_TP1_Cuenta_De_Ahorros', N'ON'
GO
ALTER DATABASE [BD_TP1_Cuenta_De_Ahorros] SET QUERY_STORE = OFF
GO
USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  UserDefinedTableType [dbo].[CuentaAhorroPerTrigger]    Script Date: 18/1/2021 17:19:40 ******/
CREATE TYPE [dbo].[CuentaAhorroPerTrigger] AS TABLE(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idPersona] [int] NULL,
	[idTipoCuenta] [int] NULL,
	[numeroCuenta] [int] NULL,
	[fechaCreacion] [date] NULL,
	[saldo] [money] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TableMovimiento]    Script Date: 18/1/2021 17:19:40 ******/
CREATE TYPE [dbo].[TableMovimiento] AS TABLE(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idTipoMovimiento] [int] NULL,
	[numeroCuenta] [int] NULL,
	[monto] [money] NULL,
	[fecha] [date] NULL,
	[descripcion] [varchar](100) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TableMovimientos]    Script Date: 18/1/2021 17:19:40 ******/
CREATE TYPE [dbo].[TableMovimientos] AS TABLE(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idTipoMovimiento] [int] NULL,
	[numeroCuenta] [int] NULL,
	[monto] [money] NULL,
	[fecha] [date] NULL,
	[descripcion] [varchar](100) NULL
)
GO
/****** Object:  Table [dbo].[Beneficiario]    Script Date: 18/1/2021 17:19:40 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CuentaAhorro]    Script Date: 18/1/2021 17:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuentaAhorro](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPersona] [int] NOT NULL,
	[IdTipoCuenta] [int] NOT NULL,
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
	[CantidadRetirosHumano] [int] NULL,
	[CantidadRetirosAutomatico] [int] NULL,
 CONSTRAINT [PK_CuentaAhorro] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CuentaObjetivo]    Script Date: 18/1/2021 17:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuentaObjetivo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCuentaAhorro] [int] NULL,
	[NumeroCuentaObjetivo] [int] NOT NULL,
	[FechaInicio] [date] NULL,
	[FechaFinal] [date] NULL,
	[Objetivo] [varchar](100) NULL,
	[Saldo] [money] NULL,
	[DiaDeAhorro] [int] NULL,
	[InteresAcumulado] [money] NULL,
	[Activo] [bit] NULL,
	[InsertAt] [datetime] NULL,
	[UpdateAt] [datetime] NULL,
	[InsertBy] [varchar](50) NULL,
	[UpdateBy] [varchar](50) NULL,
	[InsertIn] [varchar](50) NULL,
	[UpdateIn] [varchar](50) NULL,
 CONSTRAINT [PK_CuentaObjetivo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 18/1/2021 17:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLog](
	[ErrorLogID] [int] IDENTITY(1,1) NOT NULL,
	[CodigoDeError] [int] NULL,
	[ErrorTime] [datetime] NULL,
	[UserName] [varchar](50) NOT NULL,
	[ErrorNumber] [int] NOT NULL,
	[ErrorSeverity] [int] NULL,
	[ErrorState] [int] NULL,
	[ErrorProcedure] [nvarchar](100) NULL,
	[ErrorLine] [int] NULL,
	[ErrorMessege] [nvarchar](2000) NOT NULL,
 CONSTRAINT [PK_ErrorLog] PRIMARY KEY CLUSTERED 
(
	[ErrorLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoCuenta]    Script Date: 18/1/2021 17:19:40 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movimiento]    Script Date: 18/1/2021 17:19:40 ******/
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
 CONSTRAINT [PK_Movimiento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovimientoCuentaObjetivo]    Script Date: 18/1/2021 17:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovimientoCuentaObjetivo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCuentaObjetivo] [int] NOT NULL,
	[IdTipoMovimientoCuentaObjetivo] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Monto] [money] NOT NULL,
	[NuevoSaldo] [money] NOT NULL,
	[Descripcion] [varchar](150) NOT NULL,
 CONSTRAINT [PK_MovimientoCuentaObjetivo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovimientoCuentaObjetivoInteres]    Script Date: 18/1/2021 17:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovimientoCuentaObjetivoInteres](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCuentaObjetivo] [int] NOT NULL,
	[IdTipoMovimientoCuentaObjetivoInteres] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Monto] [money] NOT NULL,
	[NuevoInteresAcumulado] [money] NOT NULL,
	[Descripcion] [varchar](150) NOT NULL,
 CONSTRAINT [PK_MovimientoCuentaObjetivoInteres] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 18/1/2021 17:19:40 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoCuentaAhorro]    Script Date: 18/1/2021 17:19:40 ******/
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
	[ComisionPorServicio] [money] NULL,
	[Interes] [int] NOT NULL,
 CONSTRAINT [PK_TipoCuentaAhorro] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDocumentoIdentidad]    Script Date: 18/1/2021 17:19:40 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMoneda]    Script Date: 18/1/2021 17:19:40 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMovimiento]    Script Date: 18/1/2021 17:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMovimiento](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoMovimiento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMovimientoCuentaObjetivo]    Script Date: 18/1/2021 17:19:40 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMovimientoCuentaObjetivoInteres]    Script Date: 18/1/2021 17:19:40 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoParentezco]    Script Date: 18/1/2021 17:19:40 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 18/1/2021 17:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[EsAdministrador] [bit] NOT NULL,
	[Email] [varchar](50) NULL,
	[ValorDocumentoIdentidad] [int] NULL,
	[InsertAt] [datetime] NULL,
	[UpdateAt] [datetime] NULL,
	[InsertBy] [varchar](50) NULL,
	[UpdateBy] [varchar](50) NULL,
	[InsertIn] [varchar](50) NULL,
	[UpdateIn] [varchar](50) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioPuedeAccesar]    Script Date: 18/1/2021 17:19:40 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
ALTER TABLE [dbo].[CuentaObjetivo]  WITH CHECK ADD  CONSTRAINT [FK_CuentaObjetivo_CuentaAhorro] FOREIGN KEY([IdCuentaAhorro])
REFERENCES [dbo].[CuentaAhorro] ([Id])
GO
ALTER TABLE [dbo].[CuentaObjetivo] CHECK CONSTRAINT [FK_CuentaObjetivo_CuentaAhorro]
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
ALTER TABLE [dbo].[MovimientoCuentaObjetivo]  WITH CHECK ADD  CONSTRAINT [FK_MovimientoCuentaObjetivo_CuentaObjetivo] FOREIGN KEY([IdCuentaObjetivo])
REFERENCES [dbo].[CuentaObjetivo] ([Id])
GO
ALTER TABLE [dbo].[MovimientoCuentaObjetivo] CHECK CONSTRAINT [FK_MovimientoCuentaObjetivo_CuentaObjetivo]
GO
ALTER TABLE [dbo].[MovimientoCuentaObjetivo]  WITH CHECK ADD  CONSTRAINT [FK_MovimientoCuentaObjetivo_TipoMovimientoCuentaObjetivo] FOREIGN KEY([IdTipoMovimientoCuentaObjetivo])
REFERENCES [dbo].[TipoMovimientoCuentaObjetivo] ([Id])
GO
ALTER TABLE [dbo].[MovimientoCuentaObjetivo] CHECK CONSTRAINT [FK_MovimientoCuentaObjetivo_TipoMovimientoCuentaObjetivo]
GO
ALTER TABLE [dbo].[MovimientoCuentaObjetivoInteres]  WITH CHECK ADD  CONSTRAINT [FK_MovimientoCuentaObjetivoInteres_CuentaObjetivo] FOREIGN KEY([IdCuentaObjetivo])
REFERENCES [dbo].[CuentaObjetivo] ([Id])
GO
ALTER TABLE [dbo].[MovimientoCuentaObjetivoInteres] CHECK CONSTRAINT [FK_MovimientoCuentaObjetivoInteres_CuentaObjetivo]
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
/****** Object:  StoredProcedure [dbo].[SPActualizarBeneficiario]    Script Date: 18/1/2021 17:19:40 ******/
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
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50000, @Descripcion = 'Problemas al actualizar Beneficiario'
		--PRINT  'Algo salió mal al actualizar el beneficiario.'
		--RETURN @@ERROR;
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
/****** Object:  StoredProcedure [dbo].[SPActualizarCuentaObjetivo]    Script Date: 18/1/2021 17:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE   PROCEDURE [dbo].[SPActualizarCuentaObjetivo]
	(
	   	 @pIdCuentaObjetivo INT
		,@pNumeroCuentaAhorro INT
		,@pObjetivo VARCHAR(100)
		
		,@pSaldo MONEY
		--,@pInteresAcumulado MONEY
		,@pFechaFinal DATE
		,@pDiaDeAhorro INT
	)
AS 
BEGIN    
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN TRANSACTION
			   Update 
					[dbo].[CuentaObjetivo]
			   SET		

					 Objetivo = @pObjetivo
					,Saldo = @pSaldo
					,FechaFinal = @pFechaFinal
					,DiaDeAhorro = @pDiaDeAhorro
					--,InteresAcumulado = @pInteresAcumulado
					,UpdateBy = 'DESKTOP-FBGDAQE'
					,UpdateIn = 'DESKTOP-FBGDAQE'
					,UpdateAt = GETDATE()

			   WHERE 
					ID = @pIdCuentaObjetivo 
		COMMIT TRANSACTION

	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50001, @Descripcion = 'Problemas al actualizar CuentaObjetivo'
		--PRINT  'Algo salió mal al actualizar CO.'
		--RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;



END



	
GO
/****** Object:  StoredProcedure [dbo].[SPActualizarEstadoCuenta]    Script Date: 18/1/2021 17:19:40 ******/
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
		BEGIN TRANSACTION
		   Update 
				[dbo].[EstadoCuenta]
		   SET 
				 FechaFinal = @pFechaFinal
				,SaldoFinal = @pSaldoFinal

		   WHERE 
				Id=@pId   
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50002, @Descripcion = 'Problemas al actualizar EstadoCuenta'
		--PRINT  'Algo salió mal con el SP de actualizar estado de cuenta.'
		--RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
END


--EXEC SPActualizarEstadoCuenta 2020-11-12,145000000;
--SELECT * FROM [dbo].[EstadoCuenta]
--DROP PROCEDURE SPActualizarEstadoCuenta;
GO
/****** Object:  StoredProcedure [dbo].[SPActualizarPersona]    Script Date: 18/1/2021 17:19:40 ******/
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
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50003, @Descripcion = 'Problemas al actualizar Persona'
		--PRINT 'No se actualizó'
	END CATCH

	SET NOCOUNT OFF
END

--EXEC SPActualizarPersona @pIdPersona=2,@pNombre='Osvaldo Aguero Hernandez',@pValorDocumentoIdentidad='12738545',@pFechaNacimiento = '1994-10-24',@pTelefono1='3',@pTelefono2='3',@pCorreoElectronico='osadage@gmail.com';
--SELECT *
--FROM 
--	[dbo].Persona
--WHERE id = 2
GO
/****** Object:  StoredProcedure [dbo].[SPBuscarCuentaAhorro]    Script Date: 18/1/2021 17:19:40 ******/
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
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50004, @Descripcion = 'Problemas al Buscar cuenta de Ahorro'
		--PRINT  'Algo salió mal con buscar cuenta de ahorro.'
		--RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SPBuscarEstadoCuenta]    Script Date: 18/1/2021 17:19:40 ******/
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
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50005, @Descripcion = 'Problemas al BuscarEstadoCuenta'
		--PRINT  'Algo salió mal con buscar estado de cuenta.'
		--RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SPBuscarPersona]    Script Date: 18/1/2021 17:19:40 ******/
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
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50006, @Descripcion = 'Problemas al BuscarPersona'
		--PRINT  'Algo salió mal al buscar persona.'
		--RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SPBuscarUsuario]    Script Date: 18/1/2021 17:19:40 ******/
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
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50007, @Descripcion = 'Problemas al BuscarUsuario'
		--PRINT  'Algo salió mal al buscar usuario.'
		--RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SPCargar_Catalogos]    Script Date: 18/1/2021 17:19:40 ******/
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
				--OPENROWSET(BULK 'D:\S3\bucket-xml\PruebaCatalogo.xml', SINGLE_BLOB) AS DocumentoXML(DXML);  
				--OPENROWSET(BULK 'C:\Users\ulirp\Desktop\BAses\Base_De_Datos_Progra_1\Base De Datos\XML\Datos_Tarea_2_CatalogosPR2.xml', SINGLE_BLOB) AS DocumentoXML(DXML);
				OPENROWSET(BULK 'C:\Users\ulirp\Desktop\BAses\Base_De_Datos_Progra_1\Base De Datos\XML\Datos-Tarea3-Catalogos.xml', SINGLE_BLOB) AS DocumentoXML(DXML);
	END TRY

	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50008, @Descripcion = 'Problemas al parsear XML (SPCargar_Catalogo)'
			--PRINT 'Problemas al cargar el xml Seccion Catalogo'
			--RETURN @@ERROR;
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
					@DocumentoXML.nodes('/TipoDoc/TipoDocuIdentidad') AS t(d)
	END TRY

	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50009, @Descripcion = 'ERROR AL INSERTAR DATOS EN LA TABLA [TipoDocumentoIdentidad] (SPCargar_Catalogo)'
			--PRINT  'ERROR AL INSERTAR DATOS EN LA TABLA [TipoDocumentoIdentidad].'
			--RETURN @@ERROR;
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
					@DocumentoXML.nodes('/TipoMoneda/TipoMoneda') AS t(d)
	END TRY

	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50010, @Descripcion = 'ERROR AL INSERTAR DATOS EN LA TABLA [TipoMoneda] (SPCargar_Catalogo)'
			--PRINT  'ERROR AL INSERTAR DATOS EN LA TABLA [TipoMoneda].'
			--RETURN @@ERROR;
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
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50011, @Descripcion = 'ERROR AL INSERTAR DATOS EN LA TABLA [TipoParentezco] (SPCargar_Catalogo)'
			--PRINT  'ERROR AL INSERTAR DATOS EN LA TABLA [TipoParentezco].'
			--RETURN @@ERROR;
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
													--,[ComisionPorServicio]
													,[Interes]
												)
				SELECT	
						  d.value('@Id', 'INT')
						, d.value('@Nombre', 'VARCHAR(100)')
						, d.value('@IdTipoMoneda', 'INT')
						, d.value('@SaldoMinimo', 'MONEY')
						, d.value('@MultaSaldoMin', 'MONEY')
						, d.value('@CargoMensual', 'MONEY')
						, d.value('@NumRetiroHumano', 'INT')
						, d.value('@NumRetirosAutomatico', 'INT')
						, d.value('@ComisionHumano', 'MONEY')
						, d.value('@ComisionAutomatico', 'MONEY')
						--, d.value('@ComisionServicio', 'MONEY')
						, d.value('@Interes', 'INT')
				FROM 
						@DocumentoXML.nodes('/Tipo_Cuenta_Ahorro/TipoCuentaAhorro') AS t(d)
	END TRY

	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50012, @Descripcion = 'ERROR AL INSERTAR DATOS EN LA TABLA [TipoCuentaAhorro] (SPCargar_Catalogo)'
			--PRINT  'ERROR AL INSERTAR DATOS EN LA TABLA [TipoCuentaAhorro].'
			--RETURN @@ERROR;
	END CATCH


	BEGIN TRY
				INSERT INTO [dbo].[TipoMovimiento](
													 [Id]
													,[Nombre]
													,[Tipo]

												)
				SELECT	
						  d.value('@Id', 'INT')
						, d.value('@Nombre', 'VARCHAR(100)')
						, d.value('@Tipo', 'VARCHAR(50)')

				FROM 
						@DocumentoXML.nodes('/TipoMovimientos/TipoMovimiento') AS t(d)
	END TRY

	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50013, @Descripcion = 'ERROR AL INSERTAR DATOS EN LA TABLA [TipoMovimiento] (SPCargar_Catalogo)'
			--PRINT  'ERROR AL INSERTAR DATOS EN LA TABLA [TipoMovimiento].'
			--RETURN @@ERROR;
	END CATCH

	BEGIN TRY
				INSERT INTO [dbo].[TipoMovimientoCuentaObjetivo](
													 [Id]
													,[Nombre]
	

												)
				SELECT	
						  d.value('@Id', 'INT')
						, d.value('@Nombre', 'VARCHAR(100)')


				FROM 
						@DocumentoXML.nodes('/TiposMovimientoCuentaAhorro/Tipo_Movimiento') AS t(d)
	END TRY

	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50104, @Descripcion = 'ERROR AL INSERTAR DATOS EN LA TABLA [TipoMovimientoCuentaObjetivo] (SPCargar_Catalogo)'
			--PRINT  'ERROR AL INSERTAR DATOS EN LA TABLA [TipoMovimiento].'
			--RETURN @@ERROR;
	END CATCH


		BEGIN TRY
				INSERT INTO [dbo].[TipoMovimientoCuentaObjetivoInteres](
													 [Id]
													,[Nombre]
	

												)
				SELECT	
						  d.value('@Id', 'INT')
						, d.value('@Nombre', 'VARCHAR(100)')


				FROM 
						@DocumentoXML.nodes('/TiposMovimientoCuentaAhorro/Tipo_Movimiento') AS t(d)
	END TRY

	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50104, @Descripcion = 'ERROR AL INSERTAR DATOS EN LA TABLA [TipoMovimientoCuentaObjetivoInteres] (SPCargar_Catalogo)'
			--PRINT  'ERROR AL INSERTAR DATOS EN LA TABLA [TipoMovimiento].'
			--RETURN @@ERROR;
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
/****** Object:  StoredProcedure [dbo].[SPCargar_Operaciones]    Script Date: 18/1/2021 17:19:40 ******/
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
			--OPENROWSET(BULK 'D:\S3\bucket-xml\PruebaOperaciones.xml', SINGLE_BLOB) AS DocumentoXML(DXML);
			OPENROWSET(BULK 'C:\Users\ulirp\Desktop\BAses\Base_De_Datos_Progra_1\Base De Datos\XML\PruebaOperaciones.xml', SINGLE_BLOB) AS DocumentoXML(DXML);
	
		SELECT 
				@DocumentoXML
	END TRY

	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50014, @Descripcion = 'ERROR Al Parsear el XML (SPCargar_Operaciones)'
			--PRINT 'ERROR AL PARSEAR EL XML.'
			--RETURN @@ERROR;
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
		SELECT	DISTINCT
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
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50015, @Descripcion = 'ERROR AL INSERTAR DATOS EN LA TABLA [Persona] (SPCargar_Operaciones)'
			--PRINT 'ERROR AL INSERTAR DATOS EN LA TABLA [Persona].'
			--RETURN @@ERROR;
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
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50016, @Descripcion = 'ERROR AL INSERTAR DATOS EN LA TABLA [CuentaAhorro] (SPCargar_Operaciones)'
			--PRINT 'ERROR AL INSERTAR DATOS EN LA TABLA [CuentaAhorro].'
			--RETURN @@ERROR;
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
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50017, @Descripcion = 'ERROR AL INSERTAR DATOS EN LA TABLA [Beneficiario] (SPCargar_Operaciones)'
			--PRINT 'ERROR AL INSERTAR DATOS EN LA TABLA [Beneficiario].'
			--RETURN @@ERROR;
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
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50018, @Descripcion = 'ERROR AL INSERTAR DATOS EN LA TABLA [EstadoCuenta] (SPCargar_Operaciones)'
			--PRINT 'ERROR AL INSERTAR DATOS EN LA TABLA [EstadoCeunta].'
			--RETURN @@ERROR;
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
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50019, @Descripcion = 'ERROR AL INSERTAR DATOS EN LA TABLA [Usuario] (SPCargar_Operaciones)'
			--PRINT 'ERROR AL INSERTAR DATOS EN LA TABLA [Usuario].'
			--RETURN @@ERROR;
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
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50020, @Descripcion = 'ERROR AL INSERTAR DATOS EN LA TABLA [UsuarioPuedeAccesar] (SPCargar_Operaciones)'
			--PRINT 'ERROR AL INSERTAR DATOS EN LA TABLA [UsuarioPuedeAccesar].'
			--RETURN @@ERROR;
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
/****** Object:  StoredProcedure [dbo].[SPCargar_Operaciones_Usuarios]    Script Date: 18/1/2021 17:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     PROCEDURE [dbo].[SPCargar_Operaciones_Usuarios]
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
			--OPENROWSET(BULK 'D:\S3\bucket-xml\PruebaOperaciones.xml', SINGLE_BLOB) AS DocumentoXML(DXML);
			OPENROWSET(BULK 'C:\Users\ulirp\Desktop\BAses\Base_De_Datos_Progra_1\Base De Datos\XML\PruebaOperacionesUsuarios.xml', SINGLE_BLOB) AS DocumentoXML(DXML);
	
		SELECT 
				@DocumentoXML
	END TRY

	BEGIN CATCH
			PRINT 'ERROR AL PARSEAR EL XML.'
			--RETURN @@ERROR;
	END CATCH



	--BEGIN TRY
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
	--END TRY

	--BEGIN CATCH
	--		PRINT 'ERROR AL INSERTAR DATOS EN LA TABLA [Usuario].'
	--		RETURN @@ERROR;
	--END CATCH



	--BEGIN TRY		
		INSERT INTO [dbo].[UsuarioPuedeAccesar]
											(
												 [IdUsuario]
												,[IdCuentaDeAhorros]
												,[Activo]

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
					) AS [IdCuentaDeAhorros]
				, 1 AS [Activo]
			
		FROM 
				@DocumentoXML.nodes('/Usuarios_Ver/UsuarioPuedeVer') AS t(d)
			PRINT(d.value('@NumeroCuenta', 'INT'))
	--END TRY

	--BEGIN CATCH
	--		PRINT 'ERROR AL INSERTAR DATOS EN LA TABLA [UsuarioPuedeAccesar].'
	--		RETURN @@ERROR;
	--END CATCH
	--DELETE FROM Usuario
	
END
GO
/****** Object:  StoredProcedure [dbo].[SPCrearCuentaObjetivo]    Script Date: 18/1/2021 17:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[SPCrearCuentaObjetivo]    Script Date: 28/11/2020 12:56:42 ******/



CREATE       PROCEDURE [dbo].[SPCrearCuentaObjetivo]
		(
			 @pNumeroCuentaAhorro INT
			,@pNumeroCuentaObjetivo INT
			,@pObjetivo VARCHAR (100)
			,@pSaldo MONEY
			--,@pInteresAcumulado MONEY
			,@pFechaFinal DATE
			,@pDiaDeAhorro INT
		)

AS 

BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		DECLARE @pIdDeCuentaAhorro INT

		DECLARE @idCuentaObjetivo INT
		SET @idCuentaObjetivo = 0


		--Obtenenemos id de la cuenta AHorro gracias al número de cuenta.
		SELECT 
			@pIdDeCuentaAhorro = Id 
		FROM 
			[dbo].[CuentaAhorro] 
		WHERE 
			NumeroDeCuenta = @pNumeroCuentaAhorro;


		---- Para saber si ya existe o no y si está en activo = 0
		--SELECT 
		--	@idCuentaObjetivo = CO.Id
		--FROM 
		--	[CuentaObjetivo] CO
		--	INNER JOIN CuentaAhorro CA ON IdCuentaAhorro = CA.Id
		--WHERE 
		--	CO.IdCuentaAhorro = @pIdDeCuentaAhorro 
		SELECT 
			@idCuentaObjetivo = CO.Id
		FROM
			[CuentaObjetivo] CO
			INNER JOIN CuentaAhorro CA ON IdCuentaAhorro = CA.Id
		WHERE
			CO.NumeroCuentaObjetivo = @pNumeroCuentaObjetivo AND CA.Id = CO.IdCuentaAhorro
		--PENDIENTE -> Chequear validacion del número de cuenta principal.


		IF @idCuentaObjetivo = 0
			BEGIN
				INSERT 
					INTO [dbo].[CuentaObjetivo]
						(
							 IdCuentaAhorro
							,[NumeroCuentaObjetivo]
							,FechaInicio
							,FechaFinal
							,Objetivo
							,Saldo
							,DiaDeAhorro
							--,InteresAcumulado
							,Activo
							,InsertAt
							,UpdateAt
							,InsertBy
							,UpdateBy
							,InsertIn
							,UpdateIn
						)

					VALUES(
			
							 @pIdDeCuentaAhorro
							,@pNumeroCuentaObjetivo
							,GETDATE()
							,@pFechaFinal
							,@pObjetivo
							,@pSaldo
							,@pDiaDeAhorro
							--,@pInteresAcumulado
							,1
							,GETDATE()
							,null
							,'DESKTOP-FBGDAQE\ulirp'
							,''
							,'DESKTOP-FBGDAQE\ulirp'
							,''
						)
		
			END

			ELSE
				BEGIN
					BEGIN TRANSACTION
					Update 
						[dbo].[CuentaObjetivo]
					SET		
							 Activo = 1
							,Saldo = @pSaldo
							--,InteresAcumulado = @pInteresAcumulado
							,Objetivo = @pObjetivo
							,FechaInicio = GETDATE()
							,FechaFinal = @pFechaFinal
							,DiaDeAhorro = @pDiaDeAhorro
							
					WHERE 
						Id = @idCuentaObjetivo
					COMMIT TRANSACTION
				END
					
			
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50021, @Descripcion = 'ERROR AL CREAR CUENTA OBJETIVO (SPCrearCuentaObjetivo)'
		--PRINT  'Algo salió mal al insertar Cuenta Objetivo.'
		--RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
END

--EXEC SPCrearCuentaObjetivo @pNumeroCuentaAhorro = 11435357,@pNumeroCuentaObjetivo = 55,@pObjetivo = '5',@pSaldo = 5, @pFechaFinal = '12-10-2025', @pDiaDeAhorro = 5;
--EXEC [SPCrearCuentaObjetivo] @pNumeroCuentaAhorro = 11013939,@pObjetivo = 'PRUEBA',@pSaldo = 5000,@pInteresAcumulado = 200
--SELECT * FROM ErrorLog
GO
/****** Object:  StoredProcedure [dbo].[SPDescargar_XMLS]    Script Date: 18/1/2021 17:19:40 ******/
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
/****** Object:  StoredProcedure [dbo].[SPEditarUsuario]    Script Date: 18/1/2021 17:19:40 ******/
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
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SPEliminarBeneficiario]    Script Date: 18/1/2021 17:19:40 ******/
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
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50022, @Descripcion = 'ERROR AL Eliminar Beneficiario ([dbo].[SPEliminarBeneficiario])'
		--PRINT  'Algo salió mal al eliminar beneficiario.'
		RETURN @@ERROR ;
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
/****** Object:  StoredProcedure [dbo].[SPEliminarCuentaObjetivo]    Script Date: 18/1/2021 17:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE    PROCEDURE [dbo].[SPEliminarCuentaObjetivo]
(
	@pIdCuentaObjetivo INT
)

AS 
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		DELETE FROM 
				[dbo].[CuentaObjetivo]
		WHERE  
				Id = @pIdCuentaObjetivo;  
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50023, @Descripcion = 'ERROR AL Eliminar CuentaObjetivo ([dbo].[SPEliminarCuentaObjetivo])'
		--PRINT  'Algo salió mal al eliminar CO.'
		RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
END


GO
/****** Object:  StoredProcedure [dbo].[SPEliminarCuentaObjetivoLog]    Script Date: 18/1/2021 17:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE      PROCEDURE [dbo].[SPEliminarCuentaObjetivoLog]
(
	@pIdCuentaObjetivo INT
)

AS  
BEGIN  
	SET NOCOUNT ON;
	BEGIN TRY
	   UPDATE 
			[dbo].[CuentaObjetivo]
	   SET 
			  Activo = 0
			 ,FechaFinal = GETDATE()
	   WHERE 
			Id = @pIdCuentaObjetivo    
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50024, @Descripcion = 'ERROR AL Eliminar CuentaObjetivoLogico ([dbo].[SPEliminarCuentaObjetivoLog])'
		--PRINT  'Algo salió mal al eliminar CO.'
		RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SPEliminarLogicoBeneficiario]    Script Date: 18/1/2021 17:19:40 ******/
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
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50025, @Descripcion = 'ERROR AL Eliminar Log Beneficiario ([dbo].[SPEliminarLogicoBeneficiario])'
		--PRINT  'Algo salió mal al eliminar beneficiario.'
		RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SPEliminarUsuario]    Script Date: 18/1/2021 17:19:40 ******/
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
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END 
GO
/****** Object:  StoredProcedure [dbo].[SPExisteBeneficiarioEnDB]    Script Date: 18/1/2021 17:19:40 ******/
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
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50026, @Descripcion = 'Error al verificar Beneficiario ([dbo].[SPExisteBeneficiarioEnDB])'
		PRINT  'Algo salió mal al insertar beneficiario.'
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END


--SELECT * FROM [dbo].[Persona] 
--DROP PROC  SPExisteBeneficiarioEnDB

--EXEC SPExisteBeneficiarioEnDB @pDocumentoIdentidadPersona= 123244567;
GO
/****** Object:  StoredProcedure [dbo].[SPExistePersona]    Script Date: 18/1/2021 17:19:40 ******/
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
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50027, @Descripcion = 'ERROR al verificar Persona ([dbo].[SPExistePersona])'
		PRINT  'Algo salió mal al validar si existe persona.'
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END

--SELECT * FROM [dbo].[Persona]
--DROP PROCEDURE SPObtenerBeneficiario;
--GO
--EXEC SPObtenerPersona 20;
GO
/****** Object:  StoredProcedure [dbo].[SPFindIdCA]    Script Date: 18/1/2021 17:19:40 ******/
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
		PRINT @pNumeroCuentaDeAhorro
		DECLARE @error INT 
		
		SELECT @error = Id FROM CuentaAhorro WHERE NumeroDeCuenta = @pNumeroCuentaDeAhorro
		PRINT(@error)
	   SELECT 
			 Id

		FROM 
			[dbo].[CuentaAhorro] 

		WHERE 

			NumeroDeCuenta = @pNumeroCuentaDeAhorro;
		PRINT 23
		IF @error = NULL
			SET @error = @error/@error
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50028, @Descripcion = 'ERROR AL buscar idCA ([dbo].[SPFindIdCA])'
		PRINT  'Algo salió mal al buscar cuenta de ahorro.'
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
	
END


--EXEC [SPObtenerEstadosCuenta] @pIdCuentaDeAhorro = 1
--PRINT(EXEC [dbo].[SPFindIdCA] @pNumeroCuentaDeAhorro = 1)
GO
/****** Object:  StoredProcedure [dbo].[SPIniciarSimulacion]    Script Date: 18/1/2021 17:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SPIniciarSimulacion]
AS
DECLARE	@return_value int
BEGIN TRY
	EXEC    @return_value = [dbo].[SPVaciar_Tablas]
	EXEC	@return_value = [dbo].[SPCargar_Catalogos]
	EXEC    @return_value = [dbo].[SPVerTablaErrores]
	EXEC    @return_value = [dbo].[SPSimulacion]
	
	--EXEC	@return_value = [dbo].SPCargar_Operaciones
	--EXEC	@return_value = [dbo].[SPCargar_Operaciones_Usuarios]

		

SELECT	'Return Value' = @return_value

END TRY
BEGIN CATCH
	EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50029, @Descripcion = 'ERROR AL Iniciar simulación ([dbo].[SPIniciarSimulacion])'
	PRINT('ERROR AL INICIAR LA SIMULACIÓN')
END CATCH
--SELECT * FROM Persona
--SELECT * FROM CuentaAhorro
--SELECT * FROM Beneficiario
--SELECT * FROM Movimiento

  --DELETE FROM Persona
  --DELETE FROM CuentaAhorro
  --DELETE FROM Beneficiario
GO
/****** Object:  StoredProcedure [dbo].[SPInsertarBeneficiario]    Script Date: 18/1/2021 17:19:40 ******/
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
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50030, @Descripcion = 'ERROR AL insertar beneficiario ([dbo].[SPInsertarBeneficiario])'
		PRINT  'Algo salió mal al insertar beneficiario.'
		RETURN @@ERROR ;
	END CATCH
	--SET NOCOUNT OFF;
END

--EXEC SPInsertarBeneficiario @pIdTipoParentezco=1,@pIdPersona=1,@pIdDeCuentaAhorro=1,@pPorcentaje=1020;
--SELECT * FROM Beneficiario
--DROP PROCEDURE SPInsertarBeneficiario;
GO
/****** Object:  StoredProcedure [dbo].[SPInsertarBeneficiarioCopia]    Script Date: 18/1/2021 17:19:40 ******/
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
/****** Object:  StoredProcedure [dbo].[SPInsertarBeneficiariosLimite]    Script Date: 18/1/2021 17:19:40 ******/
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
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50031, @Descripcion = 'ERROR AL insertar Beneficiario al limite ([dbo].[SPInsertarBeneficiariosLimite])'
			PRINT 'ERROR AL INSERTAR DATOS EN LA TABLA Beneficiario.'
			RETURN @@ERROR ;
	END CATCH




--EXEC SPInsertarBeneficiario @pIdTipoParentezco=4,@pValorDocumentoIdentidad=1,@pIdDeCuentaAhorro=1,@pPorcentaje=20;
--SELECT * FROM Persona
--SELECT * FROM Beneficiario
--SELECT * FROM CuentaAhorro
--DROP PROCEDURE SPInsertarBeneficiario;
GO
/****** Object:  StoredProcedure [dbo].[SPInsertarCuentasAhorroSimulacion]    Script Date: 18/1/2021 17:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE    PROCEDURE [dbo].[SPInsertarCuentasAhorroSimulacion]
		@tablaCuentasAhorro [dbo].[CuentaAhorroPerTrigger] READONLY
			

AS 
BEGIN -- <Movimientos Tipo="5" CodigoCuenta="11895861" Monto="44438091.00" Descripcion="Banco Central" />
	


	DECLARE @idMenor INT
	DECLARE @idMayor INT

	DECLARE @idDeCuentaAhorro INT
	DECLARE @idEstadoCuenta INT

	DECLARE @idPersona INT
	DECLARE @idTipoCuenta INT
	DECLARE @numeroCuenta INT
	DECLARE @fechaCreacion DATE
	DECLARE @saldo MONEY
	
	

	SET NOCOUNT ON;
	BEGIN TRY
		--BEGIN TRANSACTION
		SELECT @idMenor = min([id]), @idMayor=max([id]) FROM @tablaCuentasAhorro
		WHILE @idMenor <= @idMayor
			BEGIN
				SELECT @idPersona = idPersona FROM @tablaCuentasAhorro WHERE id = @idMenor
				SELECT @idTipoCuenta = idTipoCuenta FROM @tablaCuentasAhorro WHERE id = @idMenor
				SELECT @numeroCuenta = numeroCuenta FROM @tablaCuentasAhorro WHERE id = @idMenor
				SELECT @fechaCreacion = fechaCreacion FROM @tablaCuentasAhorro WHERE id = @idMenor
				SELECT @saldo = saldo FROM @tablaCuentasAhorro WHERE id = @idMenor

				INSERT CuentaAhorro
					(
						 IdPersona
						,IdTipoCuenta
						,[NumeroDeCuenta]
						,[FechaCreacion]
						,[Saldo]
						,[InsertAt]
						,[UpdateAt]
						,[InsertBy]
						,[UpdateBy]
						,[InsertIn]
						,[UpdateIn]
						,[CantidadRetirosHumano]
						,[CantidadRetirosAutomatico]
					)
				VALUES
					(
						 @idPersona
						,@idTipoCuenta
						,@numeroCuenta
						,@fechaCreacion
						,@saldo
						,@fechaCreacion
						,null
						,'CURRENT_USER' 
						,null
						,'DESKTOP-FBGDAQE'
						,null
						,0
						,0
					);
		

				SET @idMenor = @idMenor + 1
			END
		--	SELECT * FROM @tablaCuentasAhorro

		--COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50032, @Descripcion = 'ERROR AL insertar la cuenta de ahorro al recorrer la simulación ([dbo].[SPInsertarCuentasAhorroSimulacion])'
		PRINT  'Algo salió mal al INSERTAR Movimiento.'
		RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
	
END


GO
/****** Object:  StoredProcedure [dbo].[SPInsertarEstadoCuenta]    Script Date: 18/1/2021 17:19:40 ******/
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
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50033, @Descripcion = 'ERROR AL insertar estado de cuenta ([dbo].[SPInsertarEstadoCuenta])'
		PRINT  'Algo salió mal al insertar estado de cuenta.'
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END

--DROP PROCEDURE SPInsertarEstadoCuenta;
--EXEC SPInsertarEstadoCuenta 1,'2020-11-12','2019-4-12',5000,9000;
GO
/****** Object:  StoredProcedure [dbo].[SPInsertarMovimientoSimulacion]    Script Date: 18/1/2021 17:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [dbo].[SPInsertarMovimientoSimulacion]
		@TablaMovimientoAux [dbo].[TableMovimiento] READONLY

AS 
BEGIN -- <Movimientos Tipo="5" CodigoCuenta="11895861" Monto="44438091.00" Descripcion="Banco Central" />
	
	DECLARE @idTipoMovimiento INT
	DECLARE @numeroCuenta INT
	DECLARE @monto MONEY
	DECLARE @fecha DATETIME
	DECLARE @descripcion VARCHAR(100)

	DECLARE @idMenor INT
	DECLARE @idMayor INT

	DECLARE @idDeCuentaAhorro INT
	DECLARE @idEstadoCuenta INT

	DECLARE @MaxRetiroHumano INT
	DECLARE @MaxRetiroAutomatico INT

	DECLARE @retiroHumanoActual INT
	DECLARE @retiroAutomaticoActual INT

	DECLARE @comisionHumano MONEY
	DECLARE @comisionAutomatico MONEY
	



	SET NOCOUNT ON;
	BEGIN TRY

		SELECT @idMenor = min([id]), @idMayor=max([id]) FROM @TablaMovimientoAux
		WHILE @idMenor <= @idMayor
			BEGIN
				
				SELECT @idTipoMovimiento = idTipoMovimiento FROM @TablaMovimientoAux WHERE id = @idMenor
				SELECT @numeroCuenta = numeroCuenta FROM @TablaMovimientoAux WHERE id = @idMenor
				SELECT @monto = monto FROM @TablaMovimientoAux WHERE id = @idMenor
				SELECT @fecha = fecha FROM @TablaMovimientoAux WHERE id = @idMenor
				SELECT @descripcion = descripcion FROM @TablaMovimientoAux WHERE id = @idMenor
				SELECT @idDeCuentaAhorro = Id FROM [dbo].[CuentaAhorro] WHERE NumeroDeCuenta = @numeroCuenta
				SELECT @idEstadoCuenta = Id FROM [dbo].[EstadoCuenta] WHERE IdCuentaDeAhorro = @idDeCuentaAhorro

				SELECT @MaxRetiroHumano = TCA.MaxCajeroAutomatico FROM TipoCuentaAhorro TCA INNER JOIN CuentaAhorro CA ON IdTipoCuenta = TCA.Id
				SELECT @MaxRetiroAutomatico = TCA.MaxCajeroAutomatico FROM TipoCuentaAhorro TCA INNER JOIN CuentaAhorro CA ON IdTipoCuenta = TCA.Id
				
				SELECT @retiroHumanoActual = CA.CantidadRetirosHumano FROM CuentaAhorro CA WHERE Id = @idDeCuentaAhorro
				SELECT @retiroAutomaticoActual = CA.CantidadRetirosAutomatico FROM CuentaAhorro CA WHERE Id = @idDeCuentaAhorro

				SELECT @comisionHumano = TCA.CobroCajeroHumano FROM TipoCuentaAhorro TCA INNER JOIN CuentaAhorro CA ON IdTipoCuenta = TCA.Id
				SELECT @comisionAutomatico = TCA.CobroCajeroAutomatico FROM TipoCuentaAhorro TCA INNER JOIN CuentaAhorro CA ON IdTipoCuenta = TCA.Id
				

				-- En caso de ser Debito se le resta a la CA, de lo contrario se le suma.
				IF @idTipoMovimiento = 1
					BEGIN
						EXEC SPMovimientoSuma @monto,@idDeCuentaAhorro
					END
				IF @idTipoMovimiento = 2 
					BEGIN
						BEGIN TRANSACTION
						update CuentaAhorro SET CantidadRetirosAutomatico = CantidadRetirosAutomatico + 1 WHERE Id = @idDeCuentaAhorro;
						COMMIT TRANSACTION
						IF @retiroAutomaticoActual + 1 > @MaxRetiroAutomatico
							BEGIN
								INSERT 
									INTO [dbo].[Movimiento]
									(
										 IdTipoMovimiento
										,IdCuentaAhorro
										,IdEstadoDeCuenta
										,Monto
										,Fecha
										,Descripcion
									)
									VALUES(
										 9 --Id 9 porque así viene en el XML.
										,@idDeCuentaAhorro
										,@idEstadoCuenta
										,@comisionAutomatico
										,@fecha
										,'Comision exceso de operacion en CA'
										);
									EXEC SPMovimientoResta @monto,@idDeCuentaAhorro
							END

					END
					IF @idTipoMovimiento = 3 
					BEGIN
						BEGIN TRANSACTION 
						update CuentaAhorro SET CantidadRetirosHumano = CantidadRetirosHumano + 1 WHERE Id = @idDeCuentaAhorro;
						COMMIT TRANSACTION 

						IF @retiroHumanoActual + 1 > @MaxRetiroHumano
							BEGIN
								INSERT 
									INTO [dbo].[Movimiento]
									(
										 IdTipoMovimiento
										,IdCuentaAhorro
										,IdEstadoDeCuenta
										,Monto
										,Fecha
										,Descripcion
									)
									VALUES(
										 8 --Id 8 porque así viene en el XML.
										,@idDeCuentaAhorro
										,@idEstadoCuenta
										,@comisionAutomatico
										,@fecha
										,'Comision exceso de operacion en CH'
										);
									EXEC SPMovimientoResta @monto,@idDeCuentaAhorro
							END

					END
					IF @idTipoMovimiento = 4 OR @idTipoMovimiento = 5 OR @idTipoMovimiento = 6
					BEGIN
						EXEC SPMovimientoSuma @monto,@idDeCuentaAhorro 
					END


				

				INSERT 
					INTO [dbo].[Movimiento]
					(
						 IdTipoMovimiento
						,IdCuentaAhorro
						,IdEstadoDeCuenta
						,Monto
						,Fecha
						,Descripcion
					)
					VALUES(
						 @idTipoMovimiento
						,@idDeCuentaAhorro
						,@idEstadoCuenta
						,@monto
						,@fecha
						,@descripcion
						);
				SET @idMenor = @idMenor + 1
			END
			--SELECT * FROM @TablaMovimientoAux

	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50034, @Descripcion = 'ERROR AL insertar movimiento de la simulación ([dbo].[SPInsertarMovimientoSimulacion])'
		PRINT  'Algo salió mal al INSERTAR Movimiento.'
		RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
	
END


GO
/****** Object:  StoredProcedure [dbo].[SPInsertarPersona]    Script Date: 18/1/2021 17:19:40 ******/
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
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50035, @Descripcion = 'ERROR AL insertar persona ([dbo].[SPInsertarPersona])'
		PRINT  'Algo salió mal al insertar Persona.'
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END

--DROP PROCEDURE SPInsertarPersona;
GO
/****** Object:  StoredProcedure [dbo].[SPInsertarUsuario]    Script Date: 18/1/2021 17:19:40 ******/
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
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SPManejoDeErrores]    Script Date: 18/1/2021 17:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[SPManejoDeErrores]
	 @ErrorLogId [int]  OUTPUT
	,@CodigoDeError INT
	,@Descripcion VARCHAR(500)
AS
BEGIN
	SET NOCOUNT ON;

	SET @ErrorLogId = 0;

	BEGIN TRY

		IF ERROR_NUMBER() IS NULL
			RETURN;

		IF XACT_STATE() = -1
		BEGIN
			PRINT('No se puede registrar el error ya que la transacción está en proceso.') --COMMIT TRANSACTION
		END

		INSERT [dbo].[ErrorLog]
			(
			 [UserName]
			,[CodigoDeError]
			,[ErrorNumber]
			,[ErrorSeverity]
			,[ErrorState]
			,[ErrorProcedure]
			,[ErrorLine]
			,[ErrorMessege]
			)
			VALUES
				(
				 CURRENT_USER
				,@CodigoDeError
				,ERROR_NUMBER()
				,ERROR_SEVERITY()
				,ERROR_STATE()
				,ERROR_PROCEDURE()
				,ERROR_LINE()
				,@Descripcion
				);
			SET @ErrorLogId = @@IDENTITY;
	END TRY
	BEGIN CATCH
		PRINT('Ocurrió un error en el Stored procedure de errores xD.');

		RETURN -1;

	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPMostrarCuentas]    Script Date: 18/1/2021 17:19:40 ******/
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
			 CA.Id
			,TC.Id
			,CA.IdPersona
			,CA.NumeroDeCuenta
			,CA.Saldo
			,CA.FechaCreacion
		FROM 
			[dbo].[CuentaAhorro] CA
		INNER JOIN TipoCuentaAhorro TC ON TC.Id = CA.IdTipoCuenta
	END TRY
	BEGIN CATCH
		PRINT  'Algo salió mal al mostrar cuentas.'
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SPMostrarCuentasUsuario]    Script Date: 18/1/2021 17:19:40 ******/
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
	   SELECT DISTINCT
			 CA.Id
			,IdTipoCuenta
			,IdPersona
			,NumeroDeCuenta
			,Saldo
			,FechaCreacion
			,U.Nombre
			,TC.Nombre
			,@id
		
		FROM 
			[dbo].[CuentaAhorro] CA
		INNER JOIN UsuarioPuedeAccesar UPA ON UPA.IdCuentaDeAhorros = CA.Id
		INNER JOIN Usuario U ON UPA.IdUsuario = U.id
		INNER JOIN TipoCuentaAhorro TC ON CA.IdTipoCuenta = TC.Id
		WHERE 
			UPA.IdUsuario = @id
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50036, @Descripcion = 'ERROR AL mostrar las cuentas de UPA(Usuario puede accesar) ([dbo].[SPMostrarCuentasUsuario])'
		PRINT  'Algo salió mal al mostrar cuentas usuario.'
		RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SPMostrarUsuarios]    Script Date: 18/1/2021 17:19:40 ******/
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
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50037, @Descripcion = 'ERROR AL mostrar Usuarios ()'
		PRINT  'Algo salió al mostrar usuarios.'
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SPMovimientoCompra]    Script Date: 18/1/2021 17:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE    PROCEDURE [dbo].[SPMovimientoCompra]
		@monto MONEY
		,@idDeCuentaAhorro INT


AS 
BEGIN 
	
	BEGIN TRY
		SET NOCOUNT ON;
		BEGIN TRANSACTION
		Update 
			[dbo].[CuentaAhorro]
		SET		
			Saldo = Saldo - @monto
		WHERE 
			Id = @idDeCuentaAhorro

		UPDATE
			EstadoCuenta
		SET 
			SaldoFinal = SaldoFinal - @monto
		WHERE 
			IdCuentaDeAhorro = @idDeCuentaAhorro
		COMMIT TRANSACTION
		SET NOCOUNT OFF;
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50038, @Descripcion = 'ERROR AL realizar movimiento Compra ([dbo].[SPMovimientoCompra])'
		PRINT  'Algo salió al mostrar usuarios.'
		RETURN @@ERROR ;
	END CATCH
	
END


GO
/****** Object:  StoredProcedure [dbo].[SPMovimientoResta]    Script Date: 18/1/2021 17:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE    PROCEDURE [dbo].[SPMovimientoResta]
		@monto MONEY
		,@idDeCuentaAhorro INT


AS 
BEGIN 
	BEGIN TRY
		SET NOCOUNT ON;
		BEGIN TRANSACTION 
		Update 
			[dbo].[CuentaAhorro]
		SET		
			Saldo = Saldo - @monto
		WHERE 
			Id = @idDeCuentaAhorro

		UPDATE
			EstadoCuenta
		SET 
			SaldoFinal = SaldoFinal - @monto
		WHERE 
			IdCuentaDeAhorro = @idDeCuentaAhorro


		COMMIT TRANSACTION
		SET NOCOUNT OFF;
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50039, @Descripcion = 'ERROR AL realizar el movimiento para restar en CA ([dbo].[SPMovimientoResta])'
		PRINT  'Algo salió mal al realizar la resta.'
		RETURN @@ERROR;
	END CATCH
END


GO
/****** Object:  StoredProcedure [dbo].[SPMovimientoSuma]    Script Date: 18/1/2021 17:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE    PROCEDURE [dbo].[SPMovimientoSuma]
		@monto MONEY
		,@idDeCuentaAhorro INT


AS 
BEGIN 
	BEGIN TRY 
		BEGIN TRANSACTION
		Update 
			[dbo].[CuentaAhorro]
		SET		
			Saldo = Saldo + @monto
		WHERE 
			Id = @idDeCuentaAhorro

		UPDATE
			EstadoCuenta
		SET 
			SaldoFinal = SaldoFinal + @monto
		WHERE 
			IdCuentaDeAhorro = @idDeCuentaAhorro

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50040, @Descripcion = 'ERROR AL realizar movimiento para sumar en CA ([dbo].[SPMovimientoSuma])'
		PRINT  'Algo salió mal al realizar la suma.'
		RETURN @@ERROR;
	END CATCH
END


GO
/****** Object:  StoredProcedure [dbo].[SPObtenerBeneficiario]    Script Date: 18/1/2021 17:19:40 ******/
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
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50041, @Descripcion = 'ERROR AL obtener el beneficiario ([dbo].[SPObtenerBeneficiario])'
		PRINT  'Algo salió mal al obtener beneficiarios.'
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerBeneficiariosCuenta]    Script Date: 18/1/2021 17:19:40 ******/
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
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50042, @Descripcion = 'ERROR AL obtener el beneficiario por cuenta ([dbo].[SPObtenerBeneficiariosCuenta])'
		PRINT  'Algo salió mal al obtener beneficiarios por cuenta.'
		RETURN @@ERROR ;
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
/****** Object:  StoredProcedure [dbo].[SPObtenerCuentaObjetivo]    Script Date: 18/1/2021 17:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SPObtenerCuentaObjetivo]
(
	@Id INT
)
AS 
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		SELECT
			 CO.Id
			,CO.IdCuentaAhorro
			,CO.FechaInicio
			,CO.Objetivo
			,CO.Saldo
			,CO.FechaFinal
			--,CO.InteresAcumulado
			,CA.NumeroDeCuenta
			,CO.DiaDeAhorro
			,CO.NumeroCuentaObjetivo

		FROM [dbo].[CuentaObjetivo] CO
		INNER JOIN CuentaAhorro CA ON CO.IdCuentaAhorro = CA.Id
		WHERE  
			CO.Id = @Id AND Activo = 1
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50043, @Descripcion = 'ERROR AL obtener cuenta objetivo ([dbo].[SPObtenerCuentaObjetivo])'
		PRINT  'Algo salió mal al obtener beneficiarios.'
		RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerCuentasAhorro]    Script Date: 18/1/2021 17:19:40 ******/
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
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50044, @Descripcion = 'ERROR AL obtener cuenta de ahorro ([dbo].[SPObtenerCuentasAhorro])'
		PRINT  'Algo salió mal al obtener cuentas de ahorro.'
		RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
END

--SELECT * FROM Persona
--DROP PROCEDURE SPObtenerBeneficiario;
--GO
--EXEC SPObtenerPersona 20;
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerCuentasObjetivoPorCA]    Script Date: 18/1/2021 17:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE     PROCEDURE [dbo].[SPObtenerCuentasObjetivoPorCA]
(
	@idCuentaAhorro INT
)
AS 
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		SELECT
			 CO.Id
			,CO.IdCuentaAhorro
			,CO.FechaInicio
			--,CO.FechaFinal
			,CO.Objetivo
			,CO.Saldo
			--,CO.InteresAcumulado
			,CO.FechaFinal
			,CA.NumeroDeCuenta
			,CO.DiaDeAhorro
			,CO.NumeroCuentaObjetivo

		
		FROM [dbo].[CuentaObjetivo] CO
		INNER JOIN CuentaAhorro CA ON CO.IdCuentaAhorro = CA.Id
		WHERE  
			IdCuentaAhorro = @idCuentaAhorro AND Activo = 1;
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50045, @Descripcion = 'ERROR AL obtener las cuentas Objetivo de Cuenta Ahorro ([dbo].[SPObtenerCuentasObjetivoPorCA])'
		PRINT  'Algo salió mal al obtener cuenta.'
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerEstadosCuenta]    Script Date: 18/1/2021 17:19:40 ******/
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
		--TOP 8
			 EC.Id
			,EC.IdCuentaDeAhorro
			,EC.FechaInicio
			,EC.FechaFinal
			,EC.SaldoInicial
			,EC.SaldoFinal
			,CA.NumeroDeCuenta
			,CA.CantidadRetirosHumano
			,CA.CantidadRetirosAutomatico
			,TCA.SaldoMinimo

		FROM 
			[dbo].[EstadoCuenta] EC
			INNER JOIN CuentaAhorro CA ON EC.IdCuentaDeAhorro = CA.Id
			INNER JOIN TipoCuentaAhorro TCA ON IdTipoCuenta = TCA.Id
			
		WHERE 

			IdCuentaDeAhorro=@pIdCuentaDeAhorro  
	
		ORDER BY FechaFinal DESC 
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50046, @Descripcion = 'ERROR AL obtener el estado de cuenta ([dbo].[SPObtenerEstadosCuenta])'
		PRINT  'Algo salió mal al obtener estados de cuenta.'
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
	
END


--EXEC [SPObtenerEstadosCuenta] @pIdCuentaDeAhorro = 1
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerIdCuentaBeneficiario]    Script Date: 18/1/2021 17:19:40 ******/
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
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50047, @Descripcion = 'ERROR AL obtener el id de cuenta del beneficiario ([dbo].[SPObtenerIdCuentaBeneficiario])'
		PRINT  'Algo salió mal al obtener idCuenta beneficiario.'
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerIdCuentaObjetivo]    Script Date: 18/1/2021 17:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [dbo].[SPObtenerIdCuentaObjetivo]
(
	@Id INT
)
AS 
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		SELECT
			IdCuentaAhorro

		FROM [dbo].[CuentaObjetivo]
		WHERE  
			Id = @Id;
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50048, @Descripcion = 'ERROR AL obtener id de cuenta objetivo ([dbo].[SPObtenerIdCuentaObjetivo])'
		PRINT  'Algo salió mal al obtener idCuenta CuentaObjetivo.'
		RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerMovimientosCO]    Script Date: 18/1/2021 17:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


 CREATE   PROCEDURE [dbo].[SPObtenerMovimientosCO]
(      
   @pIdCuentaObjetivo	INT 
)      
AS

BEGIN   
	SET NOCOUNT ON;
	BEGIN TRY
	   SELECT 
			--IdCuentaObjetivo = Convert.ToInt32(read[0].ToString()),
   --           NO          IdCuentaAhorro = Convert.ToInt32(read[1].ToString()),
   --                     Fecha = Convert.ToDateTime(read[2].ToString()),
   --                     Monto = Convert.ToDecimal(read[3].ToString()),
   --                     NuevoMonto = Convert.ToDecimal(read[4].ToString()),
   --                     Descripcion = read[5].ToString(),
   --                     NumeroCuenta = read[6].ToString(),
			 CO.Id
			,CA.Id
			,CO.NumeroCuentaObjetivo
			,MCO.Fecha
			,MCO.Monto
			,MCO.NuevoSaldo
			,MCO.Descripcion
			,CA.NumeroDeCuenta

		FROM 
			[dbo].[CuentaObjetivo] CO
			INNER JOIN MovimientoCuentaObjetivo MCO ON CO.Id = MCO.IdCuentaObjetivo
			INNER JOIN CuentaAhorro CA ON CO.IdCuentaAhorro = CA.Id
			
		WHERE 

			IdCuentaObjetivo = @pIdCuentaObjetivo  
	
		ORDER BY FechaFinal DESC 
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50100, @Descripcion = 'ERROR al obtener los movimientos de ceunta objetivo -> ([dbo].[SPObtenerMovimientosCuentaObjetivo])'
		PRINT  'Algo salió mal al obtener estados de cuenta.'
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
	
END


--EXEC [SPObtenerEstadosCuenta] @pIdCuentaDeAhorro = 1
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerMovimientosCOI]    Script Date: 18/1/2021 17:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


 CREATE     PROCEDURE [dbo].[SPObtenerMovimientosCOI]
(      
   @pIdCuentaObjetivo	INT 
)      
AS

BEGIN   
	SET NOCOUNT ON;
	BEGIN TRY
	   SELECT 
			--IdCuentaObjetivo = Convert.ToInt32(read[0].ToString()),
   --           NO          IdCuentaAhorro = Convert.ToInt32(read[1].ToString()),
   --                     Fecha = Convert.ToDateTime(read[2].ToString()),
   --                     Monto = Convert.ToDecimal(read[3].ToString()),
   --                     NuevoMonto = Convert.ToDecimal(read[4].ToString()),
   --                     Descripcion = read[5].ToString(),
   --                     NumeroCuenta = read[6].ToString(),
			 CO.Id
			,CA.Id
			,CO.NumeroCuentaObjetivo
			,MCOI.Fecha
			,MCOI.Monto
			,MCOI.NuevoInteresAcumulado
			,MCOI.Descripcion
			,CA.NumeroDeCuenta

		FROM 
			[dbo].[CuentaObjetivo] CO
			INNER JOIN MovimientoCuentaObjetivoInteres MCOI ON CO.Id = MCOI.IdCuentaObjetivo
			INNER JOIN CuentaAhorro CA ON CO.IdCuentaAhorro = CA.Id
			
		WHERE 

			IdCuentaObjetivo = @pIdCuentaObjetivo  
	
		ORDER BY FechaFinal DESC 
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50101, @Descripcion = 'ERROR al obtener los movimientos de cuenta objetivo interes -> ([dbo].[SPObtenerMovimientosCuentaObjetivoInteres])'
		PRINT  'Algo salió mal al obtener estados de cuenta.'
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
	
END


--EXEC [SPObtenerEstadosCuenta] @pIdCuentaDeAhorro = 1
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerMovimientosDescripcion]    Script Date: 18/1/2021 17:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE       PROCEDURE [dbo].[SPObtenerMovimientosDescripcion]
(

	 @pDescripcion VARCHAR(50)
	,@pCategoria VARCHAR(50)
	,@pIdUsuarioPA INT
)
AS 
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
	DECLARE @idTipoMovimiento INT
	SELECT @idTipoMovimiento = Id FROM TipoMovimiento WHERE Nombre = @pCategoria;

		SELECT
			  M.Monto
			 ,M.Fecha
			 ,M.Descripcion
			 --,M.NuevoSaldo
			 ,TM.Nombre
			 ,CA.Id
			 ,EC.Id
			 ,CA.NumeroDeCuenta
			 ,TM.Tipo
			 
			 
		FROM [dbo].[Movimiento] M
		INNER JOIN CuentaAhorro CA ON M.IdCuentaAhorro = CA.Id
		INNER JOIN TipoMovimiento TM ON M.IdTipoMovimiento = TM.Id
		INNER JOIN EstadoCuenta EC ON M.IdEstadoDeCuenta = EC.Id

		INNER JOIN UsuarioPuedeAccesar UPA ON UPA.IdCuentaDeAhorros = CA.Id
		INNER JOIN Usuario U ON UPA.IdUsuario = U.id
	
		WHERE  
				TM.Id = @idTipoMovimiento AND M.Descripcion = @pDescripcion AND UPA.IdUsuario = @pIdUsuarioPA AND CA.NumeroDeCuenta = NumeroDeCuenta

		ORDER BY Fecha DESC 
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50049, @Descripcion = 'ERROR AL obtener movimeintos según descripcion y categoría ([dbo].[SPObtenerMovimientosDescripcion])'
		PRINT  'Algo salió mal al obtener las compras.'
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END

--SELECT * FROM CuentaAhorro --WHERE NumeroDeCuenta = 11326139
--SELECT * FROM UsuarioPuedeAccesar --WHERE IdCuentaDeAhorros = 1
--EXEC [dbo].[SPObtenerMovimientosDescripcion] @pDescripcion = 'Prueba',@pCategoria = 'Prueba'  ,@pIdUsuarioPA = 1;
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerMovimientosEstadoCuenta]    Script Date: 18/1/2021 17:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SPObtenerMovimientosEstadoCuenta]
(
	 --@idCuentaAhorro INT
	@idEstadoCuenta INT
)
AS 
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		SELECT
			  M.Monto
			 ,M.Fecha
			 ,M.Descripcion
			 ,TM.Nombre
			 ,CA.Id
			 ,EC.Id
			 ,TM.Tipo
			 
		FROM [dbo].[Movimiento] M
		INNER JOIN CuentaAhorro CA ON M.IdCuentaAhorro = CA.Id
		INNER JOIN TipoMovimiento TM ON M.IdTipoMovimiento = TM.Id
		INNER JOIN EstadoCuenta EC ON M.IdEstadoDeCuenta = EC.Id
		WHERE  
				EC.Id = @idEstadoCuenta
			AND
				fecha BETWEEN EC.FechaInicio AND EC.FechaFinal
		ORDER BY Fecha DESC 
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50050, @Descripcion = 'ERROR AL obtener los movimientos de los estados de cuenta ([dbo].[SPObtenerMovimientosEstadoCuenta])'
		PRINT  'Algo salió mal al obtener los movimientos del estado de cuenta.'
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END

--exec [SPObtenerMovimientosEstadoCuenta] @idEstadoCuenta = 0
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerPersona]    Script Date: 18/1/2021 17:19:40 ******/
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
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50051, @Descripcion = 'ERROR AL obtener a la persona ([dbo].[SPObtenerPersona])'
		PRINT  'Algo salió mal al obtener persona.'
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END

--SELECT * FROM Persona
--DROP PROCEDURE SPObtenerBeneficiario;
--GO
--EXEC SPObtenerPersona 20;
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerTiposParentezco]    Script Date: 18/1/2021 17:19:40 ******/
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
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50052, @Descripcion = 'ERROR AL obtener los tipos de parentezco ([dbo].[SPObtenerTiposParentezco])'
		PRINT  'Algo salió mal al obtener tipos de parentezco.'
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SPRellenar_Tablas]    Script Date: 18/1/2021 17:19:40 ******/
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
/****** Object:  StoredProcedure [dbo].[SPSimulacion]    Script Date: 18/1/2021 17:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     PROCEDURE [dbo].[SPSimulacion]
AS

BEGIN
	SET NOCOUNT ON


	DECLARE @tablaCuentasAhorro AS [dbo].[CuentaAhorroPerTrigger];
	DECLARE @TablaMovimientoAux AS [dbo].[TableMovimiento];
	DECLARE @FechaDeOperacion DATE

	-- Tabla para almacenas las fechas según el XML.
	DECLARE @FechasPorIterar TABLE
		(
			 iterador INT IDENTITY(1,1) PRIMARY KEY
			,fecha DATE
		)

	-- Sección para cargar las fechas desde el XML y parsearlo antes.

	BEGIN TRY
		--Parsear el XML e insertar datos en la tabla
		DECLARE 
				@DocumentoXML XML;
	
		SELECT 
			@DocumentoXML = DXML
		FROM 
			--OPENROWSET(BULK 'D:\S3\bucket-xml\PruebaOperaciones.xml', SINGLE_BLOB) AS DocumentoXML(DXML);
			OPENROWSET(BULK 'C:\Users\ulirp\Desktop\BAses\Base_De_Datos_Progra_1\Base De Datos\XML\Tarea3.xml', SINGLE_BLOB) AS DocumentoXML(DXML);
		INSERT 
			@FechasPorIterar (fecha)

		SELECT 
			f.value('@Fecha','DATE')
		FROM 
			@DocumentoXML.nodes('/Operaciones/FechaOperacion')AS t(f);

	END TRY

	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50055, @Descripcion = 'ERROR AL parsear el archivo de la simulación  ([dbo].[SPSimulacion])'
			PRINT 'ERROR AL PARSEAR EL XML EN LA SIMULACIÓN.'
			RETURN @@ERROR;
	END CATCH
	


	-- Sección donde vamos a declarar las variables para poder iterar por día.
	DECLARE @primerDia INT
	DECLARE @ultimoDia INT
	DECLARE @fechaMinima DATETIME
	DECLARE @fechaMaxima DATETIME
	DECLARE @fechaNodo DATE
	-- Asignamos las fechas a cada variable con MIN y MAX (funciones agregadas)
	BEGIN TRY
		SELECT 
			@fechaMinima = MIN(F.fecha)
		FROM @FechasPorIterar F
	
		SELECT 
			@fechaMaxima = MAX(F.fecha)
		FROM @FechasPorIterar F
	
		-- Inicializamos las variables inicio y fin de fechas con las cuales se va a recorrer la simulación.
		SELECT 
			@primerDia = F.iterador
		FROM
			@FechasPorIterar F
		WHERE
			F.fecha = @fechaMinima
	
		SELECT 
			@ultimoDia = F.iterador
		FROM
			@FechasPorIterar F
		WHERE
			F.fecha = @fechaMaxima
		--PRINT(@primerDia)
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50056, @Descripcion = 'ERROR AL inicializar las variable principales para recorrer la simulación ([dbo].[SPSimulacion])'
		RETURN @@ERROR;
	END CATCH
		--SELECT * FROM @FechasPorIterar
		-- Comezamo la simulación con un WHILE iniciando desde @primerDia hasta @ultimoDia.
		WHILE 
			@primerDia <= @ultimoDia

			BEGIN
				BEGIN TRY
				-- Obtenemos la fecha según el índice de la tabla fechas.
				SELECT 
					@FechaDeOperacion = F.fecha
				FROM
					@FechasPorIterar F
				WHERE 
					iterador = @primerDia

				SET @fechaNodo = @DocumentoXML.value('(/Operaciones/FechaOperacion/@Fecha)[1]','DATE')
				--PRINT(@primerDia)

			END TRY
			BEGIN CATCH
				EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50057, @Descripcion = 'ERROR AL obtener la fecha para ir iterando Simulación ([dbo].[SPSimulacion])'
				RETURN @@ERROR;
			END CATCH
				-- COMENZAMOS A PROCESAR LOS NODOS PRINCIPALES.
				
			BEGIN TRY
				-- PERSONAs
				INSERT INTO
					[dbo].[Persona]
								(
									 Telefono2
									,Telefono1
									,CorreoElectronico
									,FechaNacimiento
									,ValorDocumentoIdentidad
									,Nombre
									,IdTipoDocumentoIdentidad
									,InsertAt
									,UpdateAt
									,InsertBy
									,UpdateBy
									,InsertIn
									,UpdateIn
								)
				SELECT 
				     p.value('@Telefono2','VARCHAR(50)')
					,p.value('@Telefono1','VARCHAR(50)')
					,p.value('@Email','VARCHAR(50)')
					,p.value('@FechaNacimiento','DATE')
					,p.value('@ValorDocumentoIdentidad','INT')
					,p.value('@Nombre','VARCHAR(100)')
					,p.value('@TipoDocuIdentidad','INT')
					, @FechaDeOperacion AS [InsertAt] --obtiene la fecha del dia de insercion
					, null AS [UpdateAt] --obtiene la fecha del dia de actualizacion
					, CURRENT_USER AS [InsertBy] --string de prueba
					, '' AS [UpdateBy] --string de prueba
					, 'DESKTOP-FBGDAQE' AS [InsertIn] --string de prueba
					, '' AS [UpdateIn] --string de prueba

				FROM
					@DocumentoXML.nodes('/Operaciones/FechaOperacion[@Fecha eq sql:variable("@FechaDeOperacion")]/Persona')
				AS
					t(p);
				--WHERE		-- Esto para poder obtener sólo cuando es la fecha correcta.
				--	@DocumentoXML.value('(/Operaciones/FechaOperacion/@Fecha)[1]','DATE') = @FechaDeOperacion	--REVISAR NO FILTRA

			END TRY
			BEGIN CATCH
				EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50058, @Descripcion = 'ERROR AL Insertar Personas Simulación  ([dbo].[SPSimulacion])'
				RETURN @@ERROR;
			END CATCH



			BEGIN TRY
				DELETE 
					@tablaCuentasAhorro
				INSERT INTO 
					@tablaCuentasAhorro(idPersona,idTipoCuenta,numeroCuenta,fechaCreacion,saldo)
				SELECT 
					(	
						SELECT 
								P.Id
						FROM 
								[dbo].[Persona] P
						WHERE 
								CA.value('@ValorDocumentoIdentidadDelCliente', 'INT') = P.ValorDocumentoIdentidad
					) AS 
							[IdPersona]

					, CA.value('@TipoCuentaId', 'INT')
					, CA.value('@NumeroCuenta', 'INT')
					, @FechaDeOperacion AS [FechaCreacion]
					, 0 AS [Saldo]
				FROM 
					@DocumentoXML.nodes('/Operaciones/FechaOperacion[@Fecha eq sql:variable("@FechaDeOperacion")]/Cuenta') AS t(CA);
				EXEC SPInsertarCuentasAhorroSimulacion @tablaCuentasAhorro;

			END TRY
			BEGIN CATCH
				EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50059, @Descripcion = 'ERROR AL insertar los valores en la variable tabal cuenta AHorro Simulación ([dbo].[SPSimulacion])'
				RETURN @@ERROR;
			END CATCH
	--			--INSERT INTO [dbo].[CuentaAhorro]
	--			--(
	--			--	 [IdPersona]
	--			--	,[IdTipoCuenta]
	--			--	,[NumeroDeCuenta]
	--			--	,[FechaCreacion]
	--			--	,[Saldo]
	--			--	,[InsertAt]
	--			--	,[UpdateAt]
	--			--	,[InsertBy]
	--			--	,[UpdateBy]
	--			--	,[InsertIn]
	--			--	,[UpdateIn]
	--			--)
	--			--SELECT	
	--			--	(	
	--			--		SELECT 
	--			--				P.Id
	--			--		FROM 
	--			--				[dbo].[Persona] P
	--			--		WHERE 
	--			--				CA.value('@ValorDocumentoIdentidadDelCliente', 'INT') = P.ValorDocumentoIdentidad
	--			--	) AS 
	--			--			[IdPersona]

	--			--	, CA.value('@TipoCuentaId', 'INT')
	--			--	, CA.value('@NumeroCuenta', 'INT')
	--			--	, @FechaDeOperacion AS [FechaCreacion]
	--			--	, 0 AS [Saldo]
	--			--	, @FechaDeOperacion AS [InsertAt] --obtiene la fecha del dia de insercion
	--			--	, null AS [UpdateAt] --obtiene la fecha del dia de actualizacion
	--			--	, 'CURRENT_USER' AS [InsertBy] --string de prueba
	--			--	, 'CURRENT_USER' AS [UpdateBy] --string de prueba
	--			--	, 'DESKTOP-FBGDAQE' AS [InsertIn] --string de prueba
	--			--	, ' ' AS [UpdateIn] --string de prueba
			
	--			--FROM
	--			--	@DocumentoXML.nodes('/Operaciones/FechaOperacion[@Fecha eq sql:variable("@FechaDeOperacion")]/Cuenta')

	--			--AS
	--			--	t(CA);
				
	--			--WHERE		-- Esto para poder obtener sólo cuando es la fecha correcta.
	--			--	@DocumentoXML.value('(/Operaciones/FechaOperacion/@Fecha)[1]','DATE') = @FechaDeOperacion	--REVISAR NO FILTRA

			

			
	--			--**************************************************************
	--			--**************************************************************
	--			--**************************************************************
	--			--**************************************************************
	--			--AQUÍ DEBERÍA DE ENTRAR A FUNCIONAR EL TRIGGER DE ESTADO CUENTA.
	--			--**************************************************************
	--			--**************************************************************
	--			--**************************************************************
	--			--**************************************************************
	--			--**************************************************************

	--		--AQUÍ VA LA CUENTA OBJETIVO EN LA SIMULACIón.

			BEGIN TRY
		INSERT INTO [dbo].[CuentaObjetivo]

							(
								 [IdCuentaAhorro]
								,[NumeroCuentaObjetivo]
								,[FechaInicio]
								,[FechaFinal]
								,[Objetivo]
								,[Saldo]
								,[DiaDeAhorro]
								,[InteresAcumulado]
								,[Activo]
								,[InsertAt]
								,[UpdateAt]
								,[InsertBy]
								,[UpdateBy]
								,[InsertIn]
								,[UpdateIn]
							)
		SELECT	  
				  --d.value('@User', 'VARCHAR(100)')
				--  (	
				--		SELECT 
				--				C.Id
				--		FROM 
				--				[dbo].[CuentaAhorro] C
				--		WHERE 
				--				d.value('@NumeroCuentaPrimaria', 'INT') = C.NumeroDeCuenta
				--	) AS [IdCuentaDeAhorro]
				 CA.Id
				, d.value('@NumeroCuentaAhorro', 'INT')
				  
				, @FechaDeOperacion AS [FechaInicio]
				, d.value('@FechaFinal', 'DATE')
				, d.value('@Descripcion','VARCHAR(100)')
				, d.value('@MontoAhorro','MONEY')
				, d.value('@DiaAhorro','INT')
				, 0 AS [InteresAcumulado]
				, 1 AS [Activo]
				, GETDATE() AS [InsertAt] --obtiene la fecha del dia de insercion
				, GETDATE() AS [UpdateAt] --obtiene la fecha del dia de actualizacion
				, 'CURRENT_USER' AS [InsertBy] --string de prueba
				, 'CURRENT_USER' AS [UpdateBy] --string de prueba
				, 'Mi PC' AS [InsertIn] --string de prueba
				, 'Mi PC' AS [UpdateIn] --string de prueba
		FROM 
				@DocumentoXML.nodes('/Operaciones/FechaOperacion[@Fecha eq sql:variable("@FechaDeOperacion")]/CuentaAhorro') AS t(d)
		INNER JOIN [dbo].[CuentaAhorro] CA ON t.d.value('@NumeroCuentaPrimaria', 'INT') = CA.NumeroDeCuenta;
	END TRY

	BEGIN CATCH
			EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50106, @Descripcion = 'ERROR AL insertar las cuentas objetivo en simulación  ([dbo].[SPSimulacion])'
				RETURN @@ERROR;
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
					--,  1 AS [IdTipoParentezco] 
					, d.value('@ParentezcoId', 'INT')
					, d.value('@Porcentaje', 'INT')

					, 1 AS [Activo]

					, @FechaDeOperacion AS [InsertAt] --obtiene la fecha del dia de insercion
					, null AS [UpdateAt] --obtiene la fecha del dia de actualizacion
					, 'CURRENT_USER' AS [InsertBy] --string de prueba
					, '' AS [UpdateBy] --string de prueba
					, 'DESKTOP-FBGDAQE' AS [InsertIn] --string de prueba
					, '' AS [UpdateIn] --string de prueba
			
				FROM
					@DocumentoXML.nodes('/Operaciones/FechaOperacion[@Fecha eq sql:variable("@FechaDeOperacion")]/Beneficiario')
			
				AS 
					t(d);

				--WHERE		-- Esto para poder obtener sólo cuando es la fecha correcta.
				--	@DocumentoXML.value('(/Operaciones/FechaOperacion/@Fecha)[1]','DATE') = @FechaDeOperacion	--REVISAR NO FILTRA
			END TRY
			BEGIN CATCH
				EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50060, @Descripcion = 'ERROR AL insertar beneficiarios en simulación  ([dbo].[SPSimulacion])'
				RETURN @@ERROR;
			END CATCH


			BEGIN TRY
				DELETE 
					@TablaMovimientoAux
				INSERT INTO 
					@TablaMovimientoAux(idTipoMovimiento,numeroCuenta,monto,fecha,descripcion)
				SELECT 
					  m.value('@Tipo', 'INT')
					, m.value('@CodigoCuenta', 'INT')
					, m.value('@Monto', 'MONEY')
					, @FechaDeOperacion AS fecha
					, m.value('@Descripcion','VARCHAR(100)')
				FROM 
					@DocumentoXML.nodes('/Operaciones/FechaOperacion[@Fecha eq sql:variable("@FechaDeOperacion")]/Movimientos') AS t(m);
				EXEC SPInsertarMovimientoSimulacion @TablaMovimientoAux;
			END TRY
			BEGIN CATCH
				EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50061, @Descripcion = 'ERROR AL Insertar los valores en la variable tabla movimiento en simulación  ([dbo].[SPSimulacion])'
				RETURN @@ERROR;
			END CATCH

	
	BEGIN TRY
		INSERT INTO [dbo].[Usuario]
							(
								 [Nombre]
								,[Password]
								,[EsAdministrador]
								,[Email]
								,[ValorDocumentoIdentidad]
								,[InsertAt]
								,[UpdateAt]
								,[InsertBy]
								,[UpdateBy]
								,[InsertIn]
								,[UpdateIn]
							)
		SELECT	  
				  P.Nombre
				, d.value('@Pass', 'VARCHAR(100)')
				, d.value('@EsAdministrador', 'BIT')
				, d.value('@Email','VARCHAR(50)')
				, d.value('@ValorDocumentoIdentidad','VARCHAR(50)')
				, GETDATE() AS [InsertAt] --obtiene la fecha del dia de insercion
				, GETDATE() AS [UpdateAt] --obtiene la fecha del dia de actualizacion
				, 'CURRENT_USER' AS [InsertBy] --string de prueba
				, 'CURRENT_USER' AS [UpdateBy] --string de prueba
				, 'amazon-server' AS [InsertIn] --string de prueba
				, 'amazon-server' AS [UpdateIn] --string de prueba
		FROM 
				@DocumentoXML.nodes('/Operaciones/FechaOperacion[@Fecha eq sql:variable("@FechaDeOperacion")]/Usuario') AS t(d)
				--@DocumentoXML.nodes('/Usuarios/Usuario') AS t(d);
				INNER JOIN [dbo].[Persona] P ON t.d.value('@User', 'VARCHAR(100)') = P.Nombre;
	END TRY

	BEGIN CATCH
			EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50062, @Descripcion = 'ERROR AL insertar los usuarios en simulación  ([dbo].[SPSimulacion])'
				RETURN @@ERROR;
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
				(SELECT U.Id FROM [dbo].[Usuario] U WHERE d.value('@User', 'INT') = U.ValorDocumentoIdentidad) AS [IdUsuario]
				,(SELECT C.Id FROM [dbo].[CuentaAhorro] C WHERE d.value('@Cuenta', 'INT') = C.NumeroDeCuenta) AS [IdCuentaDeAhorro]
				, 1 AS [Activo]
				, GETDATE() AS [InsertAt] --obtiene la fecha del dia de insercion
				, GETDATE() AS [UpdateAt] --obtiene la fecha del dia de actualizacion
				, CURRENT_USER AS [InsertBy] --string de prueba
				, CURRENT_USER AS [UpdateBy] --string de prueba
				, 'amazon-server' AS [InsertIn] --string de prueba
				, 'amazon-server' AS [UpdateIn] --string de prueba
		FROM 
				@DocumentoXML.nodes('/Operaciones/FechaOperacion[@Fecha eq sql:variable("@FechaDeOperacion")]/UsuarioPuedeVer') AS t(d)
				--@DocumentoXML.nodes('/Usuarios_Ver/UsuarioPuedeVer') AS t(d)
		
	END TRY

	BEGIN CATCH
			EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50063, @Descripcion = 'ERROR AL Insertar los UPA(Usuario puede accesar) en simulación.  ([dbo].[SPSimulacion])'
				RETURN @@ERROR;
	END CATCH





























			--INSERT INTO [dbo].[Movimiento]
			--					(
									 
			--						 [IdTipoMovimiento]
			--						,[IdCuentaAhorro]
			--						,[IdEstadoDeCuenta]
			--						,[Monto]
			--						,[Fecha]
			--						,[Descripcion]
			--					)
			--SELECT	 
				
			--	 d.value('@Tipo', 'INT')
			--	,(SELECT C.Id FROM [dbo].[CuentaAhorro] C WHERE d.value('@CodigoCuenta', 'INT') = C.NumeroDeCuenta) AS [IdCuentaAhorro]
			--	,(SELECT EC.Id FROM [dbo].[EstadoCuenta] EC WHERE IdCuentaDeAhorro = 
			--	INNER JOIN Cuen
			--	) AS [IdCuentaAhorro]				

			--	, 1 AS [Activo]

			--	, @FechaDeOperacion AS [InsertAt] --obtiene la fecha del dia de insercion
			--	, null AS [UpdateAt] --obtiene la fecha del dia de actualizacion
			--	, 'CURRENT_USER' AS [InsertBy] --string de prueba
			--	, '' AS [UpdateBy] --string de prueba
			--	, 'DESKTOP-FBGDAQE' AS [InsertIn] --string de prueba
			--	, '' AS [UpdateIn] --string de prueba
			--FROM 
			--	@DocumentoXML.nodes('/Operaciones/FechaOperacion/Beneficiario') 
			--AS 
			--	t(d)

			--WHERE		-- Esto para poder obtener sólo cuando es la fecha correcta.
			--	@DocumentoXML.value('(/Operaciones/FechaOperacion/@Fecha)[1]','DATE') = @FechaDeOperacion	--REVISAR NO FILTRA




			--SELECT * FROM @TablaMovimientoAux
			SET @primerDia = @primerDia + 1;
		END --Fin WHILE

		

END
GO
/****** Object:  StoredProcedure [dbo].[SPVaciar_Tablas]    Script Date: 18/1/2021 17:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     PROCEDURE [dbo].[SPVaciar_Tablas]
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		
		DELETE FROM  [dbo].[Movimiento]
			DBCC CHECKIDENT ('[Movimiento]', RESEED, 1) --para los identity
		DELETE FROM  [dbo].[TipoMovimiento]
		DELETE FROM  [dbo].[Beneficiario]
			DBCC CHECKIDENT ('[Beneficiario]', RESEED, 1) --para los identity
		DELETE FROM	 [dbo].[TipoParentezco]
		DELETE FROM  [dbo].[EstadoCuenta]
			DBCC CHECKIDENT ('[EstadoCuenta]', RESEED, 1) --para los identity
		DELETE FROM  [dbo].[UsuarioPuedeAccesar]
			DBCC CHECKIDENT ('[UsuarioPuedeAccesar]', RESEED, 1) --para los identity
		DELETE FROM  [dbo].[CuentaObjetivo]
			DBCC CHECKIDENT ('[CuentaObjetivo]', RESEED, 1) --para los identity
		DELETE FROM  [dbo].[CuentaAhorro]
			DBCC CHECKIDENT ('[CuentaAhorro]', RESEED, 1) --para los identity
		DELETE FROM  [dbo].[Persona]
			DBCC CHECKIDENT ('[Persona]', RESEED, 1) --para los identity
		DELETE FROM  [dbo].[TipoDocumentoIdentidad]
		DELETE FROM  [dbo].[TipoMovimientoCuentaObjetivo]
		DELETE FROM  [dbo].[TipoMovimientoCuentaObjetivoInteres]
		DELETE FROM  [dbo].[MovimientoCuentaObjetivo]
			DBCC CHECKIDENT ('[MovimientoCuentaObjetivo]', RESEED, 1) --para los identity
		DELETE FROM  [dbo].[MovimientoCuentaObjetivoInteres]
			DBCC CHECKIDENT ('[MovimientoCuentaObjetivoInteres]', RESEED, 1) --para los identity
		
		DELETE FROM  [dbo].[TipoCuentaAhorro]
		DELETE FROM  [dbo].[TipoMoneda]
		DELETE FROM  [dbo].[Usuario]
			DBCC CHECKIDENT ('[Usuario]', RESEED, 1) --para los identity

		DELETE FROM  [dbo].[ErrorLog]
			DBCC CHECKIDENT ('[ErrorLog]', RESEED, 1) --para los identity

	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50053, @Descripcion = 'ERROR AL vaciar las tablas ()'
		PRINT  'Algo salió mal al limpiar las tablas.'
		RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
	

END



GO
/****** Object:  StoredProcedure [dbo].[SPValidarUsuario]    Script Date: 18/1/2021 17:19:40 ******/
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
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50054, @Descripcion = 'ERROR AL validar Usuario ()'
		PRINT  'Algo salió mal al validar al usuario.'
		RETURN @@ERROR ;
	END CATCH
	--SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SPVerTablaErrores]    Script Date: 18/1/2021 17:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [dbo].[SPVerTablaErrores]
AS
BEGIN
	SET NOCOUNT ON;
		SELECT [ErrorLogID],[CodigoDeError],[ErrorTime],[UserName],[ErrorNumber],[ErrorSeverity],[ErrorState],[ErrorProcedure],[ErrorLine],[ErrorMessege]
		FROM [dbo].[ErrorLog]
	SET NOCOUNT OFF;
END
GO
/****** Object:  Trigger [dbo].[FirstEstadoCuenta]    Script Date: 18/1/2021 17:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   TRIGGER [dbo].[FirstEstadoCuenta] ON [dbo].[CuentaAhorro]
AFTER INSERT--, UPDATE
AS

BEGIN
	
	SET NOCOUNT ON;
	DECLARE @idCuentaAhorro INT
	DECLARE @fechaInicio DATE
	DECLARE @fechaFinal DATE
	DECLARE @saldoInicial MONEY
	DECLARE @saldoFinal MONEY

	SELECT @idCuentaAhorro = Id FROM [CuentaAhorro]
	SELECT @fechaInicio = FechaCreacion FROM [CuentaAhorro] 
	SELECT @fechaFinal = DATEADD(MONTH,1,@fechaInicio);
	SELECT @saldoInicial = Saldo FROM [CuentaAhorro]
	SELECT @saldoFinal = Saldo FROM [CuentaAhorro]


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
			 @idCuentaAhorro
			,@fechaInicio
			,@fechaFinal
			,@saldoInicial
			,@saldoFinal
			);
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50064, @Descripcion = 'ERROR AL  ejecutarse el TRIGGER DE CuentaAhorro para insertar estado de cuenta ([FirstEstadoCuenta])'
		PRINT  'Algo salió mal al insertar estado de cuenta.'


	END CATCH
	SET NOCOUNT OFF;

END
--DECLARE @fecha  DATE 
--SELECT @fecha = '2017-12-28'
--DECLARE @Otra DATE
--SELEct @Otra = DATEADD(MONTH,1,@fecha);
--print(@otra)
GO
ALTER TABLE [dbo].[CuentaAhorro] ENABLE TRIGGER [FirstEstadoCuenta]
GO
USE [master]
GO
ALTER DATABASE [BD_TP1_Cuenta_De_Ahorros] SET  READ_WRITE 
GO
