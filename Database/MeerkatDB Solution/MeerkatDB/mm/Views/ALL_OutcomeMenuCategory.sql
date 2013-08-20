CREATE VIEW [mm].[ALL_OutcomeMenuCategory] 
AS 
  SELECT Title = 'Outcome Pages', 
         Link = '', 
         ID = 10000, 
         OutcomeID, 
         [OutcomeSiteName] 
  FROM   [app].[Outcome] 
  WHERE Active = 1
  UNION ALL 
  SELECT Title = do.ShortName, 
         Link = '', 
         1 - do.Output_ID + 5000 AS ID, 
         do.OutcomeID, 
         OC.[OutcomeSiteName] 
  FROM   [app].[Output] do 
         LEFT JOIN [app].[Outcome] AS OC 
                ON do.OutcomeID = oc.OutcomeID 
				WHERE do.Active = 1 AND oc.Active = 1
  UNION ALL 
  SELECT Title = 'Projects', 
         Link = '', 
         ID = 30000, 
         OutcomeID, 
         [OutcomeSiteName] 
  FROM   [app].[Outcome] 
  WHERE Active = 1