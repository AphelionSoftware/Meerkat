CREATE TABLE [forms].[Form_Event] (
    [Form_Event_ID]  INT           IDENTITY (1, 1) NOT NULL,
    [Form_ID]        INT           NULL,
    [Event_ID]       INT           NULL,
    [Active]         INT           DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]  VARCHAR (255) CONSTRAINT [DF_Form_Event_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]  DATETIME      CONSTRAINT [DF_Form_Event_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy] VARCHAR (255) CONSTRAINT [DF_Form_Event_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn] DATETIME      CONSTRAINT [DF_Form_Event_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_EventForm] PRIMARY KEY CLUSTERED ([Form_Event_ID] ASC),
    CONSTRAINT [FK_Form_Event_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_Form_Event_Form] FOREIGN KEY ([Form_ID]) REFERENCES [forms].[Form] ([Form_ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'5', @level0type = N'SCHEMA', @level0name = N'forms', @level1type = N'TABLE', @level1name = N'Form_Event';

