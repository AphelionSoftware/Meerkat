CREATE TABLE [dbo].[IndicatorMap]
(
	[IndicatorMapID] INT NOT NULL CONSTRAINT PK_IndicatorMapID PRIMARY KEY,
	[IndicatorID] INT NOT NULL,
	[PersonID] INT NOT NULL,
	[RoleID] INT NOT NULL, 
	CONSTRAINT [FK_IndicatorMap_IndicatorID] FOREIGN KEY (IndicatorID) REFERENCES App.Indicator(IndicatorID),
    CONSTRAINT [FK_IndicatorMap_PersonID] FOREIGN KEY (PersonID) REFERENCES Core.Person(Person_ID),
	CONSTRAINT [FK_IndicatorMap_RoleID] FOREIGN KEY (RoleID) REFERENCES Core.Role(RoleID), 
	CONSTRAINT [UQ_IndicatorMap_RoleID_PersonID_IndicatorID] UNIQUE NONCLUSTERED ([RoleID], [PersonID], [IndicatorID])
)