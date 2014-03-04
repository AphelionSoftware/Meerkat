CREATE TABLE [dbo].[OutputMap]
(
	[OutputMapID] INT NOT NULL CONSTRAINT PK_OutputMapID PRIMARY KEY,
	[OutputID] INT NOT NULL,
	[PersonID] INT NOT NULL,
	[RoleID] INT NOT NULL, 
	CONSTRAINT [FK_OutputMap_OutputID] FOREIGN KEY (OutputID) REFERENCES App.Output(Output_ID),
    CONSTRAINT [FK_OutputMap_PersonID] FOREIGN KEY (PersonID) REFERENCES Core.Person(Person_ID),
	CONSTRAINT [FK_OutputMap_RoleID] FOREIGN KEY (RoleID) REFERENCES Core.Role(RoleID), 
	CONSTRAINT [UQ_OutputMap_RoleID_PersonID_OutputID] UNIQUE NONCLUSTERED ([RoleID], [PersonID], [OutputID])
)
