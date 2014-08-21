MKDIR Deploy
"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" /target:rebuild /p:BlockIncrementalDeploymentIfDataLoss=False;UseSandboxSettings=false /p:TargetDatabase=Meerkat;TargetConnectionString="Data Source=.;Integrated Security=True;Pooling=False" "SQL Solution\Aphelion.Meerkat.DB\Meerkat\Aphelion.Meerkat.DB.sqlproj" > Deploy\MeerkatDB.txt

"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" /target:rebuild /p:BlockIncrementalDeploymentIfDataLoss=False;UseSandboxSettings=false /p:TargetDatabase=MeerkatErrors;TargetConnectionString="Data Source=.;Integrated Security=True;Pooling=False" "SQL Solution\Aphelion.MeerkatErrors.DB\Aphelion.MeerkatErrors.DB\Aphelion.MeerkatErrors.DB.sqlproj" > Deploy\MeerkatErrorsDB.txt

"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" /target:rebuild /p:BlockIncrementalDeploymentIfDataLoss=False;UseSandboxSettings=false /p:TargetDatabase=MeerkatStaging;TargetConnectionString="Data Source=.;Integrated Security=True;Pooling=False" "SQL Solution\Aphelion.MeerkatStaging.DB\Aphelion.MeerkatStaging.DB\Aphelion.MeerkatStaging.DB.sqlproj" > Deploy\MeerkatStagingDB.txt

