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
INSERT INTO [Core].[LocationType]
           ([Code], [Name], [Description], [BusinessKey])
     SELECT
          'CNTRY' ,'Country' ,'Country', 'CNTRY' WHERE NOT EXISTS (SELECT 1 FROM [Core].[LocationType] WHERE [Code]  ='CNTRY')

INSERT INTO [Core].[LocationType]
           ([Code], [Name], [Description], [BusinessKey])
     SELECT
          'TERR' ,'Territory' ,'Territory', 'TERR' WHERE NOT EXISTS (SELECT 1 FROM [Core].[LocationType] WHERE [Code]  ='TERR')

          
INSERT INTO [Core].[LocationType]
           ([Code], [Name], [Description], [BusinessKey])
     SELECT
          'REG' ,'Region' ,'Region', 'REG' WHERE NOT EXISTS (SELECT 1 FROM [Core].[LocationType] WHERE [Code]  ='REG')

          
INSERT INTO [Core].[LocationType]
           ([Code], [Name], [Description], [BusinessKey])
     SELECT
          'CNTY' ,'County' ,'County', 'CNTY' WHERE NOT EXISTS (SELECT 1 FROM [Core].[LocationType] WHERE [Code]  ='CNTY')
		  
INSERT INTO [Core].[LocationType]
           ([Code], [Name], [Description], [BusinessKey])
     SELECT
          'VILG' ,'Village' ,'Village', 'VILG' WHERE NOT EXISTS (SELECT 1 FROM [Core].[LocationType] WHERE [Code]  ='VILG')

INSERT INTO [Core].[LocationType]
           ([Code], [Name], [Description], [BusinessKey])
     SELECT
          'CITY' ,'City' ,'City', 'CITY' WHERE NOT EXISTS (SELECT 1 FROM [Core].[LocationType] WHERE [Code]  ='CITY')

GO