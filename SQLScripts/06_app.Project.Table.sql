USE [MeerKat]
GO
/****** Object:  Table [app].[Project]    Script Date: 2013-03-06 08:42:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[app].[Project]') AND type in (N'U'))
BEGIN
CREATE TABLE [app].[Project](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [nvarchar](255) NOT NULL,
	[ProjectName] [nvarchar](255) NOT NULL,
	[ProjectOwnerID] [nvarchar](255) NOT NULL,
	[ProjectDepID] [nvarchar](255) NOT NULL,
	[ProjectDescription] [nvarchar](max) NOT NULL,
	[ProjectParentID] [nvarchar](255) NULL,
	[ProjectTypeID] [nvarchar](255) NOT NULL,
	[OutcomeParentID] [nvarchar](255) NOT NULL,
	[sys_created] [datetime] NOT NULL,
	[sys_modified] [datetime] NOT NULL,
	[sys_createdBy] [nvarchar](255) NOT NULL,
	[sys_ModifiedBy] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[app].[DF_Project_ProjectID]') AND type = 'D')
BEGIN
ALTER TABLE [app].[Project] ADD  CONSTRAINT [DF_Project_ProjectID]  DEFAULT (newid()) FOR [ProjectID]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[app].[DF_Project_sys_created]') AND type = 'D')
BEGIN
ALTER TABLE [app].[Project] ADD  CONSTRAINT [DF_Project_sys_created]  DEFAULT (getdate()) FOR [sys_created]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[app].[DF_Project_sys_modified]') AND type = 'D')
BEGIN
ALTER TABLE [app].[Project] ADD  CONSTRAINT [DF_Project_sys_modified]  DEFAULT (getdate()) FOR [sys_modified]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[app].[FK_Project_Department]') AND parent_object_id = OBJECT_ID(N'[app].[Project]'))
ALTER TABLE [app].[Project]  WITH NOCHECK ADD  CONSTRAINT [FK_Project_Department] FOREIGN KEY([ProjectDepID])
REFERENCES [Core].[Department] ([DepartmentID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[app].[FK_Project_Department]') AND parent_object_id = OBJECT_ID(N'[app].[Project]'))
ALTER TABLE [app].[Project] NOCHECK CONSTRAINT [FK_Project_Department]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[app].[FK_Project_Outcome]') AND parent_object_id = OBJECT_ID(N'[app].[Project]'))
ALTER TABLE [app].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project_Outcome] FOREIGN KEY([OutcomeParentID])
REFERENCES [app].[Outcome] ([OutcomeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[app].[FK_Project_Outcome]') AND parent_object_id = OBJECT_ID(N'[app].[Project]'))
ALTER TABLE [app].[Project] CHECK CONSTRAINT [FK_Project_Outcome]
GO
