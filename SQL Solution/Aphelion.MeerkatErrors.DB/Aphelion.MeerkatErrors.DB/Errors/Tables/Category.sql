CREATE TABLE [Errors].[Category] (
    [QueueID]         INT            NOT NULL,
    [SSISErrorCode]   INT            NOT NULL,
    [SSISErrorColumn] INT            NOT NULL,
    [PackageName]     VARCHAR (255)  NOT NULL,
    [ErrorType]       VARCHAR (255)  NOT NULL,
    [Category_ID]     INT            NULL,
    [CategoryOrder]   INT            NOT NULL,
    [Code]            VARCHAR (50)   NOT NULL,
    [Form_ID]         INT            NOT NULL,
    [LocalName]       NVARCHAR (255) NULL,
    [Name]            VARCHAR (255)  NOT NULL,
    [TextDescription] VARCHAR (4000) NULL
);

