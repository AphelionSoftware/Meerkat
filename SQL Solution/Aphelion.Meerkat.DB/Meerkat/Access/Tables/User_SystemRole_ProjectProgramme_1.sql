CREATE TABLE [Access].[User_SystemRole_ProjectProgramme] (
    [User_SystemRole_ProjectProgramme_ID] INT           IDENTITY (1, 1) NOT NULL,
    [UserID]                              INT           NOT NULL,
    [SystemRole_ID]                       INT           NOT NULL,
    [ProjectID]                           INT           NULL,
    [Programme_ID]                        INT           NULL,
    [Active]                              INT           CONSTRAINT [DF__User_Syst__Activ__19E0A4C2] DEFAULT ((1)) NOT NULL,
    [sys_CreatedBy]                       VARCHAR (255) CONSTRAINT [DF_User_SystemRole_ProjectProgramme_sys_CreatedBy] DEFAULT (user_name()) NOT NULL,
    [sys_CreatedOn]                       DATETIME      CONSTRAINT [DF_User_SystemRole_ProjectProgramme_sys_CreatedOn] DEFAULT (getdate()) NOT NULL,
    [sys_ModifiedBy]                      VARCHAR (255) CONSTRAINT [DF_User_SystemRole_ProjectProgramme_sys_ModifiedBy] DEFAULT (user_name()) NOT NULL,
    [sys_ModifiedOn]                      DATETIME      CONSTRAINT [DF_User_SystemRole_ProjectProgramme_sys_ModifiedOn] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ProjectSystemRole] PRIMARY KEY NONCLUSTERED ([User_SystemRole_ProjectProgramme_ID] ASC)
);






GO
CREATE CLUSTERED INDEX [IX_User_SystemRole_ProjectProgramme]
    ON [Access].[User_SystemRole_ProjectProgramme]([UserID] ASC, [SystemRole_ID] ASC, [Programme_ID] ASC, [ProjectID] ASC);

