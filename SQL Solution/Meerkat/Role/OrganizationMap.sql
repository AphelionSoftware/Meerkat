CREATE TABLE [Role].[OrganizationMap]
(
	[OrganizationMapID] INT NOT NULL CONSTRAINT PK_OrganizationMapID PRIMARY KEY,
	[OrganizationID] INT NOT NULL,
	[PersonID] INT NOT NULL,
	[RoleID] INT NOT NULL, 
	CONSTRAINT [FK_OrganizationMap_OrganizationID] FOREIGN KEY (OrganizationID) REFERENCES Core.Organization(Organization_ID),
    CONSTRAINT [FK_OrganizationMap_PersonID] FOREIGN KEY (PersonID) REFERENCES Core.Person(Person_ID),
	CONSTRAINT [FK_OrganizationMap_RoleID] FOREIGN KEY (RoleID) REFERENCES Core.Role(RoleID), 
	CONSTRAINT [UQ_OrganizationMap_RoleID_PersonID_OrganizationID] UNIQUE NONCLUSTERED ([RoleID], [PersonID], [OrganizationID])
)