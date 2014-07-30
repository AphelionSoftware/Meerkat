CREATE TABLE [Staging].[DataSource] (
    [DataSource_ID]    INT             NOT NULL,
    [BusinessKey]      NVARCHAR (4000) NOT NULL,
    [CollectionMethod] VARCHAR (MAX)   NULL,
    [ContactDetails]   VARCHAR (MAX)   NULL,
    [Custodian]        VARCHAR (MAX)   NULL,
    [Format]           VARCHAR (MAX)   NULL,
    [MetadataStatus]   VARCHAR (MAX)   NULL,
    [Name]             VARCHAR (255)   NOT NULL
);

