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

/*Sectors Meerkat*/

SET IDENTITY_INSERT [app].[Sector] ON
GO

INSERT INTO [app].[Project]
           ([Code]
           ,[ShortName]
           ,[LongName]
           ,[TextDescription]
          
           ,[Sector_ID]
          
           ,[BusinessKey]
           ,[ProjectSiteName]
          )

		 SELECT [Code]
           ,[ShortName]
           ,[LongName]
           ,[TextDescription]
          
           ,[Sector_ID]
          
           ,[BusinessKey]
           ,[ProjectSiteName]

		   FROM 
		   (
		    SELECT 'PRJ2.1' [Code]
           ,'Textbooks' [ShortName]
           ,'Deliver Textbooks' [LongName]
           ,'Deliver Textbooks' [TextDescription]
          
           , [Sector_ID]
          
           ,'PRJ2.1' [BusinessKey]
           ,'' [ProjectSiteName]
		   FROM app.Sector S
		   WHERE  S.BusinessKey ='RVWP'

		   ) src
      WHERE   NOT EXISTS ( SELECT 1
                             FROM   [app].[Project]
                             WHERE  [app].[Project].[BusinessKey] = src.BusinessKey) 

							 GO



 SET IDENTITY_INSERT [app].[Sector]  OFF
