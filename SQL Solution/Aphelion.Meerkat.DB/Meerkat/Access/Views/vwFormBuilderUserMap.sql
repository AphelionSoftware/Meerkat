





CREATE   VIEW [Access].[vwFormBuilderUserMap]
as

select F.Form_ID, P.ProjectID , acc.UserID from app.Project P
 inner join Access.User_SystemRole_ProjectProgramme Acc
 on p.ProjectID = acc.ProjectID
 OR P.Programme_ID = acc.Programme_ID
 inner join Access.[User] U
 on acc.UserID = u.UserID
 and u.Active = 1
 left join forms.Form_Project FP
 on P.ProjectID = FP.ProjectID
 left join forms.Form_Programme FProg
 on P.Programme_ID = FProg.Programme_ID

 
 inner join forms.Form F
 ON FP.Form_ID  = F.Form_ID
 OR FProg.Form_ID = F.Form_ID
 inner join [Access].[SystemRole] SR
 on Acc.SystemRole_ID = SR.SystemRole_ID
 AND SystemRoleSourceKey = 'FM'
 
 

 WHERE P.Active = 1
 UNION
 select F.Form_ID, U.UserID, P.ProjectID 
 FROM app.Project P
 CROSS JOIN access.[User] U
 INNER JOIN Access.User_SystemRole_ProjectProgramme RM
 ON U.UserID = RM.[UserID]
 INNER JOIN Access.SystemRole SR
 ON RM.SystemRole_ID = SR.SystemRole_ID
 INNER JOIN Access.RoleType RT
 ON SR.RoleType_ID = RT.RoleType_ID
 AND RT.RoleTypeCode = 'SU'
 
left join forms.Form_Project FP
 on P.ProjectID = FP.ProjectID
 left join forms.Form_Programme FProg
 on P.Programme_ID = FProg.Programme_ID

 
 inner join forms.Form F
 ON FP.Form_ID  = F.Form_ID
 OR FProg.Form_ID = F.Form_ID
 WHERE U.Active = 1
 and P.Active = 1