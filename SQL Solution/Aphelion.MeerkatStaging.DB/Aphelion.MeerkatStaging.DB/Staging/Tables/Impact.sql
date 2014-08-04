CREATE TABLE [Staging].[Impact] (
    [Impact_ID]              INT            NULL,
    [BusinessKey]            NVARCHAR (400) NOT NULL,
    [Code]                   VARCHAR (50)   NOT NULL,
    [ImpactSiteName]         NVARCHAR (50)  NULL,
    [LongName]               NVARCHAR (500) NOT NULL,
    [ShortName]              NVARCHAR (50)  NOT NULL,
    [TextDescription]        NVARCHAR (MAX) NULL,
    [DataVersionBusinessKey] NVARCHAR (400) NOT NULL
);





