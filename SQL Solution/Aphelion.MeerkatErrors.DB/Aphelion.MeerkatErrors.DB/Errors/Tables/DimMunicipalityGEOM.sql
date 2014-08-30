CREATE TABLE [Errors].[DimMunicipalityGEOM] (
    [QueueID]         INT            NOT NULL,
    [SSISErrorCode]   INT            NOT NULL,
    [SSISErrorColumn] INT            NOT NULL,
    [PackageName]     VARCHAR (255)  NOT NULL,
    [ErrorType]       VARCHAR (255)  NOT NULL,
    [ADM0]            NVARCHAR (255) NULL,
    [ADM1]            NVARCHAR (255) NULL,
    [ADM2]            NVARCHAR (255) NULL,
    [ADM3]            NVARCHAR (255) NULL,
    [ADM4]            NVARCHAR (255) NULL,
    [ADM5]            NVARCHAR (255) NULL,
    [FIP]             NVARCHAR (255) NULL,
    [ID]              BIGINT         NULL,
    [LBL]             NVARCHAR (255) NULL,
    [LONG_FRM]        NVARCHAR (255) NULL,
    [MMT_ID]          NVARCHAR (255) NULL,
    [PK_ID]           INT            NOT NULL,
    [SHORT__FRM]      NVARCHAR (255) NULL
);

