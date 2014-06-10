CREATE TABLE [disagg].[AgeBand] (
    [AgeBand_ID]      INT           IDENTITY (1, 1) NOT NULL,
    [AgeBandMin_ID]   INT           NOT NULL,
    [AgeBandMax_ID]   INT           NOT NULL,
    [TextDescription] VARCHAR (MAX) NULL,
    [Name]            VARCHAR (255) NULL,
    [Code]            VARCHAR (50)  NULL,
	[BusinessKey]	  NVARCHAR(4000) NOT NULL,
    [Active]          INT           CONSTRAINT [DF__AgeBand__Active__1B7E091A] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]   VARCHAR (255) CONSTRAINT [DF_AgeBand_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]   DATETIME      CONSTRAINT [DF_AgeBand_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  VARCHAR (255) CONSTRAINT [DF_AgeBand_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]  DATETIME      CONSTRAINT [DF_AgeBand_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [ProjectID]       INT           NULL,
    CONSTRAINT [PK_AgeBand_] PRIMARY KEY CLUSTERED ([AgeBand_ID] ASC),
    CONSTRAINT [FK_AgeBand_Age] FOREIGN KEY ([AgeBandMin_ID]) REFERENCES [disagg].[Age] ([Age_ID]),
    CONSTRAINT [FK_AgeBand_Age1] FOREIGN KEY ([AgeBandMax_ID]) REFERENCES [disagg].[Age] ([Age_ID]),
    CONSTRAINT [FK_AgeBand_Project] FOREIGN KEY ([ProjectID]) REFERENCES [app].[Project] ([ProjectID])
);

