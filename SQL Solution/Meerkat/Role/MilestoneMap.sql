CREATE TABLE [dbo].[MilestoneMap]
(
	[MilestoneMapID] INT NOT NULL CONSTRAINT PK_MilestoneMapID PRIMARY KEY,
	[MilestoneID] INT NOT NULL,
	[PersonID] INT NOT NULL,
	[RoleID] INT NOT NULL, 
	CONSTRAINT [FK_MilestoneMap_MilestoneID] FOREIGN KEY (MilestoneID) REFERENCES App.Milestone(MilestoneID),
    CONSTRAINT [FK_MilestoneMap_PersonID] FOREIGN KEY (PersonID) REFERENCES Core.Person(Person_ID),
	CONSTRAINT [FK_MilestoneMap_RoleID] FOREIGN KEY (RoleID) REFERENCES Core.Role(RoleID), 
	CONSTRAINT [UQ_MilestoneMap_RoleID_PersonID_MilestoneID] UNIQUE NONCLUSTERED ([RoleID], [PersonID], [MilestoneID])
)
