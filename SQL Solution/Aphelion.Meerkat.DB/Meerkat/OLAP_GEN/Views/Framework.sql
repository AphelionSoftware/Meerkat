  

CREATE VIEW [OLAP_GEN].[Framework]
AS

SELECT 
	[Framework_8126524522388879988].[BusinessKey] AS [FrameworkBusinessKey]
	,[Framework_8126524522388879988].[Code] AS [FrameworkCode]
	,[Framework_8126524522388879988].[Framework_ID] AS [Framework_ID]
	,[Framework_8126524522388879988].[LocalName] AS [FrameworkLocalName]
	,[Framework_8126524522388879988].[Name] AS [FrameworkName]
	,[Framework_8126524522388879988].[SourceOrganizationID] AS [FrameworkSourceOrganizationID]
	,[Organization_7951172648770724020].[BusinessKey] AS [OrganizationBusinessKey]
	,[Organization_7951172648770724020].[Code] AS [OrganizationCode]
	,[Organization_7951172648770724020].[LocalLongName] AS [OrganizationLocalLongName]
	,[Organization_7951172648770724020].[LocalShortName] AS [OrganizationLocalShortName]
	,[Organization_7951172648770724020].[LongName] AS [OrganizationLongName]
	,[Organization_7951172648770724020].[Organization_ID] AS [Organization_ID]
	,[Organization_7951172648770724020].[OrganizationType_ID] AS [OrganizationType_ID]
	,[Organization_7951172648770724020].[ParentOrganization_ID] AS [OrganizationParentOrganization_ID]
	,[Organization_7951172648770724020].[ShortName] AS [OrganizationShortName]
	,[OrganizationType_9205437231618914758].[BusinessKey] AS [OrganizationTypeBusinessKey]
	,[OrganizationType_9205437231618914758].[Code] AS [OrganizationTypeCode]
	,[OrganizationType_9205437231618914758].[Description] AS [OrganizationTypeDescription]
	,[OrganizationType_9205437231618914758].[LocalName] AS [OrganizationTypeLocalName]
	,[OrganizationType_9205437231618914758].[Name] AS [OrganizationTypeName]
FROM [disagg].[Framework] AS [Framework_8126524522388879988]

    LEFT JOIN [Core].[Organization] AS [Organization_7951172648770724020] 
    
    LEFT JOIN [Core].[OrganizationType] AS [OrganizationType_9205437231618914758] 
    
    ON  [Organization_7951172648770724020].[OrganizationType_ID] = [OrganizationType_9205437231618914758].[OrganizationType_ID]
        

    ON  [Framework_8126524522388879988].[SourceOrganizationID] = [Organization_7951172648770724020].[Organization_ID]
GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'OrganizationType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Name', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'OrganizationType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationTypeDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationTypeDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Description', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationTypeDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationTypeDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'OrganizationType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'OrganizationType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Organization', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Organization', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationParentOrganization_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationParentOrganization_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ParentOrganization_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationParentOrganization_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationParentOrganization_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Organization', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'OrganizationType_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Organization', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'Organization_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'Organization_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Organization_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'Organization_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'Organization_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Organization', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Organization', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Organization', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Framework', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'FrameworkSourceOrganizationID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'FrameworkSourceOrganizationID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'SourceOrganizationID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'FrameworkSourceOrganizationID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'FrameworkSourceOrganizationID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Framework', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'FrameworkName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'FrameworkName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Name', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'FrameworkName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'FrameworkName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Framework', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'Framework_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'Framework_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Framework_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'Framework_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'Framework_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Framework', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'FrameworkCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'FrameworkCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'FrameworkCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'FrameworkCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Framework', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'FrameworkBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'FrameworkBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'FrameworkBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'OrganizationType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Organization', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Organization', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalLongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'OrganizationLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Framework', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'FrameworkLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'FrameworkLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'FrameworkLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Framework', @level2type = N'COLUMN', @level2name = N'FrameworkLocalName';

