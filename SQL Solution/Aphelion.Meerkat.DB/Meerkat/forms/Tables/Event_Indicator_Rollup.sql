CREATE TABLE [forms].[Event_Indicator_Rollup] (
    [Event_Indicator_RollupID] INT           IDENTITY (1, 1) NOT NULL,
    [Event_ID]                 INT           NOT NULL,
    [Indicator_ID]             INT           NOT NULL,
    [Active]                   INT           CONSTRAINT [DF__Event_Indicator_Rollup_sys_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]            VARCHAR (255) CONSTRAINT [DF_Event_Indicator_Rollup_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]            DATETIME      CONSTRAINT [DF_Event_Indicator_Rollup_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]           VARCHAR (255) CONSTRAINT [DF_Event_Indicator_Rollup_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]           DATETIME      CONSTRAINT [DF_Event_Indicator_Rollup_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Event_Indicator_Rollup_3] PRIMARY KEY CLUSTERED ([Event_Indicator_RollupID] ASC),
    CONSTRAINT [FK_Event_Indicator_Rollup_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_Event_Indicator_Rollup_Event] FOREIGN KEY ([Event_ID]) REFERENCES [forms].[Event] ([Event_ID]),
    CONSTRAINT [FK_Event_Indicator_Rollup_PotentialEvent_Indicator_Rollup] FOREIGN KEY ([Indicator_ID]) REFERENCES [app].[Indicator] ([IndicatorID])
);






GO


