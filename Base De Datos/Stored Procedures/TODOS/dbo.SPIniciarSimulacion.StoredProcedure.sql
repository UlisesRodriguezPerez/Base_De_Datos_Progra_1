USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPIniciarSimulacion]    Script Date: 5/12/2020 23:48:32 ******/
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
