


CREATE   VIEW [Access].[vwMilestoneUserMap]
as

select MilestoneID, UserID from app.Milestone M
 inner join app.Project P
 on M.ProjectID = p.ProjectID
 inner join Access.User_SystemRole_ProjectProgramme Acc
 on p.ProjectID = acc.ProjectID
 --where acc.UserID = 1
 UNION
select MilestoneID, UserID  from app.Milestone M
 inner join app.Activity A
 on M.Activity_ID = A.Activity_ID
 INNER JOIN app.Project P
 ON A.ProjectID = P.ProjectID
 inner join Access.User_SystemRole_ProjectProgramme Acc
 on p.Programme_ID = acc.Programme_ID
 OR P.ProjectID = acc.ProjectID
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