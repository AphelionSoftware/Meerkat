CREATE TABLE [Staging].[ReportingPeriod] (
    [BusinessKey]     NVARCHAR (400) NOT NULL,
    [EndDateID]       INT            NOT NULL,
    [FirstCycleDate]  DATETIME       NOT NULL,
    [ID]              INT            NOT NULL,
    [LastCycleDate]   DATETIME       NOT NULL,
    [ReportingPeriod] INT            NOT NULL,
    [StartDateID]     INT            NOT NULL,
    [Summary]         VARCHAR (50)   NOT NULL,
    [YearName]        CHAR (4)       NOT NULL,
    [YearNumber]      INT            NOT NULL
);



