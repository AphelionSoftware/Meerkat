CREATE TABLE [app].[OutputOutputLink] (
    [OutputOutputLink_ID] INT           IDENTITY (1, 1) NOT NULL,
    [PrimaryOutput_ID]    INT           NOT NULL,
    [SecondaryOutput_ID]  INT           NOT NULL,
    [Active]              INT           DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]       VARCHAR (255) CONSTRAINT [DF_OutputOutputLink_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]       DATETIME      CONSTRAINT [DF_OutputOutputLink_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]      VARCHAR (255) CONSTRAINT [DF_OutputOutputLink_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]      DATETIME      CONSTRAINT [DF_OutputOutputLink_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_OutputOutputLink] PRIMARY KEY CLUSTERED ([OutputOutputLink_ID] ASC),
    CONSTRAINT [FK_OutputOutputLink_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_OutputOutputLink_Output] FOREIGN KEY ([PrimaryOutput_ID]) REFERENCES [app].[Output] ([Output_ID]),
    CONSTRAINT [FK_OutputOutputLink_Output1] FOREIGN KEY ([SecondaryOutput_ID]) REFERENCES [app].[Output] ([Output_ID])
);

