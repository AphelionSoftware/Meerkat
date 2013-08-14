CREATE VIEW [mm].[ALL_OutcomeMenuGroup] 
AS 
  SELECT TOP (10000) title, 
                     link, 
                     parent, 
                     id, 
                     outcomeid 
  FROM   (SELECT dso.code 
                 AS 
                        orderBy1 
                         , 
                 1 
                         AS orderby2 
                         , 
                 dso.shortname 
                         AS Title 
, 
                 '/' + oc.[outcomesitename] 
       + '/Dashboards/Template%20Pages/Indicator%20Details%20Page.aspx?qsIndCode=' 
       + '[Sub Output].[Sub Output].%26[' 
       + Cast(dso.suboutput_id AS VARCHAR(8)) + ']'                  AS Link, 
       (SELECT id 
        FROM   mm.all_outcomemenucategory 
        WHERE  ( title = do.shortname ) 
               AND all_outcomemenucategory.outcomeid = do.outcomeid) AS Parent, 
       1 - dso.suboutput_id + 5000                                   AS ID, 
       do.outcomeid 
FROM   app.suboutput AS dso 
       INNER JOIN app.output AS do 
               ON dso.output_id = do.output_id 
       INNER JOIN app.outcome AS OC 
               ON do.outcomeid = oc.outcomeid 
WHERE  dso.active = 1 AND do.Active = 1 AND oc.Active = 1
UNION ALL 
SELECT do.shortname                                                  AS orderBy1 
       , 
       1                                                             AS 
       orderby2 
       , 
       'Indicators: ' + do.shortname + ' '                           AS 
       Title, 
       '/' + [outcomesitename] 
       + 
'/Dashboards/Template%20Pages/Indicator%20Details%20Page.aspx?qsIndCode=' 
       + '[Output].[Output].%26[' 
       + Cast(do.output_id AS VARCHAR(8)) + ']'                      AS Link, 
       (SELECT id 
        FROM   mm.all_outcomemenucategory 
        WHERE  ( title = do.shortname ) 
               AND all_outcomemenucategory.outcomeid = do.outcomeid) AS Parent, 
       100 + do.output_id                                            AS ID, 
       dom.outcomeid 
FROM   app.output AS do 
       INNER JOIN app.outcome AS dom 
               ON do.outcomeid = dom.outcomeid 
WHERE  do.active = 1  AND dom.Active = 1
UNION ALL 
SELECT '10003'                                    AS OrderBy1, 
       0                                          AS OrderBy2, 
       'Outcome Level Indicators'                 AS Title, 
       '/' + [outcomesitename] 
       + 
'/Dashboards/Template%20Pages/Indicator%20Details%20Page.aspx?qsIndCode=[Outcome].[Outcome].%26[10]' 
                                           AS Link, 
(SELECT id 
 FROM   mm.all_outcomemenucategory AS OMC_7 
 WHERE  ( title = 'Outcome Pages' ) 
        AND OMC_7.outcomeid = O.outcomeid) AS Parent, 
70                                         AS ID, 
outcomeid 
FROM   app.outcome O 
WHERE  active = 1 
UNION ALL 
SELECT '10006'                                    AS OrderBy1, 
       0                                          AS OrderBy2, 
       'Outcome Documents'                        AS Title, 
       '/' + [outcomesitename] 
       + '/Documents/Forms/AllItems.aspx'         AS Link, 
       (SELECT id 
        FROM   mm.all_outcomemenucategory AS OMC_4 
        WHERE  ( title = 'Outcome Pages' ) 
               AND OMC_4.outcomeid = O.outcomeid) AS Parent, 
       40                                         AS ID, 
       outcomeid 
FROM   app.outcome O 
WHERE  active = 1 
UNION ALL 
SELECT '10008'                                    AS OrderBy1, 
       0                                          AS OrderBy2, 
       'Outcome Contact Info'                     AS Title, 
       '/' + [outcomesitename] 
       + '/Pages/OutcomeContacts.aspx'            AS Link, 
       (SELECT id 
        FROM   mm.all_outcomemenucategory AS OMC_2 
        WHERE  ( title = 'Outcome Pages' ) 
               AND OMC_2.outcomeid = O.outcomeid) AS Parent, 
       20                                         AS ID, 
       outcomeid 
FROM   app.outcome O 
WHERE  active = 1 
UNION ALL 
SELECT '10009'                                     AS OrderBy1, 
       0                                           AS OrderBy2, 
       'FAQs'                                      AS Title, 
       '/' + [outcomesitename] + '/Outcome%20Wiki' AS Link, 
       (SELECT id 
        FROM   mm.all_outcomemenucategory AS OMC_1 
        WHERE  ( title = 'Outcome Pages' ) 
               AND OMC_1.outcomeid = O.outcomeid)  AS Parent, 
       10                                          AS ID, 
       outcomeid 
FROM   app.outcome O 
WHERE  active = 1 
 UNION ALL 
 SELECT P.shortname          AS OrderBy1, 
        30000                AS OrderBy2, 
        P.shortname          AS Title, 
        ''                   AS Link, 
        Src.id               AS Parent, 
        SRC.id + P.projectid AS ID, 
        outcomeid 
 FROM   app.project P 
        CROSS apply (SELECT id 
                     FROM   mm.all_outcomemenucategory 
                     WHERE  title = 'Projects' 
                            AND all_outcomemenucategory.outcomeid = P.outcomeid) 
                    Src) AS t 
ORDER  BY orderby1, 
          orderby2 