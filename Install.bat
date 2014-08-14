CALL powershell "& 'Installation\Install_SSIS.ps1'"
CALL powershell "& 'Installation\SetupProxies.ps1'"
C:\Program Files\7-Zip\7z.exe" x Installation\MegaMenu.7z -o"C:\inetpub\Meerkat_Megamenu" -y
C:\Program Files\7-Zip\7z.exe" x Installation\NewsAgg.7z -o"C:\inetpub\Meerkat_NewsAgg" -y
CALL powershell "& 'Installation\Install_LSWebApps.ps1'"
CALL powershell "& 'Installation\Install_LSWebApps.ps1'"
CD Installation\SP
CALL powershell "& '00_MeerkatSP.ps1'"
cd..
cd..
