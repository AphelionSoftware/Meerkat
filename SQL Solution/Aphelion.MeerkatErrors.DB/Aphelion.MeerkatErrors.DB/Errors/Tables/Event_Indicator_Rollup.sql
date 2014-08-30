CREATE TABLE [Errors].[Event_Indicator_Rollup] (
    [QueueID]                  INT            NOT NULL,
    [SSISErrorCode]            INT            NOT NULL,
    [SSISErrorColumn]          INT            NOT NULL,
    [PackageName]              VARCHAR (255)  NOT NULL,
    [ErrorType]                VARCHAR (255)  NOT NULL,
    [Event_Indicator_RollupID] INT            NULL,
    [Event_ID]                 INT            NOT NULL,
    [IndicatorBusinessKey]     NVARCHAR (400) NOT NULL,
    [Indicator_ID]             INT            NULL
);

