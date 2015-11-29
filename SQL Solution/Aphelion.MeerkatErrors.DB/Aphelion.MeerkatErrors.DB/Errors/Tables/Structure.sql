CREATE TABLE [Errors].[Structure] (
    [QueueID]                  INT            NOT NULL,
    [SSISErrorCode]            INT            NOT NULL,
    [SSISErrorColumn]          INT            NOT NULL,
    [PackageName]              VARCHAR (255)  NOT NULL,
    [ErrorType]                VARCHAR (255)  NOT NULL,
    [Structure_ID]             INT            NULL,
    [BusinessKey]              NVARCHAR (400) NOT NULL,
    [Code]                     VARCHAR (50)   NOT NULL,
    [InstitutionBusinessKey]   NVARCHAR (400) NULL,
    [LocalName]                NVARCHAR (255) NULL,
    [LocationBusinessKey]      NVARCHAR (400) NOT NULL,
    [Name]                     VARCHAR (255)  NOT NULL,
    [StructureTypeBusinessKey] NVARCHAR (400) NOT NULL,
    [TextDescription]          VARCHAR (4000) NULL,
    [Institution_ID]           INT            NULL,
    [Location_ID]              INT            NULL,
    [StructureType_ID]         INT            NULL
);

