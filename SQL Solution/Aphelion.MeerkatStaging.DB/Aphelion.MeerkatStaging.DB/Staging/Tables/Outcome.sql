CREATE TABLE [Staging].[Outcome] (
    [Outcome_ID]             INT            NULL,
    [BusinessKey]            NVARCHAR (400) NOT NULL,
    [Code]                   VARCHAR (50)   NOT NULL,
    [LongName]               NVARCHAR (500) NOT NULL,
    [OutcomeSiteName]        NVARCHAR (50)  NULL,
    [ShortName]              NVARCHAR (50)  NOT NULL,
    [TextDescription]        NVARCHAR (MAX) NULL,
    [DataVersionBusinessKey] NVARCHAR (400) NOT NULL,
    [ImpactBusinessKey]      NVARCHAR (400) NULL
);





