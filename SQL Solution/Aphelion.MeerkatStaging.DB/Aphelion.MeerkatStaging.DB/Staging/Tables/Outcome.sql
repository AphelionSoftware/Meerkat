﻿CREATE TABLE [Staging].[Outcome] (
    [Outcome_ID]             INT            NULL,
    [BusinessKey]            NVARCHAR (400) NOT NULL,
    [Code]                   VARCHAR (50)   NOT NULL,
    [LocalLongName]          NVARCHAR (500) NULL,
    [LocalShortName]         NVARCHAR (50)  NULL,
    [LongName]               VARCHAR (500)  NOT NULL,
    [OutcomeSiteName]        NVARCHAR (50)  NULL,
    [ShortName]              VARCHAR (50)   NOT NULL,
    [TextDescription]        VARCHAR (4000) NULL,
    [DataVersionBusinessKey] NVARCHAR (400) NOT NULL,
    [ImpactBusinessKey]      NVARCHAR (400) NULL
);







