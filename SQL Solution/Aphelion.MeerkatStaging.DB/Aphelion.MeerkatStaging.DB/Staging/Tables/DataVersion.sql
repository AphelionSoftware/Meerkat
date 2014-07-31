﻿CREATE TABLE [Staging].[DataVersion] (
    [DataVersion_ID] INT             NULL,
    [BusinessKey]    NVARCHAR (4000) NOT NULL,
    [Code]           VARCHAR (50)    NOT NULL,
    [Description]    VARCHAR (MAX)   NOT NULL,
    [Name]           VARCHAR (255)   NOT NULL,
    [Order]          INT             NOT NULL
);



