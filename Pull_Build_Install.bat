"C:\Program Files (x86)\Git\bin\git.exe" fetch --progress "origin" +refs/heads/r02_CARE_Screens/Deployment:refs/remotes/origin/r02_CARE_Screens/Deployment
git reset --hard HEAD
git clean -f -d
"C:\Program Files (x86)\Git\bin\git.exe" pull "origin" +refs/heads/r02_CARE_Screens/Deployment:refs/remotes/origin/r02_CARE_Screens/Deployment
CALL Build.bat
CALL Install.bat
