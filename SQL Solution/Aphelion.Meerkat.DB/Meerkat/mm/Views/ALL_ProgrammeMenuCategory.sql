
CREATE VIEW [mm].[ALL_ProgrammeMenuCategory] 
AS 
  SELECT Title = 'Programme Pages', 
         Link = '', 
         ID = 10000, 
         [Programme_ID], 
         [ProgrammeSiteName] [SiteName] 
  FROM   [app].[Programme] 
  WHERE Active = 1
  UNION ALL 
  SELECT Title = do.ShortName, 
         Link = '', 
         1 - do.Sector_ID + 5000 AS ID, 
         do.Programme_ID, 
         OC.[ProgrammeSiteName] SiteName
  FROM   [app].[Sector] do 
         LEFT JOIN [app].[Programme] AS OC 
                ON do.Programme_ID = oc.[Programme_ID] 
				WHERE do.Active = 1 AND oc.Active = 1
  UNION ALL 
  SELECT Title = 'Projects', 
         Link = '', 
         ID = 30000, 
         [Programme_ID], 
         [ProgrammeSiteName] 
  FROM   [app].[Programme] 
  WHERE Active = 1