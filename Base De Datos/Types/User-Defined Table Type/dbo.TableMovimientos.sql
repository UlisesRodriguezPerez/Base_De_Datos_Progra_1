USE BD_TP1_Cuenta_De_Ahorros
GO

IF type_id('[dbo].[CuentaAhorroPerTrigger]') IS NOT NULL
        DROP TYPE [dbo].[CuentaAhorroPerTrigger]; 
CREATE TYPE CuentaAhorroPerTrigger AS TABLE
		(
			 id iNT IDENTITY(1,1) 
			,idPersona INT
			,idTipoCuenta INT
			,numeroCuenta INT
			,fechaCreacion DATE
			,saldo MONEY
		)		
