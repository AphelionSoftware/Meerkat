

function UpdateProject( $sln, $proj, $DB ) {
    $dte.Solution.Open($sln) | Out-Null;
    $dte.MainWindow | %{$_.gettype().InvokeMember("Visible","SetProperty",$null,$_,$true)};
    #| Out-Null Piping the output forces Powershell to wait to complete

    Write-Host "Waiting 15 seconds for project to open"
            Start-Sleep 15
    

    $tries = 0
    While ($tries -lt 10)  {
        Try {
            $dte.ExecuteCommand("Tools.SSDTNewSchemaComparison", "/ProviderType ConnectionBased /ConnectionString ""Data Source=.\sql2012;Initial Catalog=$DB;Integrated Security=True"" /ProviderType ProjectBased /ProjectName $proj") | ForEach-Object {Start-Process $_} | Wait-Process ;
            $tries = 100;
            Sleep-Start 30;
            
            $dte.ExecuteCommand("SQL.SSDTSchemaCompareCompare") | Out-Null;

        }
        Catch {
        Write-Host "Waiting 5 seconds for project to open"
            Start-Sleep 5
        }
        Finally {
        $tries++
        }
    }



    $tries = 0
    $compared = 0
    While ($tries -lt 10)  {
        Try {
    
        $dte.ExecuteCommand("SQL.SSDTSchemaCompareWriteUpdates");
        Write-Host "Done";
        $dte.Solution.Close();

        $tries = 100;
        break;
        }
        Catch {
        Write-Host "Waiting 5 seconds for comparison to complete"
            Start-Sleep 5
        }
        Finally {
        $tries++
        }
    }
}

#Start-Job { 
UpdateProject( 
"C:\GitHub\Meerkat\SQL Solution\Aphelion.Meerkat.DB\Aphelion.Meerkat.DB.sln", "Aphelion.Meerkat.DB", "Meerkat"); 
#}

#Start-Job { 
UpdateProject( 
"C:\GitHub\Meerkat\SQL Solution\Aphelion.MeerkatErrors.DB\Aphelion.MeerkatErrors.DB.sln", "Aphelion.MeerkatErrors.DB", "MeerkatErrors");
#}

#Start-Job { 
UpdateProject( 
"C:\GitHub\Meerkat\SQL Solution\Aphelion.MeerkatStaging.DB\Aphelion.MeerkatStaging.DB.sln", "Aphelion.MeerkatStaging.DB", "MeerkatStaging"); 
#}


