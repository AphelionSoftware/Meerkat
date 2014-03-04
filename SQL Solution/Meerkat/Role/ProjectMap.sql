CREATE TABLE [dbo].[ProjectMap]
(
	[ProjectMapID] INT NOT NULL CONSTRAINT PK_ProjectMapID PRIMARY KEY,
	[ProjectID] INT NOT NULL,
	[PersonID] INT NOT NULL,
	[RoleID] INT NOT NULL, 
	CONSTRAINT [FK_ProjectMap_ProjectID] FOREIGN KEY (ProjectID) REFERENCES App.Project(ProjectID),
    CONSTRAINT [FK_ProjectMap_PersonID] FOREIGN KEY (PersonID) REFERENCES Core.Person(Person_ID),
	CONSTRAINT [FK_ProjectMap_RoleID] FOREIGN KEY (RoleID) REFERENCES Core.Role(RoleID), 
	CONSTRAINT [UQ_ProjectMap_RoleID_PersonID_ProjectID] UNIQUE NONCLUSTERED ([RoleID], [PersonID], [ProjectID])
)