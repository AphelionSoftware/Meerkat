CREATE TABLE [Core].[OrganizationPersonRole] (
    [OrganizationPersonRole_ID] INT           IDENTITY (1, 1) NOT NULL,
    [Person_ID]                 INT           NULL,
    [Role_ID]                   INT           NULL,
    [Organization_ID]           INT           NULL,
    [StartDate]                 DATETIME2 (7) NULL,
    [EndDate]                   DATETIME2 (7) NULL,
    [Active]                    INT           CONSTRAINT [DF_OrganizationPersonRole_Active] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]             VARCHAR (255) CONSTRAINT [DF_OrganizationPersonRole_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]             DATETIME      CONSTRAINT [DF_OrganizationPersonRole_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]            VARCHAR (255) CONSTRAINT [DF_OrganizationPersonRole_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]            DATETIME      CONSTRAINT [DF_OrganizationPersonRole_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_OrganizationPersonRole] PRIMARY KEY CLUSTERED ([OrganizationPersonRole_ID] ASC),
    CONSTRAINT [FK_OrganizationPersonRole_ActiveType] FOREIGN KEY ([Active]) REFERENCES [Core].[ActiveType] ([ID]),
    CONSTRAINT [FK_OrganizationPersonRole_Organization] FOREIGN KEY ([Organization_ID]) REFERENCES [Core].[Organization] ([Organization_ID]),
    CONSTRAINT [FK_OrganizationPersonRole_Person] FOREIGN KEY ([Person_ID]) REFERENCES [Core].[Person] ([Person_ID]),
    CONSTRAINT [FK_OrganizationPersonRole_Role] FOREIGN KEY ([Role_ID]) REFERENCES [Core].[Role] ([RoleID])
);




GO
EXECUTE sp_addextendedproperty @name = N'RelationshipDepth', @value = N'3', @level0type = N'SCHEMA', @level0name = N'Core', @level1type = N'TABLE', @level1name = N'OrganizationPersonRole';

