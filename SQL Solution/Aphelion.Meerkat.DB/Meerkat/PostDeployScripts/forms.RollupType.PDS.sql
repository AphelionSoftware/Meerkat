
INSERT INTO [forms].[RollupType]
           ([Name]
           ,[Code]
           ,[TextDescription]
           )

SELECT Q.Name, Q.Code, Q.Name
FROM
(SELECT 
	 'Sum' as Name
	,'SUM' as Code
) Q
WHERE NOT EXISTS (
	SELECT 1 FROM [forms].[RollupType]
		WHERE Code = q.Code)

GO

INSERT INTO [forms].[RollupType]
           ([Name]
           ,[Code]
           ,[TextDescription]
           )

SELECT Q.Name, Q.Code, Q.TextDescription
FROM
(SELECT 
	 'Average' as Name
	,'AVG' as Code
	,'Arithmetric mean' as TextDescription
) Q
WHERE NOT EXISTS (
	SELECT 1 FROM [forms].[RollupType]
		WHERE Code = q.Code)
GO

INSERT INTO [forms].[RollupType]
           ([Name]
           ,[Code]
           ,[TextDescription]
           )

SELECT Q.Name, Q.Code, Q.Name
FROM
(SELECT 
	 'Maximum' as Name
	,'MAX' as Code
) Q
WHERE NOT EXISTS (
	SELECT 1 FROM [forms].[RollupType]
		WHERE Code = q.Code)
GO

INSERT INTO [forms].[RollupType]
           ([Name]
           ,[Code]
           ,[TextDescription]
           )

SELECT Q.Name, Q.Code, Q.Name
FROM
(SELECT 
	 'Minimum' as Name
	,'MIN' as Code
) Q
WHERE NOT EXISTS (
	SELECT 1 FROM [forms].[RollupType]
		WHERE Code = q.Code)
GO

INSERT INTO [forms].[RollupType]
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
	SELECT 1 FROM [forms].[RollupType]
		WHERE Code = q.Code)
