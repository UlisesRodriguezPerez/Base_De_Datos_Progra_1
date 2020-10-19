exec msdb.dbo.rds_download_from_s3
 @s3_arn_of_file='arn:aws:s3:::bucket-xml/PruebaCatalogo.xml',
 @rds_file_path='D:\S3\bucket-xml\PruebaCatalogo.xml',
 @overwrite_file=1;
