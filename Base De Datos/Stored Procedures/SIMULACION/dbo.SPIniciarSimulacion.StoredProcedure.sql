USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPIniciarSimulacion]    Script Date: 1/12/2020 03:35:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[SPIniciarSimulacion]
AS
DECLARE	@return_value int

EXEC    @return_value = [dbo].[SPVaciar_Tablas]
EXEC	@return_value = [dbo].[SPCargar_Catalogos]
EXEC    @return_value = [dbo].[SPSimulacion]
--EXEC	@return_value = [dbo].[SPCargar_Operaciones_Usuarios]
		

SELECT	'Return Value' = @return_value


--SELECT * FROM Persona
--SELECT * FROM CuentaAhorro
--SELECT * FROM Beneficiario
--SELECT * FROM Movimiento

  --DELETE FROM Persona
  --DELETE FROM CuentaAhorro
  --DELETE FROM Beneficiario
