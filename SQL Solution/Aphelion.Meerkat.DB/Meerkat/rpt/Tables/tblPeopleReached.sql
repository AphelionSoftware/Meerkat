CREATE TABLE [rpt].[tblPeopleReached] (
    [PeopleReachedValuesID] INT            NOT NULL,
    [KeyType]               VARCHAR (4)    NULL,
    [LocationTypeCode]      VARCHAR (50)   NOT NULL,
    [BusinessKey]           NVARCHAR (400) NULL,
    [ShortName]             NVARCHAR (255) NULL,
    [ReportingPeriod_ID]    INT            NOT NULL,
    [ReportPeriod]          VARCHAR (50)   NOT NULL,
    [AgeBand_Name]          VARCHAR (255)  NULL,
    [CommunityType_Name]    VARCHAR (255)  NULL,
    [Donor_Name]            VARCHAR (255)  NULL,
    [Framework_Name]        VARCHAR (255)  NULL,
    [Gender_Name]           VARCHAR (255)  NULL,
    [Group_Name]            VARCHAR (255)  NULL,
    [Institution_Name]      VARCHAR (255)  NULL,
    [Location_Name]         VARCHAR (255)  NOT NULL,
    [Location_BusinessKey]  NVARCHAR (400) NOT NULL,
    [ResultArea_Name]       VARCHAR (255)  NULL,
    [StrategicElement_Name] VARCHAR (255)  NULL,
    [NumberReached]         INT            NOT NULL
);

