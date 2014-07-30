  

CREATE VIEW [OLAP_GEN].[StrategicElement]
AS

SELECT 
	[StrategicElement_8654208557531165784].[BusinessKey] AS [StrategicElementBusinessKey]
	,[StrategicElement_8654208557531165784].[Code] AS [StrategicElementCode]
	,[StrategicElement_8654208557531165784].[Name] AS [StrategicElementName]
	,[StrategicElement_8654208557531165784].[StrategicElement_ID] AS [StrategicElement_ID]
FROM [disagg].[StrategicElement] AS [StrategicElement_8654208557531165784]
GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'StrategicElement', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StrategicElement', @level2type = N'COLUMN', @level2name = N'StrategicElement_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StrategicElement', @level2type = N'COLUMN', @level2name = N'StrategicElement_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'StrategicElement_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StrategicElement', @level2type = N'COLUMN', @level2name = N'StrategicElement_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StrategicElement', @level2type = N'COLUMN', @level2name = N'StrategicElement_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'StrategicElement', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StrategicElement', @level2type = N'COLUMN', @level2name = N'StrategicElementName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StrategicElement', @level2type = N'COLUMN', @level2name = N'StrategicElementName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Name', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StrategicElement', @level2type = N'COLUMN', @level2name = N'StrategicElementName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StrategicElement', @level2type = N'COLUMN', @level2name = N'StrategicElementName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'StrategicElement', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StrategicElement', @level2type = N'COLUMN', @level2name = N'StrategicElementCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StrategicElement', @level2type = N'COLUMN', @level2name = N'StrategicElementCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StrategicElement', @level2type = N'COLUMN', @level2name = N'StrategicElementCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StrategicElement', @level2type = N'COLUMN', @level2name = N'StrategicElementCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'StrategicElement', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StrategicElement', @level2type = N'COLUMN', @level2name = N'StrategicElementBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StrategicElement', @level2type = N'COLUMN', @level2name = N'StrategicElementBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StrategicElement', @level2type = N'COLUMN', @level2name = N'StrategicElementBusinessKey';

