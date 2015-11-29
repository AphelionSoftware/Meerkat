
-- =============================================
-- Author:		Andreas Bergstedt
-- Create date: 2013-03-15
-- Description:	Creates basic System Parameters for delta and processing
-- =============================================
CREATE PROCEDURE [dbo].[uspCreateSysDefaultColumns]
	@@FTable as Nvarchar(500)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

 
--Declare @@FTable as Nvarchar(500) = 'app.Output'
Declare @@Table as Nvarchar(500) = Substring(@@FTable,(Charindex('.',@@FTable,1)+1),500)
Declare @@TableSchema as Nvarchar(255) = Substring(@@FTable,1,(Charindex('.',@@FTable,1)-1))-- 'app'
Declare @@SQL as Nvarchar(Max)
--Select @@Table,@@FTable,@@TableSchema

Set @@SQL ='
IF not EXISTS( SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
            WHERE TABLE_NAME = ''' + @@Table + '''
            And TABLE_SCHEMA = ''' + @@TableSchema + ''' 
           AND  COLUMN_NAME = ''sys_CreatedOn'') ALTER TABLE ' + @@TableSchema + '.' + @@Table +' ADD sys_CreatedOn DateTime  Null  
IF not EXISTS( SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
            WHERE TABLE_NAME = ''' + @@Table + ''' 
            And TABLE_SCHEMA = ''' + @@TableSchema + ''' 
           AND  COLUMN_NAME = ''sys_CreatedBy'') ALTER TABLE ' + @@TableSchema + '.' + @@Table +' add sys_CreatedBy Nvarchar(255)  Null

IF not EXISTS( SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
            WHERE TABLE_NAME = ''' + @@Table + ''' 
            And TABLE_SCHEMA = ''' + @@TableSchema + ''' 
           AND  COLUMN_NAME = ''sys_ModifiedOn'') ALTER TABLE ' + @@TableSchema + '.' + @@Table +' add sys_ModifiedOn DateTime  Null 

IF not EXISTS( SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
            WHERE TABLE_NAME = ''' + @@Table + ''' 
            And TABLE_SCHEMA = ''' + @@TableSchema + ''' 
           AND  COLUMN_NAME = ''sys_ModifiedBy'') ALTER TABLE ' + @@TableSchema + '.' + @@Table +' add sys_ModifiedBy Nvarchar(255)  Null 

IF not EXISTS( SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
            WHERE TABLE_NAME = ''' + @@Table + ''' 
            And TABLE_SCHEMA = ''' + @@TableSchema + ''' 
           AND  COLUMN_NAME = ''Active'') ALTER TABLE ' + @@TableSchema + '.' + @@Table +' add Active Int Not Null DEFAULT 1

'


--Select @@SQL
Exec (@@SQL)

END

