CREATE VIEW forms.vw_ResponsesByIndicator
AS
SELECT [Response_ID]
      ,R.[FormResponse_ID]
      ,R.[Question_ID]
      ,R.[PotentialResponse_ID]
      ,R.[Response]
      ,R.[IntegerResponse]
      ,R.[DecimalResponse]
      ,R.[TrueFalse]
	  ,I.IndicatorID
	  ,R.sys_ModifiedBy
	  ,R.sys_ModifiedOn
  FROM [forms].[Response] R
  INNER JOIN forms.Question_Indicator_Rollup QIR
  oN R.Question_ID = QIR.Question_ID
  INNER JOIN app.Indicator I
  ON QIR.Indicator_ID = I.IndicatorID