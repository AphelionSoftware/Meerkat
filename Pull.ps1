﻿git fetch --all
git reset --hard HEAD
git clean -f -d
git pull "origin" +refs/heads/r03_CARE_Reports/Deployment:refs/remotes/origin/r03_CARE_Reports/Deployment
git checkout --force -B "r03_CARE_Reports/Deployment" "origin/r03_CARE_Reports/Deployment"