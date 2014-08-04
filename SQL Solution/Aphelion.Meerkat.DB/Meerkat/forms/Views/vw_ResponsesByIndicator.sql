CREATE VIEW forms.vw_ResponsesByIndicator
AS
SELECT [Response_ID]
      ,R.[FormResponse_ID]
      ,R.[Question_ID]
      ,R.[PotentialResponse_ID]
      ,[QuestionResponse] = 
		CASE 
			WHEN QT.Code = 'CTN' THEN 1 
			WHEN QT.Code = 'INT' THEN CAST( R.IntegerResponse as INT)
			WHEN QT.Code = 'DEC' THEN R.DecimalResponse
			WHEN QT.Code = 'BOOL' THEN R.TrueFalse
			WHEN QT.Code = 'TR' THEN R.Response
			WHEN QT.Code = 'RB' OR QT.Code = 'MCQ' THEN PR.Code
			END
	  ,R.Response
      ,R.[IntegerResponse]
      ,R.[DecimalResponse]
      ,R.[TrueFalse]
	  ,I.IndicatorID
	  ,R.sys_ModifiedBy
	  ,R.sys_ModifiedOn
	  ,FR.Location_ID
	  ,RT.RollupType_ID
	  ,RT.Code RollupTypeCode
	  ,RT.Name RollupTypeName
  FROM [forms].[Response] R
  INNER JOIN forms.Question_Indicator_Rollup QIR
  oN R.Question_ID = QIR.Question_ID
  INNER JOIN forms.RollupType RT
  ON QIR.Question_Indicator_RollupID = RT.RollupType_ID
  INNER JOIN app.Indicator I
  ON QIR.Indicator_ID = I.IndicatorID
  INNER JOIN forms.Question Q
  ON R.Question_ID = Q.Question_ID
  INNER JOIN forms.QuestionType QT
  ON Q.QuestionType_ID = QT.QuestionType_ID
  LEFT JOIN forms.PotentialResponse PR
  ON R.PotentialResponse_ID = PR.PotentialResponse_ID
  INNER JOIN Forms.FormResponse FR
  ON r.FormResponse_ID = fr.FormResponse_ID
