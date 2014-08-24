CREATE TABLE [forms].[Question_Indicator_Rollup] (
    [Question_Indicator_RollupID] INT           IDENTITY (1, 1) NOT NULL,
    [Question_ID]                 INT           NOT NULL,
    [Indicator_ID]                INT           NOT NULL,
    [RollupType_ID]               INT           NOT NULL,
    [Active]                      INT           CONSTRAINT [DF__Question_Indicator_Rollup_sys_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]               VARCHAR (255) CONSTRAINT [DF_Question_Indicator_Rollup_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]               DATETIME      CONSTRAINT [DF_Question_Indicator_Rollup_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]              VARCHAR (255) CONSTRAINT [DF_Question_Indicator_Rollup_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]              DATETIME      CONSTRAINT [DF_Question_Indicator_Rollup_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [Export]                      BIT           NOT NULL,
    CONSTRAINT [PK_Question_Indicator_Rollup_3] PRIMARY KEY CLUSTERED ([Question_Indicator_RollupID] ASC),
    CONSTRAINT [FK_Question_Indicator_Rollup_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_Question_Indicator_Rollup_PotentialQuestion_Indicator_Rollup] FOREIGN KEY ([Indicator_ID]) REFERENCES [app].[Indicator] ([IndicatorID]),
    CONSTRAINT [FK_Question_Indicator_Rollup_Question] FOREIGN KEY ([Question_ID]) REFERENCES [forms].[Question] ([Question_ID]),
    CONSTRAINT [FK_Question_Indicator_Rollup_RollupType] FOREIGN KEY ([RollupType_ID]) REFERENCES [forms].[RollupType] ([RollupType_ID])
);










GO
EXECUTE sp_addextendedproperty @name = N'ExcludeFromStaging', @value = N'true', @level0type = N'SCHEMA', @level0name = N'forms', @level1type = N'TABLE', @level1name = N'Question_Indicator_Rollup', @level2type = N'COLUMN', @level2name = N'Export';

