  

CREATE VIEW [OLAP_GEN].[StatusType]
AS

SELECT 
	[StatusType_3465436995796234648].[BusinessKey] AS [StatusTypeBusinessKey]
	,[StatusType_3465436995796234648].[Code] AS [StatusTypeCode]
	,[StatusType_3465436995796234648].[ID] AS [StatusTypeID]
	,[StatusType_3465436995796234648].[Name] AS [StatusTypeName]
	,[StatusType_3465436995796234648].[Value] AS [StatusTypeValue]
FROM [Core].[StatusType] AS [StatusType_3465436995796234648]
GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'StatusType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusType', @level2type = N'COLUMN', @level2name = N'StatusTypeValue';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusType', @level2type = N'COLUMN', @level2name = N'StatusTypeValue';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Value', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusType', @level2type = N'COLUMN', @level2name = N'StatusTypeValue';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusType', @level2type = N'COLUMN', @level2name = N'StatusTypeValue';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'StatusType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusType', @level2type = N'COLUMN', @level2name = N'StatusTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusType', @level2type = N'COLUMN', @level2name = N'StatusTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Name', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusType', @level2type = N'COLUMN', @level2name = N'StatusTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusType', @level2type = N'COLUMN', @level2name = N'StatusTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'StatusType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusType', @level2type = N'COLUMN', @level2name = N'StatusTypeID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusType', @level2type = N'COLUMN', @level2name = N'StatusTypeID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusType', @level2type = N'COLUMN', @level2name = N'StatusTypeID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusType', @level2type = N'COLUMN', @level2name = N'StatusTypeID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'StatusType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusType', @level2type = N'COLUMN', @level2name = N'StatusTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusType', @level2type = N'COLUMN', @level2name = N'StatusTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusType', @level2type = N'COLUMN', @level2name = N'StatusTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusType', @level2type = N'COLUMN', @level2name = N'StatusTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'StatusType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusType', @level2type = N'COLUMN', @level2name = N'StatusTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusType', @level2type = N'COLUMN', @level2name = N'StatusTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusType', @level2type = N'COLUMN', @level2name = N'StatusTypeBusinessKey';

