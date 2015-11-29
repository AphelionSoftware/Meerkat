CREATE TABLE [forms].[Form_Programme] (
    [Form_Programme_ID] INT           IDENTITY (1, 1) NOT NULL,
    [Form_ID]           INT           NULL,
    [Programme_ID]      INT           NULL,
    [Active]            INT           DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]     VARCHAR (255) CONSTRAINT [DF_Form_Programme_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]     DATETIME      CONSTRAINT [DF_Form_Programme_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]    VARCHAR (255) CONSTRAINT [DF_Form_Programme_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]    DATETIME      CONSTRAINT [DF_Form_Programme_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ProgrammeForm] PRIMARY KEY CLUSTERED ([Form_Programme_ID] ASC),
    CONSTRAINT [FK_Form_Programme_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_Form_Programme_Form] FOREIGN KEY ([Form_ID]) REFERENCES [forms].[Form] ([Form_ID]),
    CONSTRAINT [FK_Form_Programme_Programme] FOREIGN KEY ([Programme_ID]) REFERENCES [app].[Programme] ([Programme_ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'5', @level0type = N'SCHEMA', @level0name = N'forms', @level1type = N'TABLE', @level1name = N'Form_Programme';

