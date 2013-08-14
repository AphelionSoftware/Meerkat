CREATE VIEW [mm].[Outcome3MenuGroup] 
AS 
  SELECT title, 
         link, 
         parent, 
         id 
  FROM   mm.all_outcomemenugroup 
  WHERE  outcomeid IN (SELECT id 
                       FROM   (SELECT Row_number() 
                                        OVER ( 
                                          partition BY 1 
                                          ORDER BY code) AS IDX, 
                                      outcomeid          AS ID 
                               FROM   app.outcome 
                               WHERE  active = 1) AS IDX 
                       WHERE  IDX.idx = 3) 