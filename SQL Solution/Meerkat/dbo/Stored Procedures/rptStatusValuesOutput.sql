CREATE PROC [dbo].[rptStatusValuesOutput]
    (
      @OutcomeID INT ,
      @ReportingPeriodID INT
    )
AS 
    SELECT  OM.ShortName AS OutcomeName
            ,OP.ShortName AS OutputName
            ,SO.ShortName AS SubOutputname
            ,ST.Value StatusTypeValue
            ,ST.Name StatusType
            ,RP.YearName
            ,RP.ReportingPeriod
			,OM.OutcomeID AS OutcomeID
			,OP.Output_ID AS OutputID
			,SO.SubOutput_ID AS SubOutputID
			,RP.YearNumber

    FROM    [RBM].[StatusValues] SV
            INNER JOIN Core.StatusType ST ON SV.StatusTypeID = ST.ID
            LEFT JOIN [app].[SubOutput] SO ON SV.SubOutput_ID = SO.SubOutput_ID
            LEFT JOIN [app].[Output] OP ON SV.Output_ID = OP.Output_ID
                                       OR SO.Output_ID = OP.Output_ID
            LEFT JOIN [app].[Outcome] OM ON SV.OutcomeID = OM.OutcomeID
                                            OR OP.OutcomeID = OM.OutcomeID
            INNER JOIN [Core].[ReportingPeriod] RP ON SV.ReportingPeriodID = RP.ID
    WHERE   ( OM.OutcomeID = @OutcomeID
              OR @OutcomeID = 0
            )
            AND ( SV.ReportingPeriodID = @ReportingPeriodID
                  OR @ReportingPeriodID = 0
                )