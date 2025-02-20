﻿CREATE TABLE [rpt].[CustomReport_Project] (
    [CustomReport_Project_ID] INT           IDENTITY (1, 1) NOT NULL,
    [CustomReport_ID]         INT           NULL,
    [ProjectID]              INT           NULL,
    [Active]                 INT           DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]          VARCHAR (255) CONSTRAINT [DF_CustomReport_Project_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]          DATETIME      CONSTRAINT [DF_CustomReport_Project_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]         VARCHAR (255) CONSTRAINT [DF_CustomReport_Project_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]         DATETIME      CONSTRAINT [DF_CustomReport_Project_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ProjectCustomReport] PRIMARY KEY CLUSTERED ([CustomReport_Project_ID] ASC),
    CONSTRAINT [FK_CustomReport_Project_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_CustomReport_Project_CustomReport] FOREIGN KEY ([CustomReport_ID]) REFERENCES [rpt].[CustomReport] ([CustomReport_ID]),
    CONSTRAINT [FK_CustomReport_Project_Project] FOREIGN KEY ([ProjectID]) REFERENCES [app].[Project] ([ProjectID])
);

