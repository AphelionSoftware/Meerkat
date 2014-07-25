    

CREATE VIEW [OLAP_GEN].[StatusValues]
AS

SELECT 
	[StatusValuesID]
	,[Output_ID]
	,[Outcome_ID]
	,[Activity_ID]
	,[SubOutput_ID]
	,[Programme_ID]
	,[Sector_ID]
	,[SubSector_ID]
	,[ProjectID]
	,[StatusTypeID]
	,[ReportingPeriodID]
	,[LocationID]
	,[DataVersionID]
	,[Notes]
FROM [RBM].[StatusValues]
GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'StatusValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'Notes';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'Notes';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Notes', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'Notes';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'StatusValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'DataVersionID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'DataVersionID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'DataVersionID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'DataVersionID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'StatusValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'LocationID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'LocationID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocationID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'LocationID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'StatusValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'ReportingPeriodID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'ReportingPeriodID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ReportingPeriodID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'ReportingPeriodID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'StatusValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'StatusTypeID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'StatusTypeID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'StatusTypeID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'StatusTypeID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'StatusValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'ProjectID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'ProjectID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ProjectID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'ProjectID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'StatusValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'SubSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'SubSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'SubSector_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'SubSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'StatusValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'Sector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'Sector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Sector_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'Sector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'StatusValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'Programme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'Programme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Programme_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'Programme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'StatusValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'SubOutput_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'SubOutput_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'SubOutput_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'SubOutput_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'StatusValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'Activity_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'Activity_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Activity_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'Activity_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'StatusValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'Outcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'Outcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Outcome_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'Outcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'StatusValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'Output_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'Output_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Output_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'Output_ID';


GO
EXECUTE sp_addextendedproperty @name = N'XMLATableType', @value = N'MeasureGroup', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues';

