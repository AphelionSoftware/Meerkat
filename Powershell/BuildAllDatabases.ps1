

Param (
    [Parameter(Mandatory=$True)][String]$GitFolder
      )

$MSBuildModule = $GitFolder +"\Powershell\Invoke-MsBuild.psm1"
Import-Module -Name $MSBuildModule

$LogPath =  $GitFolder +"\Deploy"
$SolutionFolder =  $GitFolder +"\SQL Solution"

$BuildCommand =  "/target:Clean;Build"


Foreach ($file in get-childitem $SolutionFolder -recurse | where {$_.extension -eq ".sqlproj"})

{
    
    $LoadQueueSolutionPath = $file.FullName
    
    $BuildLog = Invoke-MsBuild -Path $LoadQueueSolutionPath -MsBuildParameters $BuildCommand -BuildLogDirectoryPath $LogPath -KeepBuildLogOnSuccessfulBuilds -GetLogPath
    $buildSucceeded = Invoke-MsBuild -Path $LoadQueueSolutionPath -MsBuildParameters $BuildCommand -BuildLogDirectoryPath $LogPath -KeepBuildLogOnSuccessfulBuilds 

    if ($buildSucceeded)
        { 
            Write-Host $File.Name " Build completed successfully." 
            Write-Host ""
        }
    else
        { 
            Write-Host $File.Name "Build failed. Check build log for details." $buildLog 
            Write-Host ""
        }
}