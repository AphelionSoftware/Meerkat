<#
$GitFolder = "E:\Github\Meerkat"
$BranchPrefix = "r03_CARE_Reports"
#>

Param (
    [Parameter(Mandatory=$True)][String]$GitFolder,
    [Parameter(Mandatory=$True)][String]$BranchPrefix
      )

cd $GitFolder


$DepBranch = "refs/heads/" +$BranchPrefix +"/Deployment"
$DevBranch = "refs/heads/" +$BranchPrefix +"/Development"

$DepToDep = $DepBranch +":" +$DepBranch
$DevToDev = $DevBranch +":" +$DevBranch
$DepToDev = $DepBranch +":" +$DevBranch





git fetch --all
git pull --rebase --progress "origin"$DepToDep
git checkout --force $BranchPrefix"/Deployment"
git pull --rebase --progress "origin"$DepToDev
git merge $DevBranch
git push --progress "origin" $DepToDep
git checkout --force $BranchPrefix"/Development"
git push --progress "origin"$DepToDev 
git push --recurse-submodules=check --progress "origin" $DepToDep
git push --recurse-submodules=check --progress "origin" $DevToDev

