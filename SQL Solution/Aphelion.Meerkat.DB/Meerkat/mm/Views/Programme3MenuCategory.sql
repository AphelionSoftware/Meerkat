



CREATE VIEW [mm].[Programme3MenuCategory] 
AS 
  SELECT Substring(Title, 1, 50) AS Title, 
         Link, 
         ID 
  FROM   [mm].[ALL_ProgrammeMenuCategory] 
  WHERE  Programme_ID IN (SELECT ID 
                       FROM   (SELECT Row_number() 
                                        OVER ( 
                                          partition BY 1
                                          ORDER BY Code) AS IDX, 
                                      Programme_ID          AS ID 
                               FROM   [app].[Programme] 
                               WHERE  Active = 1) AS IDX 
                       WHERE  IDX.ID = 3)