



CREATE   VIEW [Access].[vwMilestoneUserMap]
as

select MilestoneID, acc.UserID from app.Milestone M
 inner join app.Project P
 on M.ProjectID = p.ProjectID
 and P.Active = 1
 inner join Access.User_SystemRole_ProjectProgramme Acc
 on p.ProjectID = acc.ProjectID
inner join Access.[User] U
 on acc.UserID = u.UserID
 and u.Active = 1
 UNION
select MilestoneID, acc.UserID  from app.Milestone M
 inner join app.Activity A
 on M.Activity_ID = A.Activity_ID
 and A.Active = 1
 INNER JOIN app.Project P
 ON A.ProjectID = P.ProjectID
 and P.Active = 1
 inner join Access.User_SystemRole_ProjectProgramme Acc
 on p.Programme_ID = acc.Programme_ID
 OR P.ProjectID = acc.ProjectID
 inner join Access.[User] U
 on acc.UserID = u.UserID
 and u.Active = 1
 UNION
 select MilestoneID, U.UserID
 FROM app.Milestone M
 CROSS JOIN access.[User] U
 INNER JOIN Access.User_SystemRole_ProjectProgramme RM
 ON U.UserID = RM.[UserID]
 INNER JOIN Access.SystemRole SR
 ON RM.SystemRole_ID = SR.SystemRole_ID
 INNER JOIN Access.RoleType RT
 ON SR.RoleType_ID = RT.RoleType_ID
 AND RT.RoleTypeCode = 'SU'
 WHERE U.Active = 1
 and M.Active = 1