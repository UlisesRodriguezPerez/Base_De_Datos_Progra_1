USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPEliminarLogicoBeneficiario]    Script Date: 10/11/2020 20:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   PROCEDURE [dbo].[SPEliminarLogicoBeneficiario]
(
	@Id INT
)

AS  
BEGIN       
   UPDATE 
		[dbo].[Beneficiario]
   SET 
		 Activo = 0
   WHERE 
		Id = @Id     
END
GO
