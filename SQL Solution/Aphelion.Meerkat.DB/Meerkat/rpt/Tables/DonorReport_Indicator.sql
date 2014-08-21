CREATE TABLE [rpt].[DonorReport_Indicator] (
    [DonorReport_Indicator_ID] INT           IDENTITY (1, 1) NOT NULL,
    [DonorReportID]            INT           NULL,
    [IndicatorID]              INT           NULL,
    [Active]                   INT           DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]            VARCHAR (255) CONSTRAINT [DF_DonorReport_Indicator_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]            DATETIME      CONSTRAINT [DF_DonorReport_Indicator_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]           VARCHAR (255) CONSTRAINT [DF_DonorReport_Indicator_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]           DATETIME      CONSTRAINT [DF_DonorReport_Indicator_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_IndicatorDonorReport] PRIMARY KEY CLUSTERED ([DonorReport_Indicator_ID] ASC),
    CONSTRAINT [FK_DonorReport_Indicator_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_DonorReport_Indicator_DonorReport] FOREIGN KEY ([DonorReportID]) REFERENCES [rpt].[DonorReport] ([DonorReport_ID]),
    CONSTRAINT [FK_DonorReport_Indicator_Indicator] FOREIGN KEY ([IndicatorID]) REFERENCES [app].[Indicator] ([IndicatorID])
);






GO


