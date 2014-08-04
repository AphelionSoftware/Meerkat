CREATE TABLE [app].[Programme] (
    [Programme_ID]      INT            IDENTITY (1, 1) NOT NULL,
    [Code]              VARCHAR (50)   NULL,
    [LongName]          VARCHAR (500)  NULL,
    [BusinessKey]       NVARCHAR (400) NOT NULL,
    [ShortName]         VARCHAR (50)   NULL,
    [TextDescription]   VARCHAR (MAX)  NULL,
    [ProgrammeSiteName] VARCHAR (50)   NULL,
    [Active]            INT            DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]     VARCHAR (255)  CONSTRAINT [DF_Programme_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]     DATETIME       CONSTRAINT [DF_Programme_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]    VARCHAR (255)  CONSTRAINT [DF_Programme_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]    DATETIME       CONSTRAINT [DF_Programme_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Programme_1] PRIMARY KEY CLUSTERED ([Programme_ID] ASC),
    CONSTRAINT [FK_Programme_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [UQ_Programme_BusinessKey] UNIQUE NONCLUSTERED ([BusinessKey] ASC)
);








GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Programme', @level2type = N'COLUMN', @level2name = N'ShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Programme', @level2type = N'COLUMN', @level2name = N'ShortName';

