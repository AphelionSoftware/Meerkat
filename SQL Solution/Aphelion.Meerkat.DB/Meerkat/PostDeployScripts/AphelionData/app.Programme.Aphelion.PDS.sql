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

/*Programmes Meerkat*/

SET IDENTITY_INSERT [app].[Programme] ON
GO

INSERT  [app].[Programme]
        ( [app].[Programme].[Programme_ID]
          ,[app].[Programme].[Code]
          ,[app].[Programme].[ShortName]
          ,[app].[Programme].[LongName]
          ,[app].[Programme].[TextDescription]
          ,[app].[Programme].[BusinessKey]
          ,[app].[Programme].[ProgrammeSiteName]
          )
        SELECT 
		 [Programme_ID]
		,[Code]
		,[ShortName]
		,[LongName]
		,[TextDescription]
		,[BusinessKey]
		,[ProgrammeSiteName]
		FROM 				 
		(SELECT 
		
		 1 AS Programme_ID,
                N'PRG1' AS Code,
                N'Meerkat Development' As ShortName,
                N'Meerkat Development' As LongName,
                N'Meerkat Development' As TextDescription,
                N'PRG1.Meerkat' AS BusinessKey,
                N'Meerkat' as ProgrammeSiteName
				) as Src
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   [app].[Programme]
                             WHERE  [app].[Programme].[BusinessKey] = src.BusinessKey) 

GO


INSERT  [app].[Programme]
        ( [app].[Programme].[Programme_ID]
          ,[app].[Programme].[Code]
          ,[app].[Programme].[ShortName]
          ,[app].[Programme].[LongName]
          ,[app].[Programme].[TextDescription]
          ,[app].[Programme].[BusinessKey]
          ,[app].[Programme].[ProgrammeSiteName]
          )
        SELECT 
		 [Programme_ID]
		,[Code]
		,[ShortName]
		,[LongName]
		,[TextDescription]
		,[BusinessKey]
		,[ProgrammeSiteName]
		FROM 				 
		(SELECT 
		
		 2 AS Programme_ID,
                N'PRG2' AS Code,
                N'WCP Development' As ShortName,
                N'WeChat Platform Development' As LongName,
                N'WeChat Platform Development' As TextDescription,
                N'PRG2.WCP' AS BusinessKey,
                N'WCP' as ProgrammeSiteName
				) as Src
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   [app].[Programme]
                             WHERE  [app].[Programme].[BusinessKey] = src.BusinessKey) 

GO


INSERT  [app].[Programme]
        ( [app].[Programme].[Programme_ID]
          ,[app].[Programme].[Code]
          ,[app].[Programme].[ShortName]
          ,[app].[Programme].[LongName]
          ,[app].[Programme].[TextDescription]
          ,[app].[Programme].[BusinessKey]
          ,[app].[Programme].[ProgrammeSiteName]
          )
        SELECT 
		 [Programme_ID]
		,[Code]
		,[ShortName]
		,[LongName]
		,[TextDescription]
		,[BusinessKey]
		,[ProgrammeSiteName]
		FROM 				 
		(SELECT 
		
		 3 AS Programme_ID,
                N'PRG3' AS Code,
                N'Services' As ShortName,
                N'Services Delivery' As LongName,
                N'Services Delivery' As TextDescription,
                N'PRG3.Services' AS BusinessKey,
                N'Services' as ProgrammeSiteName
				) as Src
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   [app].[Programme]
                             WHERE  [app].[Programme].[BusinessKey] = src.BusinessKey) 

GO


INSERT  [app].[Programme]
        ( [app].[Programme].[Programme_ID]
          ,[app].[Programme].[Code]
          ,[app].[Programme].[ShortName]
          ,[app].[Programme].[LongName]
          ,[app].[Programme].[TextDescription]
          ,[app].[Programme].[BusinessKey]
          ,[app].[Programme].[ProgrammeSiteName]
          )
        SELECT 
		 [Programme_ID]
		,[Code]
		,[ShortName]
		,[LongName]
		,[TextDescription]
		,[BusinessKey]
		,[ProgrammeSiteName]
		FROM 				 
		(SELECT 
		
		 4 AS Programme_ID,
                N'PRG4' AS Code,
                N'Marketing' As ShortName,
                N'Marketing' As LongName,
                N'Marketing' As TextDescription,
                N'PRG3.Mkt' AS BusinessKey,
                N'Marketing' as ProgrammeSiteName
				) as Src
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   [app].[Programme]
                             WHERE  [app].[Programme].[BusinessKey] = src.BusinessKey) 
GO


 SET IDENTITY_INSERT [app].[Programme]  OFF
