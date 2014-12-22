git fetch --all
git pull --rebase --progress "origin" +refs/heads/r02_Joint/Deployment:+refs/heads/r02_Joint/Deployment:refs/remotes/origin/r02_Joint/Deployment
git checkout --force "r02_Joint/Deployment"
git pull --rebase --progress "origin" +refs/heads/r02_Joint/Deployment:refs/remotes/origin/r01_Finance/Development
git merge r01_Finance/Development
git push --progress "origin" refs/heads/r02_Joint/Deployment:refs/heads/r02_Joint/Deployment
git checkout --force "r01_Finance/Development"
git push --progress "origin" refs/heads/r01_Finance/Development:refs/remotes/origin/r01_Finance/Development
git push --recurse-submodules=check --progress "origin" refs/heads/R01_Finance/Development:refs/heads/R01_Finance/Development
