CREATE TABLE [RBM].[StatusValues] (
    [StatusValuesID]    INT            IDENTITY (1, 1) NOT NULL,
    [Output_ID]         INT            NULL,
    [Outcome_ID]        INT            NULL,
    [Activity_ID]       INT            NULL,
    [Milestone_ID]      INT            NULL,
    [SubOutput_ID]      INT            NULL,
    [Indicator_ID]      INT            NULL,
    [Programme_ID]      INT            NULL,
    [Sector_ID]         INT            NULL,
    [SubSector_ID]      INT            NULL,
    [ProjectID]         INT            NULL,
    [StatusTypeID]      INT            NULL,
    [ReportingPeriodID] INT            NOT NULL,
    [LocationID]        INT            NOT NULL,
    [DataVersionID]     INT            NOT NULL,
    [Notes]             NVARCHAR (MAX) NULL,
    [Active]            INT            CONSTRAINT [DF_StatusValues_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]     VARCHAR (255)  CONSTRAINT [DF_StatusValues_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]     DATETIME       CONSTRAINT [DF_StatusValues_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]    VARCHAR (255)  CONSTRAINT [DF_StatusValues_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]    DATETIME       CONSTRAINT [DF_StatusValues_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_StatusValues] PRIMARY KEY CLUSTERED ([StatusValuesID] ASC),
    CONSTRAINT [CK_ENFORCE_SINGLE_Parent_Link_StatusValues] CHECK ((((((((case when [StatusValues].[ProjectID] IS NOT NULL then (1) else (0) end+case when [StatusValues].[Programme_ID] IS NOT NULL then (1) else (0) end)+case when [StatusValues].[Output_ID] IS NOT NULL then (1) else (0) end)+case when [StatusValues].[Outcome_ID] IS NOT NULL then (1) else (0) end)+case when [StatusValues].[Activity_ID] IS NOT NULL then (1) else (0) end)+case when [StatusValues].[SubOutput_ID] IS NOT NULL then (1) else (0) end)+case when [StatusValues].[Sector_ID] IS NOT NULL then (1) else (0) end)+case when [StatusValues].[SubSector_ID] IS NOT NULL then (1) else (0) end)=(1)),
    CONSTRAINT [FK_StatusValues_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_StatusValues_Activity] FOREIGN KEY ([Activity_ID]) REFERENCES [app].[Activity] ([Activity_ID]),
    CONSTRAINT [FK_StatusValues_DataVersion] FOREIGN KEY ([DataVersionID]) REFERENCES [Core].[DataVersion] ([DataVersion_ID]),
    CONSTRAINT [FK_StatusValues_Indicator] FOREIGN KEY ([Indicator_ID]) REFERENCES [app].[Indicator] ([IndicatorID]),
    CONSTRAINT [FK_StatusValues_Location] FOREIGN KEY ([LocationID]) REFERENCES [Core].[Location] ([Location_ID]),
    CONSTRAINT [FK_StatusValues_Milestone] FOREIGN KEY ([Milestone_ID]) REFERENCES [app].[Milestone] ([MilestoneID]),
    CONSTRAINT [FK_StatusValues_Outcome] FOREIGN KEY ([Outcome_ID]) REFERENCES [app].[Outcome] ([Outcome_ID]),
    CONSTRAINT [FK_StatusValues_Output] FOREIGN KEY ([Output_ID]) REFERENCES [app].[Output] ([Output_ID]),
    CONSTRAINT [FK_StatusValues_Programme] FOREIGN KEY ([Programme_ID]) REFERENCES [app].[Programme] ([Programme_ID]),
    CONSTRAINT [FK_StatusValues_Project] FOREIGN KEY ([ProjectID]) REFERENCES [app].[Project] ([ProjectID]),
    CONSTRAINT [FK_StatusValues_ReportingPeriod] FOREIGN KEY ([ReportingPeriodID]) REFERENCES [Core].[ReportingPeriod] ([ID]),
    CONSTRAINT [FK_StatusValues_Sector] FOREIGN KEY ([Sector_ID]) REFERENCES [app].[Sector] ([Sector_ID]),
    CONSTRAINT [FK_StatusValues_StatusType] FOREIGN KEY ([StatusTypeID]) REFERENCES [Core].[StatusType] ([ID]),
    CONSTRAINT [FK_StatusValues_SubOutput] FOREIGN KEY ([SubOutput_ID]) REFERENCES [app].[SubOutput] ([SubOutput_ID]),
    CONSTRAINT [FK_StatusValues_SubSector] FOREIGN KEY ([SubSector_ID]) REFERENCES [app].[SubSector] ([SubSector_ID])
);




















GO
CREATE UNIQUE NONCLUSTERED INDEX [StatusValues_UniqueRows]
    ON [RBM].[StatusValues]([Output_ID] ASC, [Outcome_ID] ASC, [Activity_ID] ASC, [SubOutput_ID] ASC, [Programme_ID] ASC, [ProjectID] ASC, [ReportingPeriodID] ASC, [LocationID] ASC, [DataVersionID] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'AdditionalProperties', @value = N'EXEC sys.sp_addextendedproperty @name=N''AdditionalRelationship'', @value=N''IndicatorProgram[IndicatorBusinessKey]'' , @level0type=N''SCHEMA'',@level0name=N''OLAP_GEN'', @level1type=N''VIEW'',@level1name=N''StatusValues'', @level2type=N''COLUMN'',@level2name=N''HierarchyBusinessKey''
', @level0type = N'SCHEMA', @level0name = N'RBM', @level1type = N'TABLE', @level1name = N'StatusValues';


GO
EXECUTE sp_addextendedproperty @name = N'AdditionalJoin01', @value = N'LEFT JOIN app.Indicator I
	ON [StatusValues].Indicator_ID = I.IndicatorID

LEFT JOIN app.SubSector SS
	ON [StatusValues].SubSector_ID = SS.SubSector_ID

LEFT JOIN app.Sector S
	ON [StatusValues].Sector_ID = S.Sector_ID

LEFT JOIN app.Programme P
	ON [StatusValues].Programme_ID = P.Programme_ID
', @level0type = N'SCHEMA', @level0name = N'RBM', @level1type = N'TABLE', @level1name = N'StatusValues';


GO
EXECUTE sp_addextendedproperty @name = N'AdditionalField01', @value = N'COALESCE(P.BusinessKey, S.BusinessKey, SS.BusinessKey, I.BusinessKey) as HierarchyBusinessKey', @level0type = N'SCHEMA', @level0name = N'RBM', @level1type = N'TABLE', @level1name = N'StatusValues';


GO
EXECUTE sp_addextendedproperty @name = N'MeasureSum', @value = N'true', @level0type = N'SCHEMA', @level0name = N'RBM', @level1type = N'TABLE', @level1name = N'StatusValues', @level2type = N'COLUMN', @level2name = N'StatusTypeID';

