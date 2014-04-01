﻿CREATE TABLE [RBM].[MilestoneValues] (
    [MilestoneValues_ID] INT             IDENTITY (1, 1) NOT NULL,
    [Milestone_ID]       INT             NOT NULL,
    [ActualLabel]        VARCHAR (50)    NOT NULL,
    [ActualValue]        DECIMAL (20, 5) NULL,
    [ActualDate]         DATE            NULL,
    [BusinessKey]        VARCHAR (MAX)   NULL,
    [Notes]              VARCHAR (MAX)   NULL,
    [DataVersion_ID]     INT             NOT NULL,
    [Location_ID]        INT             NOT NULL,
    [ReportPeriodID]     INT             NOT NULL,
    [Organization_ID]    INT             NULL,
    [Active]             INT             CONSTRAINT [DF_MilestoneValues_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]      VARCHAR (255)   CONSTRAINT [DF_MilestoneValues_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]      DATETIME        CONSTRAINT [DF_MilestoneValues_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]     VARCHAR (255)   CONSTRAINT [DF_MilestoneValues_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]     DATETIME        CONSTRAINT [DF_MilestoneValues_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [MilestoneValueGroup] UNIQUEIDENTIFIER NOT NULL DEFAULT (newid()), 
    [GroupVersion] INT NOT NULL CONSTRAINT [DF_MilestoneValues_GroupVersion]  DEFAULT ((0)), 
    CONSTRAINT [PK_MilestoneValues] PRIMARY KEY CLUSTERED ([MilestoneValues_ID] ASC),
    CONSTRAINT [FK_MilestoneValues_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_MilestoneValues_DataVersion] FOREIGN KEY ([DataVersion_ID]) REFERENCES [Core].[DataVersion] ([DataVersion_ID]),
    CONSTRAINT [FK_MilestoneValues_Location] FOREIGN KEY ([Location_ID]) REFERENCES [Core].[Location] ([Location_ID]),
    CONSTRAINT [FK_MilestoneValues_Milestone] FOREIGN KEY ([Milestone_ID]) REFERENCES [app].[Milestone] ([MilestoneID]),
    CONSTRAINT [FK_MilestoneValues_Organization] FOREIGN KEY ([Organization_ID]) REFERENCES [Core].[Organization] ([Organization_ID]),
    CONSTRAINT [FK_MilestoneValues_ReportingPeriod] FOREIGN KEY ([ReportPeriodID]) REFERENCES [Core].[ReportingPeriod] ([ID]),
    CONSTRAINT [UQ_IDS_MS] UNIQUE NONCLUSTERED ([Milestone_ID] ASC, [Location_ID] ASC, [ReportPeriodID] ASC, [DataVersion_ID] ASC, [Organization_ID] ASC)
);



