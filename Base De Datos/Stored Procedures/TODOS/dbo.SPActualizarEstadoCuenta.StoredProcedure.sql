USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPActualizarEstadoCuenta]    Script Date: 10/11/2020 20:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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


--EXEC SPActualizarEstadoCuenta 2020-11-12,145000000;
--SELECT * FROM [dbo].[EstadoCuenta]
--DROP PROCEDURE SPActualizarEstadoCuenta;
GO
