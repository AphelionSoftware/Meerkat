CREATE VIEW Access.vwFormUserMap
as

/*Forms by project*/
select F.Form_ID , acc.UserID 
from forms.Form F
INNER JOIN forms.Form_Project FP 
on F.Form_ID = FP.Form_ID
INNER JOIN 
 app.Project P
 ON FP.ProjectID = P.ProjectID
 inner join Access.User_SystemRole_ProjectProgramme Acc
 on p.ProjectID = acc.ProjectID
 OR P.Programme_ID = acc.Programme_ID
 inner join Access.[User] U
 on acc.UserID = u.UserID
 and u.Active = 1
 
 WHERE P.Active = 1
 and f.Active = 1
 UNION
/*Forms by programme*/
select F.Form_ID , acc.UserID 
from forms.Form F
INNER JOIN forms.Form_Programme FP 
on F.Form_ID = FP.Form_ID
INNER JOIN 
 app.Programme P
 ON FP.Programme_ID = P.Programme_ID
 inner join Access.User_SystemRole_ProjectProgramme Acc
 on  P.Programme_ID = acc.Programme_ID
 inner join Access.[User] U
 on acc.UserID = u.UserID
 and u.Active = 1
 WHERE P.Active = 1
 and f.Active = 1
 UNION
 /*All forms for super users*/
 select F.Form_ID , U.UserID
 FROM forms.Form F
 CROSS JOIN access.[User] U
 INNER JOIN Access.User_SystemRole_ProjectProgramme RM
 ON U.UserID = RM.[UserID]
 INNER JOIN Access.SystemRole SR
 ON RM.SystemRole_ID = SR.SystemRole_ID
 INNER JOIN Access.RoleType RT
 ON SR.RoleType_ID = RT.RoleType_ID
 AND RT.RoleTypeCode = 'SU'
 WHERE U.Active = 1
 and F.Active = 1