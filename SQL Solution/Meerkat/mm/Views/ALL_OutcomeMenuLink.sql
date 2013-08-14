CREATE VIEW [mm].[ALL_OutcomeMenuLink] 
AS 
  SELECT Title = 'Indicator Details', 
         Link = '/' + [outcomesitename] 
                + 
'/Dashboards/Template%20Pages/Indicator%20Details%20Page.aspx?qsIndCode=' 
       + '[Sub Output].[Sub Output].%26[' 
       + Cast(dso.suboutput_id AS VARCHAR(8)) + ']', 
ID = 100 * dso.suboutput_id, 
Parent = (SELECT id 
          FROM   mm.all_outcomemenugroup G 
          WHERE  G.title = dso.shortname 
                 AND G.outcomeid = do.outcomeid), 
do.outcomeid 
FROM   app.suboutput dso 
INNER JOIN app.output do 
        ON dso.output_id = do.output_id 
INNER JOIN app.outcome AS OC 
        ON do.outcomeid = oc.outcomeid 
WHERE  dso.active = 1  AND do.Active = 1 AND oc.Active = 1
UNION ALL 
SELECT Title = 'Provincial Indicator Details', 
Link = '/' + [outcomesitename] 
       + 
'/Dashboards/Template%20Pages/Provincial%20Indicator%20Details%20Page.aspx?qsIndCode=' 
+ '[Sub Output].[Sub Output].%26[' 
+ Cast(dso.suboutput_id AS VARCHAR(8)) + ']', 
Priority = 100 * dso.suboutput_id, 
Parent = (SELECT id 
   FROM   mm.all_outcomemenugroup G 
   WHERE  G.title = dso.shortname 
          AND G.outcomeid = DO.outcomeid), 
do.outcomeid 
FROM   app.suboutput dso 
INNER JOIN app.output do 
        ON dso.output_id = do.output_id 
INNER JOIN app.outcome AS OC 
        ON do.outcomeid = oc.outcomeid 
WHERE  dso.active = 1 AND do.Active = 1 AND OC.Active = 1
UNION ALL 
SELECT Title = Da.shortname, 
Link = '/' + [outcomesitename] 
       + 
'/Dashboards/Template%20Pages/Milestones%20Page.aspx?qsActivity=' 
       + '[Activity].[Activity].%26[' 
       + Cast(da.activityid AS VARCHAR(8)) + ']', 
Priority = 1 - da.activityid + 5000, 
Parent = (SELECT SRC.id + P.projectid AS ID 
          FROM   app.project P 
                 CROSS apply (SELECT id 
                              FROM   mm.outcome2menucategory O2MC 
                              WHERE  title = 'Projects') Src 
          WHERE  outcomeid = dp.outcomeid 
                 AND P.projectid = da.projectid), 
Dp.outcomeid 
FROM   app.activity da 
INNER JOIN app.project dp 
        ON da.projectid = dp.projectid 
INNER JOIN app.outcome AS OC 
        ON dp.outcomeid = oc.outcomeid 
WHERE  da.active = 1 AND dp.Active = 1 AND oc.Active = 1