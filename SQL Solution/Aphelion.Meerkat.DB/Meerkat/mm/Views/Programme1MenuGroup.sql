
CREATE VIEW [mm].[Programme1MenuGroup] 
AS 
  SELECT Substring(Title, 1, 50) AS Title, 
         Link, 
         Parent, 
         ID 
  FROM   [mm].[ALL_ProgrammeMenuGroup] 
  WHERE  Programme_ID IN (SELECT ID 
                       FROM   (SELECT Row_number() 
                                        OVER ( 
                                          partition BY 1 
                                          ORDER BY Code) AS IDX, 
                                      Programme_ID          AS ID 
                               FROM   [app].[Programme] 
                               WHERE  Active = 1) AS IDX 
                       WHERE  IDX.ID = 1)