USE [MeerKat]
GO
/****** Object:  Table [app].[Milestone]    Script Date: 2013-03-06 08:42:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[app].[Milestone]') AND type in (N'U'))
BEGIN
CREATE TABLE [app].[Milestone](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MilestoneID] [nvarchar](255) NOT NULL,
	[MilestoneName] [nvarchar](255) NOT NULL,
	[MilestoneOwnerID] [nvarchar](255) NOT NULL,
	[MilestoneDepID] [nvarchar](255) NOT NULL,
	[MilestoneDescription] [nvarchar](max) NOT NULL,
	[MilestoneParentID] [nvarchar](255) NULL,
	[MilestoneTypeID] [nvarchar](255) NOT NULL,
	[ActivityParentID] [nvarchar](255) NOT NULL,
	[sys_created] [datetime] NOT NULL,
	[sys_modified] [datetime] NOT NULL,
	[sys_createdBy] [nvarchar](255) NOT NULL,
	[sys_ModifiedBy] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Milestone_1] PRIMARY KEY CLUSTERED 
(
	[MilestoneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[app].[DF_Milestone_MilestoneID]') AND type = 'D')
BEGIN
ALTER TABLE [app].[Milestone] ADD  CONSTRAINT [DF_Milestone_MilestoneID]  DEFAULT (newid()) FOR [MilestoneID]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[app].[DF_Milestone_sys_created]') AND type = 'D')
BEGIN
ALTER TABLE [app].[Milestone] ADD  CONSTRAINT [DF_Milestone_sys_created]  DEFAULT (getdate()) FOR [sys_created]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[app].[DF_Milestone_sys_modified]') AND type = 'D')
BEGIN
ALTER TABLE [app].[Milestone] ADD  CONSTRAINT [DF_Milestone_sys_modified]  DEFAULT (getdate()) FOR [sys_modified]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[app].[FK_Milestone_Activity]') AND parent_object_id = OBJECT_ID(N'[app].[Milestone]'))
ALTER TABLE [app].[Milestone]  WITH CHECK ADD  CONSTRAINT [FK_Milestone_Activity] FOREIGN KEY([ActivityParentID])
REFERENCES [app].[Activity] ([ActivityID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[app].[FK_Milestone_Activity]') AND parent_object_id = OBJECT_ID(N'[app].[Milestone]'))
ALTER TABLE [app].[Milestone] CHECK CONSTRAINT [FK_Milestone_Activity]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[app].[FK_Milestone_Department]') AND parent_object_id = OBJECT_ID(N'[app].[Milestone]'))
ALTER TABLE [app].[Milestone]  WITH NOCHECK ADD  CONSTRAINT [FK_Milestone_Department] FOREIGN KEY([MilestoneDepID])
REFERENCES [Core].[Department] ([DepartmentID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[app].[FK_Milestone_Department]') AND parent_object_id = OBJECT_ID(N'[app].[Milestone]'))
ALTER TABLE [app].[Milestone] NOCHECK CONSTRAINT [FK_Milestone_Department]
GO
