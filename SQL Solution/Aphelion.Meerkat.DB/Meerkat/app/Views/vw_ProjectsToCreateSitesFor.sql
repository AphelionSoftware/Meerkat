CREATE VIEW app.vw_ProjectsToCreateSitesFor
as
SELECT 
PR.ProjectSiteName As SiteName,
 
  (SELECT Value FROM settings.GlobalSettings WHERE Code = 'BASESITEURL' ) 
  + REPLACE('/' + P.ProgrammeSiteName  
  + '/'
  + PR.ProjectSiteName
  , '//', '/')
 AS SitePath
    , PR.ShortName as Title

    FROM app.Project PR
    LEFT OUTER JOIN app.SubSector SS1
   JOIN app.Sector S1
    ON SS1.Sector_ID = S1.Sector_ID

  ON PR.SubSector_ID = SS1.SubSector_ID
 
  LEFT OUTER JOIN app.Sector S2
    ON PR.Sector_ID = S2.Sector_ID
 
      JOIN app.Programme P
   ON PR.Programme_ID = P.Programme_ID
   OR S1.Programme_ID = P.Programme_ID
   OR S2.Programme_ID = P.Programme_ID
WHERE PR.isSiteCreated = 0