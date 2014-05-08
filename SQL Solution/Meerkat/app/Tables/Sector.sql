CREATE TABLE [app].[Sector] (
    [Sector_ID]       INT           IDENTITY (1, 1) NOT NULL,
    [Code]            VARCHAR (50)  NULL,
    [LongName]        VARCHAR (500) NULL,
    [BusinessKey]     NVARCHAR(4000) NOT NULL,
    [Programme_ID]    INT           NOT NULL,
    [ShortName]       VARCHAR (50)  NOT NULL,
    [TextDescription] VARCHAR (MAX) NULL,
    [Active]          INT           DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]   VARCHAR (255) CONSTRAINT [DF_Sector_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]   DATETIME      CONSTRAINT [DF_Sector_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  VARCHAR (255) CONSTRAINT [DF_Sector_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]  DATETIME      CONSTRAINT [DF_Sector_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Sector_] PRIMARY KEY CLUSTERED ([Sector_ID] ASC),
    CONSTRAINT [FK_Sector_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_Sector_Programme] FOREIGN KEY ([Programme_ID]) REFERENCES [app].[Programme] ([Programme_ID]),
    UNIQUE NONCLUSTERED ([ShortName] ASC)
);



