  

CREATE VIEW [OLAP_GEN].[ResultArea]
AS

SELECT 
	[ResultArea_2202775886859941450].[BusinessKey] AS [ResultAreaBusinessKey]
	,[ResultArea_2202775886859941450].[Code] AS [ResultAreaCode]
	,[ResultArea_2202775886859941450].[Name] AS [ResultAreaName]
	,[ResultArea_2202775886859941450].[ResultArea_ID] AS [ResultArea_ID]
FROM [disagg].[ResultArea] AS [ResultArea_2202775886859941450]
GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'ResultArea', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ResultArea', @level2type = N'COLUMN', @level2name = N'ResultArea_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ResultArea', @level2type = N'COLUMN', @level2name = N'ResultArea_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ResultArea_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ResultArea', @level2type = N'COLUMN', @level2name = N'ResultArea_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ResultArea', @level2type = N'COLUMN', @level2name = N'ResultArea_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'ResultArea', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ResultArea', @level2type = N'COLUMN', @level2name = N'ResultAreaName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ResultArea', @level2type = N'COLUMN', @level2name = N'ResultAreaName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Name', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ResultArea', @level2type = N'COLUMN', @level2name = N'ResultAreaName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ResultArea', @level2type = N'COLUMN', @level2name = N'ResultAreaName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'ResultArea', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ResultArea', @level2type = N'COLUMN', @level2name = N'ResultAreaCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ResultArea', @level2type = N'COLUMN', @level2name = N'ResultAreaCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ResultArea', @level2type = N'COLUMN', @level2name = N'ResultAreaCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ResultArea', @level2type = N'COLUMN', @level2name = N'ResultAreaCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'ResultArea', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ResultArea', @level2type = N'COLUMN', @level2name = N'ResultAreaBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ResultArea', @level2type = N'COLUMN', @level2name = N'ResultAreaBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ResultArea', @level2type = N'COLUMN', @level2name = N'ResultAreaBusinessKey';

