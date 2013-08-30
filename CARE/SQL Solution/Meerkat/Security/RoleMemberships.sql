


GO



GO
ALTER ROLE [db_owner] ADD MEMBER [PWLAB\mneAdmin];


GO



GO
ALTER ROLE [db_securityadmin] ADD MEMBER [PWLAB\mneAdmin];


GO
ALTER ROLE [db_owner] ADD MEMBER [SPS13BI\spinstall];


GO
ALTER ROLE [db_owner] ADD MEMBER [SPS13BI\mnereports];


GO

ALTER ROLE [db_datareader] ADD MEMBER [SPS13BI\mnereports];


GO
ALTER ROLE [db_datareader] ADD MEMBER [PWLAB\mneAdmin];


GO
ALTER ROLE [db_backupoperator] ADD MEMBER [PWLAB\mneAdmin];


GO
ALTER ROLE [db_accessadmin] ADD MEMBER [PWLAB\mneAdmin];

