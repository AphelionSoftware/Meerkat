CREATE VIEW rpt.ProjectStatusScorecard
as
SELECT [StatusValuesID]
      ,[ReportingPeriodID]
      ,[LocationID]
      ,pr.ShortName ProjectName
	  ,S.ShortName Sectorname
	  ,P.ShortName ProgramName
	  ,st.Value
	  ,1 As Target
  FROM [RBM].[StatusValues] SV
  INNER JOIN core.StatusType ST
on sv.StatusTypeID = st.ID
inner join app.Project Pr
ON sv.ProjectID = Pr.ProjectID
inner join app.Sector S
on Pr.Sector_ID = S.Sector_ID
inner join app.Programme p
on s.Programme_ID = p.Programme_ID
 where    [DataVersionID] = 1