CREATE TABLE [rpt].[CustomReportType] (
    [CustomReportType_ID] INT           IDENTITY (1, 1) NOT NULL,
    [Code]                VARCHAR (50)  NOT NULL,
    [Name]                VARCHAR (255) NOT NULL,
    [BusinessKey]         NVARCHAR(4000) NOT NULL,
    [Active]              INT           DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]       VARCHAR (255) CONSTRAINT [DF_CustomReportType_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]       DATETIME      CONSTRAINT [DF_CustomReportType_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]      VARCHAR (255) CONSTRAINT [DF_CustomReportType_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]      DATETIME      CONSTRAINT [DF_CustomReportType_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_CustomReportType] PRIMARY KEY CLUSTERED ([CustomReportType_ID] ASC),
    CONSTRAINT [FK_CustomReportType_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID])
);

