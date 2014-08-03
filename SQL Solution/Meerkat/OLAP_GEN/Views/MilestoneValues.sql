    

CREATE VIEW [OLAP_GEN].[MilestoneValues]
AS

SELECT 
	[MilestoneValues].[MilestoneValues_ID] 
	,[MilestoneValues].[Milestone_ID] 
	,[MilestoneValues].[ActualLabel] 
	,[MilestoneValues].[ActualValue] 
	,[MilestoneValues].[ActualDate] 
	,[MilestoneValues].[BusinessKey] 
	,[MilestoneValues].[Notes] 
	,[MilestoneValues].[DataVersion_ID] 
	,[MilestoneValues].[Location_ID] 
	,[MilestoneValues].[ReportPeriodID] 
	,[MilestoneValues].[Organization_ID] 
	,[MilestoneValues].[MilestoneValueGroup] 
	,[MilestoneValues].[GroupVersion] 
	,[MilestoneValues].[AgeBand_ID] 
	,[MilestoneValues].[CommunityType_ID] 
	,[MilestoneValues].[Donor_ID] 
	,[MilestoneValues].[Framework_ID] 
	,[MilestoneValues].[Gender_ID] 
	,[MilestoneValues].[Group_ID] 
	,[MilestoneValues].[Institution_ID] 
	,[MilestoneValues].[ResultArea_ID] 
	,[MilestoneValues].[StrategicElement_ID] 

FROM [RBM].[MilestoneValues] [MilestoneValues]
GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'MilestoneValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'StrategicElement_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'StrategicElement_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'StrategicElement_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'StrategicElement_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'MilestoneValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'ResultArea_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'ResultArea_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ResultArea_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'ResultArea_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'MilestoneValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'Institution_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'Institution_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Institution_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'Institution_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'MilestoneValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'Group_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'Group_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Group_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'Group_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'MilestoneValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'Gender_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'Gender_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Gender_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'Gender_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'MilestoneValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'Framework_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'Framework_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Framework_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'Framework_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'MilestoneValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'Donor_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'Donor_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Donor_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'Donor_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'MilestoneValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'CommunityType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'CommunityType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'CommunityType_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'CommunityType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'MilestoneValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'AgeBand_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'AgeBand_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'AgeBand_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'AgeBand_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'MilestoneValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'GroupVersion';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'GroupVersion';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'GroupVersion', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'GroupVersion';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'MilestoneValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'MilestoneValueGroup';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'MilestoneValueGroup';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'MilestoneValueGroup', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'MilestoneValueGroup';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'MilestoneValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'Organization_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'Organization_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Organization_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'Organization_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'MilestoneValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'ReportPeriodID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'ReportPeriodID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ReportPeriodID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'ReportPeriodID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'MilestoneValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'Location_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'Location_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Location_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'Location_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'MilestoneValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'DataVersion_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'DataVersion_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'DataVersion_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'DataVersion_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'MilestoneValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'Notes';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'Notes';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Notes', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'Notes';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'MilestoneValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'BusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'BusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'BusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'MilestoneValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'ActualDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'ActualDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ActualDate', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'ActualDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'MilestoneValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'ActualValue';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'ActualValue';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ActualValue', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'ActualValue';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'MilestoneValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'ActualLabel';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'ActualLabel';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ActualLabel', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'ActualLabel';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'MilestoneValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'Milestone_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'Milestone_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Milestone_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'Milestone_ID';


GO
EXECUTE sp_addextendedproperty @name = N'XMLATableType', @value = N'MeasureGroup', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'MilestoneValues';

