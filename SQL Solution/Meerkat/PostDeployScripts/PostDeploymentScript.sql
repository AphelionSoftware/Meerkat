/* Outcomes Meerkat */
:r .\DemoData\app.Outcome.PDS.sql								


/*GeoSpatialData*/

IF ( EXISTS ( SELECT    [master].[dbo].[sysdatabases].[name]
              FROM      master.dbo.sysdatabases
              WHERE     ( '[' + [master].[dbo].[sysdatabases].[name] + ']' = 'SpatialProvince'
                          OR [master].[dbo].[sysdatabases].[name] = 'SpatialProvince'
                        ) ) ) 
    BEGIN
        INSERT  INTO Meerkat.Core.DimMunicipalityGEOM
                ( [Meerkat].[Core].[DimMunicipalityGEOM].[ID] ,
                  [Meerkat].[Core].[DimMunicipalityGEOM].[LBL] ,
                  [Meerkat].[Core].[DimMunicipalityGEOM].[FIP] ,
                  [Meerkat].[Core].[DimMunicipalityGEOM].[MMT_ID] ,
                  [Meerkat].[Core].[DimMunicipalityGEOM].[SHORT__FRM] ,
                  [Meerkat].[Core].[DimMunicipalityGEOM].[LONG_FRM] ,
                  [Meerkat].[Core].[DimMunicipalityGEOM].[ADM0] ,
                  [Meerkat].[Core].[DimMunicipalityGEOM].[ADM1] ,
                  [Meerkat].[Core].[DimMunicipalityGEOM].[ADM2] ,
                  [Meerkat].[Core].[DimMunicipalityGEOM].[ADM3] ,
                  [Meerkat].[Core].[DimMunicipalityGEOM].[ADM4] ,
                  [Meerkat].[Core].[DimMunicipalityGEOM].[ADM5] ,
                  [Meerkat].[Core].[DimMunicipalityGEOM].[geom]
                )
                SELECT  [SpatialProvince].[dbo].[SimpleProvince].[Location_ID] AS [ID] ,
                        [SpatialProvince].[dbo].[SimpleProvince].[ISO] AS [LBL] ,
                        '' AS [FIP] ,
                        '' [MMT_ID] ,
                        '' [SHORT__FRM] ,
                        '' [LONG_FRM] ,
                        [SpatialProvince].[dbo].[SimpleProvince].[ADM0] ,
                        [SpatialProvince].[dbo].[SimpleProvince].[ADM1] ,
                        '' [ADM2] ,
                        '' [ADM3] ,
                        '' [ADM4] ,
                        '' [ADM5] ,
                        [SpatialProvince].[dbo].[SimpleProvince].[Geog] AS [geom]
                FROM    [SpatialProvince].dbo.[SimpleProvince] 
    END

/*ALTER TABLE app.SubOutput ADD CONSTRAINT
    DF_SubOutput_Active DEFAULT 1 FOR Active
GO*/

/*Populate Organization Type*/
USE [Meerkat]
GO
SET IDENTITY_INSERT [Core].[OrganizationType] ON 

