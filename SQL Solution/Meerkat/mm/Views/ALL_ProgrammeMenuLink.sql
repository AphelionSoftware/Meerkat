﻿

CREATE VIEW [mm].[ALL_ProgrammeMenuLink] 
AS 
   SELECT Title = 'Indicator Details', 
         Link = ISNULL(GS.Value, '/') + [ProgrammeSiteName] 
                + 
'/Dashboards/Template%20Pages/Indicator%20Details%20Page.aspx?qsIndCode=' 
       + '[Sub Sector].[Sub Sector].%26[' 
       + Cast(dso.SubSector_ID AS VARCHAR(8)) + ']', 
ID = 100 * dso.SubSector_ID, 
Parent = (SELECT ID 
          FROM   [mm].[ALL_ProgrammeMenuGroup] G 
          WHERE  G.Title = dso.ShortName 
                 AND G.Programme_ID = do.Programme_ID), 
do.Programme_ID 
FROM   [app].[SubSector] dso 
INNER JOIN app.Sector do 
        ON dso.Sector_ID = do.Sector_ID 
INNER JOIN [app].[Programme] AS OC 
        ON do.Programme_ID = oc.Programme_ID 
						LEFT OUTER JOIN  settings.GlobalSettings GS
							ON GS.Code = 'MMBASEURL'
WHERE  dso.Active = 1  AND do.Active = 1 AND oc.Active = 1
UNION ALL 
SELECT Title = 'Location Indicator Details', 
Link = ISNULL(GS.Value, '/') + [ProgrammeSiteName] 
       + 
'/Dashboards/Template%20Pages/Provincial%20Indicator%20Details%20Page.aspx?qsIndCode=' 
+ '[Sub Sector].[Sub Sector].%26[' 
+ Cast(dso.SubSector_ID AS VARCHAR(8)) + ']', 
Priority = 100 * dso.SubSector_ID, 
Parent = (SELECT ID 
   FROM   [mm].[ALL_ProgrammeMenuGroup] G 
   WHERE  G.Title = dso.ShortName 
          AND G.Programme_ID = DO.Programme_ID), 
do.Programme_ID 
FROM   [app].[SubSector] dso 
INNER JOIN app.Sector do 
        ON dso.Sector_ID = do.Sector_ID 
INNER JOIN [app].[Programme] AS OC 
        ON do.Programme_ID = oc.Programme_ID 
						LEFT OUTER JOIN  settings.GlobalSettings GS
							ON GS.Code = 'MMBASEURL'
WHERE  dso.Active = 1 AND do.Active = 1 AND OC.Active = 1
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
