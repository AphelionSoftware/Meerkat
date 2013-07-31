CREATE TABLE [Core].[ReportingPeriod] (
    [ID]              INT           IDENTITY (1, 1) NOT NULL,
    [ReportingPeriod] INT           NOT NULL,
    [StartDateID]     INT           NOT NULL,
    [EndDateID]       INT           NOT NULL,
    [FirstCycleDate]  DATETIME      NOT NULL,
    [LastCycleDate]   DATETIME      NOT NULL,
    [YearName]        CHAR (4)      NOT NULL,
    [YearNumber]      INT           NOT NULL,
    [Active]          INT           DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]   VARCHAR (255) CONSTRAINT [DF_ReportingPeriod_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]   DATETIME      CONSTRAINT [DF_ReportingPeriod_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  VARCHAR (255) CONSTRAINT [DF_ReportingPeriod_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]  DATETIME      CONSTRAINT [DF_ReportingPeriod_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ReportingPeriod] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ReportingPeriod_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID])
);

