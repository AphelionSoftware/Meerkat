/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

INSERT INTO [settings].[GlobalSettings]
           ([Code]
           ,[Name]
           ,[Value]
           )
     SELECT 
	 Code, Name, Value 
	 FROM (
		SELECT 
		'MMBASEURL' AS Code
		, 'MegaMenu Base URL' AS Name 
		, '/sites/Meerkat/' as Value)
		Src
	 WHERE NOT EXISTS 
	 (SELECT 1 FROM settings.GlobalSettings
	 WHERE Src.Code = GlobalSettings.Code)


	 INSERT INTO [settings].[GlobalSettings]
           ([Code]
           ,[Name]
           ,[Value]
           )
     SELECT 
	 Code, Name, Value 
	 FROM (
		SELECT 
		'BASESITEURL' AS Code
		, 'Fully qualified Base URL' AS Name 
		, 'http://mgs-m6700/sites/Meerkat/' as Value)
		Src
	 WHERE NOT EXISTS 
	 (SELECT 1 FROM settings.GlobalSettings
	 WHERE Src.Code = GlobalSettings.Code)