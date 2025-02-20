﻿CREATE TABLE [app].[Output] (
    [Output_ID]       INT            IDENTITY (1, 1) NOT NULL,
    [Code]            NVARCHAR (20)  NOT NULL,
    [LongName]        NVARCHAR (500) NOT NULL,
    [BusinessKey]     NVARCHAR (MAX) NULL,
    [OutcomeID]       INT            NULL,
    [ShortName]       VARCHAR (50)   NOT NULL,
    [TextDescription] VARCHAR (MAX)  NULL,
    [Active]          INT            DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]   VARCHAR (255)  CONSTRAINT [DF_Output_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]   DATETIME       CONSTRAINT [DF_Output_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  VARCHAR (255)  CONSTRAINT [DF_Output_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]  DATETIME       CONSTRAINT [DF_Output_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Output_] PRIMARY KEY CLUSTERED ([Output_ID] ASC),
    CONSTRAINT [FK_Output_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_Output_Outcome] FOREIGN KEY ([OutcomeID]) REFERENCES [app].[Outcome] ([OutcomeID]),
    UNIQUE NONCLUSTERED ([ShortName] ASC)
);



