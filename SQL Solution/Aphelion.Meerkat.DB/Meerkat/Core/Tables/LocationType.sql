CREATE TABLE [Core].[LocationType] (
    [LocationType_ID] INT            IDENTITY (1, 1) NOT NULL,
    [Code]            VARCHAR (50)   NOT NULL,
    [Name]            VARCHAR (255)  NULL,
    [Description]     VARCHAR (MAX)  NOT NULL,
    [BusinessKey]     NVARCHAR (400) NOT NULL,
    [Active]          INT            CONSTRAINT [DF_LocationType_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]   VARCHAR (255)  CONSTRAINT [DF_LocationType_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]   DATETIME       CONSTRAINT [DF_LocationType_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  VARCHAR (255)  CONSTRAINT [DF_LocationType_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]  DATETIME       CONSTRAINT [DF_LocationType_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [LocalName]       NVARCHAR (255) NULL,
    CONSTRAINT [PK_LocationType] PRIMARY KEY CLUSTERED ([LocationType_ID] ASC),
    CONSTRAINT [FK_LocationType_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [UQ_LocationType_Code] UNIQUE NONCLUSTERED ([Code] ASC),
    CONSTRAINT [UQ_LocationType_Name] UNIQUE NONCLUSTERED ([Name] ASC)
);









GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_LocationType_BusinessKey]
    ON [Core].[LocationType]([BusinessKey] ASC) WHERE ([Active]>=(0));

