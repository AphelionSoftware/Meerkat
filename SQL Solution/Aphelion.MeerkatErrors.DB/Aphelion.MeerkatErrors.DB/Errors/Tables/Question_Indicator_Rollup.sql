CREATE TABLE [Errors].[Question_Indicator_Rollup] (
    [QueueID]                     INT            NOT NULL,
    [SSISErrorCode]               INT            NOT NULL,
    [SSISErrorColumn]             INT            NOT NULL,
    [PackageName]                 VARCHAR (255)  NOT NULL,
    [ErrorType]                   VARCHAR (255)  NOT NULL,
    [Question_Indicator_RollupID] INT            NULL,
    [IndicatorBusinessKey]        NVARCHAR (400) NOT NULL,
    [Question_ID]                 INT            NOT NULL,
    [RollupType_ID]               INT            NOT NULL,
    [Indicator_ID]                INT            NULL
);

