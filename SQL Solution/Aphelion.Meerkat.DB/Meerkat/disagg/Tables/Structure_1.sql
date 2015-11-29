CREATE TABLE [disagg].[Structure] (
    [Structure_ID]     INT               IDENTITY (1, 1) NOT NULL,
    [Code]             VARCHAR (50)      NOT NULL,
    [Name]             VARCHAR (255)     NOT NULL,
    [BusinessKey]      NVARCHAR (400)    NOT NULL,
    [TextDescription]  VARCHAR (4000)    NULL,
    [Active]           INT               CONSTRAINT [DF__Structure__Active__39D87308] DEFAULT ((1)) NOT NULL,
    [StructureType_ID] INT               NOT NULL,
    [Institution_ID]   INT               NULL,
    [Location_ID]      INT               NOT NULL,
    [sys_CreatedBy]    VARCHAR (255)     CONSTRAINT [DF_Structure_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]    DATETIME          CONSTRAINT [DF_Structure_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]   VARCHAR (255)     CONSTRAINT [DF_Structure_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]   DATETIME          CONSTRAINT [DF_Structure_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [LocalName]        NVARCHAR (255)    NULL,
    [geog]             [sys].[geography] NULL,
    CONSTRAINT [PK_Structure] PRIMARY KEY CLUSTERED ([Structure_ID] ASC),
    CONSTRAINT [FK_Structure_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_Structure_Institution] FOREIGN KEY ([Institution_ID]) REFERENCES [disagg].[Institution] ([Institution_ID]),
    CONSTRAINT [FK_Structure_Location] FOREIGN KEY ([Location_ID]) REFERENCES [Core].[Location] ([Location_ID]),
    CONSTRAINT [FK_Structure_StructureType] FOREIGN KEY ([StructureType_ID]) REFERENCES [disagg].[StructureType] ([StructureType_ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'disagg', @level1type = N'TABLE', @level1name = N'Structure', @level2type = N'COLUMN', @level2name = N'BusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'2', @level0type = N'SCHEMA', @level0name = N'disagg', @level1type = N'TABLE', @level1name = N'Structure';

