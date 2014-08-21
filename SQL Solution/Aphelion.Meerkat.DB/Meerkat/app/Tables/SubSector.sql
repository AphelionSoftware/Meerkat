CREATE TABLE [app].[SubSector] (
    [SubSector_ID]    INT            IDENTITY (1, 1) NOT NULL,
    [Code]            VARCHAR (50)   NULL,
    [ShortName]       VARCHAR (50)   NOT NULL,
    [BusinessKey]     NVARCHAR (400) NOT NULL,
    [Sector_ID]       INT            NOT NULL,
    [LongName]        VARCHAR (500)  NOT NULL,
    [TextDescription] VARCHAR (4000) NULL,
    [Active]          INT            DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]   VARCHAR (255)  CONSTRAINT [DF_SubSector_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]   DATETIME       CONSTRAINT [DF_SubSector_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  VARCHAR (255)  CONSTRAINT [DF_SubSector_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]  DATETIME       CONSTRAINT [DF_SubSector_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [LocalShortName]  NVARCHAR (50)  NULL,
    [LocalLongName]   NVARCHAR (500) NULL,
    CONSTRAINT [PK_SubSector] PRIMARY KEY CLUSTERED ([SubSector_ID] ASC),
    CONSTRAINT [FK_SubSector_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_SubSector_Sector] FOREIGN KEY ([Sector_ID]) REFERENCES [app].[Sector] ([Sector_ID])
);














GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'SubSector', @level2type = N'COLUMN', @level2name = N'ShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'SubSector', @level2type = N'COLUMN', @level2name = N'ShortName';


GO
EXECUTE sp_addextendedproperty @name = N'CoalesceFieldsInView', @value = N'true', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'SubSector';


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_SubSector_BusinessKey]
    ON [app].[SubSector]([BusinessKey] ASC) WHERE ([Active]>=(0));

