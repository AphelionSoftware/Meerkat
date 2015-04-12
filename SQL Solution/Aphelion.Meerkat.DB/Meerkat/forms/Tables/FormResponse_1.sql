CREATE TABLE [forms].[FormResponse] (
    [FormResponse_ID]    INT           IDENTITY (1, 1) NOT NULL,
    [Text]               VARCHAR (MAX) NULL,
    [TrueFalse]          BIT           NULL,
    [isConfidential]     BIT           NULL,
    [Form_ID]            INT           NOT NULL,
    [Location_ID]        INT           NULL,
    [ProjectID]          INT           CONSTRAINT [DF_FormResponse_ProjectID] DEFAULT ((1)) NOT NULL,
    [Active]             INT           CONSTRAINT [DF__FormResponse_sys_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]      VARCHAR (255) CONSTRAINT [DF_FormResponse_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]      DATETIME      CONSTRAINT [DF_FormResponse_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]     VARCHAR (255) CONSTRAINT [DF_FormResponse_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]     DATETIME      CONSTRAINT [DF_FormResponse_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [isComplete]         BIT           CONSTRAINT [DF_FormResponse_isComplete] DEFAULT ((0)) NOT NULL,
    [FormResponse_FNVID] BIGINT        CONSTRAINT [DF__FormRespo__FormR__7C055DC1] DEFAULT ((0)) NOT NULL,
    [Age_ID]             INT           NULL,
    [AgeBand_ID]         INT           NULL,
    [CommunityType_ID]   INT           NULL,
    [Gender_ID]          INT           NULL,
    [Group_ID]           INT           NULL,
    [Institution_ID]     INT           NULL,
    [ReportingPeriod_ID] INT           CONSTRAINT [DF_FormResponse_ReportingPeriod_ID] DEFAULT ((96)) NOT NULL,
    [Organization_ID]    INT           NULL,
    CONSTRAINT [PK_FormResponse_3] PRIMARY KEY CLUSTERED ([FormResponse_ID] ASC),
    CONSTRAINT [FK_FormResponse_Age] FOREIGN KEY ([Age_ID]) REFERENCES [disagg].[Age] ([Age_ID]),
    CONSTRAINT [FK_FormResponse_AgeBand] FOREIGN KEY ([AgeBand_ID]) REFERENCES [disagg].[AgeBand] ([AgeBand_ID]),
    CONSTRAINT [FK_FormResponse_CommunityType] FOREIGN KEY ([CommunityType_ID]) REFERENCES [disagg].[CommunityType] ([CommunityType_ID]),
    CONSTRAINT [FK_FormResponse_Form] FOREIGN KEY ([Form_ID]) REFERENCES [forms].[Form] ([Form_ID]),
    CONSTRAINT [FK_FormResponse_Gender] FOREIGN KEY ([Gender_ID]) REFERENCES [disagg].[Gender] ([Gender_ID]),
    CONSTRAINT [FK_FormResponse_Group] FOREIGN KEY ([Group_ID]) REFERENCES [disagg].[Group] ([Group_ID]),
    CONSTRAINT [FK_FormResponse_Institution] FOREIGN KEY ([Institution_ID]) REFERENCES [disagg].[Institution] ([Institution_ID]),
    CONSTRAINT [FK_FormResponse_Location] FOREIGN KEY ([Location_ID]) REFERENCES [Core].[Location] ([Location_ID]),
    CONSTRAINT [FK_FormResponse_Organization] FOREIGN KEY ([Organization_ID]) REFERENCES [Core].[Organization] ([Organization_ID]),
    CONSTRAINT [FK_FormResponse_Project] FOREIGN KEY ([ProjectID]) REFERENCES [app].[Project] ([ProjectID]),
    CONSTRAINT [FK_FormResponse_ReportingPeriod] FOREIGN KEY ([ReportingPeriod_ID]) REFERENCES [Core].[ReportingPeriod] ([ID])
);


































GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'7', @level0type = N'SCHEMA', @level0name = N'forms', @level1type = N'TABLE', @level1name = N'FormResponse';


GO
CREATE NONCLUSTERED INDEX [IX_FormResponseIncomplete]
    ON [forms].[FormResponse]([isComplete] ASC, [FormResponse_ID] DESC, [Form_ID] ASC) WHERE ([isComplete]=(0));

