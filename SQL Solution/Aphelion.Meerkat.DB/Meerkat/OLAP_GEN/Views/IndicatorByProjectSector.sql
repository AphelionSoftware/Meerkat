



CREATE VIEW [OLAP_GEN].[IndicatorByProjectSector]
AS
-------------------------------------------
--Sector 
-------------------------------------------
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
LEFT JOIN app.Project PR
	ON I.ProjectID = PR.ProjectID

INNER JOIN app.Sector S
ON I.Sector_ID = S.Sector_ID
	INNER JOIN app.Programme P
	ON COALESCE(I.Programme_ID , PR.Programme_ID, S.Programme_ID) = P.Programme_ID
		
WHERE I.Active >= 1 
 AND S.Active >= 1
 AND P.Active >= 1
 AND ISNULL(PR.Active, 2) >= 1
UNION


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
LEFT JOIN app.Project PR
	ON I.ProjectID = PR.ProjectID

INNER JOIN app.SubSector SS
ON I.SubSector_ID = SS.SubSector_ID


INNER JOIN app.Sector S
ON I.Sector_ID = SS.Sector_ID
	INNER JOIN app.Programme P
	ON COALESCE(I.Programme_ID , PR.Programme_ID, S.Programme_ID) = P.Programme_ID
		


WHERE I.Active >= 1 
 AND S.Active >= 1
 AND SS.Active >= 1
 AND P.Active >= 1
 AND ISNULL(PR.Active, 2) >= 1
------------------------------------------------------------
----Project links.
------------------------------------------------------------
/*UNION

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

LEFT JOIN app.Sector S
ON I.Sector_ID = S.Sector_ID
	
	INNER JOIN app.Programme P
	ON PR.Programme_ID = P.Programme_ID



UNION


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

LEFT JOIN app.SubSector SS
ON I.SubSector_ID = SS.SubSector_ID

LEFT JOIN app.Sector S
ON I.Sector_ID = SS.Sector_ID


	INNER JOIN app.Programme P
	ON PR.Programme_ID = P.Programme_ID
*/
GO
EXECUTE sp_addextendedproperty @name = N'ExcludeFromCube', @value = N'true', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorByProjectSector';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorByProjectSector', @level2type = N'COLUMN', @level2name = N'ProjectShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorByProjectSector', @level2type = N'COLUMN', @level2name = N'ProjectShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorByProjectSector', @level2type = N'COLUMN', @level2name = N'ProgrammeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorByProjectSector', @level2type = N'COLUMN', @level2name = N'ProgrammeShortName';

