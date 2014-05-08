CREATE TABLE [app].[Project] (
    [ProjectID]       INT            IDENTITY (1, 1) NOT NULL,
    [Code]            VARCHAR (50)   NOT NULL,
    [ShortName]       NVARCHAR (255) NOT NULL,
    [LongName]        VARCHAR (255)  NOT NULL,
    [TextDescription] VARCHAR (MAX)  NOT NULL,
    [ProjectParentID] INT            NULL,
    [Outcome_ID]      INT            NULL,
    [Programme_ID]    INT            NULL,
    [Sector_ID]       INT            NULL,
    [SubSector_ID]    INT            NULL,
	[BusinessKey]     NVARCHAR(4000)	 NOT NULL,
    [ProjectSiteName] VARCHAR (255)  CONSTRAINT [DF_Project_ProjectSiteName] DEFAULT ('ShortName') NOT NULL,
    [Active]          INT            CONSTRAINT [DF_Project_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]   VARCHAR (255)  CONSTRAINT [DF_Project_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]   DATETIME       CONSTRAINT [DF_Project_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  VARCHAR (255)  CONSTRAINT [DF_Project_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]  DATETIME       CONSTRAINT [DF_Project_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED ([ProjectID] ASC),
    CONSTRAINT [CK_Project] CHECK ((((case when [Outcome_ID] IS NOT NULL then (1) else (0) end+case when [Programme_ID] IS NOT NULL then (1) else (0) end)+case when [Sector_ID] IS NOT NULL then (1) else (0) end)+case when [SubSector_ID] IS NOT NULL then (1) else (0) end)=(1)),
    CONSTRAINT [FK_Project_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_Project_Outcome] FOREIGN KEY ([Outcome_ID]) REFERENCES [app].[Outcome] ([Outcome_ID]),
    CONSTRAINT [FK_Project_Programme] FOREIGN KEY ([Programme_ID]) REFERENCES [app].[Programme] ([Programme_ID]),
    CONSTRAINT [FK_Project_Project] FOREIGN KEY ([ProjectParentID]) REFERENCES [app].[Project] ([ProjectID]),
    CONSTRAINT [FK_Project_Sector] FOREIGN KEY ([Sector_ID]) REFERENCES [app].[Sector] ([Sector_ID]),
    CONSTRAINT [FK_Project_SubSector] FOREIGN KEY ([SubSector_ID]) REFERENCES [app].[SubSector] ([SubSector_ID]),
    CONSTRAINT [UW_Project_Code] UNIQUE NONCLUSTERED ([Code] ASC)
);















