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
                N'Rural Woman' As ShortName,
                N'Rural Vulnerable Women Programme' As LongName,
                N'Rural Vulnerable Women Programme' As TextDescription,
                N'RVWP' AS BusinessKey,
                N'RVWP' as ProgrammeSiteName
				) as Src
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   [app].[Programme]
                             WHERE  [app].[Programme].[BusinessKey] = src.BusinessKey) 

GO



 SET IDENTITY_INSERT [app].[Programme]  OFF
