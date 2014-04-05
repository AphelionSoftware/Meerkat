CREATE TABLE [forms].[Form] (
    [Form_ID]         INT           IDENTITY (1, 1) NOT NULL,
    [Name]            VARCHAR (50)  NOT NULL,
    [Code]            VARCHAR (50)  NOT NULL,
    [TextDescription] VARCHAR (MAX) NOT NULL,
    [Active]          INT           CONSTRAINT [DF__Form_sys_Active] DEFAULT ((1)) NOT NULL,
    [ProjectID]       INT           NOT NULL,
    [sys_CreatedBy]   VARCHAR (255) CONSTRAINT [DF_Form_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]   DATETIME      CONSTRAINT [DF_Form_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  VARCHAR (255) CONSTRAINT [DF_Form_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]  DATETIME      CONSTRAINT [DF_Form_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Form_3] PRIMARY KEY CLUSTERED ([Form_ID] ASC),
    CONSTRAINT [FK_Form_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_Form_Project] FOREIGN KEY ([ProjectID]) REFERENCES [app].[Project] ([ProjectID]),
    CONSTRAINT [UQ__Form__A25C5AA73EDF24B3] UNIQUE NONCLUSTERED ([Code] ASC)
);



