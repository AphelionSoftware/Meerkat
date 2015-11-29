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
    , 'KE' Code
    , 'Kenya' [Name]
    , 562245
    , 38610097
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTRY')
    , NULL
    , NULL [Geog]
    WHERE NOT EXISTS (
    SELECT 1 FROM [Core].[Location] WHERE Code = 'KE'
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
    SELECT '47' Code
    , 'Nairobi' [Name]
    , 694 
    , 3138369
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '47' 
    )	
    

UNION ALL
SELECT '1' Code
    , 'Mombasa' [Name]
    , 212 
    , 939370
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '1' 
    )	
    

UNION ALL
SELECT '2' Code
    , 'Kwale' [Name]
    , 8270 
    , 649931
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '2' 
    )	
    

UNION ALL
SELECT '3' Code
    , 'Kilifi' [Name]
    , 12245 
    , 1109735
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '3' 
    )	
    

UNION ALL
SELECT '4' Code
    , 'Tana River' [Name]
    , 35375 
    , 240075
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '4' 
    )	
    

UNION ALL
SELECT '5' Code
    , 'Lamu' [Name]
    , 6497 
    , 101539
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '5' 
    )	
    

UNION ALL
SELECT '6' Code
    , 'Taita-Taveta' [Name]
    , 17083 
    , 284657
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '6' 
    )	
    

UNION ALL
SELECT '7' Code
    , 'Garissa' [Name]
    , 45720 
    , 623060
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '7' 
    )	
    

UNION ALL
SELECT '8' Code
    , 'Wajir' [Name]
    , 55840 
    , 661941
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '8' 
    )	
    

UNION ALL
SELECT '9' Code
    , 'Mandera' [Name]
    , 25797 
    , 1025756
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '9' 
    )	
    

UNION ALL
SELECT '10' Code
    , 'Marsabit' [Name]
    , 66923 
    , 291166
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '10' 
    )	
    

UNION ALL
SELECT '11' Code
    , 'Isiolo' [Name]
    , 25336 
    , 143294
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '11' 
    )	
    

UNION ALL
SELECT '12' Code
    , 'Meru' [Name]
    , 5127 
    , 1356301
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '12' 
    )	
    

UNION ALL
SELECT '13' Code
    , 'Tharaka-Nithi' [Name]
    , 2409 
    , 365330
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '13' 
    )	
    

UNION ALL
SELECT '14' Code
    , 'Embu' [Name]
    , 2555 
    , 516212
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '14' 
    )	
    

UNION ALL
SELECT '15' Code
    , 'Kitui' [Name]
    , 24385 
    , 1012709
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '15' 
    )	
    

UNION ALL
SELECT '16' Code
    , 'Machakos' [Name]
    , 5952 
    , 1098584
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '16' 
    )	
    

UNION ALL
SELECT '18' Code
    , 'Nyandarua' [Name]
    , 3107 
    , 596268
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '18' 
    )	
    

UNION ALL
SELECT '19' Code
    , 'Nyeri' [Name]
    , 2361 
    , 693558
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '19' 
    )	
    

UNION ALL
SELECT '20' Code
    , 'Kirinyaga' [Name]
    , 1205 
    , 528054
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '20' 
    )	
    

UNION ALL
SELECT '21' Code
    , 'Murang''a' [Name]
    , 2325 
    , 942581
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '21' 
    )	
    

UNION ALL
SELECT '22' Code
    , 'Kiambu' [Name]
    , 2449 
    , 1623282
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '22' 
    )	
    

UNION ALL
SELECT '23' Code
    , 'Turkana' [Name]
    , 71597 
    , 855399
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '23' 
    )	
    

UNION ALL
SELECT '24' Code
    , 'West Pokot' [Name]
    , 8418 
    , 512690
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '24' 
    )	
    

UNION ALL
SELECT '25' Code
    , 'Samburu' [Name]
    , 20182 
    , 223947
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '25' 
    )	
    

UNION ALL
SELECT '27' Code
    , 'Uasin Gishu' [Name]
    , 2955 
    , 894179
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '27' 
    )	
    

UNION ALL
SELECT '28' Code
    , 'Elgeyo-Marakwet' [Name]
    , 3049 
    , 369998
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '28' 
    )	
    

UNION ALL
SELECT '29' Code
    , 'Nandi' [Name]
    , 2884 
    , 752965
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '29' 
    )	
    

UNION ALL
SELECT '30' Code
    , 'Baringo' [Name]
    , 11075 
    , 555561
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '30' 
    )	
    

UNION ALL
SELECT '31' Code
    , 'Laikipia' [Name]
    , 8696 
    , 399227
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '31' 
    )	
    

UNION ALL
SELECT '32' Code
    , 'Nakuru' [Name]
    , 7509 
    , 1603325
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '32' 
    )	
    

UNION ALL
SELECT '33' Code
    , 'Narok' [Name]
    , 17921 
    , 850920
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '33' 
    )	
    

UNION ALL
SELECT '34' Code
    , 'Kajiado' [Name]
    , 21292 
    , 687312
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '34' 
    )	
    

UNION ALL
SELECT '17' Code
    , 'Makueni' [Name]
    , 8008 
    , 884527
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '17' 
    )	
    

UNION ALL
SELECT '35' Code
    , 'Kericho' [Name]
    , 2454 
    , 752396
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '35' 
    )	
    

UNION ALL
SELECT '37' Code
    , 'Kakamega' [Name]
    , 3033 
    , 1660651
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '37' 
    )	
    

UNION ALL
SELECT '38' Code
    , 'Vihiga' [Name]
    , 531 
    , 554622
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '38' 
    )	
    

UNION ALL
SELECT '39' Code
    , 'Bungoma' [Name]
    , 2206 
    , 1375063
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '39' 
    )	
    

UNION ALL
SELECT '40' Code
    , 'Busia' [Name]
    , 1628 
    , 743946
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '40' 
    )	
    

UNION ALL
SELECT '41' Code
    , 'Siaya' [Name]
    , 2496 
    , 842304
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '41' 
    )	
    

UNION ALL
SELECT '43' Code
    , 'Homa Bay' [Name]
    , 3154 
    , 963794
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '43' 
    )	
    

UNION ALL
SELECT '44' Code
    , 'Migori' [Name]
    , 2586 
    , 917170
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '44' 
    )	
    

UNION ALL
SELECT '45' Code
    , 'Kisii' [Name]
    , 1317 
    , 1152282
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '45' 
    )	
    

UNION ALL
SELECT '36' Code
    , 'Bomet' [Name]
    , 1997 
    , 730129
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '36' 
    )	
    

UNION ALL
SELECT '46' Code
    , 'Nyamira' [Name]
    , 912 
    , 598252
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '46' 
    )	
    

UNION ALL
SELECT '42' Code
    , 'Kisumu' [Name]
    , 2009 
    , 968909
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '42' 
    )	
    

UNION ALL
SELECT '26' Code
    , 'Trans Nzoia' [Name]
    , 2469 
    , 818757
    ,(SELECT LocationType_ID FROM [Core].[LocationType] WHERE [Code] = 'CNTY')
    , (SELECT Location_ID FROM [Core].[Location] WHERE [Code] = 'KE')
    , NULL [Geog]
    WHERE NOT EXISTS (
        SELECT 1 FROM [Core].[Location] WHERE [Code] = '26' 
    )	
    

    /*Location Insert end*/
    /*Update Geography*/

IF (CHARINDEX(CONVERT(VARCHAR, SERVERPROPERTY('edition')), N'Express') > -1)
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
END