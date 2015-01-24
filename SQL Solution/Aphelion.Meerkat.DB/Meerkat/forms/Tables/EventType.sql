CREATE TABLE [forms].[EventType] (
    [EventType_ID]    INT            IDENTITY (1, 1) NOT NULL,
    [Name]            VARCHAR (255)  NOT NULL,
    [Code]            VARCHAR (50)   NOT NULL,
    [TextDescription] VARCHAR (4000) NULL,
    [Active]          INT            CONSTRAINT [DF__EventType_sys_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]   VARCHAR (255)  CONSTRAINT [DF_EventType_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]   DATETIME       CONSTRAINT [DF_EventType_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  VARCHAR (255)  CONSTRAINT [DF_EventType_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]  DATETIME       CONSTRAINT [DF_EventType_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [LocalName]       NVARCHAR (255) NULL,
    CONSTRAINT [PK_EventType_3] PRIMARY KEY CLUSTERED ([EventType_ID] ASC),
    CONSTRAINT [FK_EventType_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [UQ__eVENTtYPE] UNIQUE NONCLUSTERED ([Code] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'1', @level0type = N'SCHEMA', @level0name = N'forms', @level1type = N'TABLE', @level1name = N'EventType';

