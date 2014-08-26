CREATE TABLE [Core].[Location] (
    [Location_ID]       INT               IDENTITY (1, 1) NOT NULL,
    [Code]              VARCHAR (50)      NOT NULL,
    [Name]              VARCHAR (255)     NULL,
    [AreaKM]            DECIMAL (18, 2)   NULL,
    [Population]        DECIMAL (18, 2)   NULL,
    [Density]           VARCHAR (MAX)     NULL,
    [BusinessKey]       NVARCHAR (400)    NOT NULL,
    [LocationType_ID]   INT               NULL,
    [ParentLocation_ID] INT               NULL,
    [Geog]              [sys].[geography] NULL,
    [Active]            INT               CONSTRAINT [DF_Location_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]     VARCHAR (255)     CONSTRAINT [DF_Location_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]     DATETIME          CONSTRAINT [DF_Location_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]    VARCHAR (255)     CONSTRAINT [DF_Location_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]    DATETIME          CONSTRAINT [DF_Location_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [LocalName]         NVARCHAR (255)    NULL,
    CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED ([Location_ID] ASC),
    CONSTRAINT [FK_Location_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_Location_LocationType] FOREIGN KEY ([LocationType_ID]) REFERENCES [Core].[LocationType] ([LocationType_ID]),
    CONSTRAINT [FK_Location_ParentLocation] FOREIGN KEY ([ParentLocation_ID]) REFERENCES [Core].[Location] ([Location_ID]),
    CONSTRAINT [UQ_Location_Code] UNIQUE NONCLUSTERED ([ParentLocation_ID] ASC, [Code] ASC)
);






















GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Location_BusinessKey]
    ON [Core].[Location]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'Core', @level1type = N'TABLE', @level1name = N'Location', @level2type = N'COLUMN', @level2name = N'BusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'2', @level0type = N'SCHEMA', @level0name = N'Core', @level1type = N'TABLE', @level1name = N'Location';


GO


