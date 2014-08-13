CREATE TABLE [RBM].[PeopleReachedValues] (
    [PeopleReachedValuesID]        INT            IDENTITY (1, 1) NOT NULL,
    [Outcome_ID]                   INT            NULL,
    [Output_ID]                    INT            NULL,
    [SubOutput_ID]                 INT            NULL,
    [Programme_ID]                 INT            NULL,
    [Sector_ID]                    INT            NULL,
    [SubSector_ID]                 INT            NULL,
    [ProjectID]                    INT            NULL,
    [Activity_ID]                  INT            NULL,
    [StatusType_ID]                INT            NULL,
    [ReportingPeriod_ID]           INT            NOT NULL,
    [Location_ID]                  INT            NOT NULL,
    [DataVersion_ID]               INT            NOT NULL,
    [Notes]                        NVARCHAR (MAX) NULL,
    [Active]                       INT            CONSTRAINT [DF_PeopleReachedValues_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]                VARCHAR (255)  CONSTRAINT [DF_PeopleReachedValues_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]                DATETIME       CONSTRAINT [DF_PeopleReachedValues_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]               VARCHAR (255)  CONSTRAINT [DF_PeopleReachedValues_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]               DATETIME       CONSTRAINT [DF_PeopleReachedValues_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [AgeBand_ID]                   INT            NULL,
    [CommunityType_ID]             INT            NULL,
    [Donor_ID]                     INT            NULL,
    [Framework_ID]                 INT            NULL,
    [FrameworkDetail_Indicator_ID] INT            NULL,
    [Gender_ID]                    INT            NULL,
    [Group_ID]                     INT            NULL,
    [Institution_ID]               INT            NULL,
    [ResultArea_ID]                INT            NULL,
    [StrategicElement_ID]          INT            NULL,
    [NumberReached]                INT            NOT NULL,
    CONSTRAINT [PK_PeopleReachedValues] PRIMARY KEY CLUSTERED ([PeopleReachedValuesID] ASC),
    CONSTRAINT [CK_PeopleReachedValues] CHECK ((((((((case when [Outcome_ID] IS NULL then (0) else (1) end+case when [Output_ID] IS NULL then (0) else (1) end)+case when [SubOutput_ID] IS NULL then (0) else (1) end)+case when [Programme_ID] IS NULL then (0) else (1) end)+case when [Sector_ID] IS NULL then (0) else (1) end)+case when [SubSector_ID] IS NULL then (0) else (1) end)+case when [ProjectID] IS NULL then (0) else (1) end)+case when [Activity_ID] IS NULL then (0) else (1) end)=(1)),
    CONSTRAINT [FK_PeopleReachedValues_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_PeopleReachedValues_Activity] FOREIGN KEY ([Activity_ID]) REFERENCES [app].[Activity] ([Activity_ID]),
    CONSTRAINT [FK_PeopleReachedValues_AgeBand] FOREIGN KEY ([AgeBand_ID]) REFERENCES [disagg].[AgeBand] ([AgeBand_ID]),
    CONSTRAINT [FK_PeopleReachedValues_CommunityType] FOREIGN KEY ([CommunityType_ID]) REFERENCES [disagg].[CommunityType] ([CommunityType_ID]),
    CONSTRAINT [FK_PeopleReachedValues_DataVersion] FOREIGN KEY ([DataVersion_ID]) REFERENCES [Core].[DataVersion] ([DataVersion_ID]),
    CONSTRAINT [FK_PeopleReachedValues_Donor] FOREIGN KEY ([Donor_ID]) REFERENCES [disagg].[Donor] ([Donor_ID]),
    CONSTRAINT [FK_PeopleReachedValues_Framework] FOREIGN KEY ([Framework_ID]) REFERENCES [disagg].[Framework] ([Framework_ID]),
    CONSTRAINT [FK_PeopleReachedValues_FrameworkDetail_Indicator] FOREIGN KEY ([FrameworkDetail_Indicator_ID]) REFERENCES [disagg].[FrameworkDetail_Indicator] ([FrameworkDetail_Indicator_ID]),
    CONSTRAINT [FK_PeopleReachedValues_Gender] FOREIGN KEY ([Gender_ID]) REFERENCES [disagg].[Gender] ([Gender_ID]),
    CONSTRAINT [FK_PeopleReachedValues_Group] FOREIGN KEY ([Group_ID]) REFERENCES [disagg].[Group] ([Group_ID]),
    CONSTRAINT [FK_PeopleReachedValues_Institution] FOREIGN KEY ([Institution_ID]) REFERENCES [disagg].[Institution] ([Institution_ID]),
    CONSTRAINT [FK_PeopleReachedValues_Location] FOREIGN KEY ([Location_ID]) REFERENCES [Core].[Location] ([Location_ID]),
    CONSTRAINT [FK_PeopleReachedValues_Outcome] FOREIGN KEY ([Outcome_ID]) REFERENCES [app].[Outcome] ([Outcome_ID]),
    CONSTRAINT [FK_PeopleReachedValues_Output] FOREIGN KEY ([Output_ID]) REFERENCES [app].[Output] ([Output_ID]),
    CONSTRAINT [FK_PeopleReachedValues_Programme] FOREIGN KEY ([Programme_ID]) REFERENCES [app].[Programme] ([Programme_ID]),
    CONSTRAINT [FK_PeopleReachedValues_Project] FOREIGN KEY ([ProjectID]) REFERENCES [app].[Project] ([ProjectID]),
    CONSTRAINT [FK_PeopleReachedValues_ReportingPeriod] FOREIGN KEY ([ReportingPeriod_ID]) REFERENCES [Core].[ReportingPeriod] ([ID]),
    CONSTRAINT [FK_PeopleReachedValues_ResultArea] FOREIGN KEY ([ResultArea_ID]) REFERENCES [disagg].[ResultArea] ([ResultArea_ID]),
    CONSTRAINT [FK_PeopleReachedValues_Sector] FOREIGN KEY ([Sector_ID]) REFERENCES [app].[Sector] ([Sector_ID]),
    CONSTRAINT [FK_PeopleReachedValues_StatusType] FOREIGN KEY ([StatusType_ID]) REFERENCES [Core].[StatusType] ([ID]),
    CONSTRAINT [FK_PeopleReachedValues_StrategicElement] FOREIGN KEY ([StrategicElement_ID]) REFERENCES [disagg].[StrategicElement] ([StrategicElement_ID]),
    CONSTRAINT [FK_PeopleReachedValues_SubOutput] FOREIGN KEY ([SubOutput_ID]) REFERENCES [app].[SubOutput] ([SubOutput_ID]),
    CONSTRAINT [FK_PeopleReachedValues_SubSector] FOREIGN KEY ([SubSector_ID]) REFERENCES [app].[SubSector] ([SubSector_ID])
);




GO
EXECUTE sp_addextendedproperty @name = N'MeasureSum', @value = N'True', @level0type = N'SCHEMA', @level0name = N'RBM', @level1type = N'TABLE', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'NumberReached';


GO
EXECUTE sp_addextendedproperty @name = N'MeasureMin', @value = N'True', @level0type = N'SCHEMA', @level0name = N'RBM', @level1type = N'TABLE', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'NumberReached';


GO
EXECUTE sp_addextendedproperty @name = N'MeasureMax', @value = N'True', @level0type = N'SCHEMA', @level0name = N'RBM', @level1type = N'TABLE', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'NumberReached';


GO
EXECUTE sp_addextendedproperty @name = N'MeasureDistinctCount', @value = N'False', @level0type = N'SCHEMA', @level0name = N'RBM', @level1type = N'TABLE', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'NumberReached';


GO
EXECUTE sp_addextendedproperty @name = N'MeasureCount', @value = N'True', @level0type = N'SCHEMA', @level0name = N'RBM', @level1type = N'TABLE', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'NumberReached';


GO
EXECUTE sp_addextendedproperty @name = N'MeasureAverage', @value = N'True', @level0type = N'SCHEMA', @level0name = N'RBM', @level1type = N'TABLE', @level1name = N'PeopleReachedValues', @level2type = N'COLUMN', @level2name = N'NumberReached';


GO
EXECUTE sp_addextendedproperty @name = N'AdditionalProperties', @value = N'EXEC sys.sp_addextendedproperty @name=N''AdditionalRelationship'', @value=N''IndicatorByProgram[IndicatorBusinessKey]'' , @level0type=N''SCHEMA'',@level0name=N''OLAP_GEN'', @level1type=N''VIEW'',@level1name=N''PeopleReachedValues'', @level2type=N''COLUMN'',@level2name=N''HierarchyBusinessKey''
', @level0type = N'SCHEMA', @level0name = N'RBM', @level1type = N'TABLE', @level1name = N'PeopleReachedValues';




GO
EXECUTE sp_addextendedproperty @name = N'AdditionalJoin01', @value = N'LEFT JOIN app.SubSector SS
	ON [PeopleReachedValues].SubSector_ID = SS.SubSector_ID

LEFT JOIN app.Sector S
	ON [PeopleReachedValues].Sector_ID = S.Sector_ID

LEFT JOIN app.Programme P
	ON [PeopleReachedValues].Programme_ID = P.Programme_ID

LEFT JOIN app.Project PR
	ON [PeopleReachedValues].ProjectID = PR.ProjectID
', @level0type = N'SCHEMA', @level0name = N'RBM', @level1type = N'TABLE', @level1name = N'PeopleReachedValues';




GO
EXECUTE sp_addextendedproperty @name = N'AdditionalField01', @value = N'COALESCE(P.BusinessKey, S.BusinessKey, SS.BusinessKey, PR.BusinessKey) as HierarchyBusinessKey', @level0type = N'SCHEMA', @level0name = N'RBM', @level1type = N'TABLE', @level1name = N'PeopleReachedValues';






GO


GO
