CREATE TABLE [Core].[Location] (
    [Location_ID]       INT               IDENTITY (1, 1) NOT NULL,
    [Code]              VARCHAR (50)      NOT NULL,
    [Name]              VARCHAR (255)     NOT NULL,
    [Area]              VARCHAR (MAX)     NULL,
    [Density]           VARCHAR (MAX)     NULL,
    [BusinessKey]       NVARCHAR (MAX)    NULL,
    [LocationType_ID]   INT               NULL,
    [ParentLocation_ID] INT               NULL,
    [Geog]              [sys].[geography] NULL,
    [Active]            INT               CONSTRAINT [DF__Location__sys_Ac__36470DEF] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]     VARCHAR (255)     CONSTRAINT [DF_Location_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]     DATETIME          CONSTRAINT [DF_Location_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]    VARCHAR (255)     CONSTRAINT [DF_Location_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]    DATETIME          CONSTRAINT [DF_Location_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED ([Location_ID] ASC),
    CONSTRAINT [FK_Location_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_Location_LocationType] FOREIGN KEY ([LocationType_ID]) REFERENCES [Core].[LocationType] ([LocationType_ID]),
    UNIQUE NONCLUSTERED ([Code] ASC),
    UNIQUE NONCLUSTERED ([Code] ASC)
);



