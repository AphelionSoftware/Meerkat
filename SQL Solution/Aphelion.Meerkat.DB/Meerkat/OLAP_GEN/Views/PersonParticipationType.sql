  

CREATE VIEW [OLAP_GEN].[PersonParticipationType]
AS

SELECT 
	[PersonParticipationType_7352486456236417010].[BusinessKey] AS [PersonParticipationTypeBusinessKey]
	,[PersonParticipationType_7352486456236417010].[Code] AS [PersonParticipationTypeCode]
	,[PersonParticipationType_7352486456236417010].[Name] AS [PersonParticipationTypeName]
	,[PersonParticipationType_7352486456236417010].[PersonParticipationType_ID] AS [PersonParticipationType_ID]
FROM [Core].[PersonParticipationType] AS [PersonParticipationType_7352486456236417010]
GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'PersonParticipationType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PersonParticipationType', @level2type = N'COLUMN', @level2name = N'PersonParticipationType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PersonParticipationType', @level2type = N'COLUMN', @level2name = N'PersonParticipationType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'PersonParticipationType_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PersonParticipationType', @level2type = N'COLUMN', @level2name = N'PersonParticipationType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PersonParticipationType', @level2type = N'COLUMN', @level2name = N'PersonParticipationType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'PersonParticipationType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PersonParticipationType', @level2type = N'COLUMN', @level2name = N'PersonParticipationTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PersonParticipationType', @level2type = N'COLUMN', @level2name = N'PersonParticipationTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Name', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PersonParticipationType', @level2type = N'COLUMN', @level2name = N'PersonParticipationTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PersonParticipationType', @level2type = N'COLUMN', @level2name = N'PersonParticipationTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'PersonParticipationType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PersonParticipationType', @level2type = N'COLUMN', @level2name = N'PersonParticipationTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PersonParticipationType', @level2type = N'COLUMN', @level2name = N'PersonParticipationTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PersonParticipationType', @level2type = N'COLUMN', @level2name = N'PersonParticipationTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PersonParticipationType', @level2type = N'COLUMN', @level2name = N'PersonParticipationTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'PersonParticipationType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PersonParticipationType', @level2type = N'COLUMN', @level2name = N'PersonParticipationTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PersonParticipationType', @level2type = N'COLUMN', @level2name = N'PersonParticipationTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PersonParticipationType', @level2type = N'COLUMN', @level2name = N'PersonParticipationTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PersonParticipationType', @level2type = N'COLUMN', @level2name = N'PersonParticipationTypeBusinessKey';

