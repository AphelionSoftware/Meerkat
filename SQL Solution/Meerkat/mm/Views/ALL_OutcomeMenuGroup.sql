






CREATE VIEW [mm].[ALL_OutcomeMenuGroup]
AS
SELECT     TOP (10000)  Title, Link, Parent, ID, OutcomeID
FROM         (
                                         SELECT  
                                                dso.Code AS orderBy1
                                                ,1 AS orderby2
                                                ,dso.ShortName AS Title
                                                ,'/'+oc.[OutcomeSiteName]+'/Dashboards/Template%20Pages/Indicator%20Details%20Page.aspx?qsIndCode=' + '[Sub Output].[Sub Output].%26[' + CAST(dso.SubOutput_ID AS varchar(8)) + ']' AS Link
                                                ,(SELECT ID FROM mm.All_OutcomeMenuCategory where (Title = do.ShortName)
												AND All_OutcomeMenuCategory.OutcomeID = do.OutcomeID
												) AS Parent
                                                , 1 - dso.SubOutput_ID + 5000 AS ID
												, do.OutcomeID 
                                         FROM          
                                                app.SubOutput AS dso INNER JOIN
                                                app.Output AS do ON dso.Output_ID = do.Output_ID
												inner Join app.Outcome as OC on do.OutcomeID=oc.OutcomeID
												WHERE dso.Active=1
												
										
                    UNION ALL
                        SELECT  
                                                do.ShortName AS orderBy1
                                                ,1 AS orderby2
                                                ,do.ShortName + ' Indicators' AS Title
                                                ,'/'+[OutcomeSiteName]+'/Dashboards/Template%20Pages/Indicator%20Details%20Page.aspx?qsIndCode=' + '[Output].[Output].%26[' + CAST(do.Output_ID AS varchar(8)) + ']' AS Link
                                                ,(SELECT ID FROM mm.All_OutcomeMenuCategory WHERE (Title = do.ShortName)
												AND All_OutcomeMenuCategory.OutcomeID = do.OutcomeID
												) AS Parent
                                                , 100 + do.Output_ID AS ID
												, dom.OutcomeID
                                         FROM          
                                                app.Output AS do INNER JOIN
                                                app.Outcome AS dom ON do.OutcomeID = dom.OutcomeID
												Where do.Active = 1
												
               UNION ALL
                       SELECT     '10003' AS OrderBy1, 0 AS OrderBy2, 'Outcome Level Indicators' AS Title, 
                                             '/'+[OutcomeSiteName]+'/Dashboards/Template%20Pages/Indicator%20Details%20Page.aspx?qsIndCode=[Outcome].[Outcome].%26[10]' AS Link,
                                                 (SELECT     ID
                                                   FROM          mm.All_OutcomeMenuCategory AS OMC_7
                                                   WHERE      (Title = 'Outcome Pages')
												   AND OMC_7.OutcomeID = O.OutcomeID
												   ) AS Parent, 70 AS ID
												   , OutcomeID 
												   FROM app.Outcome O
												   Where Active = 1
                       
					   
					    UNION ALL
                       SELECT     '10006' AS OrderBy1, 0 AS OrderBy2, 'Outcome Documents' AS Title, '/'+[OutcomeSiteName]+'/Documents/Forms/AllItems.aspx' AS Link,
                                                 (SELECT     ID
                                                   FROM          mm.All_OutcomeMenuCategory AS OMC_4
                                                   WHERE      (Title = 'Outcome Pages')
												    AND OMC_4.OutcomeID = O.OutcomeID
												   ) AS Parent, 40 AS ID
												   , OutcomeID 
												    FROM app.Outcome O
													 Where Active = 1
                       UNION ALL
                       SELECT     '10008' AS OrderBy1, 0 AS OrderBy2, 'Outcome Contact Info' AS Title,'/'+[OutcomeSiteName]+'/Pages/OutcomeContacts.aspx' AS Link,
                                                 (SELECT     ID
                                                   FROM          mm.All_OutcomeMenuCategory AS OMC_2
                                                   WHERE      (Title = 'Outcome Pages')
												    AND OMC_2.OutcomeID = O.OutcomeID) AS Parent, 20 AS ID
													, OutcomeID 
												    FROM app.Outcome O
													 Where Active = 1
                       UNION ALL
                       SELECT     '10009' AS OrderBy1, 0 AS OrderBy2, 'FAQs' AS Title, '/'+[OutcomeSiteName]+'/Outcome%20Wiki' AS Link,
                                                 (SELECT     ID
                                                   FROM          mm.All_OutcomeMenuCategory AS OMC_1
                                                   WHERE      (Title = 'Outcome Pages')
												    AND OMC_1.OutcomeID = O.OutcomeID) AS Parent, 10 AS ID
													, OutcomeID 
													FROM app.Outcome O
													 Where Active = 1

				UNION ALL
                       SELECT     P.ShortName AS OrderBy1, 30000 AS OrderBy2
									, P.ShortName AS Title,
									'' AS Link,
									 Src.ID AS  Parent
											,SRC.ID +  P.ProjectID as ID
											, OutcomeID 
								FROM app.Project P
								CROSS APPLY 
								(SELECT ID
										FROM mm.All_OutcomeMenuCategory 
											WHERE Title = 'Projects'
											AND All_OutcomeMenuCategory.OutcomeID = P.OutcomeID) Src
			) AS t
				

ORDER BY   orderby1, orderby2






