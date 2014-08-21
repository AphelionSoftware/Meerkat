CREATE TABLE [Staging].[DataVersion] (
    [DataVersion_ID] INT            NULL,
    [BusinessKey]    NVARCHAR (400) NOT NULL,
    [Code]           VARCHAR (50)   NOT NULL,
    [Description]    VARCHAR (MAX)  NOT NULL,
    [LocalName]      NVARCHAR (255) NULL,
    [Name]           VARCHAR (255)  NULL,
    [Order]          INT            NOT NULL
);







