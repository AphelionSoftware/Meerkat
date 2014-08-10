CREATE TABLE [Errors].[AgeBand] (
    [QueueID]            INT            NOT NULL,
    [SSISErrorCode]      INT            NOT NULL,
    [SSISErrorColumn]    INT            NOT NULL,
    [PackageName]        VARCHAR (255)  NOT NULL,
    [ErrorType]          VARCHAR (255)  NOT NULL,
    [AgeBand_ID]         INT            NULL,
    [AgeBandMax_ID]      INT            NOT NULL,
    [AgeBandMin_ID]      INT            NOT NULL,
    [BusinessKey]        NVARCHAR (400) NOT NULL,
    [Code]               VARCHAR (50)   NULL,
    [Name]               VARCHAR (255)  NULL,
    [ProjectBusinessKey] NVARCHAR (400) NULL,
    [TextDescription]    VARCHAR (MAX)  NULL,
    [ProjectID]          INT            NULL
);

