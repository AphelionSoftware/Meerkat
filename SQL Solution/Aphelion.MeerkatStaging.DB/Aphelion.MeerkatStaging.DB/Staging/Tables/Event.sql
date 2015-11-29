CREATE TABLE [Staging].[Event] (
    [Event_ID]               INT            NULL,
    [Code]                   VARCHAR (50)   NOT NULL,
    [EventDate]              DATE           NOT NULL,
    [LocalName]              NVARCHAR (255) NULL,
    [Name]                   VARCHAR (255)  NOT NULL,
    [TextDescription]        VARCHAR (4000) NULL,
    [InstitutionBusinessKey] NVARCHAR (400) NULL,
    [LocationBusinessKey]    NVARCHAR (400) NULL,
    [ProjectBusinessKey]     NVARCHAR (400) NOT NULL
);

