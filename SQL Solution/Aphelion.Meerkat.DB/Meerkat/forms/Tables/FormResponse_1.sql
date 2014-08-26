CREATE TABLE [forms].[FormResponse] (
    [FormResponse_ID]    INT           IDENTITY (1, 1) NOT NULL,
    [Text]               VARCHAR (MAX) NULL,
    [TrueFalse]          BIT           NULL,
    [isConfidential]     BIT           NULL,
    [Form_ID]            INT           NOT NULL,
    [Location_ID]        INT           NULL,
    [Active]             INT           CONSTRAINT [DF__FormResponse_sys_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]      VARCHAR (255) CONSTRAINT [DF_FormResponse_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]      DATETIME      CONSTRAINT [DF_FormResponse_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]     VARCHAR (255) CONSTRAINT [DF_FormResponse_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]     DATETIME      CONSTRAINT [DF_FormResponse_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [FormResponse_FNVID] BIGINT        DEFAULT ((0)) NOT NULL,
    [Age_ID]             INT           NULL,
    [AgeBand_ID]         INT           NULL,
    [CommunityType_ID]   INT           NULL,
    [Gender_ID]          INT           NULL,
    [Group_ID]           INT           NULL,
    [Institution_ID]     INT           NULL,
    CONSTRAINT [PK_FormResponse_3] PRIMARY KEY CLUSTERED ([FormResponse_ID] ASC),
    CONSTRAINT [FK_FormResponse_Age] FOREIGN KEY ([Age_ID]) REFERENCES [disagg].[Age] ([Age_ID]),
    CONSTRAINT [FK_FormResponse_AgeBand] FOREIGN KEY ([AgeBand_ID]) REFERENCES [disagg].[AgeBand] ([AgeBand_ID]),
    CONSTRAINT [FK_FormResponse_CommunityType] FOREIGN KEY ([CommunityType_ID]) REFERENCES [disagg].[CommunityType] ([CommunityType_ID]),
    CONSTRAINT [FK_FormResponse_Form] FOREIGN KEY ([Form_ID]) REFERENCES [forms].[Form] ([Form_ID]),
    CONSTRAINT [FK_FormResponse_Gender] FOREIGN KEY ([Gender_ID]) REFERENCES [disagg].[Gender] ([Gender_ID]),
    CONSTRAINT [FK_FormResponse_Group] FOREIGN KEY ([Group_ID]) REFERENCES [disagg].[Group] ([Group_ID]),
    CONSTRAINT [FK_FormResponse_Institution] FOREIGN KEY ([Institution_ID]) REFERENCES [disagg].[Institution] ([Institution_ID])
);
























GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'7', @level0type = N'SCHEMA', @level0name = N'forms', @level1type = N'TABLE', @level1name = N'FormResponse';


GO


