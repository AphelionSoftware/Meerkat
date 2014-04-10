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

USE Meerkat
GO

SET identity_insert [rpt].CustomReportType on


INSERT INTO [rpt].[CustomReportType]
           ([CustomReportType_ID]
		   ,[Code]
           ,[Name]
           )
SELECT Q.CustomReportType_ID, Q.Code, Q.Name
FROM
(SELECT 
	1 As CustomReportType_ID
	 ,'DNR' as Code
	,'Donor' as Name
) Q
WHERE NOT EXISTS (
	SELECT 1 FROM [rpt].[CustomReportType]
		WHERE Code = q.Code)
