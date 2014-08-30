CREATE TABLE [Errors].[Age] (
    [QueueID]         INT           NOT NULL,
    [SSISErrorCode]   INT           NOT NULL,
    [SSISErrorColumn] INT           NOT NULL,
    [PackageName]     VARCHAR (255) NOT NULL,
    [ErrorType]       VARCHAR (255) NOT NULL,
    [Age_ID]          INT           NULL
);

