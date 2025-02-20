USE [MeerKat]
GO
/****** Object:  Table [app].[Activity]    Script Date: 2013-03-06 08:42:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[app].[Activity]') AND type in (N'U'))
BEGIN
CREATE TABLE [app].[Activity](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ActivityID] [nvarchar](255) NOT NULL,
	[ActivityName] [nvarchar](255) NOT NULL,
	[ActivityOwnerID] [nvarchar](255) NOT NULL,
	[ActivityDepID] [nvarchar](255) NOT NULL,
	[ActivityDescription] [nvarchar](max) NOT NULL,
	[ActivityParentID] [nvarchar](255) NULL,
	[ActivityTypeID] [nvarchar](255) NOT NULL,
	[ProjectParentID] [nvarchar](255) NOT NULL,
	[sys_created] [datetime] NOT NULL,
	[sys_modified] [datetime] NOT NULL,
	[sys_createdBy] [nvarchar](255) NOT NULL,
	[sys_ModifiedBy] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Activity_1] PRIMARY KEY CLUSTERED 
(
	[ActivityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[app].[DF_Activity_ActivityID]') AND type = 'D')
BEGIN
ALTER TABLE [app].[Activity] ADD  CONSTRAINT [DF_Activity_ActivityID]  DEFAULT (newid()) FOR [ActivityID]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[app].[DF_Activity_sys_created]') AND type = 'D')
BEGIN
ALTER TABLE [app].[Activity] ADD  CONSTRAINT [DF_Activity_sys_created]  DEFAULT (getdate()) FOR [sys_created]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[app].[DF_Activity_sys_modified]') AND type = 'D')
BEGIN
ALTER TABLE [app].[Activity] ADD  CONSTRAINT [DF_Activity_sys_modified]  DEFAULT (getdate()) FOR [sys_modified]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[app].[FK_Activity_Department]') AND parent_object_id = OBJECT_ID(N'[app].[Activity]'))
ALTER TABLE [app].[Activity]  WITH NOCHECK ADD  CONSTRAINT [FK_Activity_Department] FOREIGN KEY([ActivityDepID])
REFERENCES [Core].[Department] ([DepartmentID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[app].[FK_Activity_Department]') AND parent_object_id = OBJECT_ID(N'[app].[Activity]'))
ALTER TABLE [app].[Activity] NOCHECK CONSTRAINT [FK_Activity_Department]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[app].[FK_Activity_Project]') AND parent_object_id = OBJECT_ID(N'[app].[Activity]'))
ALTER TABLE [app].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_Project] FOREIGN KEY([ProjectParentID])
REFERENCES [app].[Project] ([ProjectID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[app].[FK_Activity_Project]') AND parent_object_id = OBJECT_ID(N'[app].[Activity]'))
ALTER TABLE [app].[Activity] CHECK CONSTRAINT [FK_Activity_Project]
GO
