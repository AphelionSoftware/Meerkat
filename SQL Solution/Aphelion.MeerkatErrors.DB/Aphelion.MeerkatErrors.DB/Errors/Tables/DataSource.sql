CREATE TABLE [Errors].[DataSource] (
    [QueueID]          INT            NOT NULL,
    [SSISErrorCode]    INT            NOT NULL,
    [SSISErrorColumn]  INT            NOT NULL,
    [PackageName]      VARCHAR (255)  NOT NULL,
    [ErrorType]        VARCHAR (255)  NOT NULL,
    [DataSource_ID]    INT            NULL,
    [BusinessKey]      NVARCHAR (400) NOT NULL,
    [CollectionMethod] VARCHAR (MAX)  NULL,
    [ContactDetails]   VARCHAR (MAX)  NULL,
    [Custodian]        VARCHAR (MAX)  NULL,
    [Format]           VARCHAR (MAX)  NULL,
    [MetadataStatus]   VARCHAR (MAX)  NULL,
    [Name]             VARCHAR (255)  NOT NULL
);

