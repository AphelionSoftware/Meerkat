CREATE TABLE [Staging].[Structure] (
    [Structure_ID]             INT            NULL,
    [BusinessKey]              NVARCHAR (400) NOT NULL,
    [Code]                     VARCHAR (50)   NOT NULL,
    [LocalName]                NVARCHAR (255) NULL,
    [Name]                     VARCHAR (255)  NOT NULL,
    [TextDescription]          VARCHAR (4000) NULL,
    [InstitutionBusinessKey]   NVARCHAR (400) NULL,
    [LocationBusinessKey]      NVARCHAR (400) NOT NULL,
    [StructureTypeBusinessKey] NVARCHAR (400) NOT NULL
);

