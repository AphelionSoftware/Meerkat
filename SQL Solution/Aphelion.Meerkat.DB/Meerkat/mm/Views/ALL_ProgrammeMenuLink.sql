

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
       --+  '/' + [ProjectSiteName] +
--'/SitePages/IndicatorValues.aspx?qsIndCode=' 
            + '/Dashboards/Template%20Pages/Indicator%20Details%20Page.aspx?qsIndCode='
            + '[Project].[Project].%26[' 
+ Cast(P.ProjectID AS VARCHAR(8)) + ']'
+ '&qsMDXKey=' 
+ '[Project].[Project].%26[' 
+ Cast(P.ProjectID AS VARCHAR(8)) + ']'  , 
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
AND Exists (select 1 FROM RBM.IndicatorValues IV
					INNER JOIN App.Indicator I
					ON IV.Indicator_ID = I.IndicatorID
					WHERE I.ProjectID = P.ProjectID)
UNION ALL 
SELECT Title = 'Milestones', 
Link = ISNULL(GS.Value, '/') + [ProgrammeSiteName] 
       --+  '/' + [ProjectSiteName] +
+ '/Dashboards/Template%20Pages/Indicator%20Details%20Page.aspx?qsIndCode='
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
AND Exists (select 1 FROM RBM.MilestoneValues MV
					INNER JOIN App.Milestone M
					ON MV.Milestone_ID = M.MilestoneID
					WHERE M.ProjectID = P.ProjectID)
---------------------------------------------------------------------
--
---------------------------------------------------------------------
UNION ALL 
SELECT Title = 'By District', 
Link = ISNULL(GS.Value, '') + ':350/HTMLClient/#/Rpt_PeopleReached/DIST/'
, 
Priority = 300 , 
Parent = 55
, Programme_ID
FROM app.Programme
LEFT OUTER JOIN  settings.GlobalSettings GS
							ON GS.Code = 'BASESITEURL'
UNION ALL 
SELECT Title = 'By Region', 
Link = ISNULL(GS.Value, '') + ':350/HTMLClient/#/Rpt_PeopleReached/REG/'
, 
Priority = 310 , 
Parent = 55
, Programme_ID
FROM app.Programme
LEFT OUTER JOIN  settings.GlobalSettings GS
							ON GS.Code = 'BASESITEURL'
UNION ALL 
SELECT Title = 'By Country', 
Link = ISNULL(GS.Value, '') + ':350/HTMLClient/#/Rpt_PeopleReached/CNTRY/'
, 
Priority = 320 , 
Parent = 55
, Programme_ID
FROM app.Programme
LEFT OUTER JOIN  settings.GlobalSettings GS
							ON GS.Code = 'BASESITEURL'
UNION ALL 
-------------------------------People reached by project
SELECT Title = ' People reached by District', 
Link = ISNULL(GS.Value, '') + ':350/HTMLClient/#/Rpt_PeopleReached/DIST/?ProjectID=' + cast(p.projectID as varchar(255))
, 
Priority = 300 , 
 (SELECT ID 
   FROM   [mm].[ALL_ProgrammeMenuGroup] G 
   WHERE  G.Title = P.ShortName 
          AND G.Programme_ID = P.Programme_ID)
, Prog.Programme_ID
FROM app.Programme Prog
INNER JOIN app.Project P
ON Prog.Programme_ID = P.Programme_ID
LEFT OUTER JOIN  settings.GlobalSettings GS
							ON GS.Code = 'BASESITEURL'
WHERE Exists (select 1 FROM RBM.PeopleReachedValues PRV 
					WHERE Prv.ProjectID = P.ProjectID)
AND P.Active = 1
UNION ALL 
SELECT Title = ' People reached by Region', 
Link = ISNULL(GS.Value, '') + ':350/HTMLClient/#/Rpt_PeopleReached/REG/?ProjectID=' + cast(p.projectID as varchar(255))
, 
Priority = 310 , 
 (SELECT ID 
   FROM   [mm].[ALL_ProgrammeMenuGroup] G 
   WHERE  G.Title = P.ShortName 
          AND G.Programme_ID = P.Programme_ID)
, Prog.Programme_ID
FROM app.Programme Prog
INNER JOIN app.Project P
ON Prog.Programme_ID = P.Programme_ID
LEFT OUTER JOIN  settings.GlobalSettings GS
							ON GS.Code = 'BASESITEURL'
WHERE Exists (select 1 FROM RBM.PeopleReachedValues PRV 
					WHERE Prv.ProjectID = P.ProjectID)
AND P.Active = 1
							-------------------------------People reached by project end
UNION ALL 

----------------------------------------------------
--Project Reach
SELECT Title = 'Operational areas', 
Link = ISNULL(GS.Value, '') +  Programme.ProgrammeSiteName + '/Dashboards/ProjectReach.aspx'
, 
Priority = 330 , 
Parent = 55
, Programme_ID
FROM app.Programme
LEFT OUTER JOIN  settings.GlobalSettings GS
							ON GS.Code = 'MMBASEURL'


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

---------------------------------
--Indicator maps for sectors
---------------------------------
UNION ALL
  SELECT   
            'Indicator Map: ' + I.ShortName + ' ' AS Title ,
            ISNULL(GS.Value, '/') + [dom].[ProgrammeSiteName]
            + '/Dashboards/IndicatorMapPage.aspx?qsIndicatorID='
            --+ '[Indicator].[Sector].%26['
			--+ CAST(do.Sector_ID AS VARCHAR(8)) + ']'
			+ CAST(I.IndicatorID as varchar(255))
			 AS Link ,
			Priority = (400 * dom.Programme_ID) + I.IndicatorID,--* P.ProjectID, 
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
			LEFT JOIN app.SubSector SS
				ON do.Sector_ID = SS.Sector_ID
			INNER JOIN App.Indicator I
				ON do.Sector_ID = I.Sector_ID
				OR SS.SubSector_ID = I.SubSector_ID
  WHERE     do.Active = 1
            AND dom.Active = 1
						AND EXISTS (SELECT 1 FROM RBM.IndicatorValues IV
									WHERE I.IndicatorID = IV.Indicator_ID
													)


              
GO


