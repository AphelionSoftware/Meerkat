



CREATE   VIEW [Access].[vwActivityUserMap]
as

select Activity_ID, Acc.UserID from app.Activity A
 inner join app.Project P
 on A.ProjectID = p.ProjectID
 and p.Active = 1
 inner join Access.User_SystemRole_ProjectProgramme Acc
 on p.ProjectID = acc.ProjectID
 OR P.Programme_ID = acc.Programme_ID
 inner join Access.[User] U
 on Acc.UserID = u.UserID
 and u.Active =1 
 where A.Active = 1
 UNION
 select Activity_ID, U.UserID
 FROM app.Activity A
 CROSS JOIN access.[User] U
 INNER JOIN Access.User_SystemRole_ProjectProgramme RM
 ON U.UserID = RM.[UserID]
 INNER JOIN Access.SystemRole SR
 ON RM.SystemRole_ID = SR.SystemRole_ID
 INNER JOIN Access.RoleType RT
 ON SR.RoleType_ID = RT.RoleType_ID
 AND RT.RoleTypeCode = 'SU'
 where A.Active = 1
 and U.Active =1