CREATE TABLE [dbo].[SubOutputMap]
(
	[SubOutputMapID] INT NOT NULL CONSTRAINT PK_SubOutputMapID PRIMARY KEY,
	[SubOutputID] INT NOT NULL,
	[PersonID] INT NOT NULL,
	[RoleID] INT NOT NULL, 
	CONSTRAINT [FK_SubOutputMap_SubOutputID] FOREIGN KEY (SubOutputID) REFERENCES App.SubOutput(SubOutput_ID),
    CONSTRAINT [FK_SubOutputMap_PersonID] FOREIGN KEY (PersonID) REFERENCES Core.Person(Person_ID),
	CONSTRAINT [FK_SubOutputMap_RoleID] FOREIGN KEY (RoleID) REFERENCES Core.Role(RoleID), 
	CONSTRAINT [UQ_SubOutputMap_RoleID_PersonID_SubOutputID] UNIQUE NONCLUSTERED ([RoleID], [PersonID], [SubOutputID])
)
