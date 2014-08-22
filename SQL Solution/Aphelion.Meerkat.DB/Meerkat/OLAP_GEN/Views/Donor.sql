  

CREATE VIEW [OLAP_GEN].[Donor]
AS

SELECT 
	[Donor_2550423136641841836].[BusinessKey] AS [DonorBusinessKey]
	,[Donor_2550423136641841836].[Code] AS [DonorCode]
	,[Donor_2550423136641841836].[Donor_ID] AS [Donor_ID]
	,[Donor_2550423136641841836].[LocalName] AS [DonorLocalName]
	,[Donor_2550423136641841836].[Name] AS [DonorName]
FROM [disagg].[Donor] AS [Donor_2550423136641841836]
GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Donor', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Donor', @level2type = N'COLUMN', @level2name = N'DonorName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Donor', @level2type = N'COLUMN', @level2name = N'DonorName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Name', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Donor', @level2type = N'COLUMN', @level2name = N'DonorName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Donor', @level2type = N'COLUMN', @level2name = N'DonorName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Donor', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Donor', @level2type = N'COLUMN', @level2name = N'Donor_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Donor', @level2type = N'COLUMN', @level2name = N'Donor_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Donor_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Donor', @level2type = N'COLUMN', @level2name = N'Donor_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Donor', @level2type = N'COLUMN', @level2name = N'Donor_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Donor', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Donor', @level2type = N'COLUMN', @level2name = N'DonorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Donor', @level2type = N'COLUMN', @level2name = N'DonorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Donor', @level2type = N'COLUMN', @level2name = N'DonorCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Donor', @level2type = N'COLUMN', @level2name = N'DonorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Donor', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Donor', @level2type = N'COLUMN', @level2name = N'DonorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Donor', @level2type = N'COLUMN', @level2name = N'DonorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Donor', @level2type = N'COLUMN', @level2name = N'DonorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Donor', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Donor', @level2type = N'COLUMN', @level2name = N'DonorLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Donor', @level2type = N'COLUMN', @level2name = N'DonorLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Donor', @level2type = N'COLUMN', @level2name = N'DonorLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Donor', @level2type = N'COLUMN', @level2name = N'DonorLocalName';

