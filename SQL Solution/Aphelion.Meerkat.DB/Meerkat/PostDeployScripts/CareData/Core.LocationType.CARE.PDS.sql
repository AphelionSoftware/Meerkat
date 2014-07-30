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
          'CONT' ,'Continent' ,'Continent', 'CONT' WHERE NOT EXISTS (SELECT 1 FROM [Core].[LocationType] WHERE [Code]  ='CONT')

INSERT INTO [Core].[LocationType]
           ([Code], [Name], [Description], [BusinessKey])
     SELECT
          'CNTRY' ,'Country' ,'Country', 'CNTRY' WHERE NOT EXISTS (SELECT 1 FROM [Core].[LocationType] WHERE [Code]  ='CNTRY')

          
INSERT INTO [Core].[LocationType]
           ([Code], [Name], [Description], [BusinessKey])
     SELECT
          'REG' ,'Region' ,'Region', 'REG' WHERE NOT EXISTS (SELECT 1 FROM [Core].[LocationType] WHERE [Code]  ='REG')

          
INSERT INTO [Core].[LocationType]
           ([Code], [Name], [Description], [BusinessKey])
     SELECT
          'DIST' ,'District' ,'District', 'DIST' WHERE NOT EXISTS (SELECT 1 FROM [Core].[LocationType] WHERE [Code]  ='DIST')

INSERT INTO [Core].[LocationType]
           ([Code], [Name], [Description], [BusinessKey])
     SELECT
          'VILG' ,'Village' ,'Village', 'VILG' WHERE NOT EXISTS (SELECT 1 FROM [Core].[LocationType] WHERE [Code]  ='VILG')

GO