
CREATE VIEW [OLAP_GEN].[IndicatorByProjectSector]
AS

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