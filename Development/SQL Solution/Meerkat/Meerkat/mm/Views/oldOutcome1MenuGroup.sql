

CREATE VIEW [mm].[oldOutcome1MenuGroup]
AS
SELECT     TOP (10000) Title, Link, Parent, ID
FROM         (
						SELECT  
							dso.SubOutput_ID AS orderBy1
							,1 AS orderby2
							,replace(dso.Code,'STP','') + ' : ' + dso.LongName AS Title
							,'/Outcome1/Dashboards/Template%20Pages/Indicator%20Details%20Page.aspx?qsIndCode=' + '[Sub Output].[Sub Output].%26[' + CAST(dso.SubOutput_ID AS varchar(8)) + ']' AS Link
							,(SELECT ID FROM mm.Outcome1MenuCategory WHERE (Title = case when len(do.FullName) > 70 then left(do.FullName,70) + '...' else do.FullName end)) AS Parent
							, 1 - dso.SubOutput_ID + 5000 AS ID
						FROM          
							app.DimSubOutput AS dso INNER JOIN
							app.DimOutput AS do ON dso.Output_ID = do.Output_ID
						WHERE      (do.outcomeId=7)
               UNION ALL
						SELECT     
							 dso.SubOutput_ID AS orderBy
							,2 AS orderby2
							,replace(dso.code,'STP','') + ' : Activities' AS Title
							,'' AS Link
							,(SELECT ID FROM mm.Outcome1MenuCategory AS Outcome1MenuCategory_11 WHERE (Title = case when len(do.FullName) > 70 then left(do.FullName,70) + '...' else do.FullName end)) AS Parent, 1 * dso.SubOutput_ID AS ID
						FROM
						app.DimSubOutput AS dso INNER JOIN
						app.DimOutput AS do ON dso.Output_ID = do.Output_ID
						WHERE     (do.outcomeId=7)
			   UNION ALL
                        SELECT  
							do.Output_ID AS orderBy1
							,1 AS orderby2
							,SUBSTRING(do.ShortName,1,CHARINDEX(':',do.ShortName)-2) + ' Level Indicators' AS Title
							,'/Outcome1/Dashboards/Template%20Pages/Indicator%20Details%20Page.aspx?qsIndCode=' + '[Output].[Output].%26[' + CAST(do.Output_ID AS varchar(8)) + ']' AS Link
							,(SELECT ID FROM mm.Outcome1MenuCategory WHERE (Title = case when len(do.FullName) > 70 then left(do.FullName,70) + '...' else do.FullName end)) AS Parent
							, 100 AS ID
						FROM          
							app.DimOutput AS do INNER JOIN
							app.DimOutcome AS dom ON do.OutcomeID = dom.Outcome_ID
						WHERE      (do.outcomeId=7)
               UNION ALL
                       SELECT     10000 AS OrderBy1, 0 AS OrderBy2, 'PoA  Report' AS Expr1, '/_layouts/ReportServer/RSViewerPage.aspx?rv:RelativeReportUrl=/ReportLibrary/DeliveryAgreement.rdl&rv:ParamMode=Collapsed&rp:DataVersion=39&rp:Outcome_ID=10' AS Expr2,
                                                 (SELECT     ID
                                                   FROM          mm.Outcome1MenuCategory AS Outcome1MenuCategory_10
                                                   WHERE      (Title = 'Outcome Pages')) AS Expr3, 100 AS Expr4
                       UNION ALL
                       SELECT     10001 AS OrderBy1, 0 AS OrderBy2, 'Cabinet Reporting Template' AS Expr1, '/Outcome1/Pages/CabinetReporting.aspx' AS Expr2,
                                                 (SELECT     ID
                                                   FROM          mm.Outcome1MenuCategory AS Outcome1MenuCategory_9
                                                   WHERE      (Title = 'Outcome Pages')) AS Expr3, 90 AS Expr4
                       UNION ALL
                       SELECT     10002 AS OrderBy1, 0 AS OrderBy2, 'Key Indicators' AS Expr1, '/Outcome1/Dashboards/Template%20Pages/Key%20Indicators.aspx' AS Expr2,
                                                 (SELECT     ID
                                                   FROM          mm.Outcome1MenuCategory AS Outcome1MenuCategory_8
                                                   WHERE      (Title = 'Outcome Pages')) AS Expr3, 80 AS Expr4
                       UNION ALL
                       SELECT     10003 AS OrderBy1, 0 AS OrderBy2, 'Outcome Level Indicators' AS Expr1, 
                                             '/Outcome1/Dashboards/Template%20Pages/Indicator%20Details%20Page.aspx?qsIndCode=[Outcome].[Outcome].%26[10]' AS Expr2,
                                                 (SELECT     ID
                                                   FROM          mm.Outcome1MenuCategory AS Outcome1MenuCategory_7
                                                   WHERE      (Title = 'Outcome Pages')) AS Expr3, 70 AS Expr4
                       UNION ALL
                       SELECT     10004 AS OrderBy1, 0 AS OrderBy2, 'All Indicators for the Outcome' AS Expr1, 
                                             '/Outcome1/Dashboards/Template%20Pages/All%20Indicators.aspx?qsIndCode=[Outcome].[Outcome].%26[10]' AS Expr2,
                                                 (SELECT     ID
                                                   FROM          mm.Outcome1MenuCategory AS Outcome1MenuCategory_6
                                                   WHERE      (Title = 'Outcome Pages')) AS Expr3, 60 AS Expr4
                       UNION ALL
                       SELECT     10005 AS OrderBy1, 0 AS OrderBy2, 'All Activities for the Outcome' AS Expr1, 
                                             '/Outcome1/Dashboards/Template%20Pages/All%20Activities.aspx?qsIndCode=[Outcome].[Outcome].%26[10]' AS Expr2,
                                                 (SELECT     ID
                                                   FROM          mm.Outcome1MenuCategory AS Outcome1MenuCategory_5
                                                   WHERE      (Title = 'Outcome Pages')) AS Expr3, 50 AS Expr4
                       UNION ALL
                       SELECT     10006 AS OrderBy1, 0 AS OrderBy2, 'Outcome Documents' AS Expr1, '/Outcome1/Documents/Forms/AllItems.aspx' AS Expr2,
                                                 (SELECT     ID
                                                   FROM          mm.Outcome1MenuCategory AS Outcome1MenuCategory_4
                                                   WHERE      (Title = 'Outcome Pages')) AS Expr3, 40 AS Expr4
                       UNION ALL
                       SELECT     10007 AS OrderBy1, 0 AS OrderBy2, 'Data Forum Information' AS Expr1, '/Outcome1/Pages/DataForum.aspx' AS Expr2,
                                                 (SELECT     ID
                                                   FROM          mm.Outcome1MenuCategory AS Outcome1MenuCategory_3
                                                   WHERE      (Title = 'Outcome Pages')) AS Expr3, 30 AS Expr4
                       UNION ALL
                       SELECT     10008 AS OrderBy1, 0 AS OrderBy2, 'Outcome Contact Info' AS Expr1, '/Outcome1/Pages/OutcomeContacts.aspx' AS Expr2,
                                                 (SELECT     ID
                                                   FROM          mm.Outcome1MenuCategory AS Outcome1MenuCategory_2
                                                   WHERE      (Title = 'Outcome Pages')) AS Expr3, 20 AS Expr4
                       UNION ALL
                       SELECT     10009 AS OrderBy1, 0 AS OrderBy2, 'FAQs' AS Expr1, '/Outcome1/Outcome%20Wiki' AS Expr2,
                                                 (SELECT     ID
                                                   FROM          mm.Outcome1MenuCategory AS Outcome1MenuCategory_1
                                                   WHERE      (Title = 'Outcome Pages')) AS Expr3, 10 AS Expr4) AS t
ORDER BY orderBy1, orderby2

