

Param (
    [Parameter(Mandatory=$True)][String]$GitFolder,
    [Parameter(Mandatory=$True)][String]$TargetServer
      )

$MSBuildModule = $GitFolder +"\Powershell\Invoke-MsBuild.psm1"
Import-Module -Name $MSBuildModule

$LogPath =  $GitFolder +"\Deploy"
$SolutionFolder =  $GitFolder +"\SQL Solution"

$TargetConn = "/p:TargetConnectionString=`"Data Source=" +$TargetServer +"`;Integrated Security=True`;Pooling=False`""

Foreach ($file in get-childitem $SolutionFolder -recurse | where {$_.extension -eq ".sqlproj"})

{
    
    $LoadQueueSolutionPath = $file.FullName
    
    $TargetDB = "/p:TargetDatabase=" +$file.name.Replace(".sqlproj","").ToString() +" "

    Write-Host $File.Name " deployment started."

    $DeployCommand = "/target:Deploy /verbosity:diag /p:BlockOnPossibleDataLoss=False /p:BlockIncrementalDeploymentIfDataLoss=False /p:UseSandboxSettings=false " +$TargetDB  +$TargetConn 
   
    $DeployLog =  Invoke-MsBuild -Path $LoadQueueSolutionPath -MsBuildParameters $DeployCommand -ShowBuildWindow  -BuildLogDirectoryPath $LogPath -KeepBuildLogOnSuccessfulBuilds  -GetLogPath
    $deploySucceeded = Invoke-MsBuild -Path $LoadQueueSolutionPath -MsBuildParameters $DeployCommand -ShowBuildWindow   -BuildLogDirectoryPath $LogPath -KeepBuildLogOnSuccessfulBuilds

    if ($deploySucceeded)
        { 
            Write-Host $File.Name " deployment completed successfully." 
            Write-Host ""
        }
    else
        { 
            Write-Host $File.Name " deployment failed.  Check build log for details." $DeployLog 
            Write-Host ""
        }

}
