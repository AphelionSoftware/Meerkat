CREATE TABLE [Errors].[Impact] (
    [QueueID]                INT            NOT NULL,
    [SSISErrorCode]          INT            NOT NULL,
    [SSISErrorColumn]        INT            NOT NULL,
    [PackageName]            VARCHAR (255)  NOT NULL,
    [ErrorType]              VARCHAR (255)  NOT NULL,
    [Impact_ID]              INT            NULL,
    [BusinessKey]            NVARCHAR (400) NOT NULL,
    [Code]                   VARCHAR (50)   NOT NULL,
    [DataVersionBusinessKey] NVARCHAR (400) NOT NULL,
    [ImpactSiteName]         NVARCHAR (50)  NULL,
    [LongName]               NVARCHAR (500) NOT NULL,
    [ShortName]              NVARCHAR (50)  NOT NULL,
    [TextDescription]        NVARCHAR (MAX) NULL,
    [DataVersion]            INT            NULL
);

