CREATE TABLE [app].[Milestone] (
    [MilestoneID]     INT             IDENTITY (1, 1) NOT NULL,
    [LongName]        VARCHAR (500)   NOT NULL,
    [TextDescription] VARCHAR (MAX)   NULL,
    [Baseline]        DECIMAL (20, 5) NULL,
    [BaselineString]  VARCHAR (MAX)   NULL,
    [BaselineDate]    DATETIME        NOT NULL,
    [Target]          DECIMAL (20, 5) NULL,
    [TargetString]    VARCHAR (MAX)   NULL,
    [TargetDate]      DATETIME        NOT NULL,
    [ReleaseDate]     DATE            NULL,
    [ReportingDate]   DATE            NULL,
    [BusinessKey]     NVARCHAR (MAX)  NULL,
    [Notes]           NVARCHAR (MAX)  NULL,
    [Code]            VARCHAR (50)    NOT NULL,
    [MilestoneTypeID] INT             NOT NULL,
    [ActivityID]      INT             NULL,
	[ProjectID]       INT             NULL,
	[OutcomeID]		  INT			  NULL,
    [ShortName]       VARCHAR (50)    NOT NULL,
    [BaselineDateID]  AS              ((datepart(year,[BaselineDate])*(10000)+datepart(month,[baselineDate])*(100))+datepart(day,[BaselineDate])),
    [TargetDateID]    AS              ((datepart(year,[TargetDate])*(10000)+datepart(month,[TargetDate])*(100))+datepart(day,[TargetDate])),
    [UnitOfMeasure]   VARCHAR (50)    NOT NULL,
    [Active]          INT             CONSTRAINT [DF__Milestone__sys_A__5F492382] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]   VARCHAR (255)   CONSTRAINT [DF_Milestone_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]   DATETIME        CONSTRAINT [DF_Milestone_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  VARCHAR (255)   CONSTRAINT [DF_Milestone_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]  DATETIME        CONSTRAINT [DF_Milestone_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Milestone] PRIMARY KEY CLUSTERED ([MilestoneID] ASC),
    CONSTRAINT [FK_Milestone_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_Milestone_Activity] FOREIGN KEY ([ActivityID]) REFERENCES [app].[Activity] ([ActivityID]),
    CONSTRAINT [FK_Milestone_MilestoneType] FOREIGN KEY ([MilestoneTypeID]) REFERENCES [app].[MilestoneType] ([MilestoneTypeID]),
    CONSTRAINT [FK_Milestone_Project] FOREIGN KEY ([ProjectID]) REFERENCES [app].[Project] ([ProjectID]),
	CONSTRAINT [FK_Milestone_Outcome] FOREIGN KEY ([OutcomeID]) REFERENCES [app].[Outcome] ([OutcomeID]),
	CONSTRAINT [CK_ENFORCE_SINGLE_Parent_Link_Milestone] CHECK 
		(([ActivityID] IS NOT NULL AND [OutcomeID] IS NULL AND [ProjectID] IS NULL)
		OR ([ActivityID] IS NULL AND [OutcomeID] IS NOT NULL AND [ProjectID] IS NULL)
		OR ([ActivityID] IS NULL AND [OutcomeID] IS NULL AND [ProjectID] IS NOT NULL)),
    UNIQUE NONCLUSTERED ([Code] ASC)
);



