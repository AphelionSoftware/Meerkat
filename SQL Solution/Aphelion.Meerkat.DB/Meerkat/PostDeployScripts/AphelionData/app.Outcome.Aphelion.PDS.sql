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

/*Outcomes Meerkat*/

SET IDENTITY_INSERT [app].[Outcome] ON 


GO


INSERT  [app].[Outcome]
        ( [app].[Outcome].[Outcome_ID]
          ,[app].[Outcome].[Code]
          ,[app].[Outcome].[ShortName]
          ,[app].[Outcome].[LongName]
          ,[app].[Outcome].[TextDescription]
          ,[app].[Outcome].[BusinessKey]
          ,[app].[Outcome].[OutcomeSiteName]
		  ,[app].[Outcome].[DataVersion]
		  
          )
        SELECT 
		 [Outcome_ID]
		,[Code]
		,[ShortName]
		,[LongName]
		,[TextDescription]
		,[BusinessKey]
		,[OutcomeSiteName]
		,[DataVersion]
		FROM 				 
		(SELECT 
		
		 1 AS Outcome_ID,
                N'OM1' AS Code,
                N'IPM' As ShortName,
                N'Individual Performance Management' As LongName,
                N'Individual Performance Management' As TextDescription,
                N'OM1.IPM' AS BusinessKey,
                N'IPM' as OutcomeSiteName,
				0 As DataVersion
				
				) as Src
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   [app].[Outcome]
                             WHERE  [app].[Outcome].[BusinessKey] = src.BusinessKey) 



GO


INSERT  [app].[Outcome]
        ( [app].[Outcome].[Outcome_ID]
          ,[app].[Outcome].[Code]
          ,[app].[Outcome].[ShortName]
          ,[app].[Outcome].[LongName]
          ,[app].[Outcome].[TextDescription]
          ,[app].[Outcome].[BusinessKey]
          ,[app].[Outcome].[OutcomeSiteName]
		  ,[app].[Outcome].[DataVersion]
		  
          )
        SELECT 
		 [Outcome_ID]
		,[Code]
		,[ShortName]
		,[LongName]
		,[TextDescription]
		,[BusinessKey]
		,[OutcomeSiteName]
		,[DataVersion]
		FROM 				 
		(SELECT 
		
		 2 AS Outcome_ID,
                N'OM2' AS Code,
                N'Sales' As ShortName,
                N'Sales' As LongName,
                N'Sales' As TextDescription,
                N'OM2.Sales' AS BusinessKey,
                N'Sales' as OutcomeSiteName,
				0 As DataVersion
				
				) as Src
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   [app].[Outcome]
                             WHERE  [app].[Outcome].[BusinessKey] = src.BusinessKey) 
 SET IDENTITY_INSERT [app].[Outcome]  OFF
