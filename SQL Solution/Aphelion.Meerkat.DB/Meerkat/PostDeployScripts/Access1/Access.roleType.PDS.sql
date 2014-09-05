INSERT INTO [Access].[RoleType]
           ([RoleTypeName]
           ,[RoleTypeCode]
           ,[RoleTypeSourceKey]
           )

SELECT Q.Name, Q.Code, Q.Code
FROM
(SELECT 
	 'Super user' as Name
	,'SU' as Code
) Q
WHERE NOT EXISTS (
	SELECT 1 FROM [Access].[RoleType]
		WHERE RoleTypeCode = q.Code)

UNION ALL
SELECT Q.Name, Q.Code, Q.Code
FROM
(SELECT 
	 'Meerkat Capture & Form Capture' as Name
	,'CAPTURE' as Code
) Q
WHERE NOT EXISTS (
	SELECT 1 FROM [Access].[RoleType]
		WHERE RoleTypeCode = q.Code)

UNION ALL
SELECT Q.Name, Q.Code, Q.Code
FROM
(SELECT 
	 'Meerkat Admin' as Name
	,'ADMIN' as Code
) Q
WHERE NOT EXISTS (
	SELECT 1 FROM [Access].[RoleType]
		WHERE RoleTypeCode = q.Code)

UNION ALL
SELECT Q.Name, Q.Code, Q.Code
FROM
(SELECT 
	 'Meerkat Formbuilder' as Name
	,'FORMS' as Code
) Q
WHERE NOT EXISTS (
	SELECT 1 FROM [Access].[RoleType]
		WHERE RoleTypeCode = q.Code)

