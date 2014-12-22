Param (
    [Parameter(Mandatory=$True)][String]$GitFolder,
    [Parameter(Mandatory=$True)][String]$BranchPrefix
      )
cd $GitFolder

$DepBranch = $BranchPrefix +"/Deployment"
$DevBranch = $BranchPrefix +"/Development"

$DepToDep = "refs/heads/" +$DepBranch +":refs/heads/" +$DevBranch
$DevToDev = "refs/heads/" +$DevBranch +":refs/heads/" +$DevBranch
$DepToDev = "refs/heads/" +$DepBranch +":refs/heads/" +$DevBranch


git fetch --all
git pull --rebase --progress "origin " $DepToDep
git checkout --force $DepBranch
git pull --rebase --progress "origin " $DepToDev
git merge $DevBranch
git push --progress "origin" $DepToDep
git checkout --force $DevBranch
git push --progress "origin"$DepToDev 
git push --recurse-submodules=check --progress "origin" $DepToDep

