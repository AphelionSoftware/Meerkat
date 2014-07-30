  

CREATE VIEW [OLAP_GEN].[Location]
AS

SELECT 
	[Location_1121467150999268327].[AreaKM] AS [LocationAreaKM]
	,[Location_1121467150999268327].[BusinessKey] AS [LocationBusinessKey]
	,[Location_1121467150999268327].[Code] AS [LocationCode]
	,[Location_1121467150999268327].[Density] AS [LocationDensity]
	,[Location_1121467150999268327].[Geog] AS [LocationGeog]
	,[Location_1121467150999268327].[Location_ID] AS [Location_ID]
	,[Location_1121467150999268327].[LocationType_ID] AS [LocationType_ID]
	,[Location_1121467150999268327].[Name] AS [LocationName]
	,[Location_1121467150999268327].[ParentLocation_ID] AS [LocationParentLocation_ID]
	,[Location_1121467150999268327].[Population] AS [LocationPopulation]
	,[LocationType_2046574047640308189].[BusinessKey] AS [LocationTypeBusinessKey]
	,[LocationType_2046574047640308189].[Code] AS [LocationTypeCode]
	,[LocationType_2046574047640308189].[Description] AS [LocationTypeDescription]
	,[LocationType_2046574047640308189].[Name] AS [LocationTypeName]
FROM [Core].[Location] AS [Location_1121467150999268327]

    LEFT JOIN [Core].[LocationType] AS [LocationType_2046574047640308189] 
    
    ON  [Location_1121467150999268327].[LocationType_ID] = [LocationType_2046574047640308189].[LocationType_ID]
GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'LocationType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Name', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'LocationType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationTypeDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationTypeDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Description', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationTypeDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationTypeDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'LocationType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'LocationType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Location', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationPopulation';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationPopulation';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Population', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationPopulation';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationPopulation';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Location', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationParentLocation_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationParentLocation_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ParentLocation_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationParentLocation_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationParentLocation_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Location', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Name', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Location', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocationType_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Location', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'Location_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'Location_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Location_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'Location_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'Location_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Location', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationGeog';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationGeog';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Geog', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationGeog';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationGeog';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Location', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationDensity';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationDensity';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Density', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationDensity';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationDensity';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Location', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Location', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Location', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationAreaKM';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationAreaKM';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'AreaKM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'LocationAreaKM';

