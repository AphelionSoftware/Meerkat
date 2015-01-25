CREATE VIEW [d3].[vwProgramProjectIndicator]
as

--select top 0 * from(
select 
	'Program' as ReportLevel,
	 'Root' as NodeLevel,
	NULL AS Level1,
	NULL AS Level2,
	P.LongName AS Level3


from app.Programme P
UNION ALL


select 
	'Indicator' as ReportLevel, 
	'Leaf' as NodeLevel,
	 NULL AS Level1,
	I.LongName AS Level2,
	P.LongName AS Level3 


from app.Indicator I
INNER JOIN app.Programme P
ON I.Programme_ID = P.Programme_ID


-----------------------------------------------------
---Start of project links, from Indicator
-----------------------------------------------------
UNION ALL
--Project to Programme, with indicator
SELECT 
	'Indicator' as ReportLevel, 
	 'Leaf' as NodeLevel,
	I.LongName AS Level1,
	PR.LongName AS Level2,
	P.LongName AS Level3
from app.Indicator I
INNER JOIN app.Project PR
			INNER JOIN app.Programme P
			ON PR.Programme_ID = P.Programme_ID
				ON I.ProjectID = PR.ProjectID









-----------------------------------------------------
---Start of project links, from Indicator
-----------------------------------------------------
UNION ALL
--Project to Programme, with indicator
SELECT 
	'Project' as ReportLevel, 
	 	 'Node' as NodeLevel,
	NULL AS Level1,
	PR.LongName AS Level2,
	P.LongName AS Level3
from 
app.Project PR
			INNER JOIN app.Programme P
			ON PR.Programme_ID = P.Programme_ID




--) src