
CREATE VIEW [mm].[ALL_OutcomeMenuGroup]
AS
    SELECT TOP ( 10000 )
            [t].[Title] ,
            [t].[Link] ,
            [t].[Parent] ,
            [t].[ID] ,
            [t].[OutcomeID]
    FROM    ( SELECT    dso.Code AS orderBy1 ,
                        1 AS orderby2 ,
                        dso.ShortName AS Title ,
                        '/' + oc.[OutcomeSitename]
                        + '/Dashboards/Template%20Pages/Indicator%20Details%20Page.aspx?qsIndCode='
                        + '[Sub Output].[Sub Output].%26['
                        + CAST(dso.SubOutput_ID AS VARCHAR(8)) + ']' AS Link ,
                        ( SELECT    [mm].[ALL_OutcomeMenuCategory].[ID]
                          FROM      mm.ALL_OutcomeMenuCategory
                          WHERE     ( [mm].[ALL_OutcomeMenuCategory].[Title] = do.ShortName )
                                    AND [mm].[ALL_OutcomeMenuCategory].[OutcomeID] = do.OutcomeID
                        ) AS Parent ,
                        1 - dso.SubOutput_ID + 5000 AS ID ,
                        do.OutcomeID
              FROM      [app].[SubOutput] AS dso
                        INNER JOIN app.Output AS do ON dso.Output_ID = do.Output_ID
                        INNER JOIN [app].[Outcome] AS OC ON do.OutcomeID = oc.OutcomeID
              WHERE     dso.Active = 1
                        AND do.Active = 1
                        AND oc.Active = 1
              UNION ALL
              SELECT    do.ShortName AS orderBy1 ,
                        1 AS orderby2 ,
                        'Indicators: ' + do.ShortName + ' ' AS Title ,
                        '/' + [dom].[OutcomeSiteName]
                        + '/Dashboards/Template%20Pages/Indicator%20Details%20Page.aspx?qsIndCode='
                        + '[Output].[Output].%26['
                        + CAST(do.Output_ID AS VARCHAR(8)) + ']' AS Link ,
                        ( SELECT    [mm].[ALL_OutcomeMenuCategory].[ID]
                          FROM      mm.ALL_OutcomeMenuCategory
                          WHERE     ( [mm].[ALL_OutcomeMenuCategory].[Title] = do.ShortName )
                                    AND [mm].[ALL_OutcomeMenuCategory].[OutcomeID] = do.OutcomeID
                        ) AS Parent ,
                        100 + do.Output_ID AS ID ,
                        dom.OutcomeID
              FROM      app.Output AS do
                        INNER JOIN [app].[Outcome] AS dom ON do.OutcomeID = dom.OutcomeID
              WHERE     do.Active = 1
                        AND dom.Active = 1
              UNION ALL
              SELECT    '10003' AS OrderBy1 ,
                        0 AS OrderBy2 ,
                        'Outcome Level Indicators' AS Title ,
                        '/' + [O].[OutcomeSiteName]
                        + '/Dashboards/Template%20Pages/Indicator%20Details%20Page.aspx?qsIndCode=[Outcome].[Outcome].%26['
                        + CAST(O.OutcomeID AS VARCHAR(8)) + ']' AS Link ,
                        ( SELECT    [OMC_7].[ID]
                          FROM      mm.ALL_OutcomeMenuCategory AS OMC_7
                          WHERE     ( [OMC_7].[Title] = 'Outcome Pages' )
                                    AND OMC_7.OutcomeID = O.OutcomeID
                        ) AS Parent ,
                        70 AS ID ,
                        [O].[OutcomeID]
              FROM      [app].[Outcome] O
              WHERE     [O].[Active] = 1
              UNION ALL
              SELECT    '10006' AS OrderBy1 ,
                        0 AS OrderBy2 ,
                        'Outcome Documents' AS Title ,
                        '/' + [O].[OutcomeSiteName]
                        + '/Documents%20/Forms/AllItems.aspx' AS Link ,
                        ( SELECT    [OMC_4].[ID]
                          FROM      mm.ALL_OutcomeMenuCategory AS OMC_4
                          WHERE     ( [OMC_4].[Title] = 'Outcome Pages' )
                                    AND OMC_4.OutcomeID = O.OutcomeID
                        ) AS Parent ,
                        40 AS ID ,
                        [O].[OutcomeID]
              FROM      [app].[Outcome] O
              WHERE     [O].[Active] = 1
              UNION ALL
              SELECT    '10008' AS OrderBy1 ,
                        0 AS OrderBy2 ,
                        'Outcome Contact Info' AS Title ,
                        '/' + [O].[OutcomeSiteName]
                        + '/Lists/OutcomeContacts' AS Link ,
                        ( SELECT    [OMC_2].[ID]
                          FROM      mm.ALL_OutcomeMenuCategory AS OMC_2
                          WHERE     ( [OMC_2].[Title] = 'Outcome Pages' )
                                    AND OMC_2.OutcomeID = O.OutcomeID
                        ) AS Parent ,
                        20 AS ID ,
                        [O].[OutcomeID]
              FROM      [app].[Outcome] O
              WHERE     [O].[Active] = 1
              UNION ALL
              SELECT    '10009' AS OrderBy1 ,
                        0 AS OrderBy2 ,
                        'FAQs' AS Title ,
                        '/' + [O].[OutcomeSiteName] + '/Outcome%20Wiki' AS Link ,
                        ( SELECT    [OMC_1].[ID]
                          FROM      mm.ALL_OutcomeMenuCategory AS OMC_1
                          WHERE     ( [OMC_1].[Title] = 'Outcome Pages' )
                                    AND OMC_1.OutcomeID = O.OutcomeID
                        ) AS Parent ,
                        10 AS ID ,
                        [O].[OutcomeID]
              FROM      [app].[Outcome] O
              WHERE     [O].[Active] = 1
              UNION ALL
              SELECT    P.ShortName AS OrderBy1 ,
                        30000 AS OrderBy2 ,
                        P.ShortName AS Title ,
                        '' AS Link ,
                        Src.ID AS Parent ,
                        SRC.ID + P.ProjectID AS ID ,
                        [P].[OutcomeID]
              FROM      app.Project P
                        CROSS APPLY ( SELECT    [mm].[ALL_OutcomeMenuCategory].[ID]
                                      FROM      mm.ALL_OutcomeMenuCategory
                                      WHERE     [mm].[ALL_OutcomeMenuCategory].[Title] = 'Projects'
                                                AND [mm].[ALL_OutcomeMenuCategory].[OutcomeID] = P.OutcomeID
                                    ) Src
            ) AS t
    ORDER BY [t].[orderBy1] ,
            [t].[orderby2]






