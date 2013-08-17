CREATE VIEW [mm].[Outcome2MenuLink] 
AS 
  SELECT Substring(Title, 1, 50) AS Title, 
         Link, 
         ID, 
         Parent 
  FROM   mm.ALL_OutcomeMenuLink 
  WHERE  OutcomeID = 2
