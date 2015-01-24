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
SET IDENTITY_INSERT [Core].[Location] ON
GO
/*
-------------------------------------------------------------------------

*/
INSERT [Core].[Location] (
    [Location_ID]
    , [Code]
    , [Name]
    , [AreaKM]
    , [Population]
    , [LocationType_ID]
    , [ParentLocation_ID]
	, [BusinessKey]
    ) 

	SELECT [Location_ID]
    , [Code]
    , [Name]
    , [AreaKM]
    , [Population]
    , [LocationType_ID]
    , [ParentLocation_ID]
	, Code
    FROM (
    SELECT 1 [Location_ID]
    , 'UK' Code
    , 'United Kingdom' [Name]
    , 243789  AreaKm
    , 63182000 Population
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTRY')[LocationType_ID]
	,NULL ParentLocation_ID 
	) Src
    WHERE NOT EXISTS (
    SELECT 1 FROM [Core].[Location] WHERE Code = 'UK'
    )

GO
/*
-------------------------------------------------------------------------
*/

INSERT [Core].[Location] (
    [Location_ID]
    , [Code]
    , [Name]
    
    , [LocationType_ID]
    , [ParentLocation_ID]
	, [BusinessKey]
    ) 


	SELECT [Location_ID]
    , [Code]
    , [Name]
    , [LocationType_ID]
    , [ParentLocation_ID]
	, Code
    FROM (
    SELECT 2 [Location_ID]
    , 'ENG' Code
    , 'England' [Name]
      ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'TERR')[LocationType_ID]
	,1 ParentLocation_ID 
	UNION ALL
 
SELECT 3 [Location_ID]
    , 'SCOT' Code
    , 'Scotland' [Name]
      ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'TERR')[LocationType_ID]
	,1 ParentLocation_ID 
	UNION ALL
SELECT 5 [Location_ID]
    , 'WALES' Code
    , 'Wales' [Name]
      ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'TERR')[LocationType_ID]
	,1 ParentLocation_ID 
	UNION ALL
	SELECT 4 [Location_ID]
    , 'NI' Code
    , 'Northern Ireland' [Name]
      ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'TERR')[LocationType_ID]
	,1 ParentLocation_ID 

	) Src
    WHERE NOT EXISTS (
    SELECT 1 FROM [Core].[Location] WHERE Code = Src.Code
    )



GO
SET IDENTITY_INSERT [Core].[Location] OFF