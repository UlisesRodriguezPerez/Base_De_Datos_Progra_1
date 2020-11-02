
-- ==============================================================================
-- Author:		Natalia Vargas 
-- Create date: 02/11/2020
-- Description:	Buscar a una persona en la tabla [dbo].[EstadoCuenta]
-- ==============================================================================

USE [BD_TP1_Cuenta_De_Ahorros]
GO
CREATE PROCEDURE [dbo].[SPActualizarEstadoCuenta]
(		
		 @pId INT
		,@pFechaFinal DATE
		,@pSaldoFinal MONEY
)

AS 
BEGIN       
   Update 
		[dbo].[EstadoCuenta]
   SET 
		 FechaFinal = @pFechaFinal
		,SaldoFinal = @pSaldoFinal

   WHERE 
		Id=@pId   
END


--EXEC SPActualizarEstadoCuenta @pId=1,@pFechaFinal='2020-11-12',@pSaldoFinal=145000000;
--SELECT * FROM [dbo].[EstadoCuenta]
--DROP PROCEDURE SPActualizarEstadoCuenta;
GO