CREATE TABLE [Errors].[SubOutputSubOutputLink] (
    [QueueID]                   INT            NOT NULL,
    [SSISErrorCode]             INT            NOT NULL,
    [SSISErrorColumn]           INT            NOT NULL,
    [PackageName]               VARCHAR (255)  NOT NULL,
    [ErrorType]                 VARCHAR (255)  NOT NULL,
    [SubOutputSubOutputLink_ID] INT            NULL,
    [SubOutputBusinessKey]      NVARCHAR (400) NOT NULL,
    [PrimarySubOutput_ID]       INT            NULL,
    [SecondarySubOutput_ID]     INT            NULL
);

