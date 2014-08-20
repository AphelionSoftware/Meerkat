CREATE TABLE [app].[SubOutputSubOutputLink] (
    [SubOutputSubOutputLink_ID] INT           IDENTITY (1, 1) NOT NULL,
    [PrimarySubOutput_ID]       INT           NOT NULL,
    [SecondarySubOutput_ID]     INT           NOT NULL,
    [Active]                    INT           CONSTRAINT [DF_SubOutputSubOutputLink_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]             VARCHAR (255) CONSTRAINT [DF_SubOutputSubOutputLink_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]             DATETIME      CONSTRAINT [DF_SubOutputSubOutputLink_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]            VARCHAR (255) CONSTRAINT [DF_SubOutputSubOutputLink_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]            DATETIME      CONSTRAINT [DF_SubOutputSubOutputLink_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_SubOutputSubOutputLink] PRIMARY KEY CLUSTERED ([SubOutputSubOutputLink_ID] ASC),
    CONSTRAINT [FK_SubOutputSubOutputLink_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_SubOutputSubOutputLink_SubOutput] FOREIGN KEY ([PrimarySubOutput_ID]) REFERENCES [app].[SubOutput] ([SubOutput_ID]),
    CONSTRAINT [FK_SubOutputSubOutputLink_SubOutput1] FOREIGN KEY ([SecondarySubOutput_ID]) REFERENCES [app].[SubOutput] ([SubOutput_ID]) NOT FOR REPLICATION
);


GO
ALTER TABLE [app].[SubOutputSubOutputLink] NOCHECK CONSTRAINT [FK_SubOutputSubOutputLink_SubOutput1];




GO
ALTER TABLE [app].[SubOutputSubOutputLink] NOCHECK CONSTRAINT [FK_SubOutputSubOutputLink_SubOutput1];




GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'6', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'SubOutputSubOutputLink';

