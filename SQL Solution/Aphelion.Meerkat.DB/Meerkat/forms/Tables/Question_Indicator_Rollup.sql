CREATE TABLE [forms].[Question_Indicator_Rollup] (
    [Question_Indicator_RollupID] INT           IDENTITY (1, 1) NOT NULL,
    [QuestionID]                  INT           NOT NULL,
    [IndicatorID]                 INT           NOT NULL,
    [Active]                      INT           CONSTRAINT [DF__Question_Indicator_Rollup_sys_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]               VARCHAR (255) CONSTRAINT [DF_Question_Indicator_Rollup_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]               DATETIME      CONSTRAINT [DF_Question_Indicator_Rollup_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]              VARCHAR (255) CONSTRAINT [DF_Question_Indicator_Rollup_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]              DATETIME      CONSTRAINT [DF_Question_Indicator_Rollup_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Question_Indicator_Rollup_3] PRIMARY KEY CLUSTERED ([Question_Indicator_RollupID] ASC),
    CONSTRAINT [FK_Question_Indicator_Rollup_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_Question_Indicator_Rollup_PotentialQuestion_Indicator_Rollup] FOREIGN KEY ([IndicatorID]) REFERENCES [app].[Indicator] ([IndicatorID]),
    CONSTRAINT [FK_Question_Indicator_Rollup_Question] FOREIGN KEY ([QuestionID]) REFERENCES [forms].[Question] ([QuestionID])
);

