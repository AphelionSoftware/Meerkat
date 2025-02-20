USE [MeerKat]
GO
/****** Object:  Table [Core].[AttributeType]    Script Date: 2013-03-06 08:42:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Core].[AttributeType]') AND type in (N'U'))
BEGIN
CREATE TABLE [Core].[AttributeType](
	[IDSK] [int] IDENTITY(1,1) NOT NULL,
	[ID] [int] NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
	[TypeDesk] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_AttributeType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
