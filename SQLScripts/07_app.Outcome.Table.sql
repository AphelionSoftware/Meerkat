USE [MeerKat]
GO
/****** Object:  Table [app].[Outcome]    Script Date: 2013-03-06 08:42:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[app].[Outcome]') AND type in (N'U'))
BEGIN
CREATE TABLE [app].[Outcome](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OutcomeID] [nvarchar](255) NOT NULL,
	[OutcomeName] [nvarchar](255) NOT NULL,
	[OutcomeOwnerID] [nvarchar](255) NOT NULL,
	[OutcomeDepID] [nvarchar](255) NOT NULL,
	[OutcomeDescription] [nvarchar](max) NOT NULL,
	[OutcomeParentID] [nvarchar](255) NULL,
	[OutComeTypeID] [nvarchar](255) NOT NULL,
	[sys_created] [datetime] NOT NULL,
	[sys_modified] [datetime] NOT NULL,
	[sys_createdBy] [nvarchar](255) NOT NULL,
	[sys_ModifiedBy] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Outcome_1] PRIMARY KEY CLUSTERED 
(
	[OutcomeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[app].[DF_Outcome_OutcomeID]') AND type = 'D')
BEGIN
ALTER TABLE [app].[Outcome] ADD  CONSTRAINT [DF_Outcome_OutcomeID]  DEFAULT (newid()) FOR [OutcomeID]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[app].[DF_Outcome_sys_created]') AND type = 'D')
BEGIN
ALTER TABLE [app].[Outcome] ADD  CONSTRAINT [DF_Outcome_sys_created]  DEFAULT (getdate()) FOR [sys_created]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[app].[DF_Outcome_sys_modified]') AND type = 'D')
BEGIN
ALTER TABLE [app].[Outcome] ADD  CONSTRAINT [DF_Outcome_sys_modified]  DEFAULT (getdate()) FOR [sys_modified]
END

GO
