git fetch --all
git reset --hard HEAD
git clean -f -d
git pull "origin" +refs/heads/r02_Joint/Deployment:refs/remotes/origin/r02_Joint/Deployment
git checkout --force -B "r02_Joint/Deployment" "origin/r02_Joint/Deployment"
