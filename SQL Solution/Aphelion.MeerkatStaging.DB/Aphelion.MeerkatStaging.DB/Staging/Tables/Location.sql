CREATE TABLE [Staging].[Location] (
    [Location_ID]             INT             NULL,
    [AreaKM]                  DECIMAL (18, 2) NULL,
    [BusinessKey]             NVARCHAR (400)  NOT NULL,
    [Code]                    VARCHAR (50)    NOT NULL,
    [Density]                 VARCHAR (MAX)   NULL,
    [LocalName]               NVARCHAR (255)  NULL,
    [Name]                    VARCHAR (255)   NULL,
    [ParentLocation_ID]       INT             NULL,
    [Population]              DECIMAL (18, 2) NULL,
    [LocationTypeBusinessKey] NVARCHAR (400)  NULL
);







