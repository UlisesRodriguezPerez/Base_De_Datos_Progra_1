USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerBeneficiariosCuenta]    Script Date: 4/12/2020 11:47:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SPObtenerBeneficiariosCuenta]
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
