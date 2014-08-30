    

CREATE VIEW [OLAP_GEN].[PeopleReachedValues]
AS

SELECT 
	[PeopleReachedValues].[PeopleReachedValuesID] 
	,[PeopleReachedValues].[Notes] 
	,[PeopleReachedValues].[NumberReached] 
	,[PeopleReachedValues].[Activity_ID] 
	,[PeopleReachedValues].[AgeBand_ID] 
	,[PeopleReachedValues].[CommunityType_ID] 
	,[PeopleReachedValues].[Donor_ID] 
	,[PeopleReachedValues].[Framework_ID] 
	,[PeopleReachedValues].[FrameworkDetail_Indicator_ID] 
	,[PeopleReachedValues].[Gender_ID] 
	,[PeopleReachedValues].[Group_ID] 
	,[PeopleReachedValues].[Institution_ID] 
	,[PeopleReachedValues].[Location_ID] 
	,[PeopleReachedValues].[Outcome_ID] 
	,[PeopleReachedValues].[Output_ID] 
	,[PeopleReachedValues].[Programme_ID] 
	,[PeopleReachedValues].[ProjectID] 
	,[PeopleReachedValues].[ReportingPeriod_ID] 
	,[PeopleReachedValues].[ResultArea_ID] 
	,[PeopleReachedValues].[Sector_ID] 
	,[PeopleReachedValues].[StatusType_ID] 
	,[PeopleReachedValues].[StrategicElement_ID] 
	,[PeopleReachedValues].[SubOutput_ID] 
	,[PeopleReachedValues].[SubSector_ID] 

	,COALESCE(P.BusinessKey, S.BusinessKey, SS.BusinessKey, PR.BusinessKey) as HierarchyBusinessKey 
FROM [RBM].[PeopleReachedValues] [PeopleReachedValues]

	LEFT JOIN app.SubSector SS
	ON [PeopleReachedValues].SubSector_ID = SS.SubSector_ID

LEFT JOIN app.Sector S
	ON [PeopleReachedValues].Sector_ID = S.Sector_ID

LEFT JOIN app.Programme P
	ON [PeopleReachedValues].Programme_ID = P.Programme_ID

LEFT JOIN app.Project PR
	ON [PeopleReachedValues].ProjectID = PR.ProjectID
GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'PeopleReachedValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'NumberReached';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'NumberReached';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'NumberReached', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'NumberReached';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'PeopleReachedValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'StrategicElement_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'StrategicElement_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'StrategicElement_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'StrategicElement_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'PeopleReachedValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'ResultArea_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'ResultArea_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ResultArea_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'ResultArea_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'PeopleReachedValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'Institution_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'Institution_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Institution_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'Institution_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'PeopleReachedValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'Group_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'Group_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Group_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'Group_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'PeopleReachedValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'Gender_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'Gender_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Gender_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'Gender_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'PeopleReachedValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'FrameworkDetail_Indicator_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'FrameworkDetail_Indicator_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'FrameworkDetail_Indicator_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'FrameworkDetail_Indicator_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'PeopleReachedValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'Framework_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'Framework_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Framework_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'Framework_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'PeopleReachedValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'Donor_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'Donor_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Donor_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'Donor_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'PeopleReachedValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'CommunityType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'CommunityType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'CommunityType_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'CommunityType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'PeopleReachedValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'AgeBand_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'AgeBand_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'AgeBand_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'AgeBand_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'PeopleReachedValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'Notes';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'Notes';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Notes', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'Notes';


GO



GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'PeopleReachedValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'Location_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'Location_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Location_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'Location_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'PeopleReachedValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'ReportingPeriod_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'ReportingPeriod_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ReportingPeriod_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'ReportingPeriod_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'PeopleReachedValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'StatusType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'StatusType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'StatusType_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'StatusType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'PeopleReachedValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'Activity_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'Activity_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Activity_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'Activity_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'PeopleReachedValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'ProjectID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'ProjectID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ProjectID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'ProjectID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'PeopleReachedValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'SubSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'SubSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'SubSector_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'SubSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'PeopleReachedValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'Sector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'Sector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Sector_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'Sector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'PeopleReachedValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'Programme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'Programme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Programme_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'Programme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'PeopleReachedValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'SubOutput_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'SubOutput_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'SubOutput_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'SubOutput_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'PeopleReachedValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'Output_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'Output_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Output_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'Output_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'PeopleReachedValues', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'Outcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'RBM', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'Outcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Outcome_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'Outcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'XMLATableType', @value = N'MeasureGroup', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues';


GO
EXECUTE sp_addextendedproperty @name = N'MeasureSum', @value = N'true', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'NumberReached';


GO
EXECUTE sp_addextendedproperty @name = N'MeasureMin', @value = N'true', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'NumberReached';


GO
EXECUTE sp_addextendedproperty @name = N'MeasureMax', @value = N'true', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'NumberReached';


GO
EXECUTE sp_addextendedproperty @name = N'MeasureDistinctCount', @value = N'false', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'NumberReached';


GO
EXECUTE sp_addextendedproperty @name = N'MeasureCount', @value = N'true', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'NumberReached';


GO
EXECUTE sp_addextendedproperty @name = N'MeasureAverage', @value = N'true', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'NumberReached';


GO
EXECUTE sp_addextendedproperty @name = N'AdditionalRelationship', @value = N'IndicatorByProgram[IndicatorBusinessKey]', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'HierarchyBusinessKey';

