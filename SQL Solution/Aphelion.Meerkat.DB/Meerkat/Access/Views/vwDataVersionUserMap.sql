CREATE VIEW Access.vwDataVersionUserMap
as

select userid, 
CASE WHEN MAX(RT.RoleTypeCode) = 'SU' THEN 0 ELSE
min(dv.[Order]) END DataVersionOrder
from 
Access.User_SystemRole_ProjectProgramme RM
join Access.SystemRole SR
on RM.SystemRole_ID = SR.SystemRole_ID
join core.DataVersion dv
on SR.DataVersion_ID = dv.DataVersion_ID
join Access.RoleType RT
on SR.RoleType_ID = RT.RoleType_ID
group by userid