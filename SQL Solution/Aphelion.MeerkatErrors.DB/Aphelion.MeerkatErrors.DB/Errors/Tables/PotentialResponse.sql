CREATE TABLE [Errors].[PotentialResponse] (
    [QueueID]              INT            NOT NULL,
    [SSISErrorCode]        INT            NOT NULL,
    [SSISErrorColumn]      INT            NOT NULL,
    [PackageName]          VARCHAR (255)  NOT NULL,
    [ErrorType]            VARCHAR (255)  NOT NULL,
    [PotentialResponse_ID] INT            NULL,
    [Code]                 VARCHAR (50)   NOT NULL,
    [LocalName]            NVARCHAR (255) NULL,
    [Name]                 VARCHAR (255)  NOT NULL,
    [Question_ID]          INT            NOT NULL,
    [ResponseOrder]        INT            NOT NULL,
    [TextDescription]      VARCHAR (4000) NULL
);

