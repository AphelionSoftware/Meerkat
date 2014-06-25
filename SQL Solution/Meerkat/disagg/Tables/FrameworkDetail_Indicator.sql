CREATE TABLE [disagg].[FrameworkDetail_Indicator] (
    [FrameworkDetail_Indicator_ID] INT           IDENTITY (1, 1) NOT NULL,
    [FrameworkDetail_ID]            INT           NULL,
    [IndicatorID]            INT           NULL,
	[BusinessKey]			 NVARCHAR(4000) NOT NULL,
    [Active]                 INT           DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]          VARCHAR (255) CONSTRAINT [DF_FrameworkDetail_Indicator_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]          DATETIME      CONSTRAINT [DF_FrameworkDetail_Indicator_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]         VARCHAR (255) CONSTRAINT [DF_FrameworkDetail_Indicator_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]         DATETIME      CONSTRAINT [DF_FrameworkDetail_Indicator_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_IndicatorFrameworkDetail] PRIMARY KEY CLUSTERED ([FrameworkDetail_Indicator_ID] ASC),
    CONSTRAINT [FK_FrameworkDetail_Indicator_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_FrameworkDetail_Indicator_Indicator] FOREIGN KEY ([IndicatorID]) REFERENCES [app].[Indicator] ([IndicatorID]),
	CONSTRAINT [FK_FrameworkDetail_Indicator_FrameworkDetail] FOREIGN KEY ([FrameworkDetailID]) REFERENCES [disagg].[FrameworkDetail] ([FrameworkDetail_ID])
);

