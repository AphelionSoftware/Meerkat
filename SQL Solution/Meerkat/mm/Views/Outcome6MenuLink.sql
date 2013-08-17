CREATE VIEW [mm].[Outcome6MenuLink] 
AS 
  SELECT Substring(Title, 1, 50) AS Title, 
         Link, 
         ID, 
         Parent 
  FROM   mm.ALL_OutcomeMenuLink 
  WHERE  OutcomeID = 6 
