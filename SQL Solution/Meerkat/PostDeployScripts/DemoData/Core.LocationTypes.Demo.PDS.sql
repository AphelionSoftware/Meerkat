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
           ([Code], [Name], [Description])
     SELECT
          'CONT' ,'Continent' ,'Continent' WHERE NOT EXISTS (SELECT 1 FROM [Core].[LocationType] WHERE [Code]  ='CONT')

INSERT INTO [Core].[LocationType]
           ([Code], [Name], [Description])
     SELECT
          'CNTRY' ,'Country' ,'Country' WHERE NOT EXISTS (SELECT 1 FROM [Core].[LocationType] WHERE [Code]  ='CNTRY')

          
INSERT INTO [Core].[LocationType]
           ([Code], [Name], [Description])
     SELECT
          'REG' ,'Region' ,'Region' WHERE NOT EXISTS (SELECT 1 FROM [Core].[LocationType] WHERE [Code]  ='REG')

          
INSERT INTO [Core].[LocationType]
           ([Code], [Name], [Description])
     SELECT
          'PROV' ,'Province' ,'Province' WHERE NOT EXISTS (SELECT 1 FROM [Core].[LocationType] WHERE [Code]  ='PROV')

INSERT INTO [Core].[LocationType]
           ([Code], [Name], [Description])
     SELECT
          'CNTY' ,'County' ,'County' WHERE NOT EXISTS (SELECT 1 FROM [Core].[LocationType] WHERE [Code]  ='CNTY')


INSERT INTO [Core].[LocationType]
           ([Code], [Name], [Description])
     SELECT
          'CTY' ,'City' ,'City' WHERE NOT EXISTS (SELECT 1 FROM [Core].[LocationType] WHERE [Code]  ='CTY')


INSERT INTO [Core].[LocationType]
           ([Code], [Name], [Description])
     SELECT
          'TWN' ,'Town' ,'Town' WHERE NOT EXISTS (SELECT 1 FROM [Core].[LocationType] WHERE [Code]  ='TWN')


INSERT INTO [Core].[LocationType]
           ([Code], [Name], [Description])
     SELECT
          'Municipality' ,'Municipality' ,'Municipality' WHERE NOT EXISTS (SELECT 1 FROM [Core].[LocationType] WHERE [Code]  ='Municipality')

GO