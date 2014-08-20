CREATE TABLE [forms].[Form] (
    [Form_ID]           INT            IDENTITY (1, 1) NOT NULL,
    [Name]              VARCHAR (50)   NOT NULL,
    [Code]              VARCHAR (50)   NOT NULL,
    [TextDescription]   VARCHAR (4000) NULL,
    [Active]            INT            CONSTRAINT [DF__Form_sys_Active] DEFAULT ((1)) NOT NULL,
    [ProjectID]         INT            NOT NULL,
    [sys_CreatedBy]     VARCHAR (255)  CONSTRAINT [DF_Form_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]     DATETIME       CONSTRAINT [DF_Form_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]    VARCHAR (255)  CONSTRAINT [DF_Form_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]    DATETIME       CONSTRAINT [DF_Form_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    [isConfidential]    BIT            CONSTRAINT [DF_Form_isConfidential] DEFAULT ((0)) NOT NULL,
    [Location_ID]       INT            NULL,
    [Age_ID]            INT            NULL,
    [AgeBand_ID]        INT            NULL,
    [CommunityType_ID]  INT            NULL,
    [Gender_ID]         INT            NULL,
    [Group_ID]          INT            NULL,
    [Institution_ID]    INT            NULL,
    [ShowAge]           BIT            NULL,
    [ShowAgeBand]       BIT            NULL,
    [ShowCommunityType] BIT            NULL,
    [ShowGender]        BIT            NULL,
    [ShowGroup]         BIT            NULL,
    [ShowInstitution]   BIT            NULL,
    CONSTRAINT [PK_Form_3] PRIMARY KEY CLUSTERED ([Form_ID] ASC),
    CONSTRAINT [FK_Form_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_Form_Age] FOREIGN KEY ([Age_ID]) REFERENCES [disagg].[Age] ([Age_ID]),
    CONSTRAINT [FK_Form_AgeBand] FOREIGN KEY ([AgeBand_ID]) REFERENCES [disagg].[AgeBand] ([AgeBand_ID]),
    CONSTRAINT [FK_Form_CommunityType] FOREIGN KEY ([CommunityType_ID]) REFERENCES [disagg].[CommunityType] ([CommunityType_ID]),
    CONSTRAINT [FK_Form_Gender] FOREIGN KEY ([Gender_ID]) REFERENCES [disagg].[Gender] ([Gender_ID]),
    CONSTRAINT [FK_Form_Group] FOREIGN KEY ([Group_ID]) REFERENCES [disagg].[Group] ([Group_ID]),
    CONSTRAINT [FK_Form_Institution] FOREIGN KEY ([Institution_ID]) REFERENCES [disagg].[Institution] ([Institution_ID]),
    CONSTRAINT [FK_Form_Location] FOREIGN KEY ([Location_ID]) REFERENCES [Core].[Location] ([Location_ID]),
    CONSTRAINT [FK_Form_Project] FOREIGN KEY ([ProjectID]) REFERENCES [app].[Project] ([ProjectID]),
    CONSTRAINT [UQ__Form__A25C5AA73EDF24B3] UNIQUE NONCLUSTERED ([Code] ASC)
);










GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'6', @level0type = N'SCHEMA', @level0name = N'forms', @level1type = N'TABLE', @level1name = N'Form';

