CREATE VIEW [mm].[ALL_OutcomeMenuGroup]
AS
    SELECT TOP ( 10000 )
            [t].[Title] ,
            [t].[Link] ,
            [t].[Parent] ,
            [t].[ID] ,
            [t].[Outcome_ID]
    FROM    ( SELECT    dso.Code AS orderBy1 ,
                        1 AS orderby2 ,
                        dso.ShortName AS Title ,
                        ISNULL(GS.Value, '/') + oc.[OutcomeSiteName]
                        + '/Dashboards/Template%20Pages/Indicator%20Details%20Page.aspx?qsIndCode='
                        + '[Sub Output].[Sub Output].%26['
                        + CAST(dso.SubOutput_ID AS VARCHAR(8)) + ']' AS Link ,
                        ( SELECT    [mm].[ALL_OutcomeMenuCategory].[ID]
                          FROM      mm.ALL_OutcomeMenuCategory
                          WHERE     ( [mm].[ALL_OutcomeMenuCategory].[Title] = do.ShortName )
                                    AND [mm].[ALL_OutcomeMenuCategory].[Outcome_ID] = do.Outcome_ID
                        ) AS Parent ,
                        1 - dso.SubOutput_ID + 5000 AS ID ,
                        do.Outcome_ID
              FROM      [app].[SubOutput] AS dso
                        INNER JOIN app.Output AS do ON dso.Output_ID = do.Output_ID
                        INNER JOIN [app].[Outcome] AS OC ON do.Outcome_ID = oc.Outcome_ID
						LEFT OUTER JOIN  settings.GlobalSettings GS
							ON GS.Code = 'MMBASEURL'
              WHERE     dso.Active = 1
                        AND do.Active = 1
                        AND oc.Active = 1
			UNION ALL
              SELECT    do.ShortName AS orderBy1 ,
                        1 AS orderby2 ,
                        'Indicators: ' + do.ShortName + ' ' AS Title ,
                        ISNULL(GS.Value, '/') +  [dom].[OutcomeSiteName]
                        + '/Dashboards/Template%20Pages/Indicator%20Details%20Page.aspx?qsIndCode='
                        + '[Output].[Output].%26['
                        + CAST(do.Output_ID AS VARCHAR(8)) + ']' AS Link ,
                        ( SELECT    [mm].[ALL_OutcomeMenuCategory].[ID]
                          FROM      mm.ALL_OutcomeMenuCategory
                          WHERE     ( [mm].[ALL_OutcomeMenuCategory].[Title] = do.ShortName )
                                    AND [mm].[ALL_OutcomeMenuCategory].[Outcome_ID] = do.Outcome_ID
                        ) AS Parent ,
                        100 + do.Output_ID AS ID ,
                        dom.Outcome_ID
              FROM      app.Output AS do
                        INNER JOIN [app].[Outcome] AS dom ON do.Outcome_ID = dom.Outcome_ID
						LEFT OUTER JOIN  settings.GlobalSettings GS
							ON GS.Code = 'MMBASEURL'
              WHERE     do.Active = 1
                        AND dom.Active = 1
              UNION ALL
			 SELECT    '10002' AS OrderBy1 ,
                        0 AS OrderBy2 ,
                        'Outcome Level Status' AS Title ,
                        ISNULL(GS.Value, '/') +  [O].[OutcomeSiteName]
                        + '/Dashboards/Template%20Pages/Outcome%20Status%20Report.aspx?qsOutcome=' + substring([O].[OutcomeSiteName],8,1) AS Link ,
                        ( SELECT    [OMC_2].[ID]
                          FROM      mm.ALL_OutcomeMenuCategory AS OMC_2
                          WHERE     ( [OMC_2].[Title] = 'Outcome Pages' )
                                    AND OMC_2.Outcome_ID = O.Outcome_ID
                        ) AS Parent ,
                        20 AS ID ,
                        [O].[Outcome_ID]
              FROM      [app].[Outcome] O
						LEFT OUTER JOIN  settings.GlobalSettings GS
							ON GS.Code = 'MMBASEURL'
              WHERE     [O].[Active] = 1

              UNION ALL
              SELECT    '10003' AS OrderBy1 ,
                        0 AS OrderBy2 ,
                        'Outcome Level Indicators' AS Title ,
                        ISNULL(GS.Value, '/') +  [O].[OutcomeSiteName]
                        + '/Dashboards/Template%20Pages/Indicator%20Details%20Page.aspx?qsIndCode=[Outcome].[Outcome].%26['
                        + CAST(O.Outcome_ID AS VARCHAR(8)) + ']' AS Link ,
                        ( SELECT    [OMC_7].[ID]
                          FROM      mm.ALL_OutcomeMenuCategory AS OMC_7
                          WHERE     ( [OMC_7].[Title] = 'Outcome Pages' )
                                    AND OMC_7.Outcome_ID = O.Outcome_ID
                        ) AS Parent ,
                        70 AS ID ,
                        [O].[Outcome_ID]
              FROM      [app].[Outcome] O
						LEFT OUTER JOIN  settings.GlobalSettings GS
							ON GS.Code = 'MMBASEURL'
              WHERE     [O].[Active] = 1
              UNION ALL
              SELECT    '10006' AS OrderBy1 ,
                        0 AS OrderBy2 ,
                        'Outcome Documents' AS Title ,
                        ISNULL(GS.Value, '/') +  [O].[OutcomeSiteName]
                        + '/Shared%20Documents/Forms/AllItems.aspx' AS Link ,
                        ( SELECT    [OMC_4].[ID]
                          FROM      mm.ALL_OutcomeMenuCategory AS OMC_4
                          WHERE     ( [OMC_4].[Title] = 'Outcome Pages' )
                                    AND OMC_4.Outcome_ID = O.Outcome_ID
                        ) AS Parent ,
                        40 AS ID ,
                        [O].[Outcome_ID]
              FROM      [app].[Outcome] O
						LEFT OUTER JOIN  settings.GlobalSettings GS
							ON GS.Code = 'MMBASEURL'
              WHERE     [O].[Active] = 1
              UNION ALL
              SELECT    '10008' AS OrderBy1 ,
                        0 AS OrderBy2 ,
                        'Outcome Contact Info' AS Title ,
                        ISNULL(GS.Value, '/') +  [O].[OutcomeSiteName]
                        + '/lists/Outcome%20Contacts' AS Link ,
                        ( SELECT    [OMC_2].[ID]
                          FROM      mm.ALL_OutcomeMenuCategory AS OMC_2
                          WHERE     ( [OMC_2].[Title] = 'Outcome Pages' )
                                    AND OMC_2.Outcome_ID = O.Outcome_ID
                        ) AS Parent ,
                        20 AS ID ,
                        [O].[Outcome_ID]
              FROM      [app].[Outcome] O
						LEFT OUTER JOIN  settings.GlobalSettings GS
							ON GS.Code = 'MMBASEURL'
              WHERE     [O].[Active] = 1
              UNION ALL
              SELECT    '10009' AS OrderBy1 ,
                        0 AS OrderBy2 ,
                        'FAQs' AS Title ,
                        ISNULL(GS.Value, '/') +  [O].[OutcomeSiteName] + '/Outcome%20Wiki' AS Link ,
                        ( SELECT    [OMC_1].[ID]
                          FROM      mm.ALL_OutcomeMenuCategory AS OMC_1
                          WHERE     ( [OMC_1].[Title] = 'Outcome Pages' )
                                    AND OMC_1.Outcome_ID = O.Outcome_ID
                        ) AS Parent ,
                        10 AS ID ,
                        [O].[Outcome_ID]
              FROM      [app].[Outcome] O
						LEFT OUTER JOIN  settings.GlobalSettings GS
							ON GS.Code = 'MMBASEURL'
              WHERE     [O].[Active] = 1

              UNION ALL
              SELECT    P.ShortName AS OrderBy1 ,
                        30000 AS OrderBy2 ,
                        P.ShortName AS Title ,
                        '' AS Link ,
                        Src.ID AS Parent ,
                        SRC.ID + P.ProjectID AS ID ,
                        [P].[Outcome_ID]
              FROM      app.Project P
						LEFT OUTER JOIN  settings.GlobalSettings GS
							ON GS.Code = 'MMBASEURL'
                        CROSS APPLY ( SELECT    [mm].[ALL_OutcomeMenuCategory].[ID]
                                      FROM      mm.ALL_OutcomeMenuCategory
                                      WHERE     [mm].[ALL_OutcomeMenuCategory].[Title] = 'Projects'
                                                AND [mm].[ALL_OutcomeMenuCategory].[Outcome_ID] = P.Outcome_ID
                                    ) Src
            ) AS t
    ORDER BY [t].[orderBy1] ,
            [t].[orderby2]

