
-- ==============================================================================
-- Author:		Natalia Vargas 
-- Create date: 19/10/2020
-- Description:	Insertar beneficiarios en la tabla [dbo].[Beneficiario]
-- ==============================================================================

USE [BD_TP1_Cuenta_De_Ahorros]
GO

CREATE PROCEDURE [dbo].[SPInsertarBeneficiario]
@pIdTipoParentezco INT,
@pIdPersona INT,
@pIdDeCuentaAhorro INT,
@pPorcentaje INT

AS 
BEGIN
	INSERT 
	INTO [dbo].[Beneficiario]
	(IdTipoParentezco, IdPersona, IdCuentaDeAhorro,Porcentaje,InsertAt,UpdateAt,InsertBy,UpdateBy,InsertIn,UpdateIn)

	VALUES (@pIdTipoParentezco,@pIdPersona,@pIdDeCuentaAhorro,@pPorcentaje,GETDATE(),GETDATE(),'A','A','A','A');

END

--SELECT * FROM Beneficiario
--SELECT * FROM CuentaAhorro
--SELECT * FROM Persona
--DROP PROCEDURE SPInsertarBeneficiario;
--GO
EXEC SPInsertarBeneficiario 2,1,1,36;