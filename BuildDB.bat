"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" /target:Build /p:UseSandboxSettings=false /p:TargetDatabase=Meerkat;TargetConnectionString="Data Source=.;Integrated Security=True;Pooling=False" "SQL Solution\Aphelion.Meerkat.DB\Meerkat\Aphelion.Meerkat.DB.sqlproj" > MeerkatDB.txt
XCOPY "SQL Solution\Aphelion.Meerkat.DB\Meerkat\bin\Debug\Aphelion.Meerkat.DB.sql" "Deploy\MeerkatDBs\" /Y

"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" /target:Build /p:UseSandboxSettings=false /p:TargetDatabase=Meerkat;TargetConnectionString="Data Source=.;Integrated Security=True;Pooling=False" "SQL Solution\Aphelion.MeerkatErrors.DB\Aphelion.MeerkatErrors.DB\Aphelion.MeerkatErrors.DB.sqlproj" > MeerkatErrorsDB.txt
XCOPY "SQL Solution\Aphelion.MeerkatErrors.DB\Aphelion.MeerkatErrors.DB\bin\Debug\Aphelion.MeerkatErrors.DB.sql" "Deploy\MeerkatDBs\" /Y

"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" /target:Build /p:UseSandboxSettings=false /p:TargetDatabase=Meerkat;TargetConnectionString="Data Source=.;Integrated Security=True;Pooling=False" "SQL Solution\Aphelion.MeerkatStaging.DB\Aphelion.MeerkatStaging.DB\Aphelion.MeerkatStaging.DB.sqlproj" > MeerkatStagingDB.txt
XCOPY "SQL Solution\Aphelion.MeerkatStaging.DB\Aphelion.MeerkatStaging.DB\bin\Debug\Aphelion.MeerkatStaging.DB.sql" "Deploy\MeerkatDBs\" /Y

