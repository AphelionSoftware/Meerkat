
CREATE VIEW [Access].[vwDataVersionUserMap]
as
select UserID, 
DvJoin.DataVersion_ID
from 
Access.User_SystemRole_ProjectProgramme RM
join Access.SystemRole SR
on RM.SystemRole_ID = SR.SystemRole_ID
join core.DataVersion dv
on SR.DataVersion_ID = dv.DataVersion_ID
join Access.RoleType RT
on SR.RoleType_ID = RT.RoleType_ID
join core.DataVersion DvJoin
on DvJoin.[Order] >= DV.[Order]
OR RT.RoleTypeCode = 'SU' 
GROUP BY UserID, 
DvJoin.DataVersion_ID