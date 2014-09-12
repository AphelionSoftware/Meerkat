

CREATE VIEW [OLAP_GEN].[IndicatorByProject]
as

--select top 0 * from(
select 
	'Program' as ReportLevel,
	P.ShortName as IndicatorShortName,
	P.ShortName as ProjectShortName,
	P.ShortName as ProgrammeShortName,
	P.BusinessKey as IndicatorBusinessKey,
	P.BusinessKey as ProjectBusinessKey,
	P.BusinessKey as ProgrammeBusinessKey,
	P.LongName as IndicatorLongName,
	P.LongName as ProjectLongName,
	P.LongName as ProgrammeLongName,
	P.Code as IndicatorCode,
	P.Code as ProjectCode,
	P.Code as ProgrammeCode

from app.Programme P
UNION ALL


select 
	'Indicator' as ReportLevel,
	I.ShortName as IndicatorShortName,
	P.ShortName as ProjectShortName,
	P.ShortName as ProgrammeShortName	,
	I.BusinessKey as IndicatorBusinessKey,
	P.BusinessKey as ProjectBusinessKey,
	P.BusinessKey as ProgrammeBusinessKey,
	I.LongName as IndicatorLongName,
	P.LongName as ProjectLongName,
	P.LongName as ProgrammeLongName,
	I.Code as IndicatorCode,
	P.Code as ProjectCode,
	P.Code as ProgrammeCode


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
	
	I.ShortName as IndicatorShortName,
	PR.ShortName as ProjectShortName,
	P.ShortName as ProgrammeShortName,
	I.BusinessKey as IndicatorBusinessKey,
	PR.BusinessKey as ProjectBusinessKey,
	P.BusinessKey as ProgrammeBusinessKey,
	I.LongName as IndicatorLongName,
	PR.LongName as ProjectLongName,
	P.LongName as ProgrammeLongName,
	I.Code as IndicatorCode,
	PR.Code as ProjectCode,
	P.Code as ProgrammeCode
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
	
	PR.ShortName as IndicatorShortName,
	PR.ShortName as ProjectShortName,
	P.ShortName as ProgrammeShortName,
	PR.BusinessKey as IndicatorBusinessKey,
	PR.BusinessKey as ProjectBusinessKey,
	P.BusinessKey as ProgrammeBusinessKey,
	PR.LongName as IndicatorLongName,
	PR.LongName as ProjectLongName,
	P.LongName as ProgrammeLongName,
	PR.Code as IndicatorCode,
	PR.Code as ProjectCode,
	P.Code as ProgrammeCode
from 
app.Project PR
			INNER JOIN app.Programme P
			ON PR.Programme_ID = P.Programme_ID




--) src
GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorByProject', @level2type = N'COLUMN', @level2name = N'ProgrammeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorByProject', @level2type = N'COLUMN', @level2name = N'ProgrammeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorByProject', @level2type = N'COLUMN', @level2name = N'ProjectShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'4', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorByProject', @level2type = N'COLUMN', @level2name = N'ProjectShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorByProject', @level2type = N'COLUMN', @level2name = N'IndicatorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'5', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorByProject', @level2type = N'COLUMN', @level2name = N'IndicatorShortName';


GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorByProject';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorByProject';

