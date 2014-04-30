/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
USE [Meerkat]
GO
SET IDENTITY_INSERT [Core].[OrganizationType] ON 

GO
IF NOT EXISTS (
        SELECT 1
        FROM [Core].[OrganizationType]
        WHERE [OrganizationType_ID] = 1
)
BEGIN
    INSERT [Core].[OrganizationType] ([OrganizationType_ID], [Description], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (1, N'Food Support', 1, N'dbo', CAST(0x0000A23700F26E2A AS DateTime), N'dbo', CAST(0x0000A23700F26E2A AS DateTime))
END
GO
IF NOT EXISTS (
        SELECT 1
        FROM [Core].[OrganizationType]
        WHERE [OrganizationType_ID] = 2
)
BEGIN
    INSERT [Core].[OrganizationType] ([OrganizationType_ID], [Description], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (2, N'Agricultural Development Support', 1, N'dbo', CAST(0x0000A23700F27C1C AS DateTime), N'dbo', CAST(0x0000A23700F27C1C AS DateTime))
END
GO
IF NOT EXISTS (
        SELECT 1
        FROM [Core].[OrganizationType]
        WHERE [OrganizationType_ID] = 3
)
BEGIN
    INSERT [Core].[OrganizationType] ([OrganizationType_ID], [Description], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (3, N'Funding/Financing Support', 1, N'dbo', CAST(0x0000A23700F28B06 AS DateTime), N'dbo', CAST(0x0000A23700F28B06 AS DateTime))
END
GO
IF NOT EXISTS (
        SELECT 1
        FROM [Core].[OrganizationType]
        WHERE [OrganizationType_ID] = 4
)
BEGIN
    INSERT [Core].[OrganizationType] ([OrganizationType_ID], [Description], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (4, N'Educational Support', 1, N'dbo', CAST(0x0000A23700F29855 AS DateTime), N'dbo', CAST(0x0000A23700F29855 AS DateTime))
END
GO
IF NOT EXISTS (
        SELECT 1
        FROM [Core].[OrganizationType]
        WHERE [OrganizationType_ID] = 5
)
BEGIN
    INSERT [Core].[OrganizationType] ([OrganizationType_ID], [Description], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (5, N'Transport Support', 1, N'dbo', CAST(0x0000A23700F2A66F AS DateTime), N'dbo', CAST(0x0000A23700F2A66F AS DateTime))
END
GO
IF NOT EXISTS (
        SELECT 1
        FROM [Core].[OrganizationType]
        WHERE [OrganizationType_ID] = 6
)
BEGIN
    INSERT [Core].[OrganizationType] ([OrganizationType_ID], [Description], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (6, N'Telecomunications Support', 1, N'dbo', CAST(0x0000A23700F2B7D9 AS DateTime), N'dbo', CAST(0x0000A23700F2B7D9 AS DateTime))
END
GO
IF NOT EXISTS (
        SELECT 1
        FROM [Core].[OrganizationType]
        WHERE [OrganizationType_ID] = 7
)
BEGIN
    INSERT [Core].[OrganizationType] ([OrganizationType_ID], [Description], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (7, N'Health & Wellbeing Support', 1, N'dbo', CAST(0x0000A23700F2C268 AS DateTime), N'dbo', CAST(0x0000A23700F2C268 AS DateTime))
END
GO
SET IDENTITY_INSERT [Core].[OrganizationType] OFF
GO