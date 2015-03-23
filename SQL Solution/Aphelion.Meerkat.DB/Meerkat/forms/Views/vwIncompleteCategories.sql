
CREATE VIEW [forms].[vwIncompleteCategories]
as
SELECT  ISNULL(cast(C.[Category_ID] as bigint) + (CAST(FR.FormResponse_ID as bigint) * -10000000), 0) AS vwIncompleteCategoriesID
	  , C.[Category_ID]
      , C.[Name]
      , C.[Code]
      , C.[TextDescription]
      , C.[Form_ID]
      , C.[CategoryOrder]
      , C.[Active]
      , C.[sys_CreatedBy]
      , C.[sys_CreatedOn]
      , C.[sys_ModifiedBy]
      , C.[sys_ModifiedOn]
      , C.[LocalName]
	  , FR.FormResponse_ID
  FROM [forms].[Category] C
  INNER JOIN [forms].[FormResponse] FR 
	ON C.Form_ID = FR.Form_ID
WHERE NOT EXISTS ( SELECT 1 
		FROM [forms].Response R
			INNER JOIN [forms].Question Q
				ON R.Question_ID = Q.Question_ID
			WHERE R.FormResponse_ID = FR.FormResponse_ID
			AND Q.Category_ID = C.Category_ID
		)
	AND FR.isComplete = 0