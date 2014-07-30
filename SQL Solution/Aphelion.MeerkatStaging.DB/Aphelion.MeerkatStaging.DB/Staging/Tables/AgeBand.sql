CREATE TABLE [Staging].[AgeBand] (
    [AgeBand_ID]         INT             NULL,
    [AgeBandMax_ID]      INT             NOT NULL,
    [AgeBandMin_ID]      INT             NOT NULL,
    [BusinessKey]        NVARCHAR (4000) NOT NULL,
    [Code]               VARCHAR (50)    NULL,
    [Name]               VARCHAR (255)   NULL,
    [TextDescription]    VARCHAR (MAX)   NULL,
    [ProjectBusinessKey] NVARCHAR (4000) NULL
);



