CREATE TABLE [rpt].[DonorReport_Project] (
    [DonorReport_Project_ID] INT           IDENTITY (1, 1) NOT NULL,
    [DonorReportID]          INT           NULL,
    [ProjectID]              INT           NULL,
    [Active]                 INT           DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]          VARCHAR (255) CONSTRAINT [DF_DonorReport_Project_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]          DATETIME      CONSTRAINT [DF_DonorReport_Project_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]         VARCHAR (255) CONSTRAINT [DF_DonorReport_Project_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]         DATETIME      CONSTRAINT [DF_DonorReport_Project_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ProjectDonorReport] PRIMARY KEY CLUSTERED ([DonorReport_Project_ID] ASC),
    CONSTRAINT [FK_DonorReport_Project_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_DonorReport_Project_DonorReport] FOREIGN KEY ([DonorReportID]) REFERENCES [rpt].[DonorReport] ([DonorReport_ID]),
    CONSTRAINT [FK_DonorReport_Project_Project] FOREIGN KEY ([ProjectID]) REFERENCES [app].[Project] ([ProjectID])
);




GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'5', @level0type = N'SCHEMA', @level0name = N'rpt', @level1type = N'TABLE', @level1name = N'DonorReport_Project';

