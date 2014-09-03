﻿CREATE TABLE [Staging].[StructureType] (
    [StructureType_ID] INT            NULL,
    [BusinessKey]      NVARCHAR (400) NOT NULL,
    [Code]             VARCHAR (50)   NOT NULL,
    [LocalName]        NVARCHAR (255) NULL,
    [Name]             VARCHAR (255)  NOT NULL
);
