CREATE View [PowerPivot].FactIndicatorValues
as
SELECT [IndicatorValues_ID]
      ,[Indicator_ID]
      ,[ActualLabel]
      ,[ActualValue]
      ,[ActualDate]
      ,[BusinessKey]
      ,[Notes]
      ,[DataVersion_ID]
      ,[Location_ID]
      ,[ReportPeriodID]
      ,[Organization_ID]
        FROM [RBM].[IndicatorValues]
		WHERE Active = 1