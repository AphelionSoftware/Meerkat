USE [MeerKat]
GO
/****** Object:  Table [app].[Attributes]    Script Date: 2013-03-06 08:42:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[app].[Attributes]') AND type in (N'U'))
BEGIN
CREATE TABLE [app].[Attributes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ParentID] [nvarchar](255) NOT NULL,
	[AttributeTypeID] [int] NOT NULL,
	[AttributeName] [nvarchar](250) NULL,
	[AttributeStrVal] [nvarchar](max) NULL,
	[AttributenumericalVal] [numeric](18, 5) NULL,
	[AttributeDateTimeVal] [datetime] NULL,
	[sys_created] [datetime] NOT NULL,
	[sys_modified] [datetime] NOT NULL,
	[sys_createdBy] [nvarchar](255) NOT NULL,
	[sys_ModifiedBy] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Attributes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[app].[FK_Attributes_AttributeType]') AND parent_object_id = OBJECT_ID(N'[app].[Attributes]'))
ALTER TABLE [app].[Attributes]  WITH CHECK ADD  CONSTRAINT [FK_Attributes_AttributeType] FOREIGN KEY([AttributeTypeID])
REFERENCES [Core].[AttributeType] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[app].[FK_Attributes_AttributeType]') AND parent_object_id = OBJECT_ID(N'[app].[Attributes]'))
ALTER TABLE [app].[Attributes] CHECK CONSTRAINT [FK_Attributes_AttributeType]
GO
