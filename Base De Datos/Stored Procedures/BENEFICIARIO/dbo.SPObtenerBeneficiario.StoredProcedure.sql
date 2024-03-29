USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerBeneficiario]    Script Date: 4/12/2020 11:46:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SPObtenerBeneficiario]
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
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END
