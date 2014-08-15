"C:\Program Files (x86)\Git\bin\git.exe" fetch --all
git reset --hard HEAD
git clean -f -d
"C:\Program Files (x86)\Git\bin\git.exe" pull "origin" +refs/heads/r03_CARE_Reports/Deployment:refs/remotes/origin/r03_CARE_Reports/Deployment
"C:\Program Files (x86)\Git\bin\git.exe" checkout --force -B "r03_CARE_Reports/Deployment" "origin/r03_CARE_Reports/Deployment"
