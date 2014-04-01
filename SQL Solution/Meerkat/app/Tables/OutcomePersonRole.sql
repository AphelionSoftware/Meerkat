CREATE TABLE [app].[OutcomePersonRole] (
    [OutcomePersonRole_ID] INT              IDENTITY (1, 1) NOT NULL,
    [Outcome_ID]            INT              NULL,
    [Person_ID]            INT              NULL,
    [Role_ID]              INT              NULL,
    [Active]               INT              CONSTRAINT [DF_OutcomePersonRole_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]        VARCHAR (255)    CONSTRAINT [DF_OutcomePersonRole_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]        DATETIME         CONSTRAINT [DF_OutcomePersonRole_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]       VARCHAR (255)    CONSTRAINT [DF_OutcomePersonRole_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]       DATETIME         CONSTRAINT [DF_OutcomePersonRole_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_OutcomePersonRole] PRIMARY KEY CLUSTERED ([OutcomePersonRole_ID] ASC),
    CONSTRAINT [FK_OutcomePersonRole_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_OutcomePersonRole_Outcome] FOREIGN KEY ([Outcome_ID]) REFERENCES [app].[Outcome] ([Outcome_ID])
);

