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

INSERT INTO [app].[Programme]
           ([Code]
           ,[LongName]
           ,[BusinessKey]
           ,[ShortName]
		   ,[ProgrammeSiteName]
           ,[TextDescription]


)
SELECT		src.[Code]
           ,src.[LongName]
           ,src.[Code]
           ,src.[ShortName]
           ,src.[ProgrammeSiteName] 
           ,src.[TextDescription]

FROM (
	SELECT 'RVW' AS Code
		,'Emergency Response Programme' As LongName
		,'Emergency Response' as ShortName
		,'program1' as ProgrammeSiteName
		,'The Emergency Response Program (ERP) provides direct humanitarian relief to communities affected by drought and conflict across Somalia.' As TextDescription
	) Src
	WHERE NOT EXISTS (SELECT 1 FROM app.Programme P WHERE P.BusinessKey = Src.Code)

UNION ALL

SELECT		src.[Code]
           ,src.[LongName]
           ,src.[Code]
           ,src.[ShortName]
           ,src.[ProgrammeSiteName] 
           ,src.[TextDescription]

FROM (
	SELECT 'UYP' AS Code
		,'Urban Youth Programme' As LongName
		,'Urban Youth' as ShortName
		,'program2' as ProgrammeSiteName
		,'The Urban Youth Program (UYP) focuses on job creation and livelihood opportunities for poor youth through e.g. secondary education, vocational training, small business development, and microfinance.' As TextDescription
	) Src
	WHERE NOT EXISTS (SELECT 1 FROM app.Programme P WHERE P.BusinessKey = Src.Code)

UNION ALL
SELECT		src.[Code]
           ,src.[LongName]
           ,src.[Code]
           ,src.[ShortName]
           ,src.[ProgrammeSiteName] 
           ,src.[TextDescription]

FROM (
	SELECT 'RVW' AS Code
		,'Rural Vulnerable Women Programme' As LongName
		,'Rural Women' as ShortName
		,'program3' as ProgrammeSiteName
		,'The Rural Vulnerable Women’s Program (RVWP) supports poor rural women and girls in addressing long term underlying causes of poverty and vulnerability, addressing social, economic, cultural and political obstacles to positive change. We help women and girls improve their economic status, access education and support them to play a greater role in local leadership and conflict resolution.' As TextDescription
	) Src
	WHERE NOT EXISTS (SELECT 1 FROM app.Programme P WHERE P.BusinessKey = Src.Code)

UNION ALL


SELECT		src.[Code]
           ,src.[LongName]
           ,src.[Code]
           ,src.[ShortName]
           ,src.[ProgrammeSiteName] 
           ,src.[TextDescription]

FROM (
	SELECT 'CO' AS Code
		,'Country Office' As LongName
		,'Country Office' as ShortName
		,'program4' as ProgrammeSiteName
		,'The Country Office aggregates information from all programme sites.' As TextDescription
	) Src
	WHERE NOT EXISTS (SELECT 1 FROM app.Programme P WHERE P.BusinessKey = Src.Code)