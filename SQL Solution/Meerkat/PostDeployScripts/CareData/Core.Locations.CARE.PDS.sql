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

INSERT [Core].[Location] (
    [Location_ID]
    , [Code]
    , [Name]
    , [AreaKM]
    , [Population]
    , [LocationType_ID]
    , [ParentLocation_ID]
    , [Geog]
    ) 
    SELECT 0
    , 'SOM' Code
    , 'Somaliland' [Name]
    , 137600
    , 3500000
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTRY')
    , NULL
    , NULL [Geog]
    WHERE NOT EXISTS (
    SELECT 1 FROM [Core].[Location] WHERE Code = 'SOM'
    )

	INSERT [Core].[Location] (
    [Location_ID]
    , [Code]
    , [Name]
    , [AreaKM]
    , [Population]
    , [LocationType_ID]
    , [ParentLocation_ID]
    , [Geog]
    ) 
    SELECT 0
    , 'MOG' Code
    , 'Mogadishu' [Name]
    , 1637
    , 1530000
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTRY')
    , NULL
    , NULL [Geog]
    WHERE NOT EXISTS (
    SELECT 1 FROM [Core].[Location] WHERE Code = 'MOG'
    )

	INSERT [Core].[Location] (
    [Location_ID]
    , [Code]
    , [Name]
    , [AreaKM]
    , [Population]
    , [LocationType_ID]
    , [ParentLocation_ID]
    , [Geog]
    ) 

    SELECT 0
    , 'PUNT' Code
    , 'Puntland' [Name]
    , 212510
    , 3900000
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTRY')
    , NULL
    , NULL [Geog]
    WHERE NOT EXISTS (
    SELECT 1 FROM [Core].[Location] WHERE Code = 'PUNT'
    )

SET IDENTITY_INSERT [Core].[Location] OFF
GO

INSERT [Core].[Location] (
    [Code]
    , [Name]
    , [AreaKM]
    , [Population]
    , [LocationType_ID]
    , [ParentLocation_ID]
    , [Geog]
    ) 
    SELECT '1' Code
    , 'Lascanood' [Name]
    , NULL 
    , NULL
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'DIST')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'SOM')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '1' 
    )	
    

UNION ALL
SELECT '2' Code
    , 'Ainabo' [Name]
    , NULL 
    , NULL
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'DIST')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'SOM')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '2' 
    )	
    

UNION ALL
SELECT '3' Code
    , 'Odweyne' [Name]
    , 12245 
    , 1109735
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'DIST')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'SOM')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '3' 
    )	
    

UNION ALL
SELECT '4' Code
    , 'Burao' [Name]
    , 35375 
    , 240075
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'DIST')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'SOM')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '4' 
    )	
    

UNION ALL
SELECT '5' Code
    , 'Badhan' [Name]
    , 6497 
    , 101539
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'DIST')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'SOM')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '5' 
    )	
    

UNION ALL
SELECT '6' Code
    , 'Erigavo' [Name]
    , 17083 
    , 284657
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'DIST')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'SOM')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '6' 
    )	
    

UNION ALL
SELECT '7' Code
    , 'El-afweyn' [Name]
    , 45720 
    , 623060
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'DIST')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'SOM')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '7' 
    )	
    

UNION ALL
SELECT '8' Code
    , 'Waaberi' [Name]
    , 55840 
    , 661941
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'DIST')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'MOG')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '8' 
    )	
    

UNION ALL
SELECT '9' Code
    , 'Wadajir' [Name]
    , 25797 
    , 1025756
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'DIST')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'MOG')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '9' 
    )	
    

UNION ALL
SELECT '10' Code
    , 'Hodan' [Name]
    , 66923 
    , 291166
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'DIST')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'MOG')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '10' 
    )	
    

UNION ALL
SELECT '11' Code
    , 'Garowe' [Name]
    , 25336 
    , 143294
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'DIST')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'PUNT')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '11' 
    )	
    

UNION ALL
SELECT '12' Code
    , 'Jalam' [Name]
    , 5127 
    , 1356301
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'DIST')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'PUNT')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '12' 
    )	
    

UNION ALL
SELECT '13' Code
    , 'Godobjiran' [Name]
    , 2409 
    , 365330
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'DIST')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'PUNT')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '13' 
    )	
    

UNION ALL
SELECT '14' Code
    , 'Galkacyo' [Name]
    , 2555 
    , 516212
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'DIST')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'PUNT')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '14' 
    )	
    

UNION ALL
SELECT '15' Code
    , 'Gardo' [Name]
    , 24385 
    , 1012709
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'DIST')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'PUNT')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '15' 
    )	
    

UNION ALL
SELECT '16' Code
    , 'Bosasso' [Name]
    , 5952 
    , 1098584
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'DIST')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'PUNT')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '16' 
    )	
    

UNION ALL
SELECT '18' Code
    , 'Taleh' [Name]
    , 3107 
    , 596268
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'DIST')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'PUNT')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '18' 
    )	
    

UNION ALL
SELECT '19' Code
    , 'Kalabyer' [Name]
    , 2361 
    , 693558
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'DIST')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'PUNT')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '19' 
    )	
    

UNION ALL
SELECT '20' Code
    , 'Baran' [Name]
    , 1205 
    , 528054
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'DIST')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'PUNT')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '20' 
    )	
    

UNION ALL
SELECT '21' Code
    , 'Buraan' [Name]
    , 2325 
    , 942581
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'DIST')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'PUNT')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '21' 
    )	
    

UNION ALL
SELECT '22' Code
    , 'Hinglool' [Name]
    , 2449 
    , 1623282
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'DIST')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '22' 
    )	   

    /*Location Insert end*/
    /*Update Geography*/

/*IF (CHARINDEX(CONVERT(VARCHAR, SERVERPROPERTY('edition')), N'Express') > -1)
BEGIN    
IF NOT EXISTs (select 1 FROM sys.Databases where Name = 'KenyaShapes')
    
    RAISERROR ('You must restore the KenyaShapes DB to get the geography shapes, obtain it at https://www.dropbox.com/s/jtb9ohpuov51wkt/KenyaShapes.bak', -- Message text.
               18, -- Severity.
               1 -- State.
               );

UPDATE [Core].[Location]
SET Geog = (SELECT Geography::UnionAggregate(geom)
  FROM [KenyaShapes].[dbo].[Counties])
  WHERE [Code] = 'KE'

UPDATE [Core].[Location]
SET Geog = geom
FROM [KenyaShapes].[dbo].[Counties]
  WHERE  [Code] = CAST(COUNTY_COD as varchar(10))
END*/