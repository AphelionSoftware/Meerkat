INSERT INTO [Access].[SystemRole]
           ([SystemRoleName]
           ,[SystemRoleCode]
           ,[SystemRoleSourceKey]
		   ,[RoleTypeID]
           )

SELECT Q.Name, Q.Code, Q.Code, Q.RoleTypeID
FROM
(SELECT 
  'IT ' AS Name
, 'IT' AS Code
,RoleTypeID
 FROM [Access].RoleType WHERE RoleTypeSourceKey = 'CAPTURE'
	UNION
SELECT 
  'M&L Coordinators' AS Name
, 'M&L' AS Code
,RoleTypeID
 FROM [Access].RoleType WHERE RoleTypeSourceKey = 'CAPTURE'
	UNION
SELECT 
  'PQU' AS Name
, 'PQU' AS Code
,RoleTypeID
 FROM [Access].RoleType WHERE RoleTypeSourceKey = 'CAPTURE'
	UNION
SELECT 
  'M&E Officers/M&E Focal Point Person' AS Name
, 'M&E' AS Code
,RoleTypeID
 FROM [Access].RoleType WHERE RoleTypeSourceKey = 'CAPTURE'
	UNION
SELECT 
  'Project Manager' AS Name
, 'PM' AS Code
,RoleTypeID
 FROM [Access].RoleType WHERE RoleTypeSourceKey = 'CAPTURE'
	UNION
SELECT 
  'Area Manager' AS Name
, 'AM' AS Code
,RoleTypeID
 FROM [Access].RoleType WHERE RoleTypeSourceKey = 'CAPTURE'
	UNION
SELECT 
  'Project Officer/Partner Organization' AS Name
, 'PO' AS Code
,RoleTypeID
 FROM [Access].RoleType WHERE RoleTypeSourceKey = 'CAPTURE'
	UNION
SELECT 
  'Senior Program Officer' AS Name
, 'SPO' AS Code
,RoleTypeID
 FROM [Access].RoleType WHERE RoleTypeSourceKey = 'CAPTURE'
	

) Q
WHERE NOT EXISTS (
	SELECT 1 FROM [Access].[SystemRole]
		WHERE Code = q.Code)
