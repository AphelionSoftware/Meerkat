









CREATE VIEW [mm].[Programme3MenuLink]
AS
SELECT     Substring(Title,1,50) as Title, Link, ID, Parent 
FROM mm.ALL_ProgrammeMenuLink
WHERE Programme_ID in (Select ID from (
Select Row_Number() Over (Partition by 1 Order By Code) as IDX, Programme_ID as ID
from app.Programme Where Active=1 ) as IDX

Where IDX.ID=3)