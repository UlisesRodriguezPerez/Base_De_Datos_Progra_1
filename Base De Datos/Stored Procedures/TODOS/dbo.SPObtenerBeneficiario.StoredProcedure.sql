USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerBeneficiario]    Script Date: 10/11/2020 20:32:14 ******/
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
		B.Id = @Id 

END
GO
