CALL Install.bat
CALL Build_Deploy.bat
CALL powershell "& '.\ReportPages.ps1'"
CALL powershell "& 'Installation\Create_SSISJobs.ps1'"
