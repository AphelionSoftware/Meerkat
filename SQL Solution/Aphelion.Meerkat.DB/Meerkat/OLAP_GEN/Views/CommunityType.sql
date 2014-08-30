  

CREATE VIEW [OLAP_GEN].[CommunityType]
AS

SELECT 
	[CommunityType_5175060220666888175].[BusinessKey] AS [CommunityTypeBusinessKey]
	,[CommunityType_5175060220666888175].[Code] AS [CommunityTypeCode]
	,[CommunityType_5175060220666888175].[CommunityType_ID] AS [CommunityType_ID]
	,[CommunityType_5175060220666888175].[LocalName] AS [CommunityTypeLocalName]
	,[CommunityType_5175060220666888175].[Name] AS [CommunityTypeName]
FROM [disagg].[CommunityType] AS [CommunityType_5175060220666888175]
GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'CommunityType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'CommunityType', @level2type = N'COLUMN', @level2name = N'CommunityTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'CommunityType', @level2type = N'COLUMN', @level2name = N'CommunityTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Name', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'CommunityType', @level2type = N'COLUMN', @level2name = N'CommunityTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'CommunityType', @level2type = N'COLUMN', @level2name = N'CommunityTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'CommunityType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'CommunityType', @level2type = N'COLUMN', @level2name = N'CommunityType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'CommunityType', @level2type = N'COLUMN', @level2name = N'CommunityType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'CommunityType_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'CommunityType', @level2type = N'COLUMN', @level2name = N'CommunityType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'CommunityType', @level2type = N'COLUMN', @level2name = N'CommunityType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'CommunityType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'CommunityType', @level2type = N'COLUMN', @level2name = N'CommunityTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'CommunityType', @level2type = N'COLUMN', @level2name = N'CommunityTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'CommunityType', @level2type = N'COLUMN', @level2name = N'CommunityTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'CommunityType', @level2type = N'COLUMN', @level2name = N'CommunityTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'CommunityType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'CommunityType', @level2type = N'COLUMN', @level2name = N'CommunityTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'CommunityType', @level2type = N'COLUMN', @level2name = N'CommunityTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'CommunityType', @level2type = N'COLUMN', @level2name = N'CommunityTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'CommunityType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'CommunityType', @level2type = N'COLUMN', @level2name = N'CommunityTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'CommunityType', @level2type = N'COLUMN', @level2name = N'CommunityTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'CommunityType', @level2type = N'COLUMN', @level2name = N'CommunityTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'CommunityType', @level2type = N'COLUMN', @level2name = N'CommunityTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'CommunityType', @level2type = N'COLUMN', @level2name = N'CommunityTypeBusinessKey';

