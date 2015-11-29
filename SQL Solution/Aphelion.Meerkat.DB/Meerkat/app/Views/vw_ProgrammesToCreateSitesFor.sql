
CREATE VIEW [app].[vw_ProgrammesToCreateSitesFor]
as

SELECT 
P.ProgrammeSiteName As SiteName,
 
  (SELECT Value FROM settings.GlobalSettings WHERE Code = 'BASESITEURL' ) 
  + REPLACE('/' + P.ProgrammeSiteName  , '//', '/')
  /*+ CASE WHEN  convert(varchar(10), getdate(), 112) = 20140820 THEN '_' +  cast (   (datepart(hour,getdate()) * 100) + datepart(minute,getdate())
   as varchar(255))
   ELSE '' END*/
 AS SitePath
 , P.ShortName as Title
    

    FROM  app.Programme P
 
 WHERE P.isSiteCreated = 0