CREATE VIEW [mm].[ALL_OutcomeMenuLink] 
AS 
   SELECT Title = 'Indicator Details', 
         Link = '/' + [OutcomeSiteName] 
                + 
'/Dashboards/Template%20Pages/Indicator%20Details%20Page.aspx?qsIndCode=' 
       + '[Sub Output].[Sub Output].%26[' 
       + Cast(dso.SubOutput_ID AS VARCHAR(8)) + ']', 
ID = 100 * dso.SubOutput_ID, 
Parent = (SELECT ID 
          FROM   [mm].[ALL_OutcomeMenuGroup] G 
          WHERE  G.Title = dso.ShortName 
                 AND G.OutcomeID = do.OutcomeID), 
do.OutcomeID 
FROM   [app].[SubOutput] dso 
INNER JOIN app.Output do 
        ON dso.Output_ID = do.Output_ID 
INNER JOIN [app].[Outcome] AS OC 
        ON do.OutcomeID = oc.OutcomeID 
WHERE  dso.Active = 1  AND do.Active = 1 AND oc.Active = 1
UNION ALL 
SELECT Title = 'Location Indicator Details', 
Link = '/' + [OutcomeSiteName] 
       + 
'/Dashboards/Template%20Pages/Provincial%20Indicator%20Details%20Page.aspx?qsIndCode=' 
+ '[Sub Output].[Sub Output].%26[' 
+ Cast(dso.SubOutput_ID AS VARCHAR(8)) + ']', 
Priority = 100 * dso.SubOutput_ID, 
Parent = (SELECT ID 
   FROM   [mm].[ALL_OutcomeMenuGroup] G 
   WHERE  G.Title = dso.ShortName 
          AND G.OutcomeID = DO.OutcomeID), 
do.OutcomeID 
FROM   [app].[SubOutput] dso 
INNER JOIN app.Output do 
        ON dso.Output_ID = do.Output_ID 
INNER JOIN [app].[Outcome] AS OC 
        ON do.OutcomeID = oc.OutcomeID 
WHERE  dso.Active = 1 AND do.Active = 1 AND OC.Active = 1
UNION ALL 
SELECT Title = Da.ShortName, 
Link = '/' + [OutcomeSiteName] 
       + 
'/Dashboards/Template%20Pages/Milestones%20Page.aspx?qsActivity='
	+ Cast(da.ActivityID AS VARCHAR(8)) , 
Priority = 1 - da.ActivityID + 5000, 
Parent = (SELECT SRC.ID + P.ProjectID AS ID 
          FROM   app.Project P 
                 CROSS apply (SELECT ID 
                              FROM   mm.ALL_OutcomeMenuCategory O2MC 
                              WHERE  Title = 'Projects'
							  AND O2MC.OutcomeID = OC.OutcomeID
							  ) Src 
          WHERE  OutcomeID = dp.OutcomeID 
                 AND P.ProjectID = da.ProjectID), 
Dp.OutcomeID 
FROM   app.Activity da 
INNER JOIN app.Project dp 
        ON da.ProjectID = dp.ProjectID 
INNER JOIN [app].[Outcome] AS OC 
        ON dp.OutcomeID = oc.OutcomeID 
WHERE  da.Active = 1 AND dp.Active = 1 AND oc.Active = 1