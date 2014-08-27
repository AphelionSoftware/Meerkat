CREATE TABLE [Staging].[Organization] (
    [Organization_ID]             INT            NULL,
    [BusinessKey]                 NVARCHAR (400) NOT NULL,
    [Code]                        VARCHAR (50)   NULL,
    [LocalLongName]               NVARCHAR (500) NULL,
    [LocalShortName]              NVARCHAR (50)  NULL,
    [LongName]                    VARCHAR (500)  NOT NULL,
    [ShortName]                   VARCHAR (50)   NOT NULL,
    [ParentOrganization_ID]       INT            NULL,
    [OrganizationTypeBusinessKey] NVARCHAR (400) NULL
);









