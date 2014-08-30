CREATE TABLE [Errors].[RollupType] (
    [QueueID]         INT            NOT NULL,
    [SSISErrorCode]   INT            NOT NULL,
    [SSISErrorColumn] INT            NOT NULL,
    [PackageName]     VARCHAR (255)  NOT NULL,
    [ErrorType]       VARCHAR (255)  NOT NULL,
    [RollupType_ID]   INT            NULL,
    [Code]            VARCHAR (50)   NOT NULL,
    [LocalName]       NVARCHAR (255) NULL,
    [Name]            VARCHAR (255)  NOT NULL,
    [TextDescription] VARCHAR (4000) NULL
);

