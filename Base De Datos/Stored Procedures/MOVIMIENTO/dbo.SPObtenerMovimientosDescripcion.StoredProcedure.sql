USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerMovimientosDescripcion]    Script Date: 1/12/2020 04:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER       PROCEDURE [dbo].[SPObtenerMovimientosDescripcion]
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
		PRINT  'Algo salió mal al obtener las compras.'
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END

--SELECT * FROM CuentaAhorro --WHERE NumeroDeCuenta = 11326139
--SELECT * FROM UsuarioPuedeAccesar --WHERE IdCuentaDeAhorros = 1
--EXEC [dbo].[SPObtenerMovimientosDescripcion] @pDescripcion = 'Prueba',@pCategoria = 'Prueba'  ,@pIdUsuarioPA = 1;