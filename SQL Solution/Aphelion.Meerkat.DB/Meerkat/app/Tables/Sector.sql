CREATE TABLE [app].[Sector] (
    [Sector_ID]       INT            IDENTITY (1, 1) NOT NULL,
    [Code]            VARCHAR (50)   NULL,
    [LongName]        VARCHAR (500)  NOT NULL,
    [BusinessKey]     NVARCHAR (400) NOT NULL,
    [Programme_ID]    INT            NULL,
    [ShortName]       VARCHAR (50)   NOT NULL,
    [TextDescription] VARCHAR (4000) NULL,
    [Active]          INT            DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]   VARCHAR (255)  CONSTRAINT [DF_Sector_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]   DATETIME       CONSTRAINT [DF_Sector_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  VARCHAR (255)  CONSTRAINT [DF_Sector_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]  DATETIME       CONSTRAINT [DF_Sector_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [LocalLongName]   NVARCHAR (500) NULL,
    [LocalShortName]  NVARCHAR (50)  NULL,
    CONSTRAINT [PK_Sector_] PRIMARY KEY CLUSTERED ([Sector_ID] ASC),
    CONSTRAINT [FK_Sector_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_Sector_Programme] FOREIGN KEY ([Programme_ID]) REFERENCES [app].[Programme] ([Programme_ID])
);


























GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'ShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'ShortName';


GO
EXECUTE sp_addextendedproperty @name = N'CoalesceFieldsInView', @value = N'true', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Sector';


GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Sector_BusinessKey]
    ON [app].[Sector]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_SubSector_Shortname] ON [app].[SubSector]
(
	[Sector_ID] ASC
	, [Shortname]
)
WHERE ([Active]>=(0))

GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Sector', @level2type = N'COLUMN', @level2name = N'BusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'2', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Sector';


GO
EXECUTE sp_addextendedproperty @name = N'ExcludeFromOLAPViews', @value = N'true', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Sector';


GO
EXECUTE sp_addextendedproperty @name = N'ExcludeFromCube', @value = N'true', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Sector';

