CREATE TABLE [rpt].[CustomReport_Indicator] (
    [CustomReport_Indicator_ID] INT           IDENTITY (1, 1) NOT NULL,
    [CustomReport_ID]           INT           NULL,
    [IndicatorID]               INT           NULL,
    [Active]                    INT           DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]             VARCHAR (255) CONSTRAINT [DF_CustomReport_Indicator_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]             DATETIME      CONSTRAINT [DF_CustomReport_Indicator_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]            VARCHAR (255) CONSTRAINT [DF_CustomReport_Indicator_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]            DATETIME      CONSTRAINT [DF_CustomReport_Indicator_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [Export]                    BIT           NOT NULL,
    CONSTRAINT [PK_IndicatorCustomReport] PRIMARY KEY CLUSTERED ([CustomReport_Indicator_ID] ASC),
    CONSTRAINT [FK_CustomReport_Indicator_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_CustomReport_Indicator_CustomReport] FOREIGN KEY ([CustomReport_ID]) REFERENCES [rpt].[CustomReport] ([CustomReport_ID]),
    CONSTRAINT [FK_CustomReport_Indicator_Indicator] FOREIGN KEY ([IndicatorID]) REFERENCES [app].[Indicator] ([IndicatorID])
);












GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'7', @level0type = N'SCHEMA', @level0name = N'rpt', @level1type = N'TABLE', @level1name = N'CustomReport_Indicator';


GO
EXECUTE sp_addextendedproperty @name = N'ExcludeFromStaging', @value = N'true', @level0type = N'SCHEMA', @level0name = N'rpt', @level1type = N'TABLE', @level1name = N'CustomReport_Indicator', @level2type = N'COLUMN', @level2name = N'Export';

