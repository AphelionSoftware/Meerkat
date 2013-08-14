CREATE VIEW [mm].[Outcome2MenuLink] 
AS 
  SELECT Substring(title, 1, 50) AS Title, 
         link, 
         id, 
         parent 
  FROM   mm.all_outcomemenulink 
  WHERE  outcomeid = 2