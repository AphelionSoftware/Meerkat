


CREATE   VIEW [Access].[vwProjectUserMap]
as

select P.ProjectID , UserID from app.Project P
 inner join Access.User_SystemRole_ProjectProgramme Acc
 on p.ProjectID = acc.ProjectID
 OR P.Programme_ID = acc.Programme_ID
 UNION
 select P.ProjectID , U.UserID
 FROM app.Project P
 CROSS JOIN access.[User] U
 INNER JOIN Access.User_SystemRole_ProjectProgramme RM
 ON U.UserID = RM.[UserID]
 INNER JOIN Access.SystemRole SR
 ON RM.SystemRole_ID = SR.SystemRole_ID
 INNER JOIN Access.RoleType RT
 ON SR.RoleType_ID = RT.RoleType_ID
 AND RT.RoleTypeCode = 'SU'