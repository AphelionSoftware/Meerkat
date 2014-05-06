CREATE TABLE [disagg].[Gender] (
    [Gender_ID]      INT           IDENTITY (1, 1) NOT NULL,
    [Code]           VARCHAR (50)  NOT NULL,
    [Name]           VARCHAR (255) NOT NULL,
	[BusinessKey]	 NVARCHAR(MAX) NOT NULL,
    [Active]         INT           DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]  VARCHAR (255) CONSTRAINT [DF_Gender_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]  DATETIME      CONSTRAINT [DF_Gender_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy] VARCHAR (255) CONSTRAINT [DF_Gender_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn] DATETIME      CONSTRAINT [DF_Gender_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED ([Gender_ID] ASC),
    CONSTRAINT [FK_Gender_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID])
);

