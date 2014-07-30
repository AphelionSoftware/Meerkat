CREATE TABLE [app].[MilestoneLocation] (
    [MilestoneLocation_ID] INT           IDENTITY (1, 1) NOT NULL,
    [Location_ID]          INT           NOT NULL,
    [MilestoneID]          INT           NOT NULL,
    [Active]               INT           CONSTRAINT [DF_MilestoneLocation_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]        VARCHAR (255) CONSTRAINT [DF_MilestoneLocation_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]        DATETIME      CONSTRAINT [DF_MilestoneLocation_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]       VARCHAR (255) CONSTRAINT [DF_MilestoneLocation_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]       DATETIME      CONSTRAINT [DF_MilestoneLocation_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_MilestoneLocation] PRIMARY KEY CLUSTERED ([MilestoneLocation_ID] ASC),
    CONSTRAINT [FK_MilestoneLocation_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_MilestoneLocation_Location] FOREIGN KEY ([Location_ID]) REFERENCES [Core].[Location] ([Location_ID]),
    CONSTRAINT [FK_MilestoneLocation_Milestone] FOREIGN KEY ([MilestoneID]) REFERENCES [app].[Milestone] ([MilestoneID])
);

