﻿CREATE TABLE [RBM].[IndicatorValues] (
    [IndicatorValues_ID] INT             IDENTITY (1, 1) NOT NULL,
    [Indicator_ID]       INT             NOT NULL,
    [ActualLabel]        VARCHAR (50)    NOT NULL,
    [ActualValue]        DECIMAL (20, 5) NULL,
    [ActualDate]         DATE            NULL,
    [BusinessKey]        VARCHAR (MAX)   NULL,
    [Notes]              VARCHAR (MAX)   NULL,
    [DataVersion_ID]     INT             NOT NULL,
    [Location_ID]        INT             NOT NULL,
    [ReportPeriodID]     INT             NOT NULL,
    [Organization_ID]    INT             NULL,
    [Active]             INT             CONSTRAINT [DF_IndicatorValues_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]      VARCHAR (255)   CONSTRAINT [DF_IndicatorValues_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]      DATETIME        CONSTRAINT [DF_IndicatorValues_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]     VARCHAR (255)   CONSTRAINT [DF_IndicatorValues_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]     DATETIME        CONSTRAINT [DF_IndicatorValues_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [IndicatorValueGroup] UNIQUEIDENTIFIER NOT NULL DEFAULT (newid()), 
    [GroupVersion] INT NOT NULL DEFAULT ((0)), 
    CONSTRAINT [PK_IndicatorValues] PRIMARY KEY CLUSTERED ([IndicatorValues_ID] ASC),
    CONSTRAINT [FK_IndicatorValues_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_IndicatorValues_DataVersion] FOREIGN KEY ([DataVersion_ID]) REFERENCES [Core].[DataVersion] ([DataVersion_ID]),
    CONSTRAINT [FK_IndicatorValues_Indicator1] FOREIGN KEY ([Indicator_ID]) REFERENCES [app].[Indicator] ([IndicatorID]),
    CONSTRAINT [FK_IndicatorValues_Location] FOREIGN KEY ([Location_ID]) REFERENCES [Core].[Location] ([Location_ID]),
    CONSTRAINT [FK_IndicatorValues_Organization] FOREIGN KEY ([Organization_ID]) REFERENCES [Core].[Organization] ([Organization_ID]),
    CONSTRAINT [FK_IndicatorValues_ReportingPeriod] FOREIGN KEY ([ReportPeriodID]) REFERENCES [Core].[ReportingPeriod] ([ID]),
    CONSTRAINT [UQ_IDS] UNIQUE NONCLUSTERED ([Indicator_ID] ASC, [Location_ID] ASC, [ReportPeriodID] ASC, [DataVersion_ID] ASC, [Organization_ID] ASC)
);




GO
