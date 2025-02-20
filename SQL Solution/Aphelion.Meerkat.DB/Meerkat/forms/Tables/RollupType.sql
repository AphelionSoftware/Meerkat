﻿CREATE TABLE [forms].[RollupType] (
    [RollupTypeID]    INT           IDENTITY (1, 1) NOT NULL,
    [Name]            VARCHAR (50)  NOT NULL,
    [Code]            VARCHAR (50)  NOT NULL,
    [TextDescription] VARCHAR (MAX) NOT NULL,
    [CategoryID]      INT           NOT NULL,
    [Active]          INT           CONSTRAINT [DF__RollupType_sys_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]   VARCHAR (255) CONSTRAINT [DF_RollupType_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]   DATETIME      CONSTRAINT [DF_RollupType_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  VARCHAR (255) CONSTRAINT [DF_RollupType_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]  DATETIME      CONSTRAINT [DF_RollupType_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_RollupType_3] PRIMARY KEY CLUSTERED ([RollupTypeID] ASC),
    CONSTRAINT [FK_RollupType_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_RollupType_Category] FOREIGN KEY ([CategoryID]) REFERENCES [forms].[Category] ([CategoryID]),
    CONSTRAINT [UQ__RollupType_Code] UNIQUE NONCLUSTERED ([Code] ASC)
);

