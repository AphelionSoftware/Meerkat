CREATE TABLE [Staging].[Category] (
    [Category_ID]     INT            NULL,
    [CategoryOrder]   INT            NOT NULL,
    [Code]            VARCHAR (50)   NOT NULL,
    [LocalName]       NVARCHAR (255) NULL,
    [Name]            VARCHAR (255)  NOT NULL,
    [TextDescription] VARCHAR (4000) NULL,
    [Form_ID]         INT            NOT NULL
);

