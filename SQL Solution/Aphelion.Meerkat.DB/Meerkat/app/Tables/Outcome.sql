﻿CREATE TABLE [app].[Outcome] (
    [Outcome_ID]       INT            IDENTITY (1, 1) NOT NULL,
    [Impact_ID]       INT            NULL,
    [Code]            VARCHAR (50)   NOT NULL,
    [LongName]        NVARCHAR (500) NOT NULL,
    [BusinessKey]     NVARCHAR (4000) NOT NULL,
    [ShortName]       NVARCHAR (50)  NOT NULL,
    [TextDescription] NVARCHAR (MAX) NULL,
    [OutcomeSiteName] NVARCHAR (50)  NULL,
    [DataVersion]     INT            DEFAULT ((0)) NOT NULL,
    [Active]          INT            CONSTRAINT [DF_Outcome_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]   VARCHAR (255)  CONSTRAINT [DF_Outcome_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]   DATETIME       CONSTRAINT [DF_Outcome_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  VARCHAR (255)  CONSTRAINT [DF_Outcome_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]  DATETIME       CONSTRAINT [DF_Outcome_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Outcome] PRIMARY KEY CLUSTERED ([Outcome_ID] ASC),
    CONSTRAINT [FK_Outcome_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_OutCome_DataVersion] FOREIGN KEY ([DataVersion]) REFERENCES [Core].[DataVersion] ([DataVersion_ID]),
    CONSTRAINT [FK_OutCome_Impact] FOREIGN KEY ([Impact_ID]) REFERENCES [App].[Impact] ([Impact_ID]),
    CONSTRAINT [UQ_OutCome_Code]UNIQUE NONCLUSTERED ([Code] ASC)
);


