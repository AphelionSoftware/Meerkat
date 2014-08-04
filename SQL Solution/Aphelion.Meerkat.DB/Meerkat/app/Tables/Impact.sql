CREATE TABLE [app].[Impact] (
    [Impact_ID]       INT            IDENTITY (1, 1) NOT NULL,
    [Code]            VARCHAR (50)   NOT NULL,
    [LongName]        NVARCHAR (500) NOT NULL,
    [BusinessKey]     NVARCHAR (400) NOT NULL,
    [ShortName]       NVARCHAR (50)  NOT NULL,
    [TextDescription] NVARCHAR (MAX) NULL,
    [ImpactSiteName]  NVARCHAR (50)  NULL,
    [DataVersion]     INT            DEFAULT ((0)) NOT NULL,
    [Active]          INT            CONSTRAINT [DF_Impact_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]   VARCHAR (255)  CONSTRAINT [DF_Impact_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]   DATETIME       CONSTRAINT [DF_Impact_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  VARCHAR (255)  CONSTRAINT [DF_Impact_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]  DATETIME       CONSTRAINT [DF_Impact_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Impact] PRIMARY KEY CLUSTERED ([Impact_ID] ASC),
    CONSTRAINT [FK_Impact_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_Impact_DataVersion] FOREIGN KEY ([DataVersion]) REFERENCES [Core].[DataVersion] ([DataVersion_ID]),
    CONSTRAINT [UQ_Impact_BusinessKey] UNIQUE NONCLUSTERED ([BusinessKey] ASC),
    CONSTRAINT [UQ_Impact_Code] UNIQUE NONCLUSTERED ([Code] ASC)
);





