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
SET identity_insert disagg.FacilityType on


INSERT INTO [disagg].[FacilityType]
           ([FacilityType_ID]
		   ,[Code]
           ,[Name]
		   ,[BusinessKey]
           )
SELECT Q.FacilityType_ID, Q.Code, Q.Name, Q.BusinessKey
FROM
(SELECT 
	-1 As FacilityType_ID
	,'UNK' as Code
	,'Unknown' as Name
	,'UNK' as BusinessKey
) Q
WHERE NOT EXISTS (
	SELECT 1 FROM [disagg].[FacilityType]
		WHERE Code = q.Code)

INSERT INTO [disagg].[FacilityType]
           ([FacilityType_ID]
		   ,[Code]
           ,[Name]
		   ,[BusinessKey]
           )
SELECT Q.FacilityType_ID, Q.Code, Q.Name, Q.BusinessKey
FROM
(SELECT 
	0 As FacilityType_ID
	,'SCHOOL' as Code
	,'School' as Name
	,'School' as BusinessKey
) Q
WHERE NOT EXISTS (
	SELECT 1 FROM [disagg].[FacilityType]
		WHERE Code = q.Code)
     


SET identity_insert disagg.FacilityType off

