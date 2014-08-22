  

CREATE VIEW [OLAP_GEN].[Institution]
AS

SELECT 
	[Institution_2741676325748222874].[BusinessKey] AS [InstitutionBusinessKey]
	,[Institution_2741676325748222874].[Code] AS [InstitutionCode]
	,[Institution_2741676325748222874].[Institution_ID] AS [Institution_ID]
	,[Institution_2741676325748222874].[LocalName] AS [InstitutionLocalName]
	,[Institution_2741676325748222874].[Name] AS [InstitutionName]
FROM [disagg].[Institution] AS [Institution_2741676325748222874]
GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Institution', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Institution', @level2type = N'COLUMN', @level2name = N'InstitutionName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Institution', @level2type = N'COLUMN', @level2name = N'InstitutionName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Name', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Institution', @level2type = N'COLUMN', @level2name = N'InstitutionName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Institution', @level2type = N'COLUMN', @level2name = N'InstitutionName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Institution', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Institution', @level2type = N'COLUMN', @level2name = N'Institution_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Institution', @level2type = N'COLUMN', @level2name = N'Institution_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Institution_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Institution', @level2type = N'COLUMN', @level2name = N'Institution_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Institution', @level2type = N'COLUMN', @level2name = N'Institution_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Institution', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Institution', @level2type = N'COLUMN', @level2name = N'InstitutionCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Institution', @level2type = N'COLUMN', @level2name = N'InstitutionCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Institution', @level2type = N'COLUMN', @level2name = N'InstitutionCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Institution', @level2type = N'COLUMN', @level2name = N'InstitutionCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Institution', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Institution', @level2type = N'COLUMN', @level2name = N'InstitutionBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Institution', @level2type = N'COLUMN', @level2name = N'InstitutionBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Institution', @level2type = N'COLUMN', @level2name = N'InstitutionBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Institution', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Institution', @level2type = N'COLUMN', @level2name = N'InstitutionLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Institution', @level2type = N'COLUMN', @level2name = N'InstitutionLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Institution', @level2type = N'COLUMN', @level2name = N'InstitutionLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Institution', @level2type = N'COLUMN', @level2name = N'InstitutionLocalName';

