CREATE TABLE [app].[Impact] (
    [Impact_ID]       INT            IDENTITY (1, 1) NOT NULL,
    [Code]            VARCHAR (50)   NOT NULL,
    [LongName]        VARCHAR (500)  NOT NULL,
    [BusinessKey]     NVARCHAR (400) NOT NULL,
    [ShortName]       VARCHAR (50)   NOT NULL,
    [TextDescription] VARCHAR (4000) NULL,
    [ImpactSiteName]  NVARCHAR (50)  NULL,
    [DataVersion]     INT            DEFAULT ((0)) NOT NULL,
    [Active]          INT            CONSTRAINT [DF_Impact_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]   VARCHAR (255)  CONSTRAINT [DF_Impact_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]   DATETIME       CONSTRAINT [DF_Impact_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  VARCHAR (255)  CONSTRAINT [DF_Impact_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]  DATETIME       CONSTRAINT [DF_Impact_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [LocalLongName]   NVARCHAR (500) NULL,
    [LocalShortName]  NVARCHAR (50)  NULL,
    CONSTRAINT [PK_Impact] PRIMARY KEY CLUSTERED ([Impact_ID] ASC),
    CONSTRAINT [FK_Impact_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_Impact_DataVersion] FOREIGN KEY ([DataVersion]) REFERENCES [Core].[DataVersion] ([DataVersion_ID]),
    CONSTRAINT [UQ_Impact_Code] UNIQUE NONCLUSTERED ([Code] ASC)
);






















GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Impact_BusinessKey]
    ON [app].[Impact]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Impact', @level2type = N'COLUMN', @level2name = N'BusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'2', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Impact';


GO
EXECUTE sp_addextendedproperty @name = N'ExcludeFromOLAPViews', @value = N'true', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Impact';

