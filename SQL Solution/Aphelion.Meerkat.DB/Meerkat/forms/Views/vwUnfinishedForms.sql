
CREATE VIEW [forms].[vwUnfinishedForms]
AS

SELECT FR.FormResponse_ID, FR.Form_ID, FR.ProjectID  FROM forms.FormResponse FR
WHERE (

select count(DISTINCT Question_ID)  From forms.Response R
WHERE r.FormResponse_ID = FR.FormResponse_ID)
<

(select count(*) from forms.Question Q
INNER join forms.Category C
on Q.Category_ID = C.Category_ID
WHERE C.Form_ID = FR.Form_ID)