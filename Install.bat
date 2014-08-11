CALL powershell "& 'Installation\Install_SSIS.ps1'"
C:\Program Files\7-Zip\7z.exe" x Installation\MegaMenu.7z -o"C:\inetpub\Meerkat_Megamenu" -y
CALL powershell "& 'Installation\Install_LSWebApps.ps1'"
