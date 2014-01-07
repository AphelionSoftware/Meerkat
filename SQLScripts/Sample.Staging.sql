USE [master]
GO
/****** Object:  Database [MeerkatStaging]    Script Date: 2014-01-06 09:23:10 PM ******/
CREATE DATABASE [MeerkatStaging]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MeerkatStaging', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQL2012\MSSQL\DATA\MeerkatStaging.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MeerkatStaging_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQL2012\MSSQL\DATA\MeerkatStaging_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MeerkatStaging] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MeerkatStaging].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MeerkatStaging] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MeerkatStaging] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MeerkatStaging] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MeerkatStaging] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MeerkatStaging] SET ARITHABORT OFF 
GO
ALTER DATABASE [MeerkatStaging] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MeerkatStaging] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [MeerkatStaging] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MeerkatStaging] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MeerkatStaging] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MeerkatStaging] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MeerkatStaging] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MeerkatStaging] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MeerkatStaging] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MeerkatStaging] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MeerkatStaging] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MeerkatStaging] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MeerkatStaging] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MeerkatStaging] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MeerkatStaging] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MeerkatStaging] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MeerkatStaging] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MeerkatStaging] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MeerkatStaging] SET RECOVERY FULL 
GO
ALTER DATABASE [MeerkatStaging] SET  MULTI_USER 
GO
ALTER DATABASE [MeerkatStaging] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MeerkatStaging] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MeerkatStaging] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MeerkatStaging] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MeerkatStaging', N'ON'
GO
USE [MeerkatStaging]
GO
/****** Object:  Schema [Staging]    Script Date: 2014-01-06 09:23:10 PM ******/
CREATE SCHEMA [Staging]
GO
/****** Object:  Table [Staging].[ActiveType]    Script Date: 2014-01-06 09:23:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staging].[ActiveType](
	[Code] [varchar](50) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[sys_CreatedBy] [varchar](255) NOT NULL,
	[sys_ModifiedBy] [varchar](255) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staging].[Activity]    Script Date: 2014-01-06 09:23:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staging].[Activity](
	[ShortName] [varchar](50) NOT NULL,
	[LongName] [varchar](500) NOT NULL,
	[TextDescription] [varchar](max) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[sys_CreatedBy] [varchar](255) NOT NULL,
	[sys_ModifiedBy] [varchar](255) NOT NULL,
	[ProjectBusinessKey] [varchar](255) NOT NULL,
	[ActiveTypeBusinessKey] [varchar](255) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staging].[DataSource]    Script Date: 2014-01-06 09:23:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staging].[DataSource](
	[Name] [varchar](255) NOT NULL,
	[ContactDetails] [varchar](max) NULL,
	[Custodian] [varchar](max) NULL,
	[Format] [varchar](max) NULL,
	[CollectionMethod] [varchar](max) NULL,
	[MetadataStatus] [varchar](max) NULL,
	[BusinessKey] [varchar](max) NULL,
	[sys_CreatedBy] [varchar](255) NOT NULL,
	[sys_ModifiedBy] [varchar](255) NOT NULL,
	[ActiveTypeBusinessKey] [varchar](255) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staging].[DataVersion]    Script Date: 2014-01-06 09:23:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staging].[DataVersion](
	[Code] [varchar](50) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[sys_CreatedBy] [varchar](255) NOT NULL,
	[sys_ModifiedBy] [varchar](255) NOT NULL,
	[ActiveTypeBusinessKey] [varchar](255) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staging].[DimDate]    Script Date: 2014-01-06 09:23:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staging].[DimDate](
	[USDayOfWeek] [varchar](9) NOT NULL,
	[DayOfWeek] [varchar](9) NOT NULL,
	[MonthName] [varchar](9) NOT NULL,
	[QuarterName] [varchar](255) NOT NULL,
	[StandardDate] [varchar](10) NULL,
	[HolidayText] [varchar](50) NULL,
	[sys_CreatedBy] [varchar](255) NOT NULL,
	[sys_ModifiedBy] [varchar](255) NOT NULL,
	[ActiveTypeBusinessKey] [varchar](255) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staging].[DimMunicipalityGEOM]    Script Date: 2014-01-06 09:23:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staging].[DimMunicipalityGEOM](
	[ID] [bigint] NULL,
	[LBL] [nvarchar](255) NULL,
	[FIP] [nvarchar](255) NULL,
	[MMT_ID] [nvarchar](255) NULL,
	[SHORT__FRM] [nvarchar](255) NULL,
	[LONG_FRM] [nvarchar](255) NULL,
	[ADM0] [nvarchar](255) NULL,
	[ADM1] [nvarchar](255) NULL,
	[ADM2] [nvarchar](255) NULL,
	[ADM3] [nvarchar](255) NULL,
	[ADM4] [nvarchar](255) NULL,
	[ADM5] [nvarchar](255) NULL,
	[sys_CreatedBy] [varchar](255) NOT NULL,
	[sys_ModifiedBy] [varchar](255) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staging].[Indicator]    Script Date: 2014-01-06 09:23:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staging].[Indicator](
	[LongName] [varchar](500) NOT NULL,
	[TextDescription] [varchar](max) NULL,
	[Baseline] [decimal](20, 5) NULL,
	[BaselineString] [varchar](max) NULL,
	[Target] [decimal](20, 5) NULL,
	[TargetString] [varchar](max) NULL,
	[BusinessKey] [nvarchar](max) NULL,
	[Notes] [nvarchar](max) NULL,
	[Code] [varchar](50) NOT NULL,
	[ShortName] [varchar](50) NOT NULL,
	[UnitOfMeasure] [varchar](50) NOT NULL,
	[sys_CreatedBy] [varchar](255) NOT NULL,
	[sys_ModifiedBy] [varchar](255) NOT NULL,
	[IndicatorTypeBusinessKey] [varchar](255) NOT NULL,
	[OutcomeBusinessKey] [varchar](255) NOT NULL,
	[OutputBusinessKey] [varchar](255) NOT NULL,
	[SubOutputBusinessKey] [varchar](255) NOT NULL,
	[ActiveTypeBusinessKey] [varchar](255) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staging].[IndicatorLocation]    Script Date: 2014-01-06 09:23:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staging].[IndicatorLocation](
	[sys_CreatedBy] [varchar](255) NOT NULL,
	[sys_ModifiedBy] [varchar](255) NOT NULL,
	[IndicatorBusinessKey] [varchar](255) NOT NULL,
	[ActiveTypeBusinessKey] [varchar](255) NOT NULL,
	[LocationBusinessKey] [varchar](255) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staging].[IndicatorType]    Script Date: 2014-01-06 09:23:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staging].[IndicatorType](
	[Code] [varchar](50) NOT NULL,
	[Name] [varchar](255) NULL,
	[sys_CreatedBy] [varchar](255) NOT NULL,
	[sys_ModifiedBy] [varchar](255) NOT NULL,
	[ActiveTypeBusinessKey] [varchar](255) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staging].[IndicatorValues]    Script Date: 2014-01-06 09:23:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staging].[IndicatorValues](
	[ActualLabel] [varchar](50) NOT NULL,
	[ActualValue] [decimal](20, 5) NULL,
	[BusinessKey] [varchar](max) NULL,
	[Notes] [varchar](max) NULL,
	[sys_CreatedBy] [varchar](255) NOT NULL,
	[sys_ModifiedBy] [varchar](255) NOT NULL,
	[IndicatorBusinessKey] [varchar](255) NOT NULL,
	[ActiveTypeBusinessKey] [varchar](255) NOT NULL,
	[LocationBusinessKey] [varchar](255) NOT NULL,
	[OrganizationBusinessKey] [varchar](255) NOT NULL,
	[ReportingPeriodBusinessKey] [varchar](255) NOT NULL,
	[DataVersionBusinessKey] [varchar](255) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staging].[Location]    Script Date: 2014-01-06 09:23:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staging].[Location](
	[Code] [varchar](50) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[AreaKM] [decimal](18, 2) NULL,
	[Population] [decimal](18, 2) NULL,
	[Density] [varchar](max) NULL,
	[BusinessKey] [nvarchar](max) NULL,
	[sys_CreatedBy] [varchar](255) NOT NULL,
	[sys_ModifiedBy] [varchar](255) NOT NULL,
	[ActiveTypeBusinessKey] [varchar](255) NOT NULL,
	[LocationTypeBusinessKey] [varchar](255) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staging].[LocationType]    Script Date: 2014-01-06 09:23:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staging].[LocationType](
	[Code] [varchar](50) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[sys_CreatedBy] [varchar](255) NOT NULL,
	[sys_ModifiedBy] [varchar](255) NOT NULL,
	[ActiveTypeBusinessKey] [varchar](255) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staging].[Milestone]    Script Date: 2014-01-06 09:23:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staging].[Milestone](
	[LongName] [varchar](500) NOT NULL,
	[TextDescription] [varchar](max) NULL,
	[Baseline] [decimal](20, 5) NULL,
	[BaselineString] [varchar](max) NULL,
	[Target] [decimal](20, 5) NULL,
	[TargetString] [varchar](max) NULL,
	[BusinessKey] [nvarchar](max) NULL,
	[Notes] [nvarchar](max) NULL,
	[Code] [varchar](50) NOT NULL,
	[ShortName] [varchar](50) NOT NULL,
	[UnitOfMeasure] [varchar](50) NOT NULL,
	[sys_CreatedBy] [varchar](255) NOT NULL,
	[sys_ModifiedBy] [varchar](255) NOT NULL,
	[ActivityBusinessKey] [varchar](255) NOT NULL,
	[MilestoneTypeBusinessKey] [varchar](255) NOT NULL,
	[ProjectBusinessKey] [varchar](255) NOT NULL,
	[ActiveTypeBusinessKey] [varchar](255) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staging].[MilestoneLocation]    Script Date: 2014-01-06 09:23:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staging].[MilestoneLocation](
	[sys_CreatedBy] [varchar](255) NOT NULL,
	[sys_ModifiedBy] [varchar](255) NOT NULL,
	[MilestoneBusinessKey] [varchar](255) NOT NULL,
	[ActiveTypeBusinessKey] [varchar](255) NOT NULL,
	[LocationBusinessKey] [varchar](255) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staging].[MilestoneType]    Script Date: 2014-01-06 09:23:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staging].[MilestoneType](
	[Code] [varchar](50) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[sys_CreatedBy] [varchar](255) NOT NULL,
	[sys_ModifiedBy] [varchar](255) NOT NULL,
	[ActiveTypeBusinessKey] [varchar](255) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staging].[MilestoneValues]    Script Date: 2014-01-06 09:23:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staging].[MilestoneValues](
	[ActualLabel] [varchar](50) NOT NULL,
	[ActualValue] [decimal](20, 5) NULL,
	[BusinessKey] [varchar](max) NULL,
	[Notes] [varchar](max) NULL,
	[sys_CreatedBy] [varchar](255) NOT NULL,
	[sys_ModifiedBy] [varchar](255) NOT NULL,
	[MilestoneBusinessKey] [varchar](255) NOT NULL,
	[ActiveTypeBusinessKey] [varchar](255) NOT NULL,
	[LocationBusinessKey] [varchar](255) NOT NULL,
	[OrganizationBusinessKey] [varchar](255) NOT NULL,
	[ReportingPeriodBusinessKey] [varchar](255) NOT NULL,
	[DataVersionBusinessKey] [varchar](255) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staging].[Organization]    Script Date: 2014-01-06 09:23:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staging].[Organization](
	[Code] [varchar](50) NULL,
	[BusinessKey] [varchar](max) NULL,
	[sys_CreatedBy] [varchar](255) NOT NULL,
	[sys_ModifiedBy] [varchar](255) NOT NULL,
	[ActiveTypeBusinessKey] [varchar](255) NOT NULL,
	[OrganizationTypeBusinessKey] [varchar](255) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staging].[OrganizationPersonRole]    Script Date: 2014-01-06 09:23:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staging].[OrganizationPersonRole](
	[sys_CreatedBy] [varchar](255) NOT NULL,
	[sys_ModifiedBy] [varchar](255) NOT NULL,
	[ActiveTypeBusinessKey] [varchar](255) NOT NULL,
	[OrganizationBusinessKey] [varchar](255) NOT NULL,
	[PersonBusinessKey] [varchar](255) NOT NULL,
	[RoleBusinessKey] [varchar](255) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staging].[OrganizationType]    Script Date: 2014-01-06 09:23:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staging].[OrganizationType](
	[Description] [varchar](max) NULL,
	[sys_CreatedBy] [varchar](255) NOT NULL,
	[sys_ModifiedBy] [varchar](255) NOT NULL,
	[ActiveTypeBusinessKey] [varchar](255) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staging].[Outcome]    Script Date: 2014-01-06 09:23:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staging].[Outcome](
	[Code] [varchar](50) NOT NULL,
	[LongName] [nvarchar](500) NOT NULL,
	[BusinessKey] [nvarchar](max) NOT NULL,
	[ShortName] [nvarchar](50) NOT NULL,
	[TextDescription] [nvarchar](max) NULL,
	[OutcomeSiteName] [nvarchar](50) NULL,
	[sys_CreatedBy] [varchar](255) NOT NULL,
	[sys_ModifiedBy] [varchar](255) NOT NULL,
	[ActiveTypeBusinessKey] [varchar](255) NOT NULL,
	[DataVersionBusinessKey] [varchar](255) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staging].[OutcomeOrganization]    Script Date: 2014-01-06 09:23:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staging].[OutcomeOrganization](
	[sys_CreatedBy] [varchar](255) NOT NULL,
	[sys_ModifiedBy] [varchar](255) NOT NULL,
	[OutcomeBusinessKey] [varchar](255) NOT NULL,
	[ActiveTypeBusinessKey] [varchar](255) NOT NULL,
	[OrganizationBusinessKey] [varchar](255) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staging].[OutcomePersonRole]    Script Date: 2014-01-06 09:23:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staging].[OutcomePersonRole](
	[sys_CreatedBy] [varchar](255) NOT NULL,
	[sys_ModifiedBy] [varchar](255) NOT NULL,
	[OutcomeBusinessKey] [varchar](255) NOT NULL,
	[ActiveTypeBusinessKey] [varchar](255) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staging].[Output]    Script Date: 2014-01-06 09:23:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staging].[Output](
	[Code] [varchar](50) NOT NULL,
	[LongName] [nvarchar](500) NOT NULL,
	[BusinessKey] [nvarchar](max) NULL,
	[ShortName] [varchar](50) NOT NULL,
	[TextDescription] [varchar](max) NULL,
	[sys_CreatedBy] [varchar](255) NOT NULL,
	[sys_ModifiedBy] [varchar](255) NOT NULL,
	[OutcomeBusinessKey] [varchar](255) NOT NULL,
	[ActiveTypeBusinessKey] [varchar](255) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staging].[OutputOutputLink]    Script Date: 2014-01-06 09:23:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staging].[OutputOutputLink](
	[sys_CreatedBy] [varchar](255) NOT NULL,
	[sys_ModifiedBy] [varchar](255) NOT NULL,
	[OutputBusinessKey] [varchar](255) NOT NULL,
	[ActiveTypeBusinessKey] [varchar](255) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staging].[OutputPersonRole]    Script Date: 2014-01-06 09:23:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staging].[OutputPersonRole](
	[sys_CreatedBy] [varchar](255) NOT NULL,
	[sys_ModifiedBy] [varchar](255) NOT NULL,
	[OutputBusinessKey] [varchar](255) NOT NULL,
	[ActiveTypeBusinessKey] [varchar](255) NOT NULL,
	[PersonBusinessKey] [varchar](255) NOT NULL,
	[RoleBusinessKey] [varchar](255) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staging].[Person]    Script Date: 2014-01-06 09:23:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staging].[Person](
	[Title] [varchar](max) NULL,
	[Name] [varchar](255) NOT NULL,
	[ContactDetails] [varchar](max) NULL,
	[Category] [varchar](max) NULL,
	[BusinessKey] [varchar](max) NULL,
	[UserDetails] [varchar](50) NULL,
	[sys_CreatedBy] [varchar](255) NOT NULL,
	[sys_ModifiedBy] [varchar](255) NOT NULL,
	[ActiveTypeBusinessKey] [varchar](255) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staging].[Project]    Script Date: 2014-01-06 09:23:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staging].[Project](
	[Code] [varchar](50) NOT NULL,
	[ShortName] [nvarchar](255) NOT NULL,
	[LongName] [varchar](255) NOT NULL,
	[TextDescription] [varchar](max) NOT NULL,
	[sys_CreatedBy] [varchar](255) NOT NULL,
	[sys_ModifiedBy] [varchar](255) NOT NULL,
	[OutcomeBusinessKey] [varchar](255) NOT NULL,
	[ActiveTypeBusinessKey] [varchar](255) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staging].[ReportingPeriod]    Script Date: 2014-01-06 09:23:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staging].[ReportingPeriod](
	[sys_CreatedBy] [varchar](255) NOT NULL,
	[sys_ModifiedBy] [varchar](255) NOT NULL,
	[Summary] [varchar](50) NOT NULL,
	[ActiveTypeBusinessKey] [varchar](255) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staging].[Role]    Script Date: 2014-01-06 09:23:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staging].[Role](
	[Code] [varchar](50) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Description] [varchar](max) NULL,
	[sys_CreatedBy] [varchar](255) NOT NULL,
	[sys_ModifiedBy] [varchar](255) NOT NULL,
	[ActiveTypeBusinessKey] [varchar](255) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staging].[StatusType]    Script Date: 2014-01-06 09:23:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staging].[StatusType](
	[Code] [varchar](50) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Value] [decimal](20, 2) NOT NULL,
	[sys_CreatedBy] [varchar](255) NOT NULL,
	[sys_ModifiedBy] [varchar](255) NOT NULL,
	[ActiveTypeBusinessKey] [varchar](255) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staging].[StatusValues]    Script Date: 2014-01-06 09:23:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staging].[StatusValues](
	[Notes] [nvarchar](max) NULL,
	[sys_CreatedBy] [varchar](255) NOT NULL,
	[sys_ModifiedBy] [varchar](255) NOT NULL,
	[ActivityBusinessKey] [varchar](255) NOT NULL,
	[OutcomeBusinessKey] [varchar](255) NOT NULL,
	[OutputBusinessKey] [varchar](255) NOT NULL,
	[ProjectBusinessKey] [varchar](255) NOT NULL,
	[SubOutputBusinessKey] [varchar](255) NOT NULL,
	[ActiveTypeBusinessKey] [varchar](255) NOT NULL,
	[LocationBusinessKey] [varchar](255) NOT NULL,
	[ReportingPeriodBusinessKey] [varchar](255) NOT NULL,
	[StatusTypeBusinessKey] [varchar](255) NOT NULL,
	[DataVersionBusinessKey] [varchar](255) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staging].[SubOutput]    Script Date: 2014-01-06 09:23:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staging].[SubOutput](
	[Code] [varchar](50) NOT NULL,
	[ShortName] [varchar](50) NOT NULL,
	[BusinessKey] [varchar](max) NULL,
	[LongName] [varchar](500) NOT NULL,
	[TextDescription] [varchar](max) NULL,
	[sys_CreatedBy] [varchar](255) NOT NULL,
	[sys_ModifiedBy] [varchar](255) NOT NULL,
	[OutputBusinessKey] [varchar](255) NOT NULL,
	[ActiveTypeBusinessKey] [varchar](255) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staging].[SubOutputPersonRole]    Script Date: 2014-01-06 09:23:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staging].[SubOutputPersonRole](
	[sys_CreatedBy] [varchar](255) NOT NULL,
	[sys_ModifiedBy] [varchar](255) NOT NULL,
	[SubOutputBusinessKey] [varchar](255) NOT NULL,
	[ActiveTypeBusinessKey] [varchar](255) NOT NULL,
	[PersonBusinessKey] [varchar](255) NOT NULL,
	[RoleBusinessKey] [varchar](255) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staging].[SubOutputSubOutputLink]    Script Date: 2014-01-06 09:23:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staging].[SubOutputSubOutputLink](
	[sys_CreatedBy] [varchar](255) NOT NULL,
	[sys_ModifiedBy] [varchar](255) NOT NULL,
	[SubOutputBusinessKey] [varchar](255) NOT NULL,
	[ActiveTypeBusinessKey] [varchar](255) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staging].[templateMenueGroup]    Script Date: 2014-01-06 09:23:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staging].[templateMenueGroup](
	[Title] [varchar](148) NULL,
	[Link] [varchar](119) NULL,
	[sys_CreatedBy] [varchar](255) NOT NULL,
	[sys_ModifiedBy] [varchar](255) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [MeerkatStaging] SET  READ_WRITE 
GO
