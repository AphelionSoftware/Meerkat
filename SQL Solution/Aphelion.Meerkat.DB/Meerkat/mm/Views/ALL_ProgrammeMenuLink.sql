﻿



CREATE VIEW [mm].[ALL_ProgrammeMenuLink] 
AS 
--Sub sector removed for now
--  SELECT Title = 'Indicator Details', 
--         Link = ISNULL(GS.Value, '/') + [ProgrammeSiteName] 
--                + 
--'/Dashboards/Template%20Pages/Indicator%20Details%20Page.aspx?qsIndCode=' 
--       + '[Sub Sector].[Sub Sector].%26[' 
--       + Cast(dso.SubSector_ID AS VARCHAR(8)) + ']', 
--ID = 100 * dso.SubSector_ID, 
--Parent = (SELECT ID 
--          FROM   [mm].[ALL_ProgrammeMenuGroup] G 
--          WHERE  G.Title = dso.ShortName 
--                 AND G.Programme_ID = do.Programme_ID), 
--do.Programme_ID 
--FROM   [app].[SubSector] dso 
--INNER JOIN app.Sector do 
--        ON dso.Sector_ID = do.Sector_ID 
--INNER JOIN [app].[Programme] AS OC 
--        ON do.Programme_ID = oc.Programme_ID 
--						LEFT OUTER JOIN  settings.GlobalSettings GS
--							ON GS.Code = 'MMBASEURL'
--WHERE  dso.Active = 1  AND do.Active = 1 AND oc.Active = 1
--UNION ALL 
--SELECT Title = 'Location Indicator Details', 
--Link = ISNULL(GS.Value, '/') + [ProgrammeSiteName] 
--       + 
--'/Dashboards/Template%20Pages/Provincial%20Indicator%20Details%20Page.aspx?qsIndCode=' 
--+ '[Sub Sector].[Sub Sector].%26[' 
--+ Cast(dso.SubSector_ID AS VARCHAR(8)) + ']', 
--ID = 100 * dso.SubSector_ID, 
--Parent = (SELECT ID 
--   FROM   [mm].[ALL_ProgrammeMenuGroup] G 
--   WHERE  G.Title = dso.ShortName 
--          AND G.Programme_ID = DO.Programme_ID), 
--do.Programme_ID 
--FROM   [app].[SubSector] dso 
--INNER JOIN app.Sector do 
--        ON dso.Sector_ID = do.Sector_ID 
--INNER JOIN [app].[Programme] AS OC 
--        ON do.Programme_ID = oc.Programme_ID 
--						LEFT OUTER JOIN  settings.GlobalSettings GS
--							ON GS.Code = 'MMBASEURL'
--WHERE  dso.Active = 1 AND do.Active = 1 AND OC.Active = 1




------------------------------------------------------------------------

---UNION ALL 
SELECT Title = 'Indicators', 
Link = ISNULL(GS.Value, '/') + [ProgrammeSiteName] 
       +  '/' + [ProjectSiteName] +
'/SitePages/IndicatorValues.aspx?qsIndCode=' 
+ '[Project].[Project].%26[' 
+ Cast(P.ProjectID AS VARCHAR(8)) + ']'
+ '&qsMDXKey=' 
+ '[Project].[Project].%26[' 
+ Cast(P.ProjectID AS VARCHAR(8)) + ']', 
ID  = 200 * P.ProjectID, 
Parent = (SELECT ID 
   FROM   [mm].[ALL_ProgrammeMenuGroup] G 
   WHERE  G.Title = P.ShortName 
          AND G.Programme_ID = P.Programme_ID), 
P.Programme_ID 
FROM   [app].[Project] P 
INNER JOIN [app].[Programme] AS OC 
        ON P.Programme_ID = oc.Programme_ID 
						LEFT OUTER JOIN  settings.GlobalSettings GS
							ON GS.Code = 'MMBASEURL'
WHERE  P.Active = 1 AND OC.Active = 1

UNION ALL 
SELECT Title = 'Milestones', 
Link = ISNULL(GS.Value, '/') + [ProgrammeSiteName] 
       +  '/' + [ProjectSiteName] +
'/SitePages/ActivityProgress.aspx?qsIndCode=' 
+ '[Project].[Project].%26[' 
+ Cast(P.ProjectID AS VARCHAR(8)) + ']'
+ '&qsMDXKey=' 
+ '[Project].[Project].%26[' 
+ Cast(P.ProjectID AS VARCHAR(8)) + ']'
, 
Priority = 200 * P.ProjectID, 
Parent = (SELECT ID 
   FROM   [mm].[ALL_ProgrammeMenuGroup] G 
   WHERE  G.Title = P.ShortName 
          AND G.Programme_ID = P.Programme_ID), 
P.Programme_ID 
FROM   [app].[Project] P 
INNER JOIN [app].[Programme] AS OC 
        ON P.Programme_ID = oc.Programme_ID 
						LEFT OUTER JOIN  settings.GlobalSettings GS
							ON GS.Code = 'MMBASEURL'
WHERE  P.Active = 1 AND OC.Active = 1

