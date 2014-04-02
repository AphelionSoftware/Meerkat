CREATE VIEW [mm].[Outcome2MenuGroup] 
AS 
  SELECT Substring(Title, 1, 50) AS Title, 
         Link, 
         Parent, 
         ID 
  FROM   [mm].[ALL_OutcomeMenuGroup] 
  WHERE  Outcome_ID IN (SELECT ID 
                       FROM   (SELECT Row_number() 
                                        OVER ( 
                                          partition BY 1 
                                          ORDER BY Code) AS IDX, 
                                      Outcome_ID          AS ID 
                               FROM   [app].[Outcome] 
                               WHERE  Active = 1) AS IDX 
                       WHERE  IDX.IDx = 2) 
