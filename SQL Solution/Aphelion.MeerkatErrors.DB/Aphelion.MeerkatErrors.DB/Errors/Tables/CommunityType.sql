﻿CREATE TABLE [Errors].[CommunityType] (
    [QueueID]          INT            NOT NULL,
    [SSISErrorCode]    INT            NOT NULL,
    [SSISErrorColumn]  INT            NOT NULL,
    [PackageName]      VARCHAR (255)  NOT NULL,
    [ErrorType]        VARCHAR (255)  NOT NULL,
    [CommunityType_ID] INT            NULL,
    [BusinessKey]      NVARCHAR (400) NOT NULL,
    [Code]             VARCHAR (50)   NOT NULL,
    [Name]             VARCHAR (255)  NOT NULL
);
