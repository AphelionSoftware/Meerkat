
CREATE VIEW [mm].[oldOutcome8MenuLink]
AS
/*
SELECT     Title = 'Indicator Details', 
                      Link = '/Outcome8/Dashboards/Template%20Pages/Indicator%20Details%20Page.aspx?qsIndCode=' + '[Sub Output].[Sub Output].%26[' + CAST(dso.SubOutput_ID
                       AS varchar(8)) + ']', ID = 100 * dso.suboutput_id, Parent =
                          (SELECT     ID
                            FROM          mm.Outcome8MenuGROUP G
                            WHERE      G.Title  = replace(dso.Code,'STP','') + ' : ' + dso.LongName)
FROM         app.DimSubOutput dso INNER JOIN
                      app.DimOutput do ON dso.Output_ID = do.Output_ID
WHERE     do.outcomeId=15
UNION ALL
SELECT     Title = 'Provincial Indicator Details', 
                      Link = '/Outcome8/Dashboards/Template%20Pages/Provincial%20Indicator%20Details%20Page.aspx?qsIndCode=' + '[Sub Output].[Sub Output].%26[' + CAST(dso.SubOutput_ID
                       AS varchar(8)) + ']', Priority = 100 * dso.suboutput_id, Parent =
                          (SELECT     ID
                            FROM          mm.Outcome8MenuGROUP G
                            WHERE      G.Title  = replace(dso.Code,'STP','') + ' : ' + dso.LongName)
FROM         app.DimSubOutput dso INNER JOIN
                      app.DimOutput do ON dso.Output_ID = do.Output_ID
WHERE     do.outcomeId=15
UNION ALL
SELECT     
 Title = Replace(replace(da.FullName, '"', ''),'ACT8','8')
,Link = '/Outcome8/Dashboards/Template%20Pages/Milestones%20Page.aspx?qsActivity=' + '[Activity].[Activity].%26[' + CAST(da.activity_ID AS varchar(8)) + ']'
, Priority = 1 - da.Activity_ID + 5000
, Parent = (SELECT ID FROM mm.Outcome8MenuGROUP G WHERE G.ID = dso.SubOutput_ID)
FROM
app.DimActivity da INNER JOIN
app.DimSubOutput dso ON da.SubOutput_ID = dso.SubOutput_ID INNER JOIN
app.DimOutput do ON dso.Output_ID = do.Output_ID
WHERE do.outcomeId=15
*/
SELECT 'Not implemented' as X



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
', @level0type = N'SCHEMA', @level0name = N'mm', @level1type = N'VIEW', @level1name = N'oldOutcome8MenuLink';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'mm', @level1type = N'VIEW', @level1name = N'oldOutcome8MenuLink';

