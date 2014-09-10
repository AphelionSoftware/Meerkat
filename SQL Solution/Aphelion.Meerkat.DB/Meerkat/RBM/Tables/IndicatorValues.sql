CREATE TABLE [RBM].[IndicatorValues] (
    [IndicatorValues_ID]  INT              IDENTITY (1, 1) NOT NULL,
    [Indicator_ID]        INT              NOT NULL,
    [ActualLabel]         VARCHAR (50)     NOT NULL,
    [ActualValue]         DECIMAL (20, 5)  NULL,
    [ActualDate]          DATE             NULL,
    [BusinessKey]         NVARCHAR (400)   NOT NULL,
    [Notes]               VARCHAR (MAX)    NULL,
    [DataVersion_ID]      INT              NOT NULL,
    [Location_ID]         INT              NOT NULL,
    [ReportPeriodID]      INT              NOT NULL,
    [Organization_ID]     INT              NULL,
    [Active]              INT              CONSTRAINT [DF_IndicatorValues_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]       VARCHAR (255)    CONSTRAINT [DF_IndicatorValues_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]       DATETIME         CONSTRAINT [DF_IndicatorValues_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]      VARCHAR (255)    CONSTRAINT [DF_IndicatorValues_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]      DATETIME         CONSTRAINT [DF_IndicatorValues_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [IndicatorValueGroup] UNIQUEIDENTIFIER CONSTRAINT [DF__Indicator__Indic__51BA1E3A] DEFAULT (newid()) NOT NULL,
    [AgeBand_ID]          INT              NULL,
    [CommunityType_ID]    INT              NULL,
    [Donor_ID]            INT              NULL,
    [Framework_ID]        INT              NULL,
    [Gender_ID]           INT              NULL,
    [Group_ID]            INT              NULL,
    [Institution_ID]      INT              NULL,
    [Structure_ID]        INT              NULL,
    CONSTRAINT [PK_IndicatorValues] PRIMARY KEY CLUSTERED ([IndicatorValues_ID] ASC),
    CONSTRAINT [FK_IndicatorValues_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_IndicatorValues_AgeBand] FOREIGN KEY ([AgeBand_ID]) REFERENCES [disagg].[AgeBand] ([AgeBand_ID]),
    CONSTRAINT [FK_IndicatorValues_CommunityType] FOREIGN KEY ([CommunityType_ID]) REFERENCES [disagg].[CommunityType] ([CommunityType_ID]),
    CONSTRAINT [FK_IndicatorValues_DataVersion] FOREIGN KEY ([DataVersion_ID]) REFERENCES [Core].[DataVersion] ([DataVersion_ID]),
    CONSTRAINT [FK_IndicatorValues_Donor] FOREIGN KEY ([Donor_ID]) REFERENCES [disagg].[Donor] ([Donor_ID]),
    CONSTRAINT [FK_IndicatorValues_Framework] FOREIGN KEY ([Framework_ID]) REFERENCES [disagg].[Framework] ([Framework_ID]),
    CONSTRAINT [FK_IndicatorValues_Gender] FOREIGN KEY ([Gender_ID]) REFERENCES [disagg].[Gender] ([Gender_ID]),
    CONSTRAINT [FK_IndicatorValues_Group] FOREIGN KEY ([Group_ID]) REFERENCES [disagg].[Group] ([Group_ID]),
    CONSTRAINT [FK_IndicatorValues_Indicator1] FOREIGN KEY ([Indicator_ID]) REFERENCES [app].[Indicator] ([IndicatorID]),
    CONSTRAINT [FK_IndicatorValues_Institution] FOREIGN KEY ([Institution_ID]) REFERENCES [disagg].[Institution] ([Institution_ID]),
    CONSTRAINT [FK_IndicatorValues_Location] FOREIGN KEY ([Location_ID]) REFERENCES [Core].[Location] ([Location_ID]),
    CONSTRAINT [FK_IndicatorValues_Organization] FOREIGN KEY ([Organization_ID]) REFERENCES [Core].[Organization] ([Organization_ID]),
    CONSTRAINT [FK_IndicatorValues_ReportingPeriod] FOREIGN KEY ([ReportPeriodID]) REFERENCES [Core].[ReportingPeriod] ([ID]),
    CONSTRAINT [FK_IndicatorValues_Structure] FOREIGN KEY ([Structure_ID]) REFERENCES [disagg].[Structure] ([Structure_ID])
);




































GO
EXECUTE sp_addextendedproperty @name = N'AdditionalRelationship', @value = N'IndicatorProgram[IndicatorBusinessKey]', @level0type = N'SCHEMA', @level0name = N'RBM', @level1type = N'TABLE', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'BusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'MeasureSum', @value = N'IndicatorValuesSum', @level0type = N'SCHEMA', @level0name = N'RBM', @level1type = N'TABLE', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'ActualValue';






GO
EXECUTE sp_addextendedproperty @name = N'MeasureMin', @value = N'IndicatorValuesMin', @level0type = N'SCHEMA', @level0name = N'RBM', @level1type = N'TABLE', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'ActualValue';






GO
EXECUTE sp_addextendedproperty @name = N'MeasureMax', @value = N'IndicatorValuesMax', @level0type = N'SCHEMA', @level0name = N'RBM', @level1type = N'TABLE', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'ActualValue';






GO
EXECUTE sp_addextendedproperty @name = N'MeasureDistinctCount', @value = N'false', @level0type = N'SCHEMA', @level0name = N'RBM', @level1type = N'TABLE', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'ActualValue';




GO
EXECUTE sp_addextendedproperty @name = N'MeasureCount', @value = N'IndicatorValuesCount', @level0type = N'SCHEMA', @level0name = N'RBM', @level1type = N'TABLE', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'ActualValue';






GO
EXECUTE sp_addextendedproperty @name = N'MeasureAverage', @value = N'IndicatorValuesAverage', @level0type = N'SCHEMA', @level0name = N'RBM', @level1type = N'TABLE', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'ActualValue';






GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'RBM', @level1type = N'TABLE', @level1name = N'IndicatorValues', @level2type = N'COLUMN', @level2name = N'BusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'7', @level0type = N'SCHEMA', @level0name = N'RBM', @level1type = N'TABLE', @level1name = N'IndicatorValues';


GO
EXECUTE sp_addextendedproperty @name = N'AdditionalProperties03', @value = N'EXEC sys.sp_addextendedproperty @name=N''AdditionalRelationship04'', @value=N''IndicatorByProject[IndicatorBusinessKey]'' , @level0type=N''SCHEMA'',@level0name=N''OLAP_GEN'', @level1type=N''VIEW'', @level1name=N''IndicatorValues'', @level2type=N''COLUMN'',@level2name=N''HierarchyBusinessKey''
', @level0type = N'SCHEMA', @level0name = N'RBM', @level1type = N'TABLE', @level1name = N'IndicatorValues';


GO
EXECUTE sp_addextendedproperty @name = N'AdditionalProperties02', @value = N'EXEC sys.sp_addextendedproperty @name=N''AdditionalRelationship03'', @value=N''IndicatorBySector[IndicatorBusinessKey]'' , @level0type=N''SCHEMA'', @level0name=N''OLAP_GEN'', @level1type=N''VIEW'', @level1name=N''IndicatorValues'', @level2type=N''COLUMN'',@level2name=N''HierarchyBusinessKey''', @level0type = N'SCHEMA', @level0name = N'RBM', @level1type = N'TABLE', @level1name = N'IndicatorValues';


GO
EXECUTE sp_addextendedproperty @name = N'AdditionalProperties', @value = N'EXEC sys.sp_addextendedproperty @name=N''AdditionalRelationship'', @value=N''IndicatorByProjectSector[IndicatorBusinessKey]'' , @level0type=N''SCHEMA'',@level0name=N''OLAP_GEN'', @level1type=N''VIEW'',@level1name=N''IndicatorValues'', @level2type=N''COLUMN'',@level2name=N''HierarchyBusinessKey''', @level0type = N'SCHEMA', @level0name = N'RBM', @level1type = N'TABLE', @level1name = N'IndicatorValues';


GO
EXECUTE sp_addextendedproperty @name = N'AdditionalJoin01', @value = N'LEFT JOIN app.Indicator I
	ON [IndicatorValues].Indicator_ID = I.IndicatorID
', @level0type = N'SCHEMA', @level0name = N'RBM', @level1type = N'TABLE', @level1name = N'IndicatorValues';


GO
EXECUTE sp_addextendedproperty @name = N'AdditionalField01', @value = N'I.BusinessKey as HierarchyBusinessKey', @level0type = N'SCHEMA', @level0name = N'RBM', @level1type = N'TABLE', @level1name = N'IndicatorValues';

