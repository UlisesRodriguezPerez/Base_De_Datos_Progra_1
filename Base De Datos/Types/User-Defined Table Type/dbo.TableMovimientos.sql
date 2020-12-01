USE BD_TP1_Cuenta_De_Ahorros
GO


IF type_id('[dbo].[TableMovimiento]') IS NOT NULL
        DROP TYPE [dbo].[TableMovimiento]; 

CREATE TYPE TableMovimiento AS TABLE
		(
			 id iNT IDENTITY(1,1) 
			,idTipoMovimiento INT
			,numeroCuenta INT
			,monto MONEY
			,fecha DATE
			,descripcion VARCHAR(100)
		)


		
