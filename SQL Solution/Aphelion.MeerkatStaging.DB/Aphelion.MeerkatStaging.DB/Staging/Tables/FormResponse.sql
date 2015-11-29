CREATE TABLE [Staging].[FormResponse] (
    [FormResponse_ID]          INT            NULL,
    [FormResponse_FNVID]       BIGINT         NOT NULL,
    [Location_ID]              INT            NULL,
    [Text]                     VARCHAR (MAX)  NULL,
    [Age_ID]                   INT            NULL,
    [Form_ID]                  INT            NOT NULL,
    [AgeBandBusinessKey]       NVARCHAR (400) NULL,
    [CommunityTypeBusinessKey] NVARCHAR (400) NULL,
    [GenderBusinessKey]        NVARCHAR (400) NULL,
    [GroupBusinessKey]         NVARCHAR (400) NULL,
    [InstitutionBusinessKey]   NVARCHAR (400) NULL
);

