USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPFindIdCA]    Script Date: 10/11/2020 20:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  	PROCEDURE [dbo].[SPFindIdCA]
(      
   @pNumeroCuentaDeAhorro	INT 
)      
AS

BEGIN      
   SELECT 
		 Id

	FROM 
		[dbo].[CuentaAhorro] 

	WHERE 

		NumeroDeCuenta = @pNumeroCuentaDeAhorro
		
	
END


--EXEC [SPObtenerEstadosCuenta] @pIdCuentaDeAhorro = 1
GO
