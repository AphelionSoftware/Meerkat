
SET IDENTITY_INSERT [Core].[Organization] ON 

GO
IF NOT EXISTS (
        SELECT 1
        FROM [Core].[Organization]
        WHERE [Organization_ID] = 1
)
BEGIN
    INSERT [Core].[Organization] ([Organization_ID], [ShortName], [LongName],[Code], [BusinessKey], [OrganizationType_ID], [ParentOrganization_ID], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (1, N'FOA',N'FOA', N'Food and Agriculture Organization',  N'Food and Agriculture Organization', 1, NULL, 1, N'spinstall', CAST(0x0000A23700F7DA7B AS DateTime), N'spinstall', CAST(0x0000A23700F7DA85 AS DateTime))
END
GO
IF NOT EXISTS (
        SELECT 1
        FROM [Core].[Organization]
        WHERE [Organization_ID] = 2
)
BEGIN
    INSERT [Core].[Organization] ([Organization_ID], [ShortName], [LongName],[Code], [BusinessKey], [OrganizationType_ID], [ParentOrganization_ID], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (2, N'IFAD',N'IFAD', N'International Fund for Agricultural Development', N'International Fund for Agricultural Development', 3, NULL, 1, N'spinstall', CAST(0x0000A23700F875D5 AS DateTime), N'spinstall', CAST(0x0000A23700F875D5 AS DateTime))
END
GO
IF NOT EXISTS (
        SELECT 1
        FROM [Core].[Organization]
        WHERE [Organization_ID] = 3
)
BEGIN
    INSERT [Core].[Organization] ([Organization_ID], [ShortName], [LongName],[Code], [BusinessKey], [OrganizationType_ID], [ParentOrganization_ID], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (3, N'UNESCO',N'UNESCO', N'United Nations Educational, Scientific and Cultural Organization ', N'United Nations Educational, Scientific and Cultural Organization ', 4, NULL, 1, N'spinstall', CAST(0x0000A23700F8A1CD AS DateTime), N'spinstall', CAST(0x0000A23700F8A1CD AS DateTime))
END
GO
IF NOT EXISTS (
        SELECT 1
        FROM [Core].[Organization]
        WHERE [Organization_ID] = 4
)
BEGIN
    INSERT [Core].[Organization] ([Organization_ID], [ShortName], [LongName],[Code], [BusinessKey], [OrganizationType_ID], [ParentOrganization_ID], [Active], [sys_CreatedBy], [sys_CreatedOn], [sys_ModifiedBy], [sys_ModifiedOn]) VALUES (4, N'WHO',N'WHO', N'World Health Organization', N'World Health Organization', 7, NULL, 1, N'spinstall', CAST(0x0000A23700F8C45C AS DateTime), N'spinstall', CAST(0x0000A23700F8C45C AS DateTime))
END
GO
SET IDENTITY_INSERT [Core].[Organization] OFF
GO