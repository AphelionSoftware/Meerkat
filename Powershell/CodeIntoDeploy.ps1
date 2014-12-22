Param (
    [Parameter(Mandatory=$True)][String]$GitFolder
      )
cd $GitFolder

git fetch --all
git pull --rebase --progress "origin" +refs/heads/r03_CARE_Reports/Deployment:+refs/heads/r03_CARE_Reports/Deployment:refs/remotes/origin/r03_CARE_Reports/Deployment
git checkout --force "r03_CARE_Reports/Deployment"
git pull --rebase --progress "origin" +refs/heads/r03_CARE_Reports/Deployment:refs/remotes/origin/r03_CARE_Reports/Development
git merge r03_CARE_Reports/Development
git push --progress "origin" refs/heads/r03_CARE_Reports/Deployment:refs/heads/r03_CARE_Reports/Deployment
git checkout --force "r03_CARE_Reports/Development"
git push --progress "origin" refs/heads/r03_CARE_Reports/Development:refs/remotes/origin/r03_CARE_Reports/Development
git push --recurse-submodules=check --progress "origin" refs/heads/r03_CARE_Reports/Development:refs/heads/r03_CARE_Reports/Development
