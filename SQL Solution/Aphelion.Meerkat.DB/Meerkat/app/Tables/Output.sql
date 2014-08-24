CREATE TABLE [app].[Output] (
    [Output_ID]       INT            IDENTITY (1, 1) NOT NULL,
    [Code]            VARCHAR (50)   NOT NULL,
    [LongName]        VARCHAR (500)  NOT NULL,
    [BusinessKey]     NVARCHAR (400) NOT NULL,
    [Outcome_ID]      INT            NOT NULL,
    [ShortName]       VARCHAR (50)   NOT NULL,
    [TextDescription] VARCHAR (4000) NULL,
    [Active]          INT            CONSTRAINT [DF_Output_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]   VARCHAR (255)  CONSTRAINT [DF_Output_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]   DATETIME       CONSTRAINT [DF_Output_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]  VARCHAR (255)  CONSTRAINT [DF_Output_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]  DATETIME       CONSTRAINT [DF_Output_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [LocalLongName]   NVARCHAR (500) NULL,
    [LocalShortName]  NVARCHAR (50)  NULL,
    [Export]          BIT            DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Output_] PRIMARY KEY CLUSTERED ([Output_ID] ASC),
    CONSTRAINT [FK_Output_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_Output_Outcome] FOREIGN KEY ([Outcome_ID]) REFERENCES [app].[Outcome] ([Outcome_ID]),
    CONSTRAINT [UQ_Output_Code] UNIQUE NONCLUSTERED ([Code] ASC)
);


















GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Output_BusinessKey]
    ON [app].[Output]([BusinessKey] ASC) WHERE ([Active]>=(0));


GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Output', @level2type = N'COLUMN', @level2name = N'BusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'4', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Output';


GO
EXECUTE sp_addextendedproperty @name = N'ExcludeFromStaging', @value = N'true', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'TABLE', @level1name = N'Output', @level2type = N'COLUMN', @level2name = N'Export';

