CREATE TABLE [Core].[ReportingPeriod] (
    [ID]              INT            IDENTITY (1, 1) NOT NULL,
    [ReportingPeriod] INT            NOT NULL,
    [StartDateID]     INT            NOT NULL,
    [EndDateID]       INT            NOT NULL,
    [FirstCycleDate]  DATETIME       NOT NULL,
    [LastCycleDate]   DATETIME       NOT NULL,
    [YearName]        CHAR (4)       NOT NULL,
    [YearNumber]      INT            NOT NULL,
    [BusinessKey]     NVARCHAR (400) NOT NULL,
    [Active]          INT            CONSTRAINT [DF_ReportingPeriod_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]   VARCHAR (255)  CONSTRAINT [DF_ReportingPeriod_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]   DATETIME       CONSTRAINT [DF_ReportingPeriod_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  VARCHAR (255)  CONSTRAINT [DF_ReportingPeriod_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]  DATETIME       CONSTRAINT [DF_ReportingPeriod_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [Summary]         VARCHAR (50)   NOT NULL,
    [LocalYearName]   NVARCHAR (4)   NULL,
    [Export]          BIT            DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_ReportingPeriod] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ReportingPeriod_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    UNIQUE NONCLUSTERED ([EndDateID] ASC),
    UNIQUE NONCLUSTERED ([StartDateID] ASC)
);














GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'Core', @level1type = N'TABLE', @level1name = N'ReportingPeriod', @level2type = N'COLUMN', @level2name = N'BusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'1', @level0type = N'SCHEMA', @level0name = N'Core', @level1type = N'TABLE', @level1name = N'ReportingPeriod';


GO
EXECUTE sp_addextendedproperty @name = N'ExcludeFromStaging', @value = N'true', @level0type = N'SCHEMA', @level0name = N'Core', @level1type = N'TABLE', @level1name = N'ReportingPeriod', @level2type = N'COLUMN', @level2name = N'Export';