GO
IF NOT EXISTS (
        SELECT 1
        FROM [Core].[OrganizationType]
        WHERE [OrganizationType_ID] = 1
)
BEGIN
    INSERT [Core].[OrganizationType] ([OrganizationType_ID], [Description], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (1, N'Food Support', 1, N'dbo', CAST(0x0000A23700F26E2A AS DateTime), N'dbo', CAST(0x0000A23700F26E2A AS DateTime))
END
GO
IF NOT EXISTS (
        SELECT 1
        FROM [Core].[OrganizationType]
        WHERE [OrganizationType_ID] = 2
)
BEGIN
    INSERT [Core].[OrganizationType] ([OrganizationType_ID], [Description], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (2, N'Agricultural Development Support', 1, N'dbo', CAST(0x0000A23700F27C1C AS DateTime), N'dbo', CAST(0x0000A23700F27C1C AS DateTime))
END
GO
IF NOT EXISTS (
        SELECT 1
        FROM [Core].[OrganizationType]
        WHERE [OrganizationType_ID] = 3
)
BEGIN
    INSERT [Core].[OrganizationType] ([OrganizationType_ID], [Description], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (3, N'Funding/Financing Support', 1, N'dbo', CAST(0x0000A23700F28B06 AS DateTime), N'dbo', CAST(0x0000A23700F28B06 AS DateTime))
END
GO
IF NOT EXISTS (
        SELECT 1
        FROM [Core].[OrganizationType]
        WHERE [OrganizationType_ID] = 4
)
BEGIN
    INSERT [Core].[OrganizationType] ([OrganizationType_ID], [Description], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (4, N'Educational Support', 1, N'dbo', CAST(0x0000A23700F29855 AS DateTime), N'dbo', CAST(0x0000A23700F29855 AS DateTime))
END
GO
IF NOT EXISTS (
        SELECT 1
        FROM [Core].[OrganizationType]
        WHERE [OrganizationType_ID] = 5
)
BEGIN
    INSERT [Core].[OrganizationType] ([OrganizationType_ID], [Description], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (5, N'Transport Support', 1, N'dbo', CAST(0x0000A23700F2A66F AS DateTime), N'dbo', CAST(0x0000A23700F2A66F AS DateTime))
END
GO
IF NOT EXISTS (
        SELECT 1
        FROM [Core].[OrganizationType]
        WHERE [OrganizationType_ID] = 6
)
BEGIN
    INSERT [Core].[OrganizationType] ([OrganizationType_ID], [Description], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (6, N'Telecomunications Support', 1, N'dbo', CAST(0x0000A23700F2B7D9 AS DateTime), N'dbo', CAST(0x0000A23700F2B7D9 AS DateTime))
END
GO
IF NOT EXISTS (
        SELECT 1
        FROM [Core].[OrganizationType]
        WHERE [OrganizationType_ID] = 7
)
BEGIN
    INSERT [Core].[OrganizationType] ([OrganizationType_ID], [Description], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (7, N'Health & Wellbeing Support', 1, N'dbo', CAST(0x0000A23700F2C268 AS DateTime), N'dbo', CAST(0x0000A23700F2C268 AS DateTime))
END
GO
SET IDENTITY_INSERT [Core].[OrganizationType] OFF
GO

/*Populate Organization */
SET IDENTITY_INSERT [Core].[Organization] ON 

GO
IF NOT EXISTS (
        SELECT 1
        FROM [Core].[Organization]
        WHERE [Organization_ID] = 1
)
BEGIN
    INSERT [Core].[Organization] ([Organization_ID], [Name], [Code], [BusinessKey], [OrganizationType_ID], [ParentOrganization_ID], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (1, N'FOA',N'FOA', N'Food and Agriculture Organization', 1, NULL, 1, N'spinstall', CAST(0x0000A23700F7DA7B AS DateTime), N'spinstall', CAST(0x0000A23700F7DA85 AS DateTime))
END
GO
IF NOT EXISTS (
        SELECT 1
        FROM [Core].[Organization]
        WHERE [Organization_ID] = 2
)
BEGIN
    INSERT [Core].[Organization] ([Organization_ID], [Name], [Code], [BusinessKey], [OrganizationType_ID], [ParentOrganization_ID], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (2, N'IFAD',N'IFAD', N'International Fund for Agricultural Development', 3, NULL, 1, N'spinstall', CAST(0x0000A23700F875D5 AS DateTime), N'spinstall', CAST(0x0000A23700F875D5 AS DateTime))
END
GO
IF NOT EXISTS (
        SELECT 1
        FROM [Core].[Organization]
        WHERE [Organization_ID] = 3
)
BEGIN
    INSERT [Core].[Organization] ([Organization_ID], [Name], [Code], [BusinessKey], [OrganizationType_ID], [ParentOrganization_ID], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (3, N'UNESCO',N'UNESCO', N'United Nations Educational, Scientific and Cultural Organization ', 4, NULL, 1, N'spinstall', CAST(0x0000A23700F8A1CD AS DateTime), N'spinstall', CAST(0x0000A23700F8A1CD AS DateTime))
END
GO
IF NOT EXISTS (
        SELECT 1
        FROM [Core].[Organization]
        WHERE [Organization_ID] = 4
)
BEGIN
    INSERT [Core].[Organization] ([Organization_ID], [Name], [Code], [BusinessKey], [OrganizationType_ID], [ParentOrganization_ID], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (4, N'WHO',N'WHO', N'World Health Organization', 7, NULL, 1, N'spinstall', CAST(0x0000A23700F8C45C AS DateTime), N'spinstall', CAST(0x0000A23700F8C45C AS DateTime))
END
GO
SET IDENTITY_INSERT [Core].[Organization] OFF
GO


/*Location Types*/
INSERT INTO [Core].[LocationType]
           ([Code], [Name], [Description])
     SELECT
          'CONT' ,'Continent' ,'Continent' WHERE NOT EXISTS (SELECT 1 FROM [Core].[LocationType] WHERE [Code]  ='CONT')

INSERT INTO [Core].[LocationType]
           ([Code], [Name], [Description])
     SELECT
          'CNTRY' ,'Country' ,'Country' WHERE NOT EXISTS (SELECT 1 FROM [Core].[LocationType] WHERE [Code]  ='CNTRY')

          
INSERT INTO [Core].[LocationType]
           ([Code], [Name], [Description])
     SELECT
          'REG' ,'Region' ,'Region' WHERE NOT EXISTS (SELECT 1 FROM [Core].[LocationType] WHERE [Code]  ='REG')

          
INSERT INTO [Core].[LocationType]
           ([Code], [Name], [Description])
     SELECT
          'PROV' ,'Province' ,'Province' WHERE NOT EXISTS (SELECT 1 FROM [Core].[LocationType] WHERE [Code]  ='PROV')

INSERT INTO [Core].[LocationType]
           ([Code], [Name], [Description])
     SELECT
          'CNTY' ,'County' ,'County' WHERE NOT EXISTS (SELECT 1 FROM [Core].[LocationType] WHERE [Code]  ='CNTY')


INSERT INTO [Core].[LocationType]
           ([Code], [Name], [Description])
     SELECT
          'CTY' ,'City' ,'City' WHERE NOT EXISTS (SELECT 1 FROM [Core].[LocationType] WHERE [Code]  ='CTY')


INSERT INTO [Core].[LocationType]
           ([Code], [Name], [Description])
     SELECT
          'TWN' ,'Town' ,'Town' WHERE NOT EXISTS (SELECT 1 FROM [Core].[LocationType] WHERE [Code]  ='TWN')


INSERT INTO [Core].[LocationType]
           ([Code], [Name], [Description])
     SELECT
          'Municipality' ,'Municipality' ,'Municipality' WHERE NOT EXISTS (SELECT 1 FROM [Core].[LocationType] WHERE [Code]  ='Municipality')

GO
/*Location Types*/

/*Insert Core data*/
:r .\Core.ActiveType.PDS.sql
:r .\Core.StatusType.PDS.sql
:r .\Core.DataVersions.PDS.sql
:r .\Core.DimDate.PDS.sql
:r .\Core.ReportingPeriod.PDS.sql
:r .\app.MilestoneType.PDS.sql
:r .\app.IndicatorType.PDS.sql

/*Insert Forms data*/
:r .\forms.QuestionType.PDS.sql								
:r .\disagg.Gender.PDS.sql
:r .\disagg.Age.PDS.sql								
:r .\rpt.CustomReportType.PDS.sql								


/* Insert Demo data */
--:r .\DemoData\PostDeploymentScript.Demo.PDS.sql
--:r .\DemoData\Core.Locations.Demo.PDS.sql									

/*Insert CARE Data */
:r .\CareData\PostDeploymentScript.CARE.PDS.sql	
:r .\CareData\Core.Locations.CARE.PDS.sql	


/*end Insert Forms data*/

