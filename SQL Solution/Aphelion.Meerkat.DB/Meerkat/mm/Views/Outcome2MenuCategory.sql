﻿





CREATE VIEW [mm].[Outcome2MenuCategory]
AS
SELECT Substring(Title,1,50) as Title, Link, ID 
FROM [mm].[ALL_OutcomeMenuCategory]
WHERE Outcome_ID		in (Select ID from (
Select Row_Number() Over (Partition by 1 Order By Code) as IDX, Outcome_ID as ID
from [app].[Outcome] Where Active=1 ) as IDX

Where IDX.IDX=2)
