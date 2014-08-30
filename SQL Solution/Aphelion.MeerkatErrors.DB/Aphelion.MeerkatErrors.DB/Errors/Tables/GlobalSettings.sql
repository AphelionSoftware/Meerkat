CREATE TABLE [Errors].[GlobalSettings] (
    [QueueID]           INT            NOT NULL,
    [SSISErrorCode]     INT            NOT NULL,
    [SSISErrorColumn]   INT            NOT NULL,
    [PackageName]       VARCHAR (255)  NOT NULL,
    [ErrorType]         VARCHAR (255)  NOT NULL,
    [GlobalSettings_ID] INT            NULL,
    [Code]              VARCHAR (50)   NOT NULL,
    [Name]              VARCHAR (255)  NOT NULL,
    [Value]             VARCHAR (8000) NOT NULL
);

