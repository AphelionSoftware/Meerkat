/*
 Pre-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be executed before the build script.	
 Use SQLCMD syntax to include a file in the pre-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the pre-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

UPDATE App.Indicator 
SET BusinessKey = BusinessKey + CAST ( indicator_ID as varchar(20))
WHERE BusinessKey IN (
  select businesskey from app.indicator
  group by BusinessKey having count(*) > 1
)
GO
UPDATE App.SubSector
SET BusinessKey = BusinessKey + CAST ( Sector_ID as varchar(20))
WHERE BusinessKey IN (
  select businesskey from app.SubSector
  group by BusinessKey having count(*) > 1
)
GO

UPDATE app.Indicator SET BusinessKey = BusinessKey + '_I' 
WHERE EXISTS (SELECT BusinessKey FROM app.Project WHERE Project.BusinessKey = Indicator.BusinessKey)
GO

ALTER TABLE [RBM].[PeopleReachedValues]
ALTER COLUMN [Notes]  varchar (8000)  NULL 
ALTER TABLE [forms].[Response]
ALTER COLUMN [Response]  varchar (8000)  NULL 
ALTER TABLE [Core].[DataSource]
ALTER COLUMN [ContactDetails]  varchar (8000)  NULL 
ALTER TABLE [Core].[DataSource]
ALTER COLUMN [Custodian]  varchar (8000)  NULL 
ALTER TABLE [Core].[DataSource]
ALTER COLUMN [Format]  varchar (8000)  NULL 
ALTER TABLE [Core].[DataSource]
ALTER COLUMN [CollectionMethod]  varchar (8000)  NULL 
ALTER TABLE [Core].[DataSource]
ALTER COLUMN [MetadataStatus]  varchar (8000)  NULL 
ALTER TABLE [RBM].[MilestoneValues]
ALTER COLUMN [Notes]  varchar (8000)  NULL 
ALTER TABLE [RBM].[IndicatorValues]
ALTER COLUMN [Notes]  varchar (8000)  NULL 
ALTER TABLE [Core].[Person]
ALTER COLUMN [Title]  varchar (8000)  NULL 
ALTER TABLE [Core].[Person]
ALTER COLUMN [ContactDetails]  varchar (8000)  NULL 
ALTER TABLE [Core].[Person]
ALTER COLUMN [Category]  varchar (8000)  NULL 
ALTER TABLE [RBM].[StatusValues]
ALTER COLUMN [Notes]  varchar (8000)  NULL 
ALTER TABLE [Core].[LocationType]
ALTER COLUMN [Description]  varchar (8000) 
ALTER TABLE [Core].[Location]
ALTER COLUMN [Density]  varchar (8000)  NULL 
ALTER TABLE [forms].[FormResponse]
ALTER COLUMN [Text]  varchar (8000)  NULL 
ALTER TABLE [Core].[OrganizationType]
ALTER COLUMN [Description]  varchar (8000)  NULL 
ALTER TABLE [Core].[Role]
ALTER COLUMN [Description]  varchar (8000)  NULL 
ALTER TABLE [app].[Indicator]
ALTER COLUMN [BaselineString]  varchar (8000)  NULL 
ALTER TABLE [app].[Indicator]
ALTER COLUMN [TargetString]  varchar (8000)  NULL 
ALTER TABLE [app].[Indicator]
ALTER COLUMN [Notes]  varchar (8000)  NULL 
ALTER TABLE [app].[Milestone]
ALTER COLUMN [BaselineString]  varchar (8000)  NULL 
ALTER TABLE [app].[Milestone]
ALTER COLUMN [TargetString]  varchar (8000)  NULL 
ALTER TABLE [app].[Milestone]
ALTER COLUMN [Notes]  varchar (8000)  NULL 
ALTER TABLE [forms].[Question]
ALTER COLUMN [Response]  varchar (8000)  NULL 
ALTER TABLE [Core].[DataVersion]
ALTER COLUMN [Description]  varchar (8000) 