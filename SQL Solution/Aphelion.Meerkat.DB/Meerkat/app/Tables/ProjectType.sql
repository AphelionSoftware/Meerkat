CREATE TABLE [app].[ProjectType] (
    [ProjectType_ID] INT            IDENTITY (1, 1) NOT NULL,
    [Code]           VARCHAR (50)   NOT NULL,
    [Name]           VARCHAR (255)  NULL,
    [BusinessKey]    NVARCHAR (400) NOT NULL,
    [Active]         INT            CONSTRAINT [DF_ProjectType_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]  VARCHAR (255)  CONSTRAINT [DF_ProjectType_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]  DATETIME       CONSTRAINT [DF_ProjectType_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy] VARCHAR (255)  CONSTRAINT [DF_ProjectType_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn] DATETIME       CONSTRAINT [DF_ProjectType_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ProjectType] PRIMARY KEY CLUSTERED ([ProjectType_ID] ASC),
    CONSTRAINT [FK_ProjectType_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [UQ_ProjectType_Code] UNIQUE NONCLUSTERED ([Code] ASC)
);

