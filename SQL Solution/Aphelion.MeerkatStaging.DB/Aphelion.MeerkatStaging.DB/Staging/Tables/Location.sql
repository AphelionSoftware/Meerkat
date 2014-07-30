CREATE TABLE [Staging].[Location] (
    [Location_ID]             INT             NULL,
    [AreaKM]                  DECIMAL (18, 2) NULL,
    [BusinessKey]             NVARCHAR (4000) NOT NULL,
    [Code]                    VARCHAR (50)    NOT NULL,
    [Density]                 VARCHAR (MAX)   NULL,
    [Name]                    VARCHAR (255)   NOT NULL,
    [ParentLocation_ID]       INT             NULL,
    [Population]              DECIMAL (18, 2) NULL,
    [LocationTypeBusinessKey] NVARCHAR (4000) NULL
);



