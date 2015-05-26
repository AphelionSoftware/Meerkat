CREATE TABLE [Stage].[Location] (
    [ID]             INT               IDENTITY (1, 1) NOT NULL,
    [Location]       VARCHAR (255)     NULL,
    [Geog]           [sys].[geography] NULL,
    [LocationType]   VARCHAR (255)     NULL,
    [ParentLocation] VARCHAR (255)     NULL,
    CONSTRAINT [PK_Location_1] PRIMARY KEY CLUSTERED ([ID] ASC)
);

