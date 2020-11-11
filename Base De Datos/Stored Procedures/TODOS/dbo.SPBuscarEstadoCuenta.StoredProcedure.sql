USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPBuscarEstadoCuenta]    Script Date: 10/11/2020 20:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE	PROCEDURE [dbo].[SPBuscarEstadoCuenta]
(      
	@pId	INT 
)      
AS
BEGIN      
   SELECT 
		 IdCuentaDeAhorro
		,FechaInicio
		,FechaFinal
		,SaldoInicial
		,SaldoFinal

	FROM 
		[dbo].[EstadoCuenta]
	WHERE 
		Id=@pId  
END
GO
