
CREATE VIEW [OLAP_GEN].IndicatorByProgram
as
select 
	P.ShortName as IndicatorShortName,
	P.ShortName as SubsectorShortName,
	P.ShortName as SectorShortName,
	P.ShortName as ProgrammeShortName,
	P.BusinessKey as IndicatorBusinessKey,
	P.BusinessKey as SubsectorBusinessKey,
	P.BusinessKey as SectorBusinessKey,
	P.BusinessKey as ProgrammeBusinessKey,
	P.LongName as IndicatorLongName,
	P.LongName as SubsectorLongName,
	P.LongName as SectorLongName,
	P.LongName as ProgrammeLongName,
	P.Code as IndicatorCode,
	P.Code as SubsectorCode,
	P.Code as SectorCode,
	P.Code as ProgrammeCode


from app.Programme P
UNION ALL


select 
	I.ShortName as IndicatorShortName,
	P.ShortName as SubsectorShortName,
	P.ShortName as SectorShortName,
	P.ShortName as ProgrammeShortName	,
	I.BusinessKey as IndicatorBusinessKey,
	P.BusinessKey as SubsectorBusinessKey,
	P.BusinessKey as SectorBusinessKey,
	P.BusinessKey as ProgrammeBusinessKey,
	I.LongName as IndicatorLongName,
	P.LongName as SubsectorLongName,
	P.LongName as SectorLongName,
	P.LongName as ProgrammeLongName,
	I.Code as IndicatorCode,
	P.Code as SubsectorCode,
	P.Code as SectorCode,
	P.Code as ProgrammeCode


from app.Indicator I
INNER JOIN app.Programme P
ON I.Programme_ID = P.Programme_ID
UNION ALL 
SELECT 
	I.ShortName as IndicatorShortName,
	S.ShortName as SubsectorShortName,
	S.ShortName as SectorShortName,
	P.ShortName as ProgrammeShortName,
	I.BusinessKey as IndicatorBusinessKey,
	S.BusinessKey as SubsectorBusinessKey,
	S.BusinessKey as SectorBusinessKey,
	P.BusinessKey as ProgrammeBusinessKey,
	I.LongName as IndicatorLongName,
	S.LongName as SubsectorLongName,
	S.LongName as SectorLongName,
	P.LongName as ProgrammeLongName,
	I.Code as IndicatorCode,
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
	I.ShortName as IndicatorShortName,
	SS.ShortName as SubsectorShortName,
	S.ShortName as SectorShortName,
	P.ShortName as ProgrammeShortName,
	I.BusinessKey as IndicatorBusinessKey,
	SS.BusinessKey as SubsectorBusinessKey,
	S.BusinessKey as SectorBusinessKey,
	P.BusinessKey as ProgrammeBusinessKey,
	I.LongName as IndicatorLongName,
	SS.LongName as SubsectorLongName,
	S.LongName as SectorLongName,
	P.LongName as ProgrammeLongName,
	I.Code as IndicatorCode,
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
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'4', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorByProgram', @level2type = N'COLUMN', @level2name = N'IndicatorShortName';

