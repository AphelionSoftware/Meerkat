




CREATE   VIEW [Access].[vwEventUserMap]
as

select E.Event_ID, P.ProjectID , acc.UserID from app.Project P
 inner join Access.User_SystemRole_ProjectProgramme Acc
 on p.ProjectID = acc.ProjectID
 OR P.Programme_ID = acc.Programme_ID
 inner join Access.[User] U
 on acc.UserID = u.UserID
 and u.Active = 1
 inner join forms.Event E
 on p.ProjectID  = E.Project_ID
 WHERE P.Active = 1
 UNION
 select E.Event_ID, U.UserID, P.ProjectID 
 FROM app.Project P
 CROSS JOIN access.[User] U
 INNER JOIN Access.User_SystemRole_ProjectProgramme RM
 ON U.UserID = RM.[UserID]
 INNER JOIN Access.SystemRole SR
 ON RM.SystemRole_ID = SR.SystemRole_ID
 INNER JOIN Access.RoleType RT
 ON SR.RoleType_ID = RT.RoleType_ID
 AND RT.RoleTypeCode = 'SU'
 
 inner join forms.Event E
 on p.ProjectID  = E.Project_ID
 WHERE U.Active = 1
 and P.Active = 1