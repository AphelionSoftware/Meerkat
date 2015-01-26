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
INSERT INTO [forms].[EventType]
           ([Name]
           ,[Code]
           ,[TextDescription]
           )

SELECT Q.Name, Q.Code, Q.Name
FROM
(SELECT 
	 'Training' as Name
	,'TRAIN' as Code
) Q
WHERE NOT EXISTS (
	SELECT 1 FROM [forms].[EventType]
		WHERE Code = q.Code)

		
INSERT INTO [forms].[EventType]
           ([Name]
           ,[Code]
           ,[TextDescription]
           )

SELECT Q.Name, Q.Code, Q.Name
FROM
(SELECT 
	 'Meeting' as Name
	,'MEET' as Code
) Q
WHERE NOT EXISTS (
	SELECT 1 FROM [forms].[EventType]
		WHERE Code = q.Code)
