USE [MeerKat]
GO
/****** Object:  Table [Core].[Department]    Script Date: 2013-03-06 08:42:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Core].[Department]') AND type in (N'U'))
BEGIN
CREATE TABLE [Core].[Department](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentID] [nvarchar](255) NOT NULL,
	[DepartmentName] [nvarchar](255) NOT NULL,
	[DepartmentTypeID] [int] NOT NULL,
	[DepartmentGeographyID] [geography] NULL,
	[DepartmentParentID] [nvarchar](255) NULL,
	[DepartmentOwnerID] [nvarchar](255) NULL,
	[sys_createdOn] [datetime] NOT NULL,
	[sys_modifiedOn] [datetime] NOT NULL,
	[sys_CreatedBy] [nvarchar](255) NOT NULL,
	[sys_ModifiedBy] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[Core].[DF_Department_DepartmentID]') AND type = 'D')
BEGIN
ALTER TABLE [Core].[Department] ADD  CONSTRAINT [DF_Department_DepartmentID]  DEFAULT (newid()) FOR [DepartmentID]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[Core].[DF_Department_sys_createdOn]') AND type = 'D')
BEGIN
ALTER TABLE [Core].[Department] ADD  CONSTRAINT [DF_Department_sys_createdOn]  DEFAULT (getdate()) FOR [sys_createdOn]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[Core].[DF_Department_sys_modifiedOn]') AND type = 'D')
BEGIN
ALTER TABLE [Core].[Department] ADD  CONSTRAINT [DF_Department_sys_modifiedOn]  DEFAULT (getdate()) FOR [sys_modifiedOn]
END

GO
