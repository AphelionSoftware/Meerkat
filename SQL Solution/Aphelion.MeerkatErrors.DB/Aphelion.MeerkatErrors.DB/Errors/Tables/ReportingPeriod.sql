CREATE TABLE [Errors].[ReportingPeriod] (
    [QueueID]         INT            NOT NULL,
    [SSISErrorCode]   INT            NOT NULL,
    [SSISErrorColumn] INT            NOT NULL,
    [PackageName]     VARCHAR (255)  NOT NULL,
    [ErrorType]       VARCHAR (255)  NOT NULL,
    [BusinessKey]     NVARCHAR (400) NOT NULL,
    [EndDateID]       INT            NOT NULL,
    [FirstCycleDate]  DATETIME       NOT NULL,
    [ID]              INT            NOT NULL,
    [LastCycleDate]   DATETIME       NOT NULL,
    [LocalYearName]   NVARCHAR (4)   NULL,
    [ReportingPeriod] INT            NOT NULL,
    [StartDateID]     INT            NOT NULL,
    [Summary]         VARCHAR (50)   NOT NULL,
    [YearName]        CHAR (4)       NOT NULL,
    [YearNumber]      INT            NOT NULL
);



