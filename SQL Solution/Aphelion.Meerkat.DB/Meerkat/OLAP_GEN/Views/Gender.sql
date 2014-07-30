  

CREATE VIEW [OLAP_GEN].[Gender]
AS

SELECT 
	[Gender_2450852589620756161].[BusinessKey] AS [GenderBusinessKey]
	,[Gender_2450852589620756161].[Code] AS [GenderCode]
	,[Gender_2450852589620756161].[Gender_ID] AS [Gender_ID]
	,[Gender_2450852589620756161].[Name] AS [GenderName]
FROM [disagg].[Gender] AS [Gender_2450852589620756161]
GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Gender', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Gender', @level2type = N'COLUMN', @level2name = N'GenderName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Gender', @level2type = N'COLUMN', @level2name = N'GenderName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Name', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Gender', @level2type = N'COLUMN', @level2name = N'GenderName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Gender', @level2type = N'COLUMN', @level2name = N'GenderName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Gender', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Gender', @level2type = N'COLUMN', @level2name = N'Gender_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Gender', @level2type = N'COLUMN', @level2name = N'Gender_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Gender_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Gender', @level2type = N'COLUMN', @level2name = N'Gender_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Gender', @level2type = N'COLUMN', @level2name = N'Gender_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Gender', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Gender', @level2type = N'COLUMN', @level2name = N'GenderCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Gender', @level2type = N'COLUMN', @level2name = N'GenderCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Gender', @level2type = N'COLUMN', @level2name = N'GenderCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Gender', @level2type = N'COLUMN', @level2name = N'GenderCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Gender', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Gender', @level2type = N'COLUMN', @level2name = N'GenderBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Gender', @level2type = N'COLUMN', @level2name = N'GenderBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Gender', @level2type = N'COLUMN', @level2name = N'GenderBusinessKey';

