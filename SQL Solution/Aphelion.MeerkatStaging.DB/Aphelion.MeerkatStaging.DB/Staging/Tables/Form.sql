CREATE TABLE [Staging].[Form] (
    [Form_ID]                  INT            NULL,
    [Code]                     VARCHAR (50)   NOT NULL,
    [LocalName]                NVARCHAR (255) NULL,
    [Name]                     VARCHAR (255)  NOT NULL,
    [TextDescription]          VARCHAR (4000) NULL,
    [Age_ID]                   INT            NULL,
    [AgeBandBusinessKey]       NVARCHAR (400) NULL,
    [CommunityTypeBusinessKey] NVARCHAR (400) NULL,
    [GenderBusinessKey]        NVARCHAR (400) NULL,
    [GroupBusinessKey]         NVARCHAR (400) NULL,
    [InstitutionBusinessKey]   NVARCHAR (400) NULL,
    [LocationBusinessKey]      NVARCHAR (400) NULL,
    [ProjectBusinessKey]       NVARCHAR (400) NOT NULL
);

