
CREATE VIEW [mm].[ALL_ProgrammeMenuGroup]
AS
    SELECT TOP ( 10000 )
            [t].[Title] ,
            [t].[Link] ,
            [t].[Parent] ,
            [t].[ID] ,
            [t].[Programme_ID]
    FROM    ( SELECT    dso.Code AS orderBy1 ,
                        1 AS orderby2 ,
                        dso.ShortName AS Title ,
                        ISNULL(GS.Value, '/') + oc.[ProgrammeSiteName]
                        + '/Dashboards/Template%20Pages/Indicator%20Details%20Page.aspx?qsIndCode='
                        + '[Sub Sector].[Sub Sector].%26['
                        + CAST(dso.SubSector_ID AS VARCHAR(8)) + ']' AS Link ,
                        ( SELECT    [mm].[ALL_ProgrammeMenuCategory].[ID]
                          FROM      mm.ALL_ProgrammeMenuCategory
                          WHERE     ( [mm].[ALL_ProgrammeMenuCategory].[Title] = do.ShortName )
                                    AND [mm].[ALL_ProgrammeMenuCategory].[Programme_ID] = do.Programme_ID
                        ) AS Parent ,
                        1 - dso.SubSector_ID + 5000 AS ID ,
                        do.Programme_ID
              FROM      [app].[SubSector] AS dso
                        INNER JOIN app.Sector AS do ON dso.Sector_ID = do.Sector_ID
                        INNER JOIN [app].[Programme] AS OC ON do.Programme_ID = oc.Programme_ID
						LEFT OUTER JOIN  settings.GlobalSettings GS
							ON GS.Code = 'MMBASEURL'
              WHERE     dso.Active = 1
                        AND do.Active = 1
                        AND oc.Active = 1
			UNION ALL
              SELECT    do.ShortName AS orderBy1 ,
                        1 AS orderby2 ,
                        'Indicators: ' + do.ShortName + ' ' AS Title ,
                        ISNULL(GS.Value, '/') + [dom].[ProgrammeSiteName]
                        + '/Dashboards/Template%20Pages/Indicator%20Details%20Page.aspx?qsIndCode='
                        + '[Sector].[Sector].%26['
                        + CAST(do.Sector_ID AS VARCHAR(8)) + ']' AS Link ,
                        ( SELECT    [mm].[ALL_ProgrammeMenuCategory].[ID]
                          FROM      mm.ALL_ProgrammeMenuCategory
                          WHERE     ( [mm].[ALL_ProgrammeMenuCategory].[Title] = do.Code )
                                    AND [mm].[ALL_ProgrammeMenuCategory].[Programme_ID] = do.Programme_ID
                        ) AS Parent ,
                        100 + do.Sector_ID AS ID ,
                        dom.Programme_ID
              FROM      app.Sector AS do
                        INNER JOIN [app].[Programme] AS dom ON do.Programme_ID = dom.Programme_ID
						LEFT OUTER JOIN  settings.GlobalSettings GS
							ON GS.Code = 'MMBASEURL'
              WHERE     do.Active = 1
                        AND dom.Active = 1
              UNION ALL
			 SELECT    '10002' AS OrderBy1 ,
                        0 AS OrderBy2 ,
                        'Program Level Status' AS Title ,
                        ISNULL(GS.Value, '/') + [O].[ProgrammeSiteName]
                        + '/Dashboards/Template%20Pages/Programme%20Status%20Report.aspx?qsProgramme=[IndicatorByProject].[ProgrammeBusinessKey].%26[' + [O].[BusinessKey] + ']' AS Link ,
                        ( SELECT    [OMC_2].[ID]
                          FROM      mm.ALL_ProgrammeMenuCategory AS OMC_2
                          WHERE     ( [OMC_2].[Title] = 'Program' )
                                    AND OMC_2.Programme_ID = O.Programme_ID
                        ) AS Parent ,
                        20 AS ID ,
                        [O].[Programme_ID]
              FROM      [app].[Programme] O
						LEFT OUTER JOIN  settings.GlobalSettings GS
							ON GS.Code = 'MMBASEURL'
              WHERE     [O].[Active] = 1

              UNION ALL
              SELECT    '10003' AS OrderBy1 ,
                        0 AS OrderBy2 ,
                        'Program Level Indicators' AS Title ,
                        ISNULL(GS.Value, '/') + [O].[ProgrammeSiteName]
                        + '/Dashboards/Template%20Pages/Indicator%20Details%20Page.aspx?qsIndCode=[Programme].[Programme].%26['
                        + CAST(O.Programme_ID AS VARCHAR(8)) + ']' AS Link ,
                        ( SELECT    [OMC_7].[ID]
                          FROM      mm.ALL_ProgrammeMenuCategory AS OMC_7
                          WHERE     ( [OMC_7].[Title] = 'Program' )
                                    AND OMC_7.Programme_ID = O.Programme_ID
                        ) AS Parent ,
                        70 AS ID ,
                        [O].[Programme_ID]
              FROM      [app].[Programme] O
						LEFT OUTER JOIN  settings.GlobalSettings GS
							ON GS.Code = 'MMBASEURL'
              WHERE     [O].[Active] = 1
              UNION ALL
              SELECT    '10006' AS OrderBy1 ,
                        0 AS OrderBy2 ,
                        'Program Documents' AS Title ,
                        ISNULL(GS.Value, '/') + [O].[ProgrammeSiteName]
                        + '/Shared%20Documents/Forms/AllItems.aspx' AS Link ,
                        ( SELECT    [OMC_4].[ID]
                          FROM      mm.ALL_ProgrammeMenuCategory AS OMC_4
                          WHERE     ( [OMC_4].[Title] = 'Program' )
                                    AND OMC_4.Programme_ID = O.Programme_ID
                        ) AS Parent ,
                        40 AS ID ,
                        [O].[Programme_ID]
              FROM      [app].[Programme] O
						LEFT OUTER JOIN  settings.GlobalSettings GS
							ON GS.Code = 'MMBASEURL'
              WHERE     [O].[Active] = 1
              UNION ALL
              SELECT    '10008' AS OrderBy1 ,
                        0 AS OrderBy2 ,
                        'Program Contact Info' AS Title ,
                        ISNULL(GS.Value, '/') + [O].[ProgrammeSiteName]
                        + '/lists/Programme%20Contacts' AS Link ,
                        ( SELECT    [OMC_2].[ID]
                          FROM      mm.ALL_ProgrammeMenuCategory AS OMC_2
                          WHERE     ( [OMC_2].[Title] = 'Program' )
                                    AND OMC_2.Programme_ID = O.Programme_ID
                        ) AS Parent ,
                        20 AS ID ,
                        [O].[Programme_ID]
              FROM      [app].[Programme] O
						LEFT OUTER JOIN  settings.GlobalSettings GS
							ON GS.Code = 'MMBASEURL'
              WHERE     [O].[Active] = 1
              UNION ALL
              SELECT    '10009' AS OrderBy1 ,
                        0 AS OrderBy2 ,
                        'FAQs' AS Title ,
                        ISNULL(GS.Value, '/') + [O].[ProgrammeSiteName] + '/Programme%20Wiki' AS Link ,
                        ( SELECT    [OMC_1].[ID]
                          FROM      mm.ALL_ProgrammeMenuCategory AS OMC_1
                          WHERE     ( [OMC_1].[Title] = 'Program' )
                                    AND OMC_1.Programme_ID = O.Programme_ID
                        ) AS Parent ,
                        10 AS ID ,
                        [O].[Programme_ID]
              FROM      [app].[Programme] O
						LEFT OUTER JOIN  settings.GlobalSettings GS
							ON GS.Code = 'MMBASEURL'
              WHERE     [O].[Active] = 1
UNION ALL
              SELECT    '10010' AS OrderBy1 ,
                        0 AS OrderBy2 ,
                        'People reached' AS Title ,
                        '' AS Link ,
                        ( SELECT    [OMC_1].[ID]
                          FROM      mm.ALL_ProgrammeMenuCategory AS OMC_1
                          WHERE     ( [OMC_1].[Title] = 'Program' )
                                    AND OMC_1.Programme_ID = O.Programme_ID
                        ) AS Parent ,
                        55 AS ID ,
                        [O].[Programme_ID]
              FROM      [app].[Programme] O
						LEFT OUTER JOIN  settings.GlobalSettings GS
							ON GS.Code = 'MMBASEURL'
              WHERE     [O].[Active] = 1

              UNION ALL
              SELECT    P.ShortName AS OrderBy1 ,
                        30000 AS OrderBy2 ,
                        P.ShortName AS Title ,
                        ISNULL(GS.Value, '/') + [O].[ProgrammeSiteName] + '/' + P.ProjectSiteName AS Link ,
                        Src.ID AS Parent ,
                        SRC.ID + P.ProjectID AS ID ,
                        [P].[Programme_ID]
              FROM      app.Project P
			  INNER JOIN [app].[Programme] O
			  ON P.Programme_ID = o.Programme_ID
			  
						LEFT OUTER JOIN  settings.GlobalSettings GS
							ON GS.Code = 'MMBASEURL'
                        CROSS APPLY ( SELECT    [mm].[ALL_ProgrammeMenuCategory].[ID]
                                      FROM      mm.ALL_ProgrammeMenuCategory
                                      WHERE     [mm].[ALL_ProgrammeMenuCategory].[Title] = 'Projects'
                                                AND [mm].[ALL_ProgrammeMenuCategory].[Programme_ID] = P.Programme_ID
                                    ) Src
            ) AS t
    ORDER BY [t].[orderBy1] ,
            [t].[orderby2]
GO


