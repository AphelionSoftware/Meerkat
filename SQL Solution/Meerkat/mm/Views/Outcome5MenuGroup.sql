CREATE VIEW [mm].[Outcome5MenuGroup] 
AS 
  SELECT Substring(title, 1, 50) AS Title, 
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
                       WHERE  IDX.idx = 5) 