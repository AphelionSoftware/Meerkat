CREATE TABLE [app].[Outcome] (
    [OutcomeID]       INT            IDENTITY (1, 1) NOT NULL,
    [Code]            NVARCHAR (20)  NOT NULL,
    [LongName]        NVARCHAR (500) NOT NULL,
    [BusinessKey]     NVARCHAR (MAX) NOT NULL,
    [ShortName]       NVARCHAR (50)  NOT NULL,
    [TextDescription] NVARCHAR (MAX) NULL,
    [Active]          INT            CONSTRAINT [DF__Outcome__sys_Act__075714DC] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]   VARCHAR (255)  CONSTRAINT [DF_Outcome_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]   DATETIME       CONSTRAINT [DF_Outcome_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  VARCHAR (255)  CONSTRAINT [DF_Outcome_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]  DATETIME       CONSTRAINT [DF_Outcome_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [OutcomeSiteName] NVARCHAR (50)  NULL,
    CONSTRAINT [PK_Outcome_1] PRIMARY KEY CLUSTERED ([OutcomeID] ASC),
    CONSTRAINT [FK_Outcome_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID])
);

