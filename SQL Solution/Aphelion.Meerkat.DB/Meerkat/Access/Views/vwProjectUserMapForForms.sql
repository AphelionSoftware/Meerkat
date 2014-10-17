




CREATE VIEW [Access].[vwProjectUserMapForForms]
as

select P.ProjectID , acc.UserID
, fp.Form_ID
 from app.Project P
 inner join Access.User_SystemRole_ProjectProgramme Acc
 on p.ProjectID = acc.ProjectID
 OR P.Programme_ID = acc.Programme_ID
 inner join Access.[User] U
 on acc.UserID = u.UserID
 and u.Active = 1
 inner join forms.Form_Project  fp
 on p.ProjectID = fp.ProjectID
 WHERE P.Active = 1
 UNION
 select P.ProjectID , acc.UserID 
 ,fpp.Form_ID
 from app.Project P
 inner join Access.User_SystemRole_ProjectProgramme Acc
 on p.ProjectID = acc.ProjectID
 OR P.Programme_ID = acc.Programme_ID
 inner join Access.[User] U
 on acc.UserID = u.UserID
 and u.Active = 1
 inner join forms.Form_Programme  fpp
	ON p.Programme_ID = fpp.Programme_ID
 WHERE P.Active = 1
 UNION
 select P.ProjectID , U.UserID, fp.Form_ID
 FROM app.Project P
 CROSS JOIN access.[User] U
 INNER JOIN Access.User_SystemRole_ProjectProgramme RM
 ON U.UserID = RM.[UserID]
 INNER JOIN Access.SystemRole SR
 ON RM.SystemRole_ID = SR.SystemRole_ID
 INNER JOIN Access.RoleType RT
 ON SR.RoleType_ID = RT.RoleType_ID
 AND RT.RoleTypeCode = 'SU'
 inner join forms.Form_Project  fp
 on p.ProjectID = fp.ProjectID
 WHERE U.Active = 1
 and P.Active = 1 UNION
 select P.ProjectID , U.UserID, fp.Form_ID
 FROM app.Project P
 CROSS JOIN access.[User] U
 INNER JOIN Access.User_SystemRole_ProjectProgramme RM
 ON U.UserID = RM.[UserID]
 INNER JOIN Access.SystemRole SR
 ON RM.SystemRole_ID = SR.SystemRole_ID
 INNER JOIN Access.RoleType RT
 ON SR.RoleType_ID = RT.RoleType_ID
 AND RT.RoleTypeCode = 'SU'
 inner join forms.Form_Programme  fp
	ON p.Programme_ID = fp.Programme_ID
 WHERE U.Active = 1
 and P.Active = 1