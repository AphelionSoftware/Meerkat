CREATE TABLE [Staging].[Person] (
    [Person_ID]      INT             NOT NULL,
    [BusinessKey]    NVARCHAR (4000) NOT NULL,
    [Category]       VARCHAR (MAX)   NULL,
    [ContactDetails] VARCHAR (MAX)   NULL,
    [Name]           VARCHAR (255)   NOT NULL,
    [Title]          VARCHAR (MAX)   NULL,
    [UserDetails]    VARCHAR (50)    NULL
);

