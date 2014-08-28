CREATE TABLE [Core].[PersonParticipationType] (
    [PersonParticipationType_ID] INT            IDENTITY (1, 1) NOT NULL,
    [Code]                       VARCHAR (50)   NULL,
    [Name]                       VARCHAR (255)  NULL,
    [BusinessKey]                NVARCHAR (400) NOT NULL,
    [Active]                     INT            CONSTRAINT [DF_PersonParticipationType_sys_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]              VARCHAR (255)  CONSTRAINT [DF_PersonParticipationType_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]              DATETIME       CONSTRAINT [DF_PersonParticipationType_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]             VARCHAR (255)  CONSTRAINT [DF_PersonParticipationType_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]             DATETIME       CONSTRAINT [DF_PersonParticipationType_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_PersonParticipationType] PRIMARY KEY CLUSTERED ([PersonParticipationType_ID] ASC),
    CONSTRAINT [FK_PersonParticipationType_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'Core', @level1type = N'TABLE', @level1name = N'PersonParticipationType', @level2type = N'COLUMN', @level2name = N'BusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'1', @level0type = N'SCHEMA', @level0name = N'Core', @level1type = N'TABLE', @level1name = N'PersonParticipationType';

