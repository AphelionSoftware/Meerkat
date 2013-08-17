﻿CREATE TABLE [app].[Outcome] (
    [OutcomeID]       INT            IDENTITY (1, 1) NOT NULL,
    [Code]             VARCHAR (50)  NOT NULL,
    [LongName]        NVARCHAR (500) NOT NULL,
    [BusinessKey]     NVARCHAR (MAX) NOT NULL,
    [ShortName]       NVARCHAR (50)  NOT NULL,
    [TextDescription] NVARCHAR (MAX) NULL,
	[OutcomeSitename] NVARCHAR (50)  NULL,
	[DataVersion]     INT			 NOT NULL DEFAULT ((0)),
    [Active]          INT            CONSTRAINT [DF__Outcome__sys_Act__075714DC] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]   VARCHAR (255)  CONSTRAINT [DF_Outcome_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]   DATETIME       CONSTRAINT [DF_Outcome_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  VARCHAR (255)  CONSTRAINT [DF_Outcome_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]  DATETIME       CONSTRAINT [DF_Outcome_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Outcome_1] PRIMARY KEY CLUSTERED ([OutcomeID] ASC),
    CONSTRAINT [FK_Outcome_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
	CONSTRAINT [FK_Outcome_DataVersion] FOREIGN KEY ([DataVersion]) REFERENCES [Core].[DataVersion] (DataVersion_ID)
);

