CREATE TABLE [app].[OutcomeOrganization] (
    [OutcomeOrganization_ID] INT           IDENTITY (1, 1) NOT NULL,
    [Organization_ID]        INT           NULL,
    [Outcome_ID]              INT           NULL,
    [Active]                 INT           CONSTRAINT [DF_OutcomeOrganization_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]          VARCHAR (255) CONSTRAINT [DF_OutcomeOrganization_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]          DATETIME      CONSTRAINT [DF_OutcomeOrganization_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]         VARCHAR (255) CONSTRAINT [DF_OutcomeOrganization_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]         DATETIME      CONSTRAINT [DF_OutcomeOrganization_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_OutcomeOrganization] PRIMARY KEY CLUSTERED ([OutcomeOrganization_ID] ASC),
    CONSTRAINT [FK_OutcomeOrganization_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_OutcomeOrganization_Organization] FOREIGN KEY ([Organization_ID]) REFERENCES [Core].[Organization] ([Organization_ID]),
    CONSTRAINT [FK_OutcomeOrganization_Outcome] FOREIGN KEY ([Outcome_ID]) REFERENCES [app].[Outcome] ([Outcome_ID])
);

