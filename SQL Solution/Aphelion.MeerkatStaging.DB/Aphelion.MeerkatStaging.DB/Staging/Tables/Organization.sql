CREATE TABLE [Staging].[Organization] (
    [Organization_ID]             INT             NULL,
    [BusinessKey]                 NVARCHAR (4000) NOT NULL,
    [Code]                        VARCHAR (50)    NULL,
    [LongName]                    NVARCHAR (500)  NULL,
    [ParentOrganization_ID]       INT             NULL,
    [ShortName]                   NVARCHAR (50)   NOT NULL,
    [OrganizationTypeBusinessKey] NVARCHAR (4000) NULL
);



