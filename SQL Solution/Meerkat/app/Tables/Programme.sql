CREATE TABLE [app].[Programme] (
    [Programme_ID]      INT           IDENTITY (1, 1) NOT NULL,
    [Code]              VARCHAR (50)  NULL,
    [LongName]          VARCHAR (500) NULL,
    [BusinessKey]       VARCHAR (255) NULL,
    [ShortName]         VARCHAR (50)  NULL,
    [TextDescription]   VARCHAR (MAX) NULL,
    [ProgrammeSiteName] VARCHAR (50)  NULL,
    [Active]            INT           DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]     VARCHAR (255) CONSTRAINT [DF_Programme_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]     DATETIME      CONSTRAINT [DF_Programme_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]    VARCHAR (255) CONSTRAINT [DF_Programme_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]    DATETIME      CONSTRAINT [DF_Programme_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Programme_1] PRIMARY KEY CLUSTERED ([Programme_ID] ASC)
);