---------------------------------------------------------------------
--
---------------------------------------------------------------------
UNION ALL 
SELECT Title = 'By District', 
Link = 'http://carer03.cloudapp.net:350/HTMLClient/#/Rpt_PeopleReached/DIST/'
, 
Priority = 300 , 
Parent = 55
, Programme_ID
FROM app.Programme
UNION ALL 
SELECT Title = 'By Region', 
Link = 'http://carer03.cloudapp.net:350/HTMLClient/#/Rpt_PeopleReached/REG/'
, 
Priority = 310 , 
Parent = 55
, Programme_ID
FROM app.Programme
UNION ALL 
SELECT Title = 'By Country', 
Link = 'http://carer03.cloudapp.net:350/HTMLClient/#/Rpt_PeopleReached/CNTRY/'
, 
Priority = 320 , 
Parent = 55
, Programme_ID
FROM app.Programme


/*UNION ALL 
SELECT Title = Da.ShortName, 
Link = '/' + [ProgrammeSiteName] 
       + 
'/Dashboards/Template%20Pages/Milestones%20Page.aspx?qsActivity='
	+ Cast(da.Activity_ID AS VARCHAR(8)) , 
Priority = 1 - da.Activity_ID + 5000, 
Parent = (SELECT SRC.ID + P.ProjectID AS ID 
          FROM   app.Project P 
                 CROSS apply (SELECT ID 
                              FROM   mm.ALL_ProgrammeMenuCategory O2MC 
                              WHERE  Title = 'Projects'
							  AND O2MC.Programme_ID = OC.Programme_ID
							  ) Src 
          WHERE  Programme_ID = dp.Programme_ID 
                 AND P.ProjectID = da.ProjectID), 
Dp.Programme_ID 
FROM   app.Activity da 
INNER JOIN app.Project dp 
        ON da.ProjectID = dp.ProjectID 
INNER JOIN [app].[Programme] AS OC 
        ON dp.Programme_ID = oc.Programme_ID 
WHERE  da.Active = 1 AND dp.Active = 1 AND oc.Active = 1
*/
-------------------------------------------------------------------------------------------------
-- Excel Reports
-------------------------------------------------------------------------------------------------

UNION ALL
SELECT Title = 'PeopleReached', 
Link = ISNULL(GS.Value, '/') + [ProgrammeSiteName] 
+ '/Dashboards/Template%20Pages/ExcelRangeDisplayByProgram.aspx' 
+ '?qsFileName=/Reports/PowerPivotGallery/StatusByProgram.xlsx' 
+ '&qsNamedRange=PeopleReached' 
+ '&qsProgramme='  + OC.BusinessKey
, 
Priority = 200 * OC.Programme_ID , 
Parent = (SELECT ID 
   FROM   [mm].[ALL_ProgrammeMenuGroup] G 
   WHERE  G.Title = 'Excel Reports' 
          AND G.Programme_ID = OC.Programme_ID), 
OC.Programme_ID 
FROM    [app].[Programme] AS OC 

						LEFT OUTER JOIN  settings.GlobalSettings GS
							ON GS.Code = 'MMBASEURL'
WHERE  OC.Active = 1
UNION ALL
SELECT Title = 'Indicator progress', 
Link = ISNULL(GS.Value, '/') + [ProgrammeSiteName] 
+ '/Dashboards/Template%20Pages/ExcelRangeDisplayByProgram.aspx' 
+ '?qsFileName=/Reports/PowerPivotGallery/StatusByProgram.xlsx' 
+ '&qsNamedRange=Indicators' 
+ '&qsProgramme='  + OC.BusinessKey
, 
Priority = 210 * OC.Programme_ID , 
Parent = (SELECT ID 
   FROM   [mm].[ALL_ProgrammeMenuGroup] G 
   WHERE  G.Title = 'Excel Reports' 
          AND G.Programme_ID = OC.Programme_ID), 
OC.Programme_ID 
FROM    [app].[Programme] AS OC 

						LEFT OUTER JOIN  settings.GlobalSettings GS
							ON GS.Code = 'MMBASEURL'
WHERE  OC.Active = 1
UNION ALL
SELECT Title = 'Status', 
Link = ISNULL(GS.Value, '/') + [ProgrammeSiteName] 
+ '/Dashboards/Template%20Pages/ExcelRangeDisplayByProgram.aspx' 
+ '?qsFileName=/Reports/PowerPivotGallery/StatusByProgram.xlsx' 
+ '&qsNamedRange=Status' 
+ '&qsProgramme='  + OC.BusinessKey
, 
Priority = 220 * OC.Programme_ID , 
Parent = (SELECT ID 
   FROM   [mm].[ALL_ProgrammeMenuGroup] G 
   WHERE  G.Title = 'Excel Reports' 
          AND G.Programme_ID = OC.Programme_ID), 
OC.Programme_ID 
FROM    [app].[Programme] AS OC 

						LEFT OUTER JOIN  settings.GlobalSettings GS
							ON GS.Code = 'MMBASEURL'
WHERE  OC.Active = 1



---------------------------------------------------------------------
--
---------------------------------------------------------------------



