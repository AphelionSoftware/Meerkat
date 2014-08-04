    

CREATE VIEW [OLAP_GEN].[IndicatorValues]
AS

SELECT 
	[IndicatorValues].[IndicatorValues_ID] 
	,[IndicatorValues].[Indicator_ID] 
	,[IndicatorValues].[ActualLabel] 
	,[IndicatorValues].[ActualValue] 
	,[IndicatorValues].[ActualDate] 
	,[IndicatorValues].[BusinessKey] 
	,[IndicatorValues].[Notes] 
	,[IndicatorValues].[DataVersion_ID] 
	,[IndicatorValues].[Location_ID] 
	,[IndicatorValues].[ReportPeriodID] 
	,[IndicatorValues].[Organization_ID] 
	,[IndicatorValues].[IndicatorValueGroup] 
	,[IndicatorValues].[AgeBand_ID] 
	,[IndicatorValues].[CommunityType_ID] 
	,[IndicatorValues].[Donor_ID] 
	,[IndicatorValues].[Framework_ID] 
	,[IndicatorValues].[Gender_ID] 
	,[IndicatorValues].[Group_ID] 
	,[IndicatorValues].[Institution_ID] 
	,[IndicatorValues].[ResultArea_ID] 
	,[IndicatorValues].[StrategicElement_ID] 

FROM [RBM].[IndicatorValues] [IndicatorValues]
GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'IndicatorValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'StrategicElement_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'StrategicElement_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'StrategicElement_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'StrategicElement_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'IndicatorValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'ResultArea_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'ResultArea_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ResultArea_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'ResultArea_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'IndicatorValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'Institution_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'Institution_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Institution_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'Institution_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'IndicatorValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'Group_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'Group_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Group_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'Group_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'IndicatorValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'Gender_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'Gender_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Gender_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'Gender_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'IndicatorValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'Framework_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'Framework_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Framework_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'Framework_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'IndicatorValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'Donor_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'Donor_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Donor_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'Donor_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'IndicatorValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'CommunityType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'CommunityType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'CommunityType_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'CommunityType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'IndicatorValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'AgeBand_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'AgeBand_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'AgeBand_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'AgeBand_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'IndicatorValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'IndicatorValueGroup';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'IndicatorValueGroup';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'IndicatorValueGroup', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'IndicatorValueGroup';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'IndicatorValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'Organization_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'Organization_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Organization_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'Organization_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'IndicatorValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'ReportPeriodID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'ReportPeriodID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ReportPeriodID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'ReportPeriodID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'IndicatorValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'Location_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'Location_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Location_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'Location_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'IndicatorValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'DataVersion_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'DataVersion_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'DataVersion_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'DataVersion_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'IndicatorValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'Notes';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'Notes';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Notes', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'Notes';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'IndicatorValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'BusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'BusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'BusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'IndicatorValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'ActualDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'ActualDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ActualDate', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'ActualDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'IndicatorValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'ActualValue';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'ActualValue';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ActualValue', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'ActualValue';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'IndicatorValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'ActualLabel';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'ActualLabel';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ActualLabel', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'ActualLabel';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'IndicatorValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'Indicator_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'Indicator_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Indicator_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'Indicator_ID';


GO
EXECUTE sp_addextendedproperty @name = N'XMLATableType', @value = N'MeasureGroup', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'IndicatorValues';

