CREATE VIEW mm.[Outcome1MenuGroup_OLD]
AS
/*Sub Outputs*/ SELECT SOP.BusinessKey + ' : ' + SOP.ShortName + '...' AS Title, 
                         '/' + 'Outcome1' + '/Dashboards/Template%20Pages/Indicator%20Details%20Page.aspx?qsIndCode=[Output].[Output].%26[' + CONVERT(nvarchar(20), 
                         op.Output_ID) + ']' AS Link, 1000 + op.Output_ID AS Parent, 2000 + sop.SubOutput_ID AS ID
/*,op.* */ FROM app.output op INNER JOIN
                         app.outcome oc ON op.OutcomeID = oc.OutcomeID INNER JOIN
                         app.SubOutput SOP ON op.Output_ID = SOP.Output_ID
/*Left outer Join app.Indicator opi on opi.Output_ID=op.Output_ID*/ WHERE oc.code = 'Outcome 1'
UNION ALL
/*Inicators*/ SELECT op.BusinessKey + ' : Indicator ' + CONVERT(Nvarchar(20), Row_Number() OVER (ORDER BY opi.Indicatorid)) + ' ' + opi.ShortName + '...' AS Title, 
'/' + 'Outcome1' + '/Dashboards/Template%20Pages/Indicator%20Details%20Page.aspx?qsIndCode=[Output].[Output].%26[' + CONVERT(nvarchar(20), opi.IndicatorID) 
+ ']' AS Link, 1000 + op.Output_ID AS Parent, 4000 + opi.IndicatorID AS ID
/*,op.* */ FROM app.output op INNER JOIN
                         app.outcome oc ON op.OutcomeID = oc.OutcomeID /*inner join app.SubOutput SOP on op.Output_ID=SOP.Output_ID*/ INNER JOIN
                         app.Indicator opi ON opi.Output_ID = op.Output_ID
/*Left outer Join app.Indicator opi on opi.Output_ID=op.Output_ID*/ WHERE oc.code = 'Outcome 1'
/*Defaults*/ UNION ALL
SELECT        [Title], [Link], [Parent], [ID]
/*,[Active]*/ FROM [dbo].[Outcome1MenuGroup]
WHERE        Parent = 10000

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[31] 4[18] 2[31] 3) )"
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
', @level0type = N'SCHEMA', @level0name = N'mm', @level1type = N'VIEW', @level1name = N'Outcome1MenuGroup_OLD';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'mm', @level1type = N'VIEW', @level1name = N'Outcome1MenuGroup_OLD';

