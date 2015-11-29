

CREATE VIEW [mm].[oldOutcome8MenuGroup]
AS
SELECT     TOP (10000) Title, Link, Parent, ID
FROM         (
						SELECT  
							dso.SubOutput_ID AS orderBy1
							,1 AS orderby2
							,replace(dso.Code,'STP','') + ' : ' + dso.LongName AS Title
							,'/Outcome8/Dashboards/Template%20Pages/Indicator%20Details%20Page.aspx?qsIndCode=' + '[Sub Output].[Sub Output].%26[' + CAST(dso.SubOutput_ID AS varchar(8)) + ']' AS Link
							,(SELECT ID FROM mm.Outcome8MenuCategory WHERE (Title = case when len(do.FullName) > 70 then left(do.FullName,70) + '...' else do.FullName end)) AS Parent
							, 1 - dso.SubOutput_ID + 5000 AS ID
						FROM          
							app.DimSubOutput AS dso INNER JOIN
							app.DimOutput AS do ON dso.Output_ID = do.Output_ID
						WHERE      (do.outcomeId=15)
               UNION ALL
						SELECT     
							 dso.SubOutput_ID AS orderBy
							,2 AS orderby2
							,replace(dso.code,'STP','') + ' : Activities' AS Title
							,'' AS Link
							,(SELECT ID FROM mm.Outcome8MenuCategory AS Outcome8MenuCategory_11 WHERE (Title = case when len(do.FullName) > 70 then left(do.FullName,70) + '...' else do.FullName end)) AS Parent, 1 * dso.SubOutput_ID AS ID
						FROM
						app.DimSubOutput AS dso INNER JOIN
						app.DimOutput AS do ON dso.Output_ID = do.Output_ID
						WHERE     (do.outcomeId=15)
			   UNION ALL
                        SELECT  
							do.Output_ID AS orderBy1
							,1 AS orderby2
							,SUBSTRING(do.ShortName,1,CHARINDEX(':',do.ShortName)-2) + ' Level Indicators' AS Title
							,'/Outcome8/Dashboards/Template%20Pages/Indicator%20Details%20Page.aspx?qsIndCode=' + '[Output].[Output].%26[' + CAST(do.Output_ID AS varchar(8)) + ']' AS Link
							,(SELECT ID FROM mm.Outcome8MenuCategory WHERE (Title = case when len(do.FullName) > 70 then left(do.FullName,70) + '...' else do.FullName end)) AS Parent
							, 100 AS ID
						FROM          
							app.DimOutput AS do INNER JOIN
							app.DimOutcome AS dom ON do.OutcomeID = dom.Outcome_ID
						WHERE      (do.outcomeId=15)
               UNION ALL
                       SELECT     10000 AS OrderBy1, 0 AS OrderBy2, 'PoA  Report' AS Expr1, '/_layouts/ReportServer/RSViewerPage.aspx?rv:RelativeReportUrl=/ReportLibrary/DeliveryAgreement.rdl&rv:ParamMode=Collapsed&rp:DataVersion=39&rp:Outcome_ID=10' AS Expr2,
                                                 (SELECT     ID
                                                   FROM          mm.Outcome8MenuCategory AS Outcome8MenuCategory_10
                                                   WHERE      (Title = 'Outcome Pages')) AS Expr3, 100 AS Expr4
                       UNION ALL
                       SELECT     10001 AS OrderBy1, 0 AS OrderBy2, 'Cabinet Reporting Template' AS Expr1, '/Outcome8/Pages/CabinetReporting.aspx' AS Expr2,
                                                 (SELECT     ID
                                                   FROM          mm.Outcome8MenuCategory AS Outcome8MenuCategory_9
                                                   WHERE      (Title = 'Outcome Pages')) AS Expr3, 90 AS Expr4
                       UNION ALL
                       SELECT     10002 AS OrderBy1, 0 AS OrderBy2, 'Key Indicators' AS Expr1, '/Outcome8/Dashboards/Template%20Pages/Key%20Indicators.aspx' AS Expr2,
                                                 (SELECT     ID
                                                   FROM          mm.Outcome8MenuCategory AS Outcome8MenuCategory_8
                                                   WHERE      (Title = 'Outcome Pages')) AS Expr3, 80 AS Expr4
                       UNION ALL
                       SELECT     10003 AS OrderBy1, 0 AS OrderBy2, 'Outcome Level Indicators' AS Expr1, 
                                             '/Outcome8/Dashboards/Template%20Pages/Indicator%20Details%20Page.aspx?qsIndCode=[Outcome].[Outcome].%26[10]' AS Expr2,
                                                 (SELECT     ID
                                                   FROM          mm.Outcome8MenuCategory AS Outcome8MenuCategory_7
                                                   WHERE      (Title = 'Outcome Pages')) AS Expr3, 70 AS Expr4
                       UNION ALL
                       SELECT     10004 AS OrderBy1, 0 AS OrderBy2, 'All Indicators for the Outcome' AS Expr1, 
                                             '/Outcome8/Dashboards/Template%20Pages/All%20Indicators.aspx?qsIndCode=[Outcome].[Outcome].%26[10]' AS Expr2,
                                                 (SELECT     ID
                                                   FROM          mm.Outcome8MenuCategory AS Outcome8MenuCategory_6
                                                   WHERE      (Title = 'Outcome Pages')) AS Expr3, 60 AS Expr4
                       UNION ALL
                       SELECT     10005 AS OrderBy1, 0 AS OrderBy2, 'All Activities for the Outcome' AS Expr1, 
                                             '/Outcome8/Dashboards/Template%20Pages/All%20Activities.aspx?qsIndCode=[Outcome].[Outcome].%26[10]' AS Expr2,
                                                 (SELECT     ID
                                                   FROM          mm.Outcome8MenuCategory AS Outcome8MenuCategory_5
                                                   WHERE      (Title = 'Outcome Pages')) AS Expr3, 50 AS Expr4
                       UNION ALL
                       SELECT     10006 AS OrderBy1, 0 AS OrderBy2, 'Outcome Documents' AS Expr1, '/Outcome8/Documents/Forms/AllItems.aspx' AS Expr2,
                                                 (SELECT     ID
                                                   FROM          mm.Outcome8MenuCategory AS Outcome8MenuCategory_4
                                                   WHERE      (Title = 'Outcome Pages')) AS Expr3, 40 AS Expr4
                       UNION ALL
                       SELECT     10007 AS OrderBy1, 0 AS OrderBy2, 'Data Forum Information' AS Expr1, '/Outcome8/Pages/DataForum.aspx' AS Expr2,
                                                 (SELECT     ID
                                                   FROM          mm.Outcome8MenuCategory AS Outcome8MenuCategory_3
                                                   WHERE      (Title = 'Outcome Pages')) AS Expr3, 30 AS Expr4
                       UNION ALL
                       SELECT     10008 AS OrderBy1, 0 AS OrderBy2, 'Outcome Contact Info' AS Expr1, '/Outcome8/Pages/OutcomeContacts.aspx' AS Expr2,
                                                 (SELECT     ID
                                                   FROM          mm.Outcome8MenuCategory AS Outcome8MenuCategory_2
                                                   WHERE      (Title = 'Outcome Pages')) AS Expr3, 20 AS Expr4
                       UNION ALL
                       SELECT     10009 AS OrderBy1, 0 AS OrderBy2, 'FAQs' AS Expr1, '/Outcome8/Outcome%20Wiki' AS Expr2,
                                                 (SELECT     ID
                                                   FROM          mm.Outcome8MenuCategory AS Outcome8MenuCategory_1
                                                   WHERE      (Title = 'Outcome Pages')) AS Expr3, 10 AS Expr4) AS t
ORDER BY orderBy1, orderby2


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'mm', @level1type = N'VIEW', @level1name = N'oldOutcome8MenuGroup';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'mm', @level1type = N'VIEW', @level1name = N'oldOutcome8MenuGroup';

