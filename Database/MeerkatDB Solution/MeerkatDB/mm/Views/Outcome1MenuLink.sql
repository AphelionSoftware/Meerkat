






CREATE VIEW [mm].[Outcome1MenuLink]
AS
SELECT     Substring(Title,1,50) as Title, Link, ID, Parent 
FROM mm.ALL_OutcomeMenuLink
WHERE OutcomeID in (Select ID from (
Select Row_Number() Over (Partition by 1 Order By Code) as IDX, OutcomeID as ID
from app.Outcome Where Active=1 ) as IDX

Where IDX.IDX=1)