CREATE TABLE [forms].[Question_Project_Rollup] (
    [Question_Project_RollupID] INT           IDENTITY (1, 1) NOT NULL,
    [Question_ID]                 INT           NOT NULL,
    [Project_ID]                INT           NOT NULL,
    [RollupType_ID]               INT           NOT NULL,
    [Active]                      INT           CONSTRAINT [DF__Question_Project_Rollup_sys_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]               VARCHAR (255) CONSTRAINT [DF_Question_Project_Rollup_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]               DATETIME      CONSTRAINT [DF_Question_Project_Rollup_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]              VARCHAR (255) CONSTRAINT [DF_Question_Project_Rollup_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]              DATETIME      CONSTRAINT [DF_Question_Project_Rollup_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Question_Project_Rollup_3] PRIMARY KEY CLUSTERED ([Question_Project_RollupID] ASC),
    CONSTRAINT [FK_Question_Project_Rollup_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_Question_Project_Rollup_PotentialQuestion_Project_Rollup] FOREIGN KEY ([Project_ID]) REFERENCES [app].[Project] ([ProjectID]),
    CONSTRAINT [FK_Question_Project_Rollup_Question] FOREIGN KEY ([Question_ID]) REFERENCES [forms].[Question] ([Question_ID]),
    CONSTRAINT [FK_Question_Project_Rollup_RollupType] FOREIGN KEY ([RollupType_ID]) REFERENCES [forms].[RollupType] ([RollupType_ID])
);





