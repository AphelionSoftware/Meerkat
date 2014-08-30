  

CREATE VIEW [OLAP_GEN].[Sector]
AS

SELECT 
	[Sector_6798140682959160272].[BusinessKey] AS [SectorBusinessKey]
	,[Sector_6798140682959160272].[Code] AS [SectorCode]
	,[Sector_6798140682959160272].[LocalLongName] AS [SectorLocalLongName]
	,[Sector_6798140682959160272].[LocalShortName] AS [SectorLocalShortName]
	,[Sector_6798140682959160272].[LongName] AS [SectorLongName]
	,COALESCE([Sector_6798140682959160272].[Programme_ID] , [Programme_7818958432026254290].[Programme_ID] ) AS [SectorProgramme_ID]
	,[Sector_6798140682959160272].[Sector_ID] AS [Sector_ID]
	,[Sector_6798140682959160272].[ShortName] AS [SectorShortName]
	,[Sector_6798140682959160272].[TextDescription] AS [SectorTextDescription]
	,[Programme_7818958432026254290].[BusinessKey] AS [ProgrammeBusinessKey]
	,[Programme_7818958432026254290].[Code] AS [ProgrammeCode]
	,[Programme_7818958432026254290].[LocalLongName] AS [ProgrammeLocalLongName]
	,[Programme_7818958432026254290].[LocalShortName] AS [ProgrammeLocalShortName]
	,[Programme_7818958432026254290].[LongName] AS [ProgrammeLongName]
	,[Programme_7818958432026254290].[ProgrammeSiteName] AS [ProgrammeSiteName]
	,[Programme_7818958432026254290].[ShortName] AS [ProgrammeShortName]
	,[Programme_7818958432026254290].[TextDescription] AS [ProgrammeTextDescription]
FROM [app].[Sector] AS [Sector_6798140682959160272]

    LEFT JOIN [app].[Programme] AS [Programme_7818958432026254290] 
    
    ON  [Sector_6798140682959160272].[Programme_ID] = [Programme_7818958432026254290].[Programme_ID]
GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'ProgrammeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'ProgrammeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'ProgrammeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'ProgrammeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'ProgrammeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'ProgrammeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'ProgrammeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'ProgrammeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'ProgrammeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'ProgrammeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'ProgrammeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ProgrammeSiteName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'ProgrammeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'ProgrammeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'ProgrammeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'ProgrammeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'ProgrammeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'ProgrammeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'ProgrammeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'ProgrammeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'ProgrammeCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'ProgrammeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'ProgrammeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'ProgrammeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'ProgrammeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'ProgrammeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'SectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'SectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'SectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'SectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'SectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'SectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'SectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'SectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'SectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'Sector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'Sector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Sector_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'Sector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'Sector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'SectorProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'SectorProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Programme_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'SectorProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'SectorProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'SectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'SectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'SectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'SectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'SectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'SectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'SectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'SectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'SectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'SectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'SectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'SectorLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'SectorLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'SectorLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'SectorLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'SectorLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'SectorLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalLongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'SectorLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'SectorLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'ProgrammeLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'ProgrammeLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'ProgrammeLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'ProgrammeLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'ProgrammeLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'ProgrammeLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalLongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'ProgrammeLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'ProgrammeLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'SectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'ProgrammeBusinessKey';

