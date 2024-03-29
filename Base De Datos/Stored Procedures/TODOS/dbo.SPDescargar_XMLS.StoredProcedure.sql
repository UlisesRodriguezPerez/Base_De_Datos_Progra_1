USE [BD_TP1_Cuenta_De_Ahorros]
GO
/****** Object:  StoredProcedure [dbo].[SPDescargar_XMLS]    Script Date: 5/12/2020 23:48:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPDescargar_XMLS]
AS

/*
Cargar archivos XML en AWS RSD
*/
--como descargar archivos en la nube S3 AWS

exec msdb.dbo.rds_download_from_s3
 @s3_arn_of_file='arn:aws:s3:::bucket-xml/PruebaCatalogo.xml', --nombre del archivo
 @rds_file_path='D:\S3\bucket-xml\PruebaCatalogo.xml', --nombre donde se guarda
 @overwrite_file=1;

exec msdb.dbo.rds_download_from_s3
 @s3_arn_of_file='arn:aws:s3:::bucket-xml/PruebaOperaciones.xml', --nombre del archivo
 @rds_file_path='D:\S3\bucket-xml\PruebaOperaciones.xml', --nombre donde se guarda
 @overwrite_file=1;

GO
