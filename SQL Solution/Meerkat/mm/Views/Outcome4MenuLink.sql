CREATE VIEW [mm].[Outcome4MenuLink] 
AS 
  SELECT Substring(Title, 1, 50) AS Title, 
         Link, 
         ID, 
         Parent 
  FROM   mm.ALL_OutcomeMenuLink 
  WHERE  OutcomeID = 4 
