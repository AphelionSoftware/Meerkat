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
SET identity_insert disagg.gender on


INSERT INTO [disagg].[Gender]
           ([Gender_ID]
		   ,[Code]
           ,[Name]
           )
SELECT Q.Gender_ID, Q.Code, Q.Name
FROM
(SELECT 
	-1 As Gender_ID
	 ,'UNK' as Code
	,'Unknown' as Name
) Q
WHERE NOT EXISTS (
	SELECT 1 FROM [disagg].[Gender]
		WHERE Code = q.Code)

INSERT INTO [disagg].[Gender]
           ([Gender_ID]
		   ,[Code]
           ,[Name]
           )
SELECT Q.Gender_ID, Q.Code, Q.Name
FROM
(SELECT 
	0 As Gender_ID
	 ,'M' as Code
	,'Male' as Name
) Q
WHERE NOT EXISTS (
	SELECT 1 FROM [disagg].[Gender]
		WHERE Code = q.Code)
     


INSERT INTO [disagg].[Gender]
           ([Gender_ID]
		   ,[Code]
           ,[Name]
           )
SELECT Q.Gender_ID, Q.Code, Q.Name
FROM
(SELECT 
	1 As Gender_ID
	 ,'F' as Code
	,'Female' as Name
) Q
WHERE NOT EXISTS (
	SELECT 1 FROM [disagg].[Gender]
		WHERE Code = q.Code)



INSERT INTO [disagg].[Gender]
           ([Gender_ID]
		   ,[Code]
           ,[Name]
           )
SELECT Q.Gender_ID, Q.Code, Q.Name
FROM
(SELECT 
	2 As Gender_ID
	 ,'UND' as Code
	,'Undisclosed' as Name
) Q
WHERE NOT EXISTS (
	SELECT 1 FROM [disagg].[Gender]
		WHERE Code = q.Code)



SET identity_insert disagg.gender off

