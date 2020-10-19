USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPCargar_Catalogos]    Script Date: 19/10/2020 10:06:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[SPCargar_Catalogos]
AS

/*    Parsear el XML e insertar datos en la tabla    */
DECLARE @DocumentoXML XML;
SELECT @DocumentoXML = DXML
FROM OPENROWSET(  
   BULK 'D:\S3\bucket-xml\PruebaCatalogo.xml', SINGLE_BLOB) AS DocumentoXML(DXML);  

		/* Inserta en las siguientes tablas sus valores correspondientes, según el XML.*/
INSERT INTO [dbo].[TipoDocumentoIdentidad]([Id],[Nombre])
SELECT	d.value('@Id', 'INT')
		, d.value('@Nombre', 'VARCHAR(100)')
FROM @DocumentoXML.nodes('/Tipo_Doc/TipoDocuIdentidad') AS t(d)



 
INSERT INTO [dbo].[TipoMoneda]([Id],[Nombre],[Simbolo])
SELECT	d.value('@Id', 'INT')
		, d.value('@Nombre', 'VARCHAR(100)')
		, d.value('@Simbolo', 'nvarchar(1)')
FROM @DocumentoXML.nodes('/Tipo_Moneda/TipoMoneda') AS t(d)




INSERT INTO [dbo].[TipoParentezco]([Id],[Nombre])
SELECT	d.value('@Id', 'INT')
		, d.value('@Nombre', 'VARCHAR(100)')
FROM @DocumentoXML.nodes('/Parentezcos/Parentezco') AS t(d)




INSERT INTO [dbo].[TipoCuentaAhorro](
		 [Id]
		,[Nombre]
		,[IdTipoMoneda]
		,[SaldoMinimo]
		,[MultaSaldoMinimo]
		,[CargoAnual]
		,[MaxcajeroHumano]
		,[MaxCajeroAutomatico]
		,[CobroCajeroHumano]
		,[CobroCajeroAutomatico]
		,[ComisionPorServicio]
		,[Interes]
	)
SELECT	d.value('@Id', 'INT')
		, d.value('@Nombre', 'VARCHAR(100)')
		, d.value('@IdTipoMoneda', 'INT')
		, d.value('@SaldoMinimo', 'MONEY')
		, d.value('@MultaSaldoMin', 'MONEY')
		, d.value('@CargoAnual', 'MONEY')
		, d.value('@NumRetirosHumano', 'INT')
		, d.value('@NumRetirosAutomatico', 'INT')
		, d.value('@comisionHumano', 'MONEY')
		, d.value('@comisionAutomatico', 'MONEY')
		, d.value('@comisionServicio', 'MONEY')
		, d.value('@interes', 'INT'
	)
FROM @DocumentoXML.nodes('/Tipo_Cuenta_Ahorros/TipoCuentaAhorro') AS t(d)




/*
--este codigo ve si hay algo en el xml sin ingresar nada en las tablas

SELECT * FROM OPENROWSET(  
   BULK 'D:\S3\bucket-xml\PruebaCatalogo.xml',  
   SINGLE_BLOB) AS x;  

SELECT CONVERT(XML, BulkColumn) AS BulkColumn, GETDATE() 
FROM OPENROWSET(BULK 'D:\S3\bucket-xml\PruebaCatalogo.xml', SINGLE_BLOB) AS x;


*/

