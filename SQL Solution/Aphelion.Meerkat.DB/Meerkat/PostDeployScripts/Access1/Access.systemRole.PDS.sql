INSERT INTO [Access].[SystemRole]
           ([SystemRoleName]
           ,[SystemRoleCode]
           ,[SystemRoleSourceKey]
		   ,[RoleTypeID]
		   ,[DataVersion_ID]
           )

SELECT Q.Name, Q.Code, Q.Code, Q.RoleTypeID
FROM
(SELECT 
  'IT ' AS Name
, 'IT' AS Code
,RoleType_ID, DV.DataVersionID
,DV.DataVersion_ID
 FROM [Access].RoleType CROSS JOIN [Core].[DataVersion] DV WHERE DV.[Order] = 0 AND RoleTypeSourceKey = 'SU'
	UNION
SELECT 
  'M&L Coordinators' AS Name
, 'M&L' AS Code
,RoleType_ID, DV.DataVersionID
 FROM [Access].RoleType CROSS JOIN [Core].[DataVersion] DV WHERE DV.[Order] = 0 AND RoleTypeSourceKey = 'CAPTURE'
	UNION
SELECT 
  'PQU' AS Name
, 'PQU' AS Code
,RoleType_ID, DV.DataVersionID
 FROM [Access].RoleType CROSS JOIN [Core].[DataVersion] DV WHERE DV.[Order] = 0 AND RoleTypeSourceKey = 'SU'
	UNION
SELECT 
  'M&E Officers/M&E Focal Point Person' AS Name
, 'M&E' AS Code
,RoleType_ID, DV.DataVersionID
 FROM [Access].RoleType CROSS JOIN [Core].[DataVersion] DV WHERE DV.[Order] = 1 AND RoleTypeSourceKey = 'CAPTURE'
	UNION
SELECT 
  'Project Manager' AS Name
, 'PM' AS Code
,RoleType_ID, DV.DataVersionID
 FROM [Access].RoleType CROSS JOIN [Core].[DataVersion] DV WHERE DV.[Order] = 1 AND RoleTypeSourceKey = 'CAPTURE'
	UNION
SELECT 
  'Area Manager' AS Name
, 'AM' AS Code
,RoleType_ID, DV.DataVersionID
 FROM [Access].RoleType CROSS JOIN [Core].[DataVersion] DV WHERE DV.[Order] = 1 AND RoleTypeSourceKey = 'CAPTURE'
	UNION
SELECT 
  'Project Officer/Partner Organization' AS Name
, 'PO' AS Code
,RoleType_ID, DV.DataVersionID
 FROM [Access].RoleType CROSS JOIN [Core].[DataVersion] DV WHERE DV.[Order] = 3 AND RoleTypeSourceKey = 'CAPTURE'
	UNION
SELECT 
  'Senior Program Officer' AS Name
, 'SPO' AS Code
,RoleType_ID, DV.DataVersionID
 FROM [Access].RoleType CROSS JOIN [Core].[DataVersion] DV WHERE DV.[Order] = 2 AND RoleTypeSourceKey = 'CAPTURE'
	

) Q
WHERE NOT EXISTS (
	SELECT 1 FROM [Access].[SystemRole]
		WHERE Code = q.Code)
