USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerBeneficiariosTotales]    Script Date: 21/1/2021 20:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[SPObtenerBeneficiariosTotales]

AS 
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
	DECLARE @MontoTotal MONEY
	DECLARE @CantidadCuentas INT
	DECLARE @CuentaMayorBeneficio INT
	DECLARE @saldoMayor MONEY
	DECLARE @inicio INT
	DECLARE @fin INT
	DECLARE @idPersona INT
	DECLARE @tabla TABLE (Nombre VARCHAR(50),NumeroCuenta INT,Cantidad INT,MontoTotal MONEY); 

	WITH DISTINTO (id) AS (SELECT DISTINCT IdPersona FROM Beneficiario)
	SELECT @inicio = MIN(B.Id) , @fin = MAX(B.Id) FROM DISTINTO B
	
	WHILE @inicio <= @fin
	BEGIN
	    
		SELECT @idPersona = B.IdPersona FROM Beneficiario B WHERE B.Id = @inicio
		SELECT @saldoMayor = MAX(CA.Saldo) FROM CuentaAhorro CA INNER JOIN Beneficiario B ON CA.Id = B.IdCuentaDeAhorro 
															INNER JOIN Persona P ON B.IdPersona = P.Id WHERE B.IdPersona = @idPersona
     INSERT @tabla(
				Nombre
				,NumeroCuenta
				,Cantidad
				,MontoTotal
				)
		
		SELECT
		 	  P.Nombre
			 ,(SELECT CA.NumeroDeCuenta FROM CuentaAhorro CA WHERE @saldoMayor = Ca.Saldo) --AS 'CuentaMayorBeneficio'
			 ,COUNT(B.Id) --AS 'CantidadCuentas'
			 ,SUM((CA.Saldo * B.Porcentaje) / 100) AS MontoTotal
			
			--,(SELECT CA.Saldo FROM CuentaAhorro CA WHERE B.IdCuentaDeAhorro = CA.Id)
		FROM [dbo].[Beneficiario] B
		INNER JOIN CuentaAhorro CA ON B.IdCuentaDeAhorro = CA.Id
		INNER JOIN Persona P ON B.IdPersona = P.Id
		INNER JOIN TipoParentezco TP ON B.IdTipoParentezco = TP.Id 

		WHERE  B.IdCuentaDeAhorro = CA.Id AND P.Id = @idPersona
		GROUP BY B.IdPersona, P.Nombre

		----PRINT(@MontoTotal)
		--SELECT * FROM CuentaAhorro CA INNER JOIN Beneficiario B ON CA.Id = B.IdCuentaDeAhorro 
		--ORDER BY MontoTotal DESC--B.IdPersona,P.Nombre,CA.Saldo					      --INNER JOIN Persona P ON B.IdPersona = P.Id WHERE B.IdPersona = 2

		--WHERE CA.Id = B.
		--SELECT B.Porcentaje FROM Beneficiario B  
		--INNER JOIN CuentaAhorro CA ON B.IdCuentaDeAhorro = CA.Id
		--WHERE CA.Id = B.IdCuentaDeAhorro
		SET @inicio = @inicio + 1
		END
		SELECT DISTINCT   Nombre
				,NumeroCuenta
				,Cantidad
				,MontoTotal
	FROM @tabla
	ORDER BY MontoTotal DESC
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