UNION ALL 
SELECT Title = 'Status', 
Link = ISNULL(GS.Value, '/') + OC.ProgrammeSitename
						+ '/' + '/Dashboards/Template%20Pages/ExcelRangeDisplayByProgram.aspx'
						+ '?qsFileName=/Reports/PowerPivotGallery/StatusByProgram.xlsx'
						+ '&qsNamedRange=Status'
						+ '&qsProgramme=' + OC.BusinessKey

, 
Priority = 200 * OC.Programme_ID,--* P.ProjectID, 
Parent = (SELECT ID 
   FROM   [mm].[ALL_ProgrammeMenuGroup] G 
   WHERE  G.Title = 'Program Reports >>>'
          AND G.Programme_ID = OC.Programme_ID), 
OC.Programme_ID 
FROM   
--[app].[Project] P 
--INNER JOIN 
[app].[Programme] AS OC 
       -- ON P.Programme_ID = oc.Programme_ID 
						LEFT OUTER JOIN  settings.GlobalSettings GS
							ON GS.Code = 'MMBASEURL'
WHERE  --P.Active = 1 AND 
OC.Active = 1


  UNION ALL 
SELECT Title = 'People Reached', 
Link = ISNULL(GS.Value, '/') + OC.ProgrammeSitename
						+ '/' + '/Dashboards/Template%20Pages/ExcelRangeDisplayByProgram.aspx'
						+ '?qsFileName=/Reports/PowerPivotGallery/StatusByProgram.xlsx'
						+ '&qsNamedRange=PeopleReached'
						+ '&qsProgramme=' + OC.BusinessKey

, 
Priority = OC.Programme_ID,--* P.ProjectID, 
Parent = (SELECT ID 
   FROM   [mm].[ALL_ProgrammeMenuGroup] G 
   WHERE  G.Title = 'Program Reports >>>'
          AND G.Programme_ID = OC.Programme_ID), 
OC.Programme_ID 
FROM   
--[app].[Project] P 
--INNER JOIN 
[app].[Programme] AS OC 
       -- ON P.Programme_ID = oc.Programme_ID 
						LEFT OUTER JOIN  settings.GlobalSettings GS
							ON GS.Code = 'MMBASEURL'
WHERE  --P.Active = 1 AND 
OC.Active = 1


UNION ALL 
SELECT Title = 'Indicators', 
Link = ISNULL(GS.Value, '/') + OC.ProgrammeSitename
						+ '/' + '/Dashboards/Template%20Pages/ExcelRangeDisplayByProgram.aspx'
						+ '?qsFileName=/Reports/PowerPivotGallery/StatusByProgram.xlsx'
						+ '&qsNamedRange=Indicators'
						+ '&qsProgramme=' + OC.BusinessKey

, 
Priority = 400 * OC.Programme_ID,--* P.ProjectID, 
Parent = (SELECT ID 
   FROM   [mm].[ALL_ProgrammeMenuGroup] G 
   WHERE  G.Title = 'Program Reports >>>'
          AND G.Programme_ID = OC.Programme_ID), 
OC.Programme_ID 
FROM   
--[app].[Project] P 
--INNER JOIN 
[app].[Programme] AS OC 
       -- ON P.Programme_ID = oc.Programme_ID 
						LEFT OUTER JOIN  settings.GlobalSettings GS
							ON GS.Code = 'MMBASEURL'
WHERE  --P.Active = 1 AND 
OC.Active = 1




-------------------------------------------------------------------
--Sectors
-------------------------------------------------------------------
UNION ALL
  SELECT   
            'Indicators: ' + do.ShortName + ' ' AS Title ,
            ISNULL(GS.Value, '/') + [dom].[ProgrammeSiteName]
            + '/Dashboards/Template%20Pages/Indicator%20Details%20Page.aspx?qsIndCode='
            + '[Sector].[Sector].%26['
            + CAST(do.Sector_ID AS VARCHAR(8)) + ']' AS Link ,
			Priority = 400 * dom.Programme_ID,--* P.ProjectID, 
            ( SELECT    [mm].[ALL_ProgrammeMenuGroup].[ID]
              FROM      mm.ALL_ProgrammeMenuGroup
              WHERE     ( [mm].[ALL_ProgrammeMenuGroup].[Title] = do.ShortName )
                        AND [mm].[ALL_ProgrammeMenuGroup].[Programme_ID] = do.Programme_ID
            ) AS Parent ,

            dom.Programme_ID
  FROM      app.Sector AS do
            INNER JOIN [app].[Programme] AS dom ON do.Programme_ID = dom.Programme_ID
			LEFT OUTER JOIN  settings.GlobalSettings GS
				ON GS.Code = 'MMBASEURL'
  WHERE     do.Active = 1
            AND dom.Active = 1
						AND EXISTS (SELECT 1 FROM app.Indicator I
												LEFT JOIN app.SubSector SS
												ON I.SubSector_ID = SS.SubSector_ID
												WHERE I.Sector_ID = do.Sector_ID
												OR SS.Sector_ID = do.Sector_ID)


              
GO


