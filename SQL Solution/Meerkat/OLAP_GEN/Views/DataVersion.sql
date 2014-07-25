  

CREATE VIEW [OLAP_GEN].[DataVersion]
AS

SELECT 
	[DataVersion_1321729285599192168].[BusinessKey] AS [DataVersionBusinessKey]
	,[DataVersion_1321729285599192168].[Code] AS [DataVersionCode]
	,[DataVersion_1321729285599192168].[DataVersion_ID] AS [DataVersion_ID]
	,[DataVersion_1321729285599192168].[Description] AS [DataVersionDescription]
	,[DataVersion_1321729285599192168].[Name] AS [DataVersionName]
	,[DataVersion_1321729285599192168].[Order] AS [DataVersionOrder]
FROM [Core].[DataVersion] AS [DataVersion_1321729285599192168]
GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'DataVersion', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'DataVersion', @level2type = N'COLUMN', @level2name = N'DataVersionOrder';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'DataVersion', @level2type = N'COLUMN', @level2name = N'DataVersionOrder';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Order', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'DataVersion', @level2type = N'COLUMN', @level2name = N'DataVersionOrder';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'DataVersion', @level2type = N'COLUMN', @level2name = N'DataVersionOrder';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'DataVersion', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'DataVersion', @level2type = N'COLUMN', @level2name = N'DataVersionName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'DataVersion', @level2type = N'COLUMN', @level2name = N'DataVersionName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Name', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'DataVersion', @level2type = N'COLUMN', @level2name = N'DataVersionName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'DataVersion', @level2type = N'COLUMN', @level2name = N'DataVersionName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'DataVersion', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'DataVersion', @level2type = N'COLUMN', @level2name = N'DataVersionDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'DataVersion', @level2type = N'COLUMN', @level2name = N'DataVersionDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Description', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'DataVersion', @level2type = N'COLUMN', @level2name = N'DataVersionDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'DataVersion', @level2type = N'COLUMN', @level2name = N'DataVersionDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'DataVersion', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'DataVersion', @level2type = N'COLUMN', @level2name = N'DataVersion_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'DataVersion', @level2type = N'COLUMN', @level2name = N'DataVersion_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'DataVersion_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'DataVersion', @level2type = N'COLUMN', @level2name = N'DataVersion_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'DataVersion', @level2type = N'COLUMN', @level2name = N'DataVersion_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'DataVersion', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'DataVersion', @level2type = N'COLUMN', @level2name = N'DataVersionCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'DataVersion', @level2type = N'COLUMN', @level2name = N'DataVersionCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'DataVersion', @level2type = N'COLUMN', @level2name = N'DataVersionCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'DataVersion', @level2type = N'COLUMN', @level2name = N'DataVersionCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'DataVersion', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'DataVersion', @level2type = N'COLUMN', @level2name = N'DataVersionBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'DataVersion', @level2type = N'COLUMN', @level2name = N'DataVersionBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'DataVersion', @level2type = N'COLUMN', @level2name = N'DataVersionBusinessKey';

