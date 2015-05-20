

CREATE VIEW [mm].[ALL_ProgrammeMenuCategory] 
AS 
 SELECT Title = 'Program', 
         Link = '', 
         ID = 10000, 
         [Programme_ID], 
         [ProgrammeSiteName] [SiteName] 
  FROM   [app].[Programme] 
  WHERE Active = 1
  UNION ALL 
---SELECT Title = do.Code , 
---       Link = '', 
---       1 - do.Sector_ID + 5000 AS ID, 
---       do.Programme_ID, 
---       OC.[ProgrammeSiteName] SiteName
---FROM   [app].[Sector] do 
---       JOIN [app].[Programme] AS OC 
---              ON do.Programme_ID = oc.[Programme_ID] 
---			WHERE do.Active = 1 AND oc.Active = 1
---			/*Hide sectors with no indicators*/
---			AND EXISTS (SELECT 1 FROM app.Indicator I
---							LEFT JOIN app.SubSector SS
---							ON I.SubSector_ID = SS.SubSector_ID
---							WHERE I.Sector_ID = do.Sector_ID
---							OR SS.Sector_ID = do.Sector_ID)
SELECT Title = 'Sectors', 
         Link = '', 
         ID = 20000, 
         [Programme_ID], 
         [ProgrammeSiteName] 
  FROM   [app].[Programme] 
  WHERE Active = 1
  UNION ALL 
  SELECT Title = 'Projects', 
         Link = '', 
         ID = 30000, 
         [Programme_ID], 
         [ProgrammeSiteName] 
  FROM   [app].[Programme] 
  WHERE Active = 1

  UNION ALL 
  SELECT Title = 'Documents and help', 
         Link = '', 
         ID = 40000, 
         [Programme_ID], 
         [ProgrammeSiteName] 
  FROM   [app].[Programme] 
  WHERE Active = 1


 -- UNION ALL 
  /*Care specific. Sectors with no programme to CO level*/
---SELECT Title = do.Code , 
---       Link = '', 
---       1 - do.Sector_ID + 5000 AS ID, 
---       do.Programme_ID, 
---       OC.[ProgrammeSiteName] SiteName
---FROM   [app].[Sector] do 
---       JOIN [app].[Programme] AS OC 
---              ON do.Programme_ID is null
---			AND OC.BusinessKey = 'CO'
---			WHERE do.Active = 1 AND oc.Active = 1
---			/*Hide sectors with no indicators*/
---			AND EXISTS (SELECT 1 FROM app.Indicator I
---							LEFT JOIN app.SubSector SS
---							ON I.SubSector_ID = SS.SubSector_ID
---							WHERE I.Sector_ID = do.Sector_ID
---							OR SS.Sector_ID = do.Sector_ID)

GO

