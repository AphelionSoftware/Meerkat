
CREATE VIEW [Access].[vwLocationUserMap]
As
select L.Location_ID ParentLocation_ID, U.UserID, L.Location_ID
 FROM core.location L
 CROSS JOIN access.[User] U
 INNER JOIN Access.User_SystemRole_ProjectProgramme RM
 ON U.UserID = RM.[UserID]
 INNER JOIN Access.SystemRole SR
 ON RM.SystemRole_ID = SR.SystemRole_ID
 INNER JOIN Access.RoleType RT
 ON SR.RoleType_ID = RT.RoleType_ID
 AND RT.RoleTypeCode = 'SU'
 WHERE U.Active = 1
 and L.Active = 1

 UNION ALL

SELECT L.Location_ID ParentLocation_ID, UL.UserID,  L.Location_ID
FROM core.Location L
INNER JOIN Access.User_Location UL
ON L.Location_ID = UL.Location_ID
UNION ALL
SELECT L.Location_ID ParentLocation_ID, UL.UserID,  L2.Location_ID
FROM core.Location L
INNER JOIN core.Location L2
ON L.Location_ID = L2.ParentLocation_ID
INNER JOIN Access.User_Location UL
ON L.Location_ID = UL.Location_ID

UNION ALL
SELECT L.Location_ID ParentLocation_ID, UL.UserID,  L3.Location_ID
FROM core.Location L
INNER JOIN core.Location L2
ON L.Location_ID = L2.ParentLocation_ID
INNER JOIN core.Location L3
ON L2.Location_ID = L3.ParentLocation_ID
INNER JOIN Access.User_Location UL
ON L.Location_ID = UL.Location_ID

UNION ALL
SELECT L.Location_ID ParentLocation_ID, UL.UserID,  L4.Location_ID
FROM core.Location L
INNER JOIN core.Location L2
ON L.Location_ID = L2.ParentLocation_ID
INNER JOIN core.Location L3
ON L2.Location_ID = L3.ParentLocation_ID
INNER JOIN core.Location L4
ON L3.Location_ID = L4.ParentLocation_ID
INNER JOIN Access.User_Location UL
ON L.Location_ID = UL.Location_ID

UNION ALL
SELECT L.Location_ID ParentLocation_ID, UL.UserID,  L5.Location_ID
FROM core.Location L
INNER JOIN core.Location L2
ON L.Location_ID = L2.ParentLocation_ID
INNER JOIN core.Location L3
ON L2.Location_ID = L3.ParentLocation_ID
INNER JOIN core.Location L4
ON L3.Location_ID = L4.ParentLocation_ID
INNER JOIN core.Location L5
ON L4.Location_ID = L5.ParentLocation_ID
INNER JOIN Access.User_Location UL
ON L.Location_ID = UL.Location_ID

UNION ALL
SELECT L.Location_ID ParentLocation_ID, UL.UserID,  L6.Location_ID
FROM core.Location L
INNER JOIN core.Location L2
ON L.Location_ID = L2.ParentLocation_ID
INNER JOIN core.Location L3
ON L2.Location_ID = L3.ParentLocation_ID
INNER JOIN core.Location L4
ON L3.Location_ID = L4.ParentLocation_ID
INNER JOIN core.Location L5
ON L4.Location_ID = L5.ParentLocation_ID
INNER JOIN core.Location L6
ON L5.Location_ID = L6.ParentLocation_ID
INNER JOIN Access.User_Location UL
ON L.Location_ID = UL.Location_ID

UNION ALL
SELECT L.Location_ID ParentLocation_ID, UL.UserID,  L7.Location_ID
FROM core.Location L
INNER JOIN core.Location L2
ON L.Location_ID = L2.ParentLocation_ID
INNER JOIN core.Location L3
ON L2.Location_ID = L3.ParentLocation_ID
INNER JOIN core.Location L4
ON L3.Location_ID = L4.ParentLocation_ID
INNER JOIN core.Location L5
ON L4.Location_ID = L5.ParentLocation_ID
INNER JOIN core.Location L6
ON L5.Location_ID = L6.ParentLocation_ID
INNER JOIN core.Location L7
ON L6.Location_ID = L7.ParentLocation_ID
INNER JOIN Access.User_Location UL
ON L.Location_ID = UL.Location_ID

UNION ALL
SELECT L.Location_ID ParentLocation_ID, UL.UserID,  L8.Location_ID
FROM core.Location L
INNER JOIN core.Location L2
ON L.Location_ID = L2.ParentLocation_ID
INNER JOIN core.Location L3
ON L2.Location_ID = L3.ParentLocation_ID
INNER JOIN core.Location L4
ON L3.Location_ID = L4.ParentLocation_ID
INNER JOIN core.Location L5
ON L4.Location_ID = L5.ParentLocation_ID
INNER JOIN core.Location L6
ON L5.Location_ID = L6.ParentLocation_ID
INNER JOIN core.Location L7
ON L6.Location_ID = L7.ParentLocation_ID
INNER JOIN core.Location L8
ON L7.Location_ID = L8.ParentLocation_ID
INNER JOIN Access.User_Location UL
ON L.Location_ID = UL.Location_ID

UNION ALL
SELECT L.Location_ID ParentLocation_ID, UL.UserID,  L9.Location_ID
FROM core.Location L
INNER JOIN core.Location L2
ON L.Location_ID = L2.ParentLocation_ID
INNER JOIN core.Location L3
ON L2.Location_ID = L3.ParentLocation_ID
INNER JOIN core.Location L4
ON L3.Location_ID = L4.ParentLocation_ID
INNER JOIN core.Location L5
ON L4.Location_ID = L5.ParentLocation_ID
INNER JOIN core.Location L6
ON L5.Location_ID = L6.ParentLocation_ID
INNER JOIN core.Location L7
ON L6.Location_ID = L7.ParentLocation_ID
INNER JOIN core.Location L8
ON L7.Location_ID = L8.ParentLocation_ID
INNER JOIN core.Location L9
ON L8.Location_ID = L9.ParentLocation_ID
INNER JOIN Access.User_Location UL
ON L.Location_ID = UL.Location_ID