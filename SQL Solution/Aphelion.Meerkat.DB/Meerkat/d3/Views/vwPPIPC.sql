CREATE VIEW d3.vwPPIPC
AS
SELECT 'Root' As ReportLevel, 
	'Root' AS NodeLevel
	, 'Programme' AS name
	, NULL AS parent
	, NULL AS ID
/*-----------------------------------------------------
---All Programs
-----------------------------------------------------*/
UNION ALL 
select 
	'Program' as ReportLevel,
	 'Root' as NodeLevel,
	P.Longname  As name
	, 'Programme' AS parent
	, P.Programme_ID AS ID
from app.Programme P
 

/*-----------------------------------------------------
---Programs linked to projects
-----------------------------------------------------*/
UNION ALL
SELECT 
	'Project' as ReportLevel, 
	 'Node' as NodeLevel,
	
	PR.Longname AS name, 
	P.Longname AS parent 
	, PR.ProjectID AS ID
from   app.Project PR
			INNER JOIN app.Programme P
			ON PR.Programme_ID = P.Programme_ID

/*-----------------------------------------------------
---Indicator to Project
-----------------------------------------------------*/
 UNION ALL
SELECT 
	'Indicator' as ReportLevel, 
	 'Leaf' as NodeLevel,
	I.Longname AS name,
	PR.Longname AS parent
	, I.IndicatorID AS ID
from app.Indicator I
INNER JOIN app.Project PR
			 	ON I.ProjectID = PR.ProjectID

/*-----------------------------------------------------
---Indicator to Program
-----------------------------------------------------*/
 UNION ALL
SELECT 
	'Indicator' as ReportLevel, 
	 'Leaf' as NodeLevel,
	I.Longname AS name,
	P.Longname AS parent
	, I.IndicatorID AS ID
from app.Indicator I
INNER JOIN app.Programme P
			 	ON I.Programme_ID = P.Programme_ID