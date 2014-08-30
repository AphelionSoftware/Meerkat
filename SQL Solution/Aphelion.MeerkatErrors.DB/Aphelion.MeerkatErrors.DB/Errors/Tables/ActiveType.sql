CREATE TABLE [Errors].[ActiveType] (
    [QueueID]         INT            NOT NULL,
    [SSISErrorCode]   INT            NOT NULL,
    [SSISErrorColumn] INT            NOT NULL,
    [PackageName]     VARCHAR (255)  NOT NULL,
    [ErrorType]       VARCHAR (255)  NOT NULL,
    [Code]            VARCHAR (50)   NOT NULL,
    [ID]              INT            NOT NULL,
    [LocalName]       NVARCHAR (255) NULL,
    [Name]            VARCHAR (255)  NULL
);

