CREATE TABLE [Errors].[FormResponse] (
    [QueueID]                  INT            NOT NULL,
    [SSISErrorCode]            INT            NOT NULL,
    [SSISErrorColumn]          INT            NOT NULL,
    [PackageName]              VARCHAR (255)  NOT NULL,
    [ErrorType]                VARCHAR (255)  NOT NULL,
    [FormResponse_ID]          INT            NULL,
    [Age_ID]                   INT            NULL,
    [AgeBandBusinessKey]       NVARCHAR (400) NULL,
    [CommunityTypeBusinessKey] NVARCHAR (400) NULL,
    [Form_ID]                  INT            NOT NULL,
    [FormResponse_FNVID]       BIGINT         NOT NULL,
    [GenderBusinessKey]        NVARCHAR (400) NULL,
    [GroupBusinessKey]         NVARCHAR (400) NULL,
    [InstitutionBusinessKey]   NVARCHAR (400) NULL,
    [Location_ID]              INT            NULL,
    [Text]                     VARCHAR (MAX)  NULL,
    [AgeBand_ID]               INT            NULL,
    [CommunityType_ID]         INT            NULL,
    [Gender_ID]                INT            NULL,
    [Group_ID]                 INT            NULL,
    [Institution_ID]           INT            NULL
);

