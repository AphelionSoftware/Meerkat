
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


/* Insert Data */
/*Insert settings*/
:r .\settings\settings.GlobalSettings.PDS.sql


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
									

/*Insert CARE Data */
:r .\CareData\PostDeploymentScript.CARE.PDS.sql	


/*end Insert data*/

