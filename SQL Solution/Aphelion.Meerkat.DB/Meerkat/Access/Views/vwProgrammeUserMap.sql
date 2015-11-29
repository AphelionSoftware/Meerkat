


CREATE   VIEW [Access].[vwProgrammeUserMap]
as

select P.Programme_ID , UserID from app.Programme P
 inner join Access.User_SystemRole_ProjectProgramme Acc
 on p.Programme_ID = acc.Programme_ID
 OR P.Programme_ID = acc.Programme_ID
 UNION
 select P.Programme_ID , U.UserID
 FROM app.Programme P
 CROSS JOIN access.[User] U
 INNER JOIN Access.User_SystemRole_ProjectProgramme RM
 ON U.UserID = RM.[UserID]
 INNER JOIN Access.SystemRole SR
 ON RM.SystemRole_ID = SR.SystemRole_ID
 INNER JOIN Access.RoleType RT
 ON SR.RoleType_ID = RT.RoleType_ID
 AND RT.RoleTypeCode = 'SU'