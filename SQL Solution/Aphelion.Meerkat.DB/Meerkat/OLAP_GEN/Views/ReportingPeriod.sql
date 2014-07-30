  

CREATE VIEW [OLAP_GEN].[ReportingPeriod]
AS

SELECT 
	[ReportingPeriod_6896613720974965773].[BusinessKey] AS [ReportingPeriodBusinessKey]
	,[ReportingPeriod_6896613720974965773].[EndDateID] AS [ReportingPeriodEndDateID]
	,[ReportingPeriod_6896613720974965773].[FirstCycleDate] AS [ReportingPeriodFirstCycleDate]
	,[ReportingPeriod_6896613720974965773].[ID] AS [ReportingPeriodID]
	,[ReportingPeriod_6896613720974965773].[LastCycleDate] AS [ReportingPeriodLastCycleDate]
	,[ReportingPeriod_6896613720974965773].[ReportingPeriod] AS [ReportingPeriod]
	,[ReportingPeriod_6896613720974965773].[StartDateID] AS [ReportingPeriodStartDateID]
	,[ReportingPeriod_6896613720974965773].[Summary] AS [ReportingPeriodSummary]
	,[ReportingPeriod_6896613720974965773].[YearName] AS [ReportingPeriodYearName]
	,[ReportingPeriod_6896613720974965773].[YearNumber] AS [ReportingPeriodYearNumber]
FROM [Core].[ReportingPeriod] AS [ReportingPeriod_6896613720974965773]
GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'ReportingPeriod', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ReportingPeriod', @level2type = N'COLUMN', @level2name = N'ReportingPeriodYearNumber';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ReportingPeriod', @level2type = N'COLUMN', @level2name = N'ReportingPeriodYearNumber';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'YearNumber', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ReportingPeriod', @level2type = N'COLUMN', @level2name = N'ReportingPeriodYearNumber';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ReportingPeriod', @level2type = N'COLUMN', @level2name = N'ReportingPeriodYearNumber';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'ReportingPeriod', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ReportingPeriod', @level2type = N'COLUMN', @level2name = N'ReportingPeriodYearName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ReportingPeriod', @level2type = N'COLUMN', @level2name = N'ReportingPeriodYearName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'YearName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ReportingPeriod', @level2type = N'COLUMN', @level2name = N'ReportingPeriodYearName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ReportingPeriod', @level2type = N'COLUMN', @level2name = N'ReportingPeriodYearName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'ReportingPeriod', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ReportingPeriod', @level2type = N'COLUMN', @level2name = N'ReportingPeriodSummary';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ReportingPeriod', @level2type = N'COLUMN', @level2name = N'ReportingPeriodSummary';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Summary', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ReportingPeriod', @level2type = N'COLUMN', @level2name = N'ReportingPeriodSummary';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ReportingPeriod', @level2type = N'COLUMN', @level2name = N'ReportingPeriodSummary';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'ReportingPeriod', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ReportingPeriod', @level2type = N'COLUMN', @level2name = N'ReportingPeriodStartDateID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ReportingPeriod', @level2type = N'COLUMN', @level2name = N'ReportingPeriodStartDateID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'StartDateID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ReportingPeriod', @level2type = N'COLUMN', @level2name = N'ReportingPeriodStartDateID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ReportingPeriod', @level2type = N'COLUMN', @level2name = N'ReportingPeriodStartDateID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'ReportingPeriod', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ReportingPeriod', @level2type = N'COLUMN', @level2name = N'ReportingPeriod';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ReportingPeriod', @level2type = N'COLUMN', @level2name = N'ReportingPeriod';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ReportingPeriod', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ReportingPeriod', @level2type = N'COLUMN', @level2name = N'ReportingPeriod';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ReportingPeriod', @level2type = N'COLUMN', @level2name = N'ReportingPeriod';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'ReportingPeriod', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ReportingPeriod', @level2type = N'COLUMN', @level2name = N'ReportingPeriodLastCycleDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ReportingPeriod', @level2type = N'COLUMN', @level2name = N'ReportingPeriodLastCycleDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LastCycleDate', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ReportingPeriod', @level2type = N'COLUMN', @level2name = N'ReportingPeriodLastCycleDate';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ReportingPeriod', @level2type = N'COLUMN', @level2name = N'ReportingPeriodLastCycleDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'ReportingPeriod', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ReportingPeriod', @level2type = N'COLUMN', @level2name = N'ReportingPeriodID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ReportingPeriod', @level2type = N'COLUMN', @level2name = N'ReportingPeriodID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ReportingPeriod', @level2type = N'COLUMN', @level2name = N'ReportingPeriodID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ReportingPeriod', @level2type = N'COLUMN', @level2name = N'ReportingPeriodID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'ReportingPeriod', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ReportingPeriod', @level2type = N'COLUMN', @level2name = N'ReportingPeriodFirstCycleDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ReportingPeriod', @level2type = N'COLUMN', @level2name = N'ReportingPeriodFirstCycleDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'FirstCycleDate', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ReportingPeriod', @level2type = N'COLUMN', @level2name = N'ReportingPeriodFirstCycleDate';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ReportingPeriod', @level2type = N'COLUMN', @level2name = N'ReportingPeriodFirstCycleDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'ReportingPeriod', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ReportingPeriod', @level2type = N'COLUMN', @level2name = N'ReportingPeriodEndDateID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ReportingPeriod', @level2type = N'COLUMN', @level2name = N'ReportingPeriodEndDateID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'EndDateID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ReportingPeriod', @level2type = N'COLUMN', @level2name = N'ReportingPeriodEndDateID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ReportingPeriod', @level2type = N'COLUMN', @level2name = N'ReportingPeriodEndDateID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'ReportingPeriod', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ReportingPeriod', @level2type = N'COLUMN', @level2name = N'ReportingPeriodBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'Core', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ReportingPeriod', @level2type = N'COLUMN', @level2name = N'ReportingPeriodBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'ReportingPeriod', @level2type = N'COLUMN', @level2name = N'ReportingPeriodBusinessKey';

