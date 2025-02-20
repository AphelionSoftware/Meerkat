﻿    

CREATE VIEW [OLAP_GEN].[StatusValues]
AS

SELECT 
	[StatusValues].[StatusValuesID] 
	,[StatusValues].[Notes] 
	,[StatusValues].[Activity_ID] 
	,[StatusValues].[DataVersionID] 
	,[StatusValues].[Indicator_ID] 
	,[StatusValues].[LocationID] 
	,[StatusValues].[Milestone_ID] 
	,[StatusValues].[Outcome_ID] 
	,[StatusValues].[Output_ID] 
	,[StatusValues].[Programme_ID] 
	,[StatusValues].[ProjectID] 
	,[StatusValues].[ReportingPeriodID] 
	,[StatusValues].[Sector_ID] 
	,[StatusValues].[StatusTypeID] 
	,[StatusValues].[SubOutput_ID] 
	,[StatusValues].[SubSector_ID] 

	,COALESCE(P.BusinessKey, S.BusinessKey, SS.BusinessKey, I.BusinessKey, PR.BusinessKey) as HierarchyBusinessKey 
FROM [RBM].[StatusValues] [StatusValues]

	LEFT JOIN app.Indicator I
	ON [StatusValues].Indicator_ID = I.IndicatorID

LEFT JOIN app.SubSector SS
	ON [StatusValues].SubSector_ID = SS.SubSector_ID

LEFT JOIN app.Sector S
	ON [StatusValues].Sector_ID = S.Sector_ID

LEFT JOIN app.Programme P
	ON [StatusValues].Programme_ID = P.Programme_ID

LEFT JOIN app.Project PR
	ON [StatusValues].ProjectID = PR.ProjectID
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


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'StatusValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'Milestone_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'Milestone_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Milestone_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'Milestone_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'StatusValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'Indicator_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'Indicator_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Indicator_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'Indicator_ID';


GO





GO
EXECUTE sp_addextendedproperty @name = N'MeasureSum', @value = N'StatusSum', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'StatusTypeID';




GO
EXECUTE sp_addextendedproperty @name = N'MeasureAverage', @value = N'StatusAverage', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'StatusTypeID';




GO
EXECUTE sp_addextendedproperty @name = N'AdditionalRelationship04', @value = N'IndicatorByProject[IndicatorBusinessKey]', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'HierarchyBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'AdditionalRelationship03', @value = N'IndicatorBySector[IndicatorBusinessKey]', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'HierarchyBusinessKey';

