  

CREATE VIEW [OLAP_GEN].[Outcome]
AS

SELECT 
	[Outcome_721092142202605996].[BusinessKey] AS [OutcomeBusinessKey]
	,[Outcome_721092142202605996].[Code] AS [OutcomeCode]
	,[Outcome_721092142202605996].[DataVersion] AS [OutcomeDataVersion]
	,COALESCE([Outcome_721092142202605996].[Impact_ID] , [Impact_5026491224880792648].[Impact_ID] ) AS [OutcomeImpact_ID]
	,[Outcome_721092142202605996].[LocalLongName] AS [OutcomeLocalLongName]
	,[Outcome_721092142202605996].[LocalShortName] AS [OutcomeLocalShortName]
	,[Outcome_721092142202605996].[LongName] AS [OutcomeLongName]
	,[Outcome_721092142202605996].[Outcome_ID] AS [Outcome_ID]
	,[Outcome_721092142202605996].[OutcomeSiteName] AS [OutcomeSiteName]
	,[Outcome_721092142202605996].[ShortName] AS [OutcomeShortName]
	,[Outcome_721092142202605996].[TextDescription] AS [OutcomeTextDescription]
	,[Impact_5026491224880792648].[BusinessKey] AS [ImpactBusinessKey]
	,[Impact_5026491224880792648].[Code] AS [ImpactCode]
	,[Impact_5026491224880792648].[DataVersion] AS [ImpactDataVersion]
	,[Impact_5026491224880792648].[ImpactSiteName] AS [ImpactSiteName]
	,[Impact_5026491224880792648].[LocalLongName] AS [ImpactLocalLongName]
	,[Impact_5026491224880792648].[LocalShortName] AS [ImpactLocalShortName]
	,[Impact_5026491224880792648].[LongName] AS [ImpactLongName]
	,[Impact_5026491224880792648].[ShortName] AS [ImpactShortName]
	,[Impact_5026491224880792648].[TextDescription] AS [ImpactTextDescription]
FROM [app].[Outcome] AS [Outcome_721092142202605996]

    LEFT JOIN [app].[Impact] AS [Impact_5026491224880792648] 
    
    ON  [Outcome_721092142202605996].[Impact_ID] = [Impact_5026491224880792648].[Impact_ID]
GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'ImpactTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'ImpactTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'ImpactTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'ImpactTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'ImpactShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'ImpactShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'ImpactShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'ImpactShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'ImpactLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'ImpactLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'ImpactLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'ImpactLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'ImpactSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'ImpactSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ImpactSiteName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'ImpactSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'ImpactSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'ImpactDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'ImpactDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'DataVersion', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'ImpactDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'ImpactDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'ImpactCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'ImpactCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'ImpactCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'ImpactCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'ImpactBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'ImpactBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'ImpactBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'ImpactBusinessKey';


GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'OutcomeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'OutcomeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'OutcomeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'OutcomeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'OutcomeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'OutcomeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'OutcomeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'OutcomeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'OutcomeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'OutcomeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'OutcomeSiteName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'OutcomeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'OutcomeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'Outcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'Outcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Outcome_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'Outcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'Outcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'OutcomeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'OutcomeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'OutcomeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'OutcomeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'OutcomeImpact_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'OutcomeImpact_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Impact_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'OutcomeImpact_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'OutcomeImpact_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'OutcomeDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'OutcomeDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'DataVersion', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'OutcomeDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'OutcomeDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'OutcomeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'OutcomeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'OutcomeCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'OutcomeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'OutcomeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'OutcomeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'OutcomeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'OutcomeLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'OutcomeLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'OutcomeLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'OutcomeLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'OutcomeLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'OutcomeLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalLongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'OutcomeLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'OutcomeLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'ImpactLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'ImpactLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'ImpactLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'ImpactLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'ImpactLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'ImpactLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalLongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'ImpactLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Outcome', @level2type = N'COLUMN', @level2name = N'ImpactLocalLongName';

