﻿CREATE TABLE [app].[Indicator] (
    [IndicatorID]      INT             IDENTITY (1, 1) NOT NULL,
    [LongName]         VARCHAR (500)   NOT NULL,
    [TextDescription]  VARCHAR (MAX)   NULL,
    [Baseline]         DECIMAL (20, 5) NULL,
    [BaselineString]   VARCHAR (MAX)   NULL,
    [BaselineDate]     DATETIME        NOT NULL,
    [Target]           DECIMAL (20, 5) NULL,
    [TargetString]     VARCHAR (MAX)   NULL,
    [TargetDate]       DATETIME        NOT NULL,
    [ReleaseDate]      DATE            NULL,
    [ReportingDate]    DATE            NULL,
    [Output_ID]        INT             NULL,
    [Outcome_ID]        INT             NULL,
    [BusinessKey]      NVARCHAR (MAX)  NULL,
    [Notes]            NVARCHAR (MAX)  NULL,
    [Code]             VARCHAR (50)    NOT NULL,
    [IndicatorType_ID] INT             NOT NULL,
    [SubOutput_ID]     INT             NULL,
    [ShortName]        VARCHAR (50)    NOT NULL,
    [BaselineDate_ID]  AS (CONVERT([int],CONVERT([varchar](8),[BaselineDate],(112)))),
	[TargetDate_ID]  AS (CONVERT([int],CONVERT([varchar](8),[TargetDate],(112)))),
    [UnitOfMeasure]    VARCHAR (50)    NOT NULL,
    [Active]           INT             CONSTRAINT [DF_Indicator_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]    VARCHAR (255)   CONSTRAINT [DF_Indicator_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]    DATETIME        CONSTRAINT [DF_Indicator_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]   VARCHAR (255)   CONSTRAINT [DF_Indicator_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]   DATETIME        CONSTRAINT [DF_Indicator_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Indicator] PRIMARY KEY CLUSTERED ([IndicatorID] ASC),
    CONSTRAINT [CK_ENFORCE_SINGLE_Parent_Link_Indicator] CHECK (((case when [Output_ID] IS NOT NULL then (1) else (0) end+case when [Outcome_ID] IS NOT NULL then (1) else (0) end)+case when [SubOutput_ID] IS NOT NULL then (1) else (0) end)=(1)),
    CONSTRAINT [FK_Indicator_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_Indicator_IndicatorType] FOREIGN KEY ([IndicatorType_ID]) REFERENCES [app].[IndicatorType] ([IndicatorType_ID]),
    CONSTRAINT [FK_Indicator_Outcome] FOREIGN KEY ([Outcome_ID]) REFERENCES [app].[Outcome] ([Outcome_ID]),
    CONSTRAINT [FK_Indicator_Output] FOREIGN KEY ([Output_ID]) REFERENCES [app].[Output] ([Output_ID]),
    CONSTRAINT [FK_Indicator_SubOutput] FOREIGN KEY ([SubOutput_ID]) REFERENCES [app].[SubOutput] ([SubOutput_ID]),
    CONSTRAINT [UQ_Indicator_Code]UNIQUE NONCLUSTERED ([Code] ASC)
);



