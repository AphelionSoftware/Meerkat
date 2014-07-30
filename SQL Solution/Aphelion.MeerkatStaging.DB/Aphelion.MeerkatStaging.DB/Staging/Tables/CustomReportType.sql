﻿CREATE TABLE [Staging].[CustomReportType] (
    [CustomReportType_ID] INT             NOT NULL,
    [BusinessKey]         NVARCHAR (4000) NOT NULL,
    [Code]                VARCHAR (50)    NOT NULL,
    [DeadlineDays]        INT             NOT NULL,
    [Name]                VARCHAR (255)   NOT NULL,
    [NoticeDays]          INT             NOT NULL,
    [WarningDays]         INT             NOT NULL
);

