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

INSERT  [app].[Sector]
        ( [app].[Sector].[Programme_ID]
          
		  ,[app].[Sector].[Sector_ID]
          ,[app].[Sector].[Code]
          ,[app].[Sector].[ShortName]
          ,[app].[Sector].[LongName]
          ,[app].[Sector].[TextDescription]
          ,[app].[Sector].[BusinessKey]
          )
        SELECT 
		Programme_ID,
		 [Sector_ID]
		,[Code]
		,[ShortName]
		,[LongName]
		,[TextDescription]
		,[BusinessKey]
		FROM 				 
		(SELECT 
		PRG.Programme_ID,
		 1 AS Sector_ID,
                N'PRG1' AS Code,
                N'Rural Woman' As ShortName,
                N'Rural Vulnerable Women Sector' As LongName,
                N'Rural Vulnerable Women Sector' As TextDescription,
                N'RVWP' AS BusinessKey

			FROM app.Programme PRG 
			WHERE PRG.BusinessKey = 'RVWP'
				) as Src
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   [app].[Sector]
                             WHERE  [app].[Sector].[BusinessKey] = src.BusinessKey) 

GO



 SET IDENTITY_INSERT [app].[Sector]  OFF
