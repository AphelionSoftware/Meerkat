  

CREATE VIEW [OLAP_GEN].[Structure]
AS

SELECT 
	[Structure_8426666361464362553].[BusinessKey] AS [StructureBusinessKey]
	,[Structure_8426666361464362553].[Code] AS [StructureCode]
	,[Structure_8426666361464362553].[geog] AS [Structuregeog]
	,[Structure_8426666361464362553].[Institution_ID] AS [StructureInstitution_ID]
	,[Structure_8426666361464362553].[LocalName] AS [StructureLocalName]
	,[Structure_8426666361464362553].[Location_ID] AS [StructureLocation_ID]
	,[Structure_8426666361464362553].[Name] AS [StructureName]
	,[Structure_8426666361464362553].[Structure_ID] AS [Structure_ID]
	,[Structure_8426666361464362553].[StructureType_ID] AS [StructureType_ID]
	,[Structure_8426666361464362553].[TextDescription] AS [StructureTextDescription]
	,[Institution_6750177965385883379].[BusinessKey] AS [InstitutionBusinessKey]
	,[Institution_6750177965385883379].[Code] AS [InstitutionCode]
	,[Institution_6750177965385883379].[LocalName] AS [InstitutionLocalName]
	,[Institution_6750177965385883379].[Name] AS [InstitutionName]
	,[Location_7939334351683545643].[AreaKM] AS [LocationAreaKM]
	,[Location_7939334351683545643].[BusinessKey] AS [LocationBusinessKey]
	,[Location_7939334351683545643].[Code] AS [LocationCode]
	,[Location_7939334351683545643].[Density] AS [LocationDensity]
	,[Location_7939334351683545643].[Geog] AS [LocationGeog]
	,[Location_7939334351683545643].[LocalName] AS [LocationLocalName]
	,[Location_7939334351683545643].[LocationType_ID] AS [LocationType_ID]
	,[Location_7939334351683545643].[Name] AS [LocationName]
	,[Location_7939334351683545643].[ParentLocation_ID] AS [LocationParentLocation_ID]
	,[Location_7939334351683545643].[Population] AS [LocationPopulation]
	,[LocationType_879619025909044639].[BusinessKey] AS [LocationTypeBusinessKey]
	,[LocationType_879619025909044639].[Code] AS [LocationTypeCode]
	,[LocationType_879619025909044639].[Description] AS [LocationTypeDescription]
	,[LocationType_879619025909044639].[LocalName] AS [LocationTypeLocalName]
	,[LocationType_879619025909044639].[Name] AS [LocationTypeName]
	,[StructureType_6991287512548466441].[BusinessKey] AS [StructureTypeBusinessKey]
	,[StructureType_6991287512548466441].[Code] AS [StructureTypeCode]
	,[StructureType_6991287512548466441].[LocalName] AS [StructureTypeLocalName]
	,[StructureType_6991287512548466441].[Name] AS [StructureTypeName]
FROM [disagg].[Structure] AS [Structure_8426666361464362553]

    LEFT JOIN [disagg].[Institution] AS [Institution_6750177965385883379] 
    
    ON  [Structure_8426666361464362553].[Institution_ID] = [Institution_6750177965385883379].[Institution_ID]
        

    JOIN [Core].[Location] AS [Location_7939334351683545643] 
    
    LEFT JOIN [Core].[LocationType] AS [LocationType_879619025909044639] 
    
    ON  [Location_7939334351683545643].[LocationType_ID] = [LocationType_879619025909044639].[LocationType_ID]
        

        ON  [Structure_8426666361464362553].[Location_ID] = [Location_7939334351683545643].[Location_ID]

    JOIN [disagg].[StructureType] AS [StructureType_6991287512548466441] 
    
        ON  [Structure_8426666361464362553].[StructureType_ID] = [StructureType_6991287512548466441].[StructureType_ID]
GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'StructureType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Name', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'StructureType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'StructureType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'StructureType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'LocationType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Name', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'LocationType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'LocationType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationTypeDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationTypeDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Description', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationTypeDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationTypeDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'LocationType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'LocationType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Location', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationPopulation';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationPopulation';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Population', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationPopulation';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationPopulation';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Location', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationParentLocation_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationParentLocation_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ParentLocation_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationParentLocation_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationParentLocation_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Location', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Name', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Location', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocationType_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Location', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Location', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationGeog';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationGeog';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Geog', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationGeog';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationGeog';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Location', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationDensity';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationDensity';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Density', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationDensity';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationDensity';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Location', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Location', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Location', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationAreaKM';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationAreaKM';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'AreaKM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationAreaKM';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'LocationAreaKM';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Institution', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'InstitutionName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'InstitutionName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Name', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'InstitutionName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'InstitutionName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Institution', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'InstitutionLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'InstitutionLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'InstitutionLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'InstitutionLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Institution', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'InstitutionCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'InstitutionCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'InstitutionCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'InstitutionCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Institution', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'InstitutionBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'InstitutionBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'InstitutionBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'InstitutionBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'InstitutionBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Structure', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Structure', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'StructureType_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Structure', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'Structure_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'Structure_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Structure_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'Structure_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'Structure_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Structure', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Name', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Structure', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureLocation_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureLocation_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Location_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureLocation_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureLocation_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Structure', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Structure', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureInstitution_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureInstitution_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Institution_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureInstitution_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureInstitution_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Structure', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'Structuregeog';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'Structuregeog';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'geog', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'Structuregeog';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'Structuregeog';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Structure', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Structure', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'StructureBusinessKey';

