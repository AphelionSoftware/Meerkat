







CREATE VIEW [mm].[Outcome3MenuGroup]
AS
SELECT      Title, Link, Parent, ID
FROM mm.ALL_OutcomeMenuGroup 
WHERE OutcomeId		in (Select ID from (
Select Row_Number() Over (Partition by 1 Order By Code) as IDX, OutcomeID as ID
from app.Outcome Where Active=1 ) as IDX

Where IDX.IDX=3)
