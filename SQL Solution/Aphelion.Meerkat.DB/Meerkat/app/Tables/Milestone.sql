﻿CREATE TABLE [app].[Milestone] (
    [MilestoneID]     INT             IDENTITY (1, 1) NOT NULL,
    [LongName]        VARCHAR (500)   NOT NULL,
    [TextDescription] VARCHAR (MAX)   NULL,
    [Baseline]        DECIMAL (20, 5) NULL,
    [BaselineString]  VARCHAR (MAX)   NULL,
    [BaselineDate]    DATETIME        NOT NULL,
    [Target]          DECIMAL (20, 5) NULL,
    [TargetString]    VARCHAR (MAX)   NULL,
    [TargetDate]      DATETIME        NOT NULL,
    [ReleaseDate]     DATE            NULL,
    [ReportingDate]   DATE            NULL,
    [ProjectID]       INT             NULL,
    [BusinessKey]     NVARCHAR (4000) NOT NULL,
    [Notes]           NVARCHAR (MAX)  NULL,
    [Code]            VARCHAR (50)    NOT NULL,
    [MilestoneTypeID] INT             NOT NULL,
    [Activity_ID]     INT             NULL,
    [ShortName]       VARCHAR (50)    NOT NULL,
    [BaselineDateID]  AS              (CONVERT([int],CONVERT([varchar](8),[BaselineDate],(112)))),
    [TargetDateID]    AS              (CONVERT([int],CONVERT([varchar](8),[TargetDate],(112)))),
    [UnitOfMeasure]   VARCHAR (50)    NOT NULL,
    [Active]          INT             CONSTRAINT [DF_Milestone_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]   VARCHAR (255)   CONSTRAINT [DF_Milestone_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]   DATETIME        CONSTRAINT [DF_Milestone_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  VARCHAR (255)   CONSTRAINT [DF_Milestone_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]  DATETIME        CONSTRAINT [DF_Milestone_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Milestone] PRIMARY KEY CLUSTERED ([MilestoneID] ASC),
    CONSTRAINT [FK_Milestone_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_Milestone_Activity] FOREIGN KEY ([Activity_ID]) REFERENCES [app].[Activity] ([Activity_ID]),
    CONSTRAINT [FK_Milestone_MilestoneType] FOREIGN KEY ([MilestoneTypeID]) REFERENCES [app].[MilestoneType] ([MilestoneTypeID]),
    CONSTRAINT [FK_Milestone_Project] FOREIGN KEY ([ProjectID]) REFERENCES [app].[Project] ([ProjectID]),
    CONSTRAINT [UQ_Milestone_Code] UNIQUE NONCLUSTERED ([Code] ASC)
);






GO
EXECUTE sp_addextendedproperty @name = N'CoalesceFieldsInView', @value = N'True', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Milestone';
GO
EXECUTE sp_addextendedproperty @name = N'CoalesceFieldsInView', @value = N'True', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Milestone';

