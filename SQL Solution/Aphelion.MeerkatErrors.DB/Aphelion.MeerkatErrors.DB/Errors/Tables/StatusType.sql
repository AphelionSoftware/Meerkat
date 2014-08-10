CREATE TABLE [Errors].[StatusType] (
    [QueueID]         INT             NOT NULL,
    [SSISErrorCode]   INT             NOT NULL,
    [SSISErrorColumn] INT             NOT NULL,
    [PackageName]     VARCHAR (255)   NOT NULL,
    [ErrorType]       VARCHAR (255)   NOT NULL,
    [BusinessKey]     NVARCHAR (400)  NOT NULL,
    [Code]            VARCHAR (50)    NOT NULL,
    [ID]              INT             NOT NULL,
    [Name]            VARCHAR (255)   NOT NULL,
    [Value]           DECIMAL (20, 2) NOT NULL
);

