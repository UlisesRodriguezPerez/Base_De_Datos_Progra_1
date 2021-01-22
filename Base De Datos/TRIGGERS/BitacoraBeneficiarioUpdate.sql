USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  Trigger [dbo].[BitacoraBeneficioInsert]    Script Date: 21/1/2021 17:33:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER   TRIGGER [dbo].[BitacoraBeneficiarioUpdate] ON [dbo].[Beneficiario]
AFTER UPDATE --, DElETE
AS

BEGIN
	
	SET NOCOUNT ON;
	DECLARE @idTipoDeEvento INT
	DECLARE @idUser VARCHAR(50)
	DECLARE @ip VARCHAR(50)
	DECLARE @fecha DATE
	DECLARE @xmlAntes VARCHAR(1000)
	DECLARE @xmlDespues VARCHAR(1000)
	DECLARE @LineCode VARCHAR(500)

	DECLARE @idBeneficiario INT
	DECLARE @idTipoParentezco INT
	DECLARE @idPersona INT
	DECLARE @idCuentaAhorro INT
	DECLARE @porcentaje INT
	DECLARE @activo BIT
	DECLARE @insertAt DATETIME
	DECLARE @insertBy VARCHAR(50)
	DECLARE @insertIn VARCHAR(50)
	DECLARE @updateAt DATETIME
	DECLARE @updateIn VARCHAR(50)
	DECLARE @updateBy VARCHAR(50)
	DECLARE @Prueba INT
	SELECT 
		 @idBeneficiario = Id
		,@idTipoParentezco = IdTipoParentezco
		,@idPersona = IdPersona
		,@idCuentaAhorro = IdCuentaDeAhorro
		,@porcentaje = Porcentaje
		,@activo = Activo
		,@insertAt = InsertAt
		,@insertBy = InsertBy
		,@insertIn = InsertIn
		,@updateAt = UpdateAt
		,@updateBy = UpdateBy
		,@updateIn = UpdateIn

	FROM Beneficiario --WHERE Id = 2
	

	--SET @xmlAntes = (SELECT * FROM inserted for XML PATH('NuevoBeneficiario'),ROOT ('Beneficiario'))
	--PRINT(@xmlAntes)

	SELECT @idTipoDeEvento = 2
	SELECT @idUser = InsertBy FROM Beneficiario
	SELECT @ip = '192.168.1.1'
	SELECT @fecha = InsertAt FROM Beneficiario

	SELECT @xmlAntes = '<Beneficiario Id = '+CONVERT(VARCHAR(50),@idBeneficiario)+' IdTipoParentezco = '+CONVERT(VARCHAR(50),@idTipoParentezco)+' IdPersona = '+CONVERT(VARCHAR(50),@idPersona)+' IdCuentaDeAhorro ='+CONVERT(VARCHAR(50),@idCuentaAhorro)+' Porcentaje = '+CONVERT(VARCHAR(50),@porcentaje)+' Activo = '+CONVERT(VARCHAR(50),@activo)+' InsertAt = '+CONVERT(VARCHAR(50),@insertAt)+' InsertBy = '+CONVERT(VARCHAR(50),@insertBy)+' InsertIn = '+CONVERT(VARCHAR(50),@insertIn)+' />'
	SET @xmlDespues = @xmlAntes
	--PRINT(@LineCode)
	--SELECT @xmlDespues = ''
	--SELECT @Prueba = porcentaje FROM Beneficiario WHERE Id =@idBeneficiario
	--print(@Prueba)
	BEGIN TRY
		INSERT INTO [dbo].[Evento]
		(
			 IdTipoEvento
			,Ip
			,IdUser
			,Fecha
			,XMLAntes
			,XMLDespues
		)

		VALUES(
			 @idTipoDeEvento
			,@ip
			,1
			,@fecha
			,@xmlAntes
			,@xmlDespues
			);
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50125, @Descripcion = 'ERROR AL  ejecutarse el TRIGGER de update de Beneficiario para insertar evento Beneficiario ([[BitacoraBeneficioInsert]])'
		--RETURN 50120

	END CATCH
	SET NOCOUNT OFF;

--	EXEC [dbo].[SPActualizarBeneficiario] @pIdBeneficiario = 1,@pIdPersona = 2,@pParentezco = 'Padre',@pIdCuenta = 1,@pPorcentaje = 6,@pNombre = 'Ulises',@pValorDocumentoIdentidad = '40346810',@pFechaNacimiento = "10/2/1984" ,@pTelefono1 = '60669560',@pTelefono2 = '60669560',@pCorreoElectronico = 'uli.rp'

END