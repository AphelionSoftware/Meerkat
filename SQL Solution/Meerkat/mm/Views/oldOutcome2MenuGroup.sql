




CREATE VIEW [mm].[oldOutcome2MenuGroup]
AS
SELECT     TOP (10000) Title, Link, Parent, ID
FROM         (
                                         SELECT  
                                                dso.Code AS orderBy1
                                                ,1 AS orderby2
                                                ,dso.ShortName AS Title
                                                ,'/Outcome2/Dashboards/Template%20Pages/Indicator%20Details%20Page.aspx?qsIndCode=' + '[Sub Output].[Sub Output].%26[' + CAST(dso.SubOutput_ID AS varchar(8)) + ']' AS Link
                                                ,(SELECT ID FROM mm.Outcome2MenuCategory where (Title = do.ShortName)) AS Parent
                                                , 1 - dso.SubOutput_ID + 5000 AS ID
                                         FROM          
                                                app.SubOutput AS dso INNER JOIN
                                                app.Output AS do ON dso.Output_ID = do.Output_ID
                                         WHERE      (do.outcomeId=9)
										
                    UNION ALL
                        SELECT  
                                                do.ShortName AS orderBy1
                                                ,1 AS orderby2
                                                ,do.ShortName + ' Indicators' AS Title
                                                ,'/Outcome2/Dashboards/Template%20Pages/Indicator%20Details%20Page.aspx?qsIndCode=' + '[Output].[Output].%26[' + CAST(do.Output_ID AS varchar(8)) + ']' AS Link
                                                ,(SELECT ID FROM mm.Outcome2MenuCategory WHERE (Title = do.ShortName)) AS Parent
                                                , 100 + do.Output_ID AS ID
                                         FROM          
                                                app.Output AS do INNER JOIN
                                                app.Outcome AS dom ON do.OutcomeID = dom.OutcomeID
                                         WHERE      (do.outcomeId=9)


               UNION ALL
                       SELECT     '10003' AS OrderBy1, 0 AS OrderBy2, 'Outcome Level Indicators' AS Title, 
                                             '/Outcome2/Dashboards/Template%20Pages/Indicator%20Details%20Page.aspx?qsIndCode=[Outcome].[Outcome].%26[10]' AS Link,
                                                 (SELECT     ID
                                                   FROM          mm.Outcome2MenuCategory AS Outcome2MenuCategory_7
                                                   WHERE      (Title = 'Outcome Pages')) AS Parent, 70 AS ID
                       /*UNION ALL
                       SELECT     10004 AS OrderBy1, 0 AS OrderBy2, 'All Indicators for the Outcome' AS Title, 
                                             '/Outcome2/Dashboards/Template%20Pages/All%20Indicators.aspx?qsIndCode=[Outcome].[Outcome].%26[10]' AS Link,
                                                 (SELECT     ID
                                                   FROM          mm.Outcome2MenuCategory AS Outcome2MenuCategory_6
                                                   WHERE      (Title = 'Outcome Pages')) AS Parent, 60 AS ID
                       UNION ALL
                       SELECT     10005 AS OrderBy1, 0 AS OrderBy2, 'All Activities for the Outcome' AS Title, 
                                             '/Outcome2/Dashboards/Template%20Pages/All%20Activities.aspx?qsIndCode=[Outcome].[Outcome].%26[10]' AS Link,
                                                 (SELECT     ID
                                                   FROM          mm.Outcome2MenuCategory AS Outcome2MenuCategory_5
                                                   WHERE      (Title = 'Outcome Pages')) AS Parent, 50 AS ID
                      */ UNION ALL
                       SELECT     '10006' AS OrderBy1, 0 AS OrderBy2, 'Outcome Documents' AS Title, '/Outcome2/Documents/Forms/AllItems.aspx' AS Link,
                                                 (SELECT     ID
                                                   FROM          mm.Outcome2MenuCategory AS Outcome2MenuCategory_4
                                                   WHERE      (Title = 'Outcome Pages')) AS Parent, 40 AS ID
                       UNION ALL
                       SELECT     '10008' AS OrderBy1, 0 AS OrderBy2, 'Outcome Contact Info' AS Title, '/Outcome2/Pages/OutcomeContacts.aspx' AS Link,
                                                 (SELECT     ID
                                                   FROM          mm.Outcome2MenuCategory AS Outcome2MenuCategory_2
                                                   WHERE      (Title = 'Outcome Pages')) AS Parent, 20 AS ID
                       UNION ALL
                       SELECT     '10009' AS OrderBy1, 0 AS OrderBy2, 'FAQs' AS Title, '/Outcome2/Outcome%20Wiki' AS Link,
                                                 (SELECT     ID
                                                   FROM          mm.Outcome2MenuCategory AS Outcome2MenuCategory_1
                                                   WHERE      (Title = 'Outcome Pages')) AS Parent, 10 AS ID

				UNION ALL
                       SELECT     P.ShortName AS OrderBy1, 30000 AS OrderBy2
									, P.ShortName AS Title,
									'' AS Link,
									 Src.ID AS  Parent
											,SRC.ID +  P.ProjectID as ID
								FROM app.Project P
								CROSS APPLY 
								(SELECT ID
										FROM mm.Outcome2MenuCategory 
											WHERE Title = 'Projects') Src
								WHERE OutcomeID = 9
			) AS t
				

ORDER BY   orderby1, orderby2





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
', @level0type = N'SCHEMA', @level0name = N'mm', @level1type = N'VIEW', @level1name = N'oldOutcome2MenuGroup';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'mm', @level1type = N'VIEW', @level1name = N'oldOutcome2MenuGroup';

