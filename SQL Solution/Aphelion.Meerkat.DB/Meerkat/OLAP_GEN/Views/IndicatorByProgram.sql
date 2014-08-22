




CREATE VIEW [OLAP_GEN].[IndicatorByProgram]
as

select top 0 * from(
select 
	'Program' as ReportLevel,
	P.ShortName as IndicatorShortName,
	P.ShortName as ProjectShortName,
	P.ShortName as SubsectorShortName,
	P.ShortName as SectorShortName,
	P.ShortName as ProgrammeShortName,
	P.BusinessKey as IndicatorBusinessKey,
	P.BusinessKey as ProjectBusinessKey,
	P.BusinessKey as SubsectorBusinessKey,
	P.BusinessKey as SectorBusinessKey,
	P.BusinessKey as ProgrammeBusinessKey,
	P.LongName as IndicatorLongName,
	P.LongName as ProjectLongName,
	P.LongName as SubsectorLongName,
	P.LongName as SectorLongName,
	P.LongName as ProgrammeLongName,
	P.Code as IndicatorCode,
	P.Code as ProjectCode,
	P.Code as SubsectorCode,
	P.Code as SectorCode,
	P.Code as ProgrammeCode


from app.Programme P
UNION ALL


select 
	'Indicator' as ReportLevel,
	I.ShortName as IndicatorShortName,
	P.ShortName as ProjectShortName,
	P.ShortName as SubsectorShortName,
	P.ShortName as SectorShortName,
	P.ShortName as ProgrammeShortName	,
	I.BusinessKey as IndicatorBusinessKey,
	P.BusinessKey as ProjectBusinessKey,
	P.BusinessKey as SubsectorBusinessKey,
	P.BusinessKey as SectorBusinessKey,
	P.BusinessKey as ProgrammeBusinessKey,
	I.LongName as IndicatorLongName,
	P.LongName as ProjectLongName,
	P.LongName as SubsectorLongName,
	P.LongName as SectorLongName,
	P.LongName as ProgrammeLongName,
	I.Code as IndicatorCode,
	P.Code as ProjectCode,
	P.Code as SubsectorCode,
	P.Code as SectorCode,
	P.Code as ProgrammeCode


from app.Indicator I
INNER JOIN app.Programme P
ON I.Programme_ID = P.Programme_ID
UNION ALL 
SELECT 
	'Indicator' as ReportLevel,
	I.ShortName as IndicatorShortName,
	S.ShortName as ProjectShortName,
	S.ShortName as SubsectorShortName,
	S.ShortName as SectorShortName,
	P.ShortName as ProgrammeShortName,
	I.BusinessKey as IndicatorBusinessKey,
	S.BusinessKey as ProjectBusinessKey,
	S.BusinessKey as SubsectorBusinessKey,
	S.BusinessKey as SectorBusinessKey,
	P.BusinessKey as ProgrammeBusinessKey,
	I.LongName as IndicatorLongName,
	S.LongName as ProjectLongName,
	S.LongName as SubsectorLongName,
	S.LongName as SectorLongName,
	P.LongName as ProgrammeLongName,
	I.Code as IndicatorCode,
	S.Code as ProjectCode,
	S.Code as SubsectorCode,
	S.Code as SectorCode,
	P.Code as ProgrammeCode



from app.Indicator I
INNER JOIN app.Sector S
	INNER JOIN app.Programme P
	ON S.Programme_ID = P.Programme_ID
	ON I.Sector_ID = S.Sector_ID

UNION ALL 
SELECT 
	'Indicator' as ReportLevel, 
	I.ShortName as IndicatorShortName,
	SS.ShortName as ProjectShortName,
	SS.ShortName as SubsectorShortName,
	S.ShortName as SectorShortName,
	P.ShortName as ProgrammeShortName,
	I.BusinessKey as IndicatorBusinessKey,
	SS.BusinessKey as ProjectBusinessKey,
	SS.BusinessKey as SubsectorBusinessKey,
	S.BusinessKey as SectorBusinessKey,
	P.BusinessKey as ProgrammeBusinessKey,
	I.LongName as IndicatorLongName,
	SS.LongName as ProjectLongName,
	SS.LongName as SubsectorLongName,
	S.LongName as SectorLongName,
	P.LongName as ProgrammeLongName,
	I.Code as IndicatorCode,
	SS.Code as ProjectCode,
	SS.Code as SubsectorCode,
	S.Code as SectorCode,
	P.Code as ProgrammeCode
from app.Indicator I
INNER JOIN app.SubSector SS
	INNER JOIN app.Sector S
		INNER JOIN app.Programme P
		ON S.Programme_ID = P.Programme_ID
		ON SS.Sector_ID = S.Sector_ID
		ON I.SubSector_ID = SS.SubSector_ID


-----------------------------------------------------
---Start of project links, from Indicator
-----------------------------------------------------
UNION ALL
--Project to Programme, with indicator
SELECT 
	'Indicator' as ReportLevel, 
	
	I.ShortName as IndicatorShortName,
	PR.ShortName as ProjectShortName,
	P.ShortName as SubsectorShortName,
	P.ShortName as SectorShortName,
	P.ShortName as ProgrammeShortName,
	I.BusinessKey as IndicatorBusinessKey,
	PR.BusinessKey as ProjectBusinessKey,
	P.BusinessKey as SubsectorBusinessKey,
	P.BusinessKey as SectorBusinessKey,
	P.BusinessKey as ProgrammeBusinessKey,
	I.LongName as IndicatorLongName,
	PR.LongName as ProjectLongName,
	P.LongName as SubsectorLongName,
	P.LongName as SectorLongName,
	P.LongName as ProgrammeLongName,
	I.Code as IndicatorCode,
	PR.Code as ProjectCode,
	P.Code as SubsectorCode,
	P.Code as SectorCode,
	P.Code as ProgrammeCode
from app.Indicator I
INNER JOIN app.Project PR
			INNER JOIN app.Programme P
			ON PR.Programme_ID = P.Programme_ID
				ON I.ProjectID = PR.ProjectID



UNION ALL
--Project to sector
SELECT 
	'Indicator' as ReportLevel, 
	
	I.ShortName as IndicatorShortName,
	PR.ShortName as ProjectShortName,
	S.ShortName as SubsectorShortName,
	S.ShortName as SectorShortName,
	P.ShortName as ProgrammeShortName,
	I.BusinessKey as IndicatorBusinessKey,
	PR.BusinessKey as ProjectBusinessKey,
	S.BusinessKey as SubsectorBusinessKey,
	S.BusinessKey as SectorBusinessKey,
	P.BusinessKey as ProgrammeBusinessKey,
	I.LongName as IndicatorLongName,
	PR.LongName as ProjectLongName,
	S.LongName as SubsectorLongName,
	S.LongName as SectorLongName,
	P.LongName as ProgrammeLongName,
	I.Code as IndicatorCode,
	PR.Code as ProjectCode,
	S.Code as SubsectorCode,
	S.Code as SectorCode,
	P.Code as ProgrammeCode
from app.Indicator I
INNER JOIN app.Project PR
		INNER JOIN app.Sector S
			INNER JOIN app.Programme P
			ON S.Programme_ID = P.Programme_ID
				ON PR.Sector_ID = S.Sector_ID
				ON I.ProjectID = PR.ProjectID

UNION ALL

--Project to Sub Sector
SELECT 
	'Indicator' as ReportLevel, 
	I.ShortName as IndicatorShortName,
	PR.ShortName as ProjectShortName,
	SS.ShortName as SubsectorShortName,
	S.ShortName as SectorShortName,
	P.ShortName as ProgrammeShortName,
	I.BusinessKey as IndicatorBusinessKey,
	PR.BusinessKey as ProjectBusinessKey,
	SS.BusinessKey as SubsectorBusinessKey,
	S.BusinessKey as SectorBusinessKey,
	P.BusinessKey as ProgrammeBusinessKey,
	I.LongName as IndicatorLongName,
	PR.LongName as ProjectLongName,
	SS.LongName as SubsectorLongName,
	S.LongName as SectorLongName,
	P.LongName as ProgrammeLongName,
	I.Code as IndicatorCode,
	PR.Code as ProjectCode,
	SS.Code as SubsectorCode,
	S.Code as SectorCode,
	P.Code as ProgrammeCode
from app.Indicator I
INNER JOIN app.Project PR
	INNER JOIN app.SubSector SS
		INNER JOIN app.Sector S
			INNER JOIN app.Programme P
			ON S.Programme_ID = P.Programme_ID
			ON SS.Sector_ID = S.Sector_ID
			ON PR.SubSector_ID = SS.SubSector_ID
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
	P.ShortName as SubsectorShortName,
	P.ShortName as SectorShortName,
	P.ShortName as ProgrammeShortName,
	PR.BusinessKey as IndicatorBusinessKey,
	PR.BusinessKey as ProjectBusinessKey,
	P.BusinessKey as SubsectorBusinessKey,
	P.BusinessKey as SectorBusinessKey,
	P.BusinessKey as ProgrammeBusinessKey,
	PR.LongName as IndicatorLongName,
	PR.LongName as ProjectLongName,
	P.LongName as SubsectorLongName,
	P.LongName as SectorLongName,
	P.LongName as ProgrammeLongName,
	PR.Code as IndicatorCode,
	PR.Code as ProjectCode,
	P.Code as SubsectorCode,
	P.Code as SectorCode,
	P.Code as ProgrammeCode
from 
app.Project PR
			INNER JOIN app.Programme P
			ON PR.Programme_ID = P.Programme_ID



UNION ALL
--Project to sector
SELECT 
	'Project' as ReportLevel, 
 
	
	PR.ShortName as IndicatorShortName,
	PR.ShortName as ProjectShortName,
	S.ShortName as SubsectorShortName,
	S.ShortName as SectorShortName,
	P.ShortName as ProgrammeShortName,
	PR.BusinessKey as IndicatorBusinessKey,
	PR.BusinessKey as ProjectBusinessKey,
	S.BusinessKey as SubsectorBusinessKey,
	S.BusinessKey as SectorBusinessKey,
	P.BusinessKey as ProgrammeBusinessKey,
	PR.LongName as IndicatorLongName,
	PR.LongName as ProjectLongName,
	S.LongName as SubsectorLongName,
	S.LongName as SectorLongName,
	P.LongName as ProgrammeLongName,
	PR.Code as IndicatorCode,
	PR.Code as ProjectCode,
	S.Code as SubsectorCode,
	S.Code as SectorCode,
	P.Code as ProgrammeCode
from 
app.Project PR
		INNER JOIN app.Sector S
			INNER JOIN app.Programme P
			ON S.Programme_ID = P.Programme_ID
				ON PR.Sector_ID = S.Sector_ID

UNION ALL

--Project to Sub Sector
SELECT 
	'Project' as ReportLevel, 
 
	PR.ShortName as IndicatorShortName,
	PR.ShortName as ProjectShortName,
	SS.ShortName as SubsectorShortName,
	S.ShortName as SectorShortName,
	P.ShortName as ProgrammeShortName,
	PR.BusinessKey as IndicatorBusinessKey,
	PR.BusinessKey as ProjectBusinessKey,
	SS.BusinessKey as SubsectorBusinessKey,
	S.BusinessKey as SectorBusinessKey,
	P.BusinessKey as ProgrammeBusinessKey,
	PR.LongName as IndicatorLongName,
	PR.LongName as ProjectLongName,
	SS.LongName as SubsectorLongName,
	S.LongName as SectorLongName,
	P.LongName as ProgrammeLongName,
	PR.Code as IndicatorCode,
	PR.Code as ProjectCode,
	SS.Code as SubsectorCode,
	S.Code as SectorCode,
	P.Code as ProgrammeCode
from 
app.Project PR
	INNER JOIN app.SubSector SS
		INNER JOIN app.Sector S
			INNER JOIN app.Programme P
			ON S.Programme_ID = P.Programme_ID
			ON SS.Sector_ID = S.Sector_ID
			ON PR.SubSector_ID = SS.SubSector_ID






-----------------------------------------------------
---Start of Sector links - directly, and sub sector
-----------------------------------------------------

UNION ALL
--SubSector to sector to programme
--We don't need Subsector direct to Programme, it doesn't exist
SELECT 
	'SubSector' as ReportLevel, 
 
	
	SS.ShortName as IndicatorShortName,
	SS.ShortName as SubSectorShortName,
	S.ShortName as SubsectorShortName,
	S.ShortName as SectorShortName,
	P.ShortName as ProgrammeShortName,
	SS.BusinessKey as IndicatorBusinessKey,
	SS.BusinessKey as SubSectorBusinessKey,
	S.BusinessKey as SubsectorBusinessKey,
	S.BusinessKey as SectorBusinessKey,
	P.BusinessKey as ProgrammeBusinessKey,
	SS.LongName as IndicatorLongName,
	SS.LongName as SubSectorLongName,
	S.LongName as SubsectorLongName,
	S.LongName as SectorLongName,
	P.LongName as ProgrammeLongName,
	SS.Code as IndicatorCode,
	SS.Code as SubSectorCode,
	S.Code as SubsectorCode,
	S.Code as SectorCode,
	P.Code as ProgrammeCode
from 
app.SubSector SS
		INNER JOIN app.Sector S
			INNER JOIN app.Programme P
			ON S.Programme_ID = P.Programme_ID
				ON SS.Sector_ID = S.Sector_ID

UNION ALL

--Sector to Programme 
SELECT 
	'Sector' as ReportLevel, 
	
	S.ShortName as IndicatorShortName,
	S.ShortName as SectorShortName,
	P.ShortName as SubsectorShortName,
	P.ShortName as SectorShortName,
	P.ShortName as ProgrammeShortName,
	S.BusinessKey as IndicatorBusinessKey,
	S.BusinessKey as SectorBusinessKey,
	P.BusinessKey as SubsectorBusinessKey,
	P.BusinessKey as SectorBusinessKey,
	P.BusinessKey as ProgrammeBusinessKey,
	S.LongName as IndicatorLongName,
	S.LongName as SectorLongName,
	P.LongName as SubsectorLongName,
	P.LongName as SectorLongName,
	P.LongName as ProgrammeLongName,
	S.Code as IndicatorCode,
	S.Code as SectorCode,
	P.Code as SubsectorCode,
	P.Code as SectorCode,
	P.Code as ProgrammeCode
from 
app.Sector S
			INNER JOIN app.Programme P
			ON S.Programme_ID = P.Programme_ID

UNION ALL
/*Indicator to both project and sector*/


SELECT 
	'Indicator' as ReportLevel, 
	
	I.ShortName as IndicatorShortName,
	PR.ShortName as ProjectShortName,
	S.ShortName as SubsectorShortName,
	S.ShortName as SectorShortName,
	P.ShortName as ProgrammeShortName,
	I.BusinessKey as IndicatorBusinessKey,
	PR.BusinessKey as ProjectBusinessKey,
	S.BusinessKey as SubsectorBusinessKey,
	S.BusinessKey as SectorBusinessKey,
	P.BusinessKey as ProgrammeBusinessKey,
	I.LongName as IndicatorLongName,
	PR.LongName as ProjectLongName,
	S.LongName as SubsectorLongName,
	S.LongName as SectorLongName,
	P.LongName as ProgrammeLongName,
	I.Code as IndicatorCode,
	PR.Code as ProjectCode,
	S.Code as SubsectorCode,
	S.Code as SectorCode,
	P.Code as ProgrammeCode
from app.Indicator I
INNER JOIN app.Project PR
	ON I.ProjectID = PR.ProjectID

INNER JOIN app.Sector S
ON I.Sector_ID = S.Sector_ID
	INNER JOIN app.Programme P
	ON S.Programme_ID = P.Programme_ID


UNION ALL


SELECT 
	'Indicator' as ReportLevel, 
	
	I.ShortName as IndicatorShortName,
	PR.ShortName as ProjectShortName,
	SS.ShortName as SubsectorShortName,
	S.ShortName as SectorShortName,
	P.ShortName as ProgrammeShortName,
	I.BusinessKey as IndicatorBusinessKey,
	PR.BusinessKey as ProjectBusinessKey,
	SS.BusinessKey as SubsectorBusinessKey,
	S.BusinessKey as SectorBusinessKey,
	P.BusinessKey as ProgrammeBusinessKey,
	I.LongName as IndicatorLongName,
	PR.LongName as ProjectLongName,
	SS.LongName as SubsectorLongName,
	S.LongName as SectorLongName,
	P.LongName as ProgrammeLongName,
	I.Code as IndicatorCode,
	PR.Code as ProjectCode,
	SS.Code as SubsectorCode,
	S.Code as SectorCode,
	P.Code as ProgrammeCode
from app.Indicator I
INNER JOIN app.Project PR
	ON I.ProjectID = PR.ProjectID

INNER JOIN app.SubSector SS
ON I.SubSector_ID = SS.SubSector_ID


INNER JOIN app.Sector S
ON I.Sector_ID = SS.Sector_ID
	INNER JOIN app.Programme P
	ON S.Programme_ID = P.Programme_ID

) src
GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorByProgram', @level2type = N'COLUMN', @level2name = N'SubsectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorByProgram', @level2type = N'COLUMN', @level2name = N'SubsectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorByProgram', @level2type = N'COLUMN', @level2name = N'SectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorByProgram', @level2type = N'COLUMN', @level2name = N'SectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorByProgram', @level2type = N'COLUMN', @level2name = N'ProgrammeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorByProgram', @level2type = N'COLUMN', @level2name = N'ProgrammeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorByProgram', @level2type = N'COLUMN', @level2name = N'IndicatorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'5', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorByProgram', @level2type = N'COLUMN', @level2name = N'IndicatorShortName';




GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorByProgram';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorByProgram';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorByProgram', @level2type = N'COLUMN', @level2name = N'ReportLevel';


GO
EXECUTE sp_addextendedproperty @name = N'HiearchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorByProgram', @level2type = N'COLUMN', @level2name = N'ReportLevel';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorByProgram', @level2type = N'COLUMN', @level2name = N'ProjectShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'4', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorByProgram', @level2type = N'COLUMN', @level2name = N'ProjectShortName';

