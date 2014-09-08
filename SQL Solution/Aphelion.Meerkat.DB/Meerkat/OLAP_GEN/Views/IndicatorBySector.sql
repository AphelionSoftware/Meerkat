

CREATE VIEW [OLAP_GEN].[IndicatorBySector]
as

--select top 0 * from(


SELECT 
	'Indicator' as ReportLevel,
	I.ShortName as IndicatorShortName,
	S.ShortName as SubsectorShortName,
	S.ShortName as SectorShortName,
	I.BusinessKey as IndicatorBusinessKey,
	S.BusinessKey as SubsectorBusinessKey,
	S.BusinessKey as SectorBusinessKey,
	I.LongName as IndicatorLongName,
	S.LongName as SubsectorLongName,
	S.LongName as SectorLongName,
	I.Code as IndicatorCode,
	S.Code as SubsectorCode,
	S.Code as SectorCode



from app.Indicator I
INNER JOIN app.Sector S
	ON I.Sector_ID = S.Sector_ID

UNION ALL 
SELECT 
	'Indicator' as ReportLevel, 
	I.ShortName as IndicatorShortName,
	SS.ShortName as SubsectorShortName,
	S.ShortName as SectorShortName,
	I.BusinessKey as IndicatorBusinessKey,
	SS.BusinessKey as SubsectorBusinessKey,
	S.BusinessKey as SectorBusinessKey,
	I.LongName as IndicatorLongName,
	SS.LongName as SubsectorLongName,
	S.LongName as SectorLongName,
	I.Code as IndicatorCode,
	SS.Code as SubsectorCode,
	S.Code as SectorCode
from app.Indicator I
INNER JOIN app.SubSector SS
	INNER JOIN app.Sector S
		ON SS.Sector_ID = S.Sector_ID
		ON I.SubSector_ID = SS.SubSector_ID

-----------------------------------------------------
---Start of Sector links - directly, and sub sector
-----------------------------------------------------

UNION ALL
--SubSector to sector to programme
--We don't need Subsector direct to Programme, it doesn't exist
SELECT 
	'SubSector' as ReportLevel, 
 
	
	SS.ShortName as IndicatorShortName,
	S.ShortName as SubsectorShortName,
	S.ShortName as SectorShortName,
	SS.BusinessKey as IndicatorBusinessKey,
	SS.BusinessKey as SubSectorBusinessKey,
	S.BusinessKey as SectorBusinessKey,
	SS.LongName as IndicatorLongName,
	SS.LongName as SubSectorLongName,
	S.LongName as SectorLongName,
	SS.Code as IndicatorCode,
	SS.Code as SubSectorCode,
	S.Code as SectorCode
from 
app.SubSector SS
		INNER JOIN app.Sector S
			ON SS.Sector_ID = S.Sector_ID
UNION ALL

--Sector 
SELECT 
	'Sector' as ReportLevel, 
	
	S.ShortName as IndicatorShortName,
	S.ShortName as SectorShortName,
	S.ShortName as SubsectorShortName,
	S.BusinessKey as IndicatorBusinessKey,
	S.BusinessKey as SubsectorBusinessKey,
	S.BusinessKey as SectorBusinessKey,
	S.LongName as IndicatorLongName,
	S.LongName as SubsectorLongName,
	S.LongName as SectorLongName,
	S.Code as IndicatorCode,
	s.Code as SubsectorCode,
	s.Code as SectorCode
from 
app.Sector S
GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorBySector', @level2type = N'COLUMN', @level2name = N'SectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorBySector', @level2type = N'COLUMN', @level2name = N'SectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorBySector', @level2type = N'COLUMN', @level2name = N'SubsectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorBySector', @level2type = N'COLUMN', @level2name = N'SubsectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorBySector', @level2type = N'COLUMN', @level2name = N'IndicatorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'5', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorBySector', @level2type = N'COLUMN', @level2name = N'IndicatorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorBySector', @level2type = N'COLUMN', @level2name = N'ReportLevel';


GO
EXECUTE sp_addextendedproperty @name = N'HiearchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorBySector', @level2type = N'COLUMN', @level2name = N'ReportLevel';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorBySector';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorBySector';

