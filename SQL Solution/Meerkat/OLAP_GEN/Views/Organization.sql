  

CREATE VIEW [OLAP_GEN].[Organization]
AS

SELECT 
	[Organization_2346206332354567989].[BusinessKey] AS [OrganizationBusinessKey]
	,[Organization_2346206332354567989].[Code] AS [OrganizationCode]
	,[Organization_2346206332354567989].[LongName] AS [OrganizationLongName]
	,[Organization_2346206332354567989].[Organization_ID] AS [Organization_ID]
	,[Organization_2346206332354567989].[OrganizationType_ID] AS [OrganizationType_ID]
	,[Organization_2346206332354567989].[ParentOrganization_ID] AS [OrganizationParentOrganization_ID]
	,[Organization_2346206332354567989].[ShortName] AS [OrganizationShortName]
	,[OrganizationType_977538741929692349].[BusinessKey] AS [OrganizationTypeBusinessKey]
	,[OrganizationType_977538741929692349].[Code] AS [OrganizationTypeCode]
	,[OrganizationType_977538741929692349].[Description] AS [OrganizationTypeDescription]
	,[OrganizationType_977538741929692349].[Name] AS [OrganizationTypeName]
FROM [Core].[Organization] AS [Organization_2346206332354567989]

    LEFT JOIN [Core].[OrganizationType] AS [OrganizationType_977538741929692349] 
    
    ON  [Organization_2346206332354567989].[OrganizationType_ID] = [OrganizationType_977538741929692349].[OrganizationType_ID]
GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'OrganizationType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'OrganizationTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'OrganizationTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Name', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'OrganizationTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'OrganizationTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'OrganizationType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'OrganizationTypeDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'OrganizationTypeDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Description', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'OrganizationTypeDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'OrganizationTypeDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'OrganizationType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'OrganizationTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'OrganizationTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'OrganizationTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'OrganizationTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'OrganizationType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'OrganizationTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'OrganizationTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'OrganizationTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'OrganizationTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Organization', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'OrganizationShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'OrganizationShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'OrganizationShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'OrganizationShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Organization', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'OrganizationParentOrganization_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'OrganizationParentOrganization_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ParentOrganization_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'OrganizationParentOrganization_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'OrganizationParentOrganization_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Organization', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'OrganizationType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'OrganizationType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'OrganizationType_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'OrganizationType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'OrganizationType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Organization', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'Organization_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'Organization_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Organization_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'Organization_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'Organization_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Organization', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'OrganizationLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'OrganizationLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'OrganizationLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'OrganizationLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Organization', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'OrganizationCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'OrganizationCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'OrganizationCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'OrganizationCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Organization', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'OrganizationBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'OrganizationBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Organization', @level2type = N'COLUMN', @level2name = N'OrganizationBusinessKey';

