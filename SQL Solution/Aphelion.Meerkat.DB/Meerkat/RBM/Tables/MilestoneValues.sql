CREATE TABLE [RBM].[MilestoneValues] (
    [MilestoneValues_ID]  INT              IDENTITY (1, 1) NOT NULL,
    [Milestone_ID]        INT              NOT NULL,
    [ActualLabel]         VARCHAR (50)     NOT NULL,
    [ActualValue]         DECIMAL (20, 5)  NULL,
    [ActualDate]          DATE             NULL,
    [BusinessKey]         NVARCHAR (400)   NOT NULL,
    [Notes]               VARCHAR (MAX)    NULL,
    [DataVersion_ID]      INT              NOT NULL,
    [Location_ID]         INT              NOT NULL,
    [ReportPeriodID]      INT              NOT NULL,
    [Organization_ID]     INT              NULL,
    [Active]              INT              CONSTRAINT [DF_MilestoneValues_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]       VARCHAR (255)    CONSTRAINT [DF_MilestoneValues_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]       DATETIME         CONSTRAINT [DF_MilestoneValues_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]      VARCHAR (255)    CONSTRAINT [DF_MilestoneValues_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]      DATETIME         CONSTRAINT [DF_MilestoneValues_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [MilestoneValueGroup] UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [GroupVersion]        INT              CONSTRAINT [DF_MilestoneValues_GroupVersion] DEFAULT ((0)) NOT NULL,
    [AgeBand_ID]          INT              NULL,
    [CommunityType_ID]    INT              NULL,
    [Donor_ID]            INT              NULL,
    [Framework_ID]        INT              NULL,
    [Gender_ID]           INT              NULL,
    [Group_ID]            INT              NULL,
    [Institution_ID]      INT              NULL,
    [ResultArea_ID]       INT              NULL,
    [StrategicElement_ID] INT              NULL,
    CONSTRAINT [PK_MilestoneValues] PRIMARY KEY CLUSTERED ([MilestoneValues_ID] ASC),
    CONSTRAINT [FK_MilestoneValues_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_MilestoneValues_AgeBand] FOREIGN KEY ([AgeBand_ID]) REFERENCES [disagg].[AgeBand] ([AgeBand_ID]),
    CONSTRAINT [FK_MilestoneValues_CommunityType] FOREIGN KEY ([CommunityType_ID]) REFERENCES [disagg].[CommunityType] ([CommunityType_ID]),
    CONSTRAINT [FK_MilestoneValues_DataVersion] FOREIGN KEY ([DataVersion_ID]) REFERENCES [Core].[DataVersion] ([DataVersion_ID]),
    CONSTRAINT [FK_MilestoneValues_Donor] FOREIGN KEY ([Donor_ID]) REFERENCES [disagg].[Donor] ([Donor_ID]),
    CONSTRAINT [FK_MilestoneValues_Framework] FOREIGN KEY ([Framework_ID]) REFERENCES [disagg].[Framework] ([Framework_ID]),
    CONSTRAINT [FK_MilestoneValues_Gender] FOREIGN KEY ([Gender_ID]) REFERENCES [disagg].[Gender] ([Gender_ID]),
    CONSTRAINT [FK_MilestoneValues_Group] FOREIGN KEY ([Group_ID]) REFERENCES [disagg].[Group] ([Group_ID]),
    CONSTRAINT [FK_MilestoneValues_Institution] FOREIGN KEY ([Institution_ID]) REFERENCES [disagg].[Institution] ([Institution_ID]),
    CONSTRAINT [FK_MilestoneValues_Location] FOREIGN KEY ([Location_ID]) REFERENCES [Core].[Location] ([Location_ID]),
    CONSTRAINT [FK_MilestoneValues_Milestone] FOREIGN KEY ([Milestone_ID]) REFERENCES [app].[Milestone] ([MilestoneID]),
    CONSTRAINT [FK_MilestoneValues_Organization] FOREIGN KEY ([Organization_ID]) REFERENCES [Core].[Organization] ([Organization_ID]),
    CONSTRAINT [FK_MilestoneValues_ReportingPeriod] FOREIGN KEY ([ReportPeriodID]) REFERENCES [Core].[ReportingPeriod] ([ID]),
    CONSTRAINT [FK_MilestoneValues_ResultArea] FOREIGN KEY ([ResultArea_ID]) REFERENCES [disagg].[ResultArea] ([ResultArea_ID]),
    CONSTRAINT [FK_MilestoneValues_StrategicElement] FOREIGN KEY ([StrategicElement_ID]) REFERENCES [disagg].[StrategicElement] ([StrategicElement_ID]),
    CONSTRAINT [UQ_IDS_MS] UNIQUE NONCLUSTERED ([Milestone_ID] ASC, [Location_ID] ASC, [ReportPeriodID] ASC, [DataVersion_ID] ASC, [Organization_ID] ASC)
);
























GO
EXECUTE sp_addextendedproperty @name = N'MeasureSum', @value = N'true', @level0type = N'SCHEMA', @level0name = N'RBM', @level1type = N'TABLE', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'ActualValue';


GO
EXECUTE sp_addextendedproperty @name = N'MeasureMin', @value = N'true', @level0type = N'SCHEMA', @level0name = N'RBM', @level1type = N'TABLE', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'ActualValue';


GO
EXECUTE sp_addextendedproperty @name = N'MeasureMax', @value = N'true', @level0type = N'SCHEMA', @level0name = N'RBM', @level1type = N'TABLE', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'ActualValue';


GO
EXECUTE sp_addextendedproperty @name = N'MeasureDistinctCount', @value = N'false', @level0type = N'SCHEMA', @level0name = N'RBM', @level1type = N'TABLE', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'ActualValue';


GO
EXECUTE sp_addextendedproperty @name = N'MeasureCount', @value = N'true', @level0type = N'SCHEMA', @level0name = N'RBM', @level1type = N'TABLE', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'ActualValue';


GO
EXECUTE sp_addextendedproperty @name = N'MeasureAverage', @value = N'true', @level0type = N'SCHEMA', @level0name = N'RBM', @level1type = N'TABLE', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'ActualValue';


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_MilestoneValues_BusinessKey]
    ON [RBM].[MilestoneValues]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'RBM', @level1type = N'TABLE', @level1name = N'MilestoneValues', @level2type = N'COLUMN', @level2name = N'BusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'7', @level0type = N'SCHEMA', @level0name = N'RBM', @level1type = N'TABLE', @level1name = N'MilestoneValues';


GO


