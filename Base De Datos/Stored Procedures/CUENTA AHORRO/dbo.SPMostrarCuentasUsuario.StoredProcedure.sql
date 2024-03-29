USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPMostrarCuentasUsuario]    Script Date: 30/11/2020 23:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER       PROCEDURE [dbo].[SPMostrarCuentasUsuario]   
(
	@id int
)
AS
BEGIN      
	SET NOCOUNT ON;
	BEGIN TRY
	   SELECT
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
		PRINT  'Algo salió mal al mostrar cuentas usuario.'
		RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
END
