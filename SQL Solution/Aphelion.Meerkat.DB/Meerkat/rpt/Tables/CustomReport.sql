CREATE TABLE [rpt].[CustomReport] (
    [CustomReport_ID]     INT            IDENTITY (1, 1) NOT NULL,
    [Code]                VARCHAR (50)   NOT NULL,
    [Name]                VARCHAR (255)  NOT NULL,
    [BusinessKey]         NVARCHAR (400) NOT NULL,
    [CustomReportType_ID] INT            NOT NULL,
    [Active]              INT            CONSTRAINT [DF__CustomRep__Activ__00750D23] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]       VARCHAR (255)  CONSTRAINT [DF_CustomReport_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]       DATETIME       CONSTRAINT [DF_CustomReport_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]      VARCHAR (255)  CONSTRAINT [DF_CustomReport_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]      DATETIME       CONSTRAINT [DF_CustomReport_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_CustomReport] PRIMARY KEY CLUSTERED ([CustomReport_ID] ASC),
    CONSTRAINT [FK_CustomReport_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_CustomReport_CustomReportType] FOREIGN KEY ([CustomReportType_ID]) REFERENCES [rpt].[CustomReportType] ([CustomReportType_ID])
);









