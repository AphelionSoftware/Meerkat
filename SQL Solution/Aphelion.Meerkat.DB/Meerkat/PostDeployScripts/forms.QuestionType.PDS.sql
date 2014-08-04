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
INSERT INTO [forms].[QuestionType]
           ([Name]
           ,[Code]
           ,[TextDescription]
           )

SELECT Q.Name, Q.Code, Q.Name
FROM
(SELECT 
	 'Multiple choice' as Name
	,'MCQ' as Code
) Q
WHERE NOT EXISTS (
	SELECT 1 FROM [forms].[QuestionType]
		WHERE Code = q.Code)

		
INSERT INTO [forms].[QuestionType]
           ([Name]
           ,[Code]
           ,[TextDescription]
           )

SELECT Q.Name, Q.Code, Q.Name
FROM
(SELECT 
	 'Radio Button' as Name
	,'RB' as Code
) Q
WHERE NOT EXISTS (
	SELECT 1 FROM [forms].[QuestionType]
		WHERE Code = q.Code)

INSERT INTO [forms].[QuestionType]
           ([Name]
           ,[Code]
           ,[TextDescription]
           )

SELECT Q.Name, Q.Code, Q.Name
FROM
(SELECT 
	 'Text response' as Name
	,'TR' as Code
) Q
WHERE NOT EXISTS (
	SELECT 1 FROM [forms].[QuestionType]
		WHERE Code = q.Code)

		
INSERT INTO [forms].[QuestionType]
           ([Name]
           ,[Code]
           ,[TextDescription]
           )
SELECT Q.Name, Q.Code, Q.Name
FROM
(SELECT 
	 'True or false' as Name
	,'BOOL' as Code
) Q
WHERE NOT EXISTS (
	SELECT 1 FROM [forms].[QuestionType]
		WHERE Code = q.Code)

		

				
INSERT INTO [forms].[QuestionType]
           ([Name]
           ,[Code]
           ,[TextDescription]
           )
SELECT Q.Name, Q.Code, Q.Name
FROM
(SELECT 
	 'Integer' as Name
	,'INT' as Code
) Q
WHERE NOT EXISTS (
	SELECT 1 FROM [forms].[QuestionType]
		WHERE Code = q.Code)


				
INSERT INTO [forms].[QuestionType]
           ([Name]
           ,[Code]
           ,[TextDescription]
           )
SELECT Q.Name, Q.Code, Q.Name
FROM
(SELECT 
	 'Decimal' as Name
	,'DEC' as Code
) Q
WHERE NOT EXISTS (
	SELECT 1 FROM [forms].[QuestionType]
		WHERE Code = q.Code)

		
INSERT INTO [forms].[QuestionType]
           ([Name]
           ,[Code]
           ,[TextDescription]
           )
SELECT Q.Name, Q.Code, Q.Name
FROM
(SELECT 
	 'Count' as Name
	,'CNT' as Code
) Q
WHERE NOT EXISTS (
	SELECT 1 FROM [forms].[QuestionType]
		WHERE Code = q.Code)
