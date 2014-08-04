CREATE TABLE [Core].[DataVersionLevel] (
    [DataVersionLevel_ID] INT           IDENTITY (1, 1) NOT NULL,
    [VersionLevelCode]    VARCHAR (50)  NOT NULL,
    [VersionOrder]        INT           NOT NULL,
    [Name]                VARCHAR (50)  NOT NULL,
    [Description]         VARCHAR (MAX) NOT NULL,
    [Active]              INT           DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]       VARCHAR (255) CONSTRAINT [DF_DataVersionLevel_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]       DATETIME      CONSTRAINT [DF_DataVersionLevel_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]      VARCHAR (255) CONSTRAINT [DF_DataVersionLevel_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]      DATETIME      CONSTRAINT [DF_DataVersionLevel_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_VersionLevel] PRIMARY KEY CLUSTERED ([DataVersionLevel_ID] ASC),
    CONSTRAINT [FK_DataVersionLevel_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID])
);

