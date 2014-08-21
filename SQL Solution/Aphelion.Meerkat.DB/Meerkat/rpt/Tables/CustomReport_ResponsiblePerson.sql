CREATE TABLE [rpt].[CustomReport_ResponsiblePerson] (
    [CustomReport_ResponsiblePerson_ID] INT           IDENTITY (1, 1) NOT NULL,
    [CustomReport_ID]                   INT           NULL,
    [ResponsiblePerson_ID]              INT           NULL,
    [isPrimary]                         BIT           CONSTRAINT [DF_CustomReport_ResponsiblePerson_isPrimary] DEFAULT ((0)) NOT NULL,
    [Active]                            INT           CONSTRAINT [DF__CustomRep__Activ__30992191] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]                     VARCHAR (255) CONSTRAINT [DF_CustomReport_ResponsiblePerson_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]                     DATETIME      CONSTRAINT [DF_CustomReport_ResponsiblePerson_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]                    VARCHAR (255) CONSTRAINT [DF_CustomReport_ResponsiblePerson_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]                    DATETIME      CONSTRAINT [DF_CustomReport_ResponsiblePerson_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ResponsiblePersonCustomReport] PRIMARY KEY CLUSTERED ([CustomReport_ResponsiblePerson_ID] ASC),
    CONSTRAINT [FK_CustomReport_ResponsiblePerson_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_CustomReport_ResponsiblePerson_CustomReport] FOREIGN KEY ([CustomReport_ID]) REFERENCES [rpt].[CustomReport] ([CustomReport_ID]),
    CONSTRAINT [FK_CustomReport_ResponsiblePerson_ResponsiblePerson] FOREIGN KEY ([ResponsiblePerson_ID]) REFERENCES [Core].[Person] ([Person_ID])
);






GO


