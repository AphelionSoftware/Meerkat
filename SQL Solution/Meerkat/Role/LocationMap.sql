CREATE TABLE [Role].[LocationMap]
(
	[LocationMapID] INT NOT NULL CONSTRAINT PK_LocationMapID PRIMARY KEY,
	[LocationID] INT NOT NULL,
	[PersonID] INT NOT NULL,
	[RoleID] INT NOT NULL, 
	CONSTRAINT [FK_LocationMap_LocationID] FOREIGN KEY (LocationID) REFERENCES Core.Location(Location_ID),
    CONSTRAINT [FK_LocationMap_PersonID] FOREIGN KEY (PersonID) REFERENCES Core.Person(Person_ID),
	CONSTRAINT [FK_LocationMap_RoleID] FOREIGN KEY (RoleID) REFERENCES Core.Role(RoleID), 
	CONSTRAINT [UQ_LocationMap_RoleID_PersonID_LocationID] UNIQUE NONCLUSTERED ([RoleID], [PersonID], [LocationID])
)
