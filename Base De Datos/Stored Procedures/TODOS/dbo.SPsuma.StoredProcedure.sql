USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPsuma]    Script Date: 10/11/2020 20:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE	PROCEDURE [dbo].[SPsuma]
AS
BEGIN  
SELECT SUM(Porcentaje) AS SUMA FROM [dbo].[Beneficiario] WHERE Id = 1;
END
GO
