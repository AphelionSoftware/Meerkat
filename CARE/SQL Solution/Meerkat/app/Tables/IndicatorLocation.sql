CREATE TABLE [app].[IndicatorLocation] (
    [IndicatorLocation_ID] INT           IDENTITY (1, 1) NOT NULL,
    [Location_ID]          INT           NULL,
    [Indicator_ID]         INT           NULL,
    [Active]               INT           DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]        VARCHAR (255) CONSTRAINT [DF_IndicatorLocation_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]        DATETIME      CONSTRAINT [DF_IndicatorLocation_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]       VARCHAR (255) CONSTRAINT [DF_IndicatorLocation_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]       DATETIME      CONSTRAINT [DF_IndicatorLocation_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_IndicatorLocation] PRIMARY KEY CLUSTERED ([IndicatorLocation_ID] ASC),
    CONSTRAINT [FK_IndicatorLocation_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_IndicatorLocation_Indicator] FOREIGN KEY ([Indicator_ID]) REFERENCES [app].[Indicator] ([IndicatorID]),
    CONSTRAINT [FK_IndicatorLocation_Location] FOREIGN KEY ([Location_ID]) REFERENCES [Core].[Location] ([Location_ID])
);



