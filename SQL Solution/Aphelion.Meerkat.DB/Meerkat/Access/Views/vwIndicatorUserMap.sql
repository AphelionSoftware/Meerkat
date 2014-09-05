

CREATE VIEW [Access].[vwIndicatorUserMap]
as

select IndicatorID, UserID from app.Indicator i
 inner join app.Project P
 on i.ProjectID = p.ProjectID
 inner join Access.User_SystemRole_ProjectProgramme Acc
 on p.ProjectID = acc.ProjectID
 --where acc.UserID = 1
 UNION
select IndicatorID, UserID  from app.Indicator i
 inner join app.Programme P
 on i.Programme_ID = p.Programme_ID
 inner join Access.User_SystemRole_ProjectProgramme Acc
 on p.Programme_ID = acc.Programme_ID
 UNION
select IndicatorID, UserID  from app.Indicator i
inner join app.Project PR
on I.ProjectID = PR.ProjectID
 inner join app.Programme P
 ON PR.Programme_ID = P.Programme_ID
 inner join Access.User_SystemRole_ProjectProgramme Acc
 on p.Programme_ID = acc.Programme_ID
 UNION
 select IndicatorID, U.UserID
 FROM app.Indicator I
 CROSS JOIN access.[User] U
 INNER JOIN Access.User_SystemRole_ProjectProgramme RM
 ON U.UserID = RM.[UserID]
 INNER JOIN Access.SystemRole SR
 ON RM.SystemRole_ID = SR.SystemRole_ID
 INNER JOIN Access.RoleType RT
 ON SR.RoleType_ID = RT.RoleType_ID
 AND RT.RoleTypeCode = 'SU'