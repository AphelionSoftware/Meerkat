"C:\Program Files (x86)\Git\bin\git.exe" checkout --force "r03_CARE_Reports/Deployment"
"C:\Program Files (x86)\Git\bin\git.exe" pull --progress "origin" +refs/heads/r03_CARE_Reports/Deployment:refs/remotes/origin/r03_CARE_Reports/Development
"C:\Program Files (x86)\Git\bin\git.exe" merge r03_CARE_Reports/Development
"C:\Program Files (x86)\Git\bin\git.exe" push --progress "origin" refs/heads/r03_CARE_Reports/Deployment:refs/heads/r03_CARE_Reports/Deployment
"C:\Program Files (x86)\Git\bin\git.exe" checkout --force "r03_CARE_Reports/Development"
"C:\Program Files (x86)\Git\bin\git.exe" merge r03_CARE_Reports/Deployment
"C:\Program Files (x86)\Git\bin\git.exe" push --progress "origin" refs/heads/r03_CARE_Reports/Development:refs/heads/r03_CARE_Reports/Development
