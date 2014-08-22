  

CREATE VIEW [OLAP_GEN].[Group]
AS

SELECT 
	[Group_6654037840398573709].[BusinessKey] AS [GroupBusinessKey]
	,[Group_6654037840398573709].[Code] AS [GroupCode]
	,[Group_6654037840398573709].[Group_ID] AS [Group_ID]
	,[Group_6654037840398573709].[LocalName] AS [GroupLocalName]
	,[Group_6654037840398573709].[Name] AS [GroupName]
FROM [disagg].[Group] AS [Group_6654037840398573709]
GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Group', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Group', @level2type = N'COLUMN', @level2name = N'GroupName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Group', @level2type = N'COLUMN', @level2name = N'GroupName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Name', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Group', @level2type = N'COLUMN', @level2name = N'GroupName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Group', @level2type = N'COLUMN', @level2name = N'GroupName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Group', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Group', @level2type = N'COLUMN', @level2name = N'Group_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Group', @level2type = N'COLUMN', @level2name = N'Group_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Group_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Group', @level2type = N'COLUMN', @level2name = N'Group_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Group', @level2type = N'COLUMN', @level2name = N'Group_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Group', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Group', @level2type = N'COLUMN', @level2name = N'GroupCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Group', @level2type = N'COLUMN', @level2name = N'GroupCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Group', @level2type = N'COLUMN', @level2name = N'GroupCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Group', @level2type = N'COLUMN', @level2name = N'GroupCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Group', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Group', @level2type = N'COLUMN', @level2name = N'GroupBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Group', @level2type = N'COLUMN', @level2name = N'GroupBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Group', @level2type = N'COLUMN', @level2name = N'GroupBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Group', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Group', @level2type = N'COLUMN', @level2name = N'GroupLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Group', @level2type = N'COLUMN', @level2name = N'GroupLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Group', @level2type = N'COLUMN', @level2name = N'GroupLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Group', @level2type = N'COLUMN', @level2name = N'GroupLocalName';

