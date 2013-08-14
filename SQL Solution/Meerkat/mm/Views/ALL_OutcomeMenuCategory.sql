CREATE VIEW [mm].[ALL_OutcomeMenuCategory] 
AS 
  SELECT Title = 'Outcome Pages', 
         Link = '', 
         ID = 10000, 
         outcomeid, 
         [outcomesitename] 
  FROM   app.outcome 
  WHERE Active = 1
  UNION ALL 
  SELECT Title = do.shortname, 
         Link = '', 
         1 - do.output_id + 5000 AS ID, 
         do.outcomeid, 
         OC.[outcomesitename] 
  FROM   [app].[output] do 
         LEFT JOIN app.outcome AS OC 
                ON do.outcomeid = oc.outcomeid 
				WHERE do.Active = 1 AND oc.Active = 1
  UNION ALL 
  SELECT Title = 'Projects', 
         Link = '', 
         ID = 30000, 
         outcomeid, 
         [outcomesitename] 
  FROM   app.outcome 
  WHERE Active = 1