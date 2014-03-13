CREATE TABLE [Role].[OutcomeMap]
(
	[OutcomeMapID] INT NOT NULL CONSTRAINT PK_OutcomeMapID PRIMARY KEY,
	[OutcomeID] INT NOT NULL,
	[PersonID] INT NOT NULL,
	[RoleID] INT NOT NULL, 
	CONSTRAINT [FK_OutcomeMap_OutcomeID] FOREIGN KEY (OutcomeID) REFERENCES App.Outcome(OutcomeID),
    CONSTRAINT [FK_OutcomeMap_PersonID] FOREIGN KEY (PersonID) REFERENCES Core.Person(Person_ID),
	CONSTRAINT [FK_OutcomeMap_RoleID] FOREIGN KEY (RoleID) REFERENCES Core.Role(RoleID), 
	CONSTRAINT [UQ_OutcomeMap_RoleID_PersonID_OutcomeID] UNIQUE NONCLUSTERED ([RoleID], [PersonID], [OutcomeID])
)