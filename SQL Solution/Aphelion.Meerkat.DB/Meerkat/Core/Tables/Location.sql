CREATE TABLE [Core].[Location] (
    [Location_ID]       INT               IDENTITY (1, 1) NOT NULL,
    [Code]              VARCHAR (50)      NOT NULL,
    [Name]              VARCHAR (255)     NOT NULL,
    [AreaKM]            DECIMAL (18, 2)   NULL,
    [Population]        DECIMAL (18, 2)   NULL,
    [Density]           VARCHAR (MAX)     NULL,
    [BusinessKey]       NVARCHAR (4000)   NOT NULL,
    [LocationType_ID]   INT               NULL,
    [ParentLocation_ID] INT               NULL,
    [Geog]              [sys].[geography] NULL,
    [Active]            INT               CONSTRAINT [DF_Location_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]     VARCHAR (255)     CONSTRAINT [DF_Location_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]     DATETIME          CONSTRAINT [DF_Location_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]    VARCHAR (255)     CONSTRAINT [DF_Location_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]    DATETIME          CONSTRAINT [DF_Location_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED ([Location_ID] ASC),
    CONSTRAINT [FK_Location_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_Location_LocationType] FOREIGN KEY ([LocationType_ID]) REFERENCES [Core].[LocationType] ([LocationType_ID]),
    CONSTRAINT [FK_Location_ParentLocation] FOREIGN KEY ([ParentLocation_ID]) REFERENCES [Core].[Location] ([Location_ID]),
    CONSTRAINT [UQ_Location_BusinessKey] UNIQUE NONCLUSTERED ([BusinessKey] ASC),
    CONSTRAINT [UQ_Location_Code] UNIQUE NONCLUSTERED ([ParentLocation_ID] ASC, [Code] ASC)
);





