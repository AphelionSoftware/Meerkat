﻿CREATE TABLE [app].[MilestoneType] (
    [MilestoneTypeID] INT           IDENTITY (1, 1) NOT NULL,
    [Code]            VARCHAR (50)  NOT NULL,
    [Name]            VARCHAR (255) NOT NULL,
    [Active]          INT           CONSTRAINT [DF__Milestone__sys_A__22401542] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]   VARCHAR (255) CONSTRAINT [DF_MilestoneType_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]   DATETIME      CONSTRAINT [DF_MilestoneType_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  VARCHAR (255) CONSTRAINT [DF_MilestoneType_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]  DATETIME      CONSTRAINT [DF_MilestoneType_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_MilestoneType] PRIMARY KEY CLUSTERED ([MilestoneTypeID] ASC),
    CONSTRAINT [FK_MilestoneType_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    UNIQUE NONCLUSTERED ([Code] ASC)
);
