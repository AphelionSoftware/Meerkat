"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" /target:Deploy /p:UseSandboxSettings=false /p:TargetDatabase=Meerkat;TargetConnectionString="Data Source=.;Integrated Security=True;Pooling=False" "SQL Solution\Aphelion.Meerkat.DB\Meerkat\Aphelion.Meerkat.DB.sqlproj" > Deploy\Deploy_MeerkatDB.txt


"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" /target:Deploy /p:UseSandboxSettings=false /p:TargetDatabase=Meerkat;TargetConnectionString="Data Source=.;Integrated Security=True;Pooling=False" "SQL Solution\Aphelion.MeerkatErrors.DB\Aphelion.MeerkatErrors.DB\Aphelion.MeerkatErrors.DB.sqlproj" > Deploy\Deploy_MeerkatErrorsDB.txt


"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" /target:Deploy /p:UseSandboxSettings=false /p:TargetDatabase=Meerkat;TargetConnectionString="Data Source=.;Integrated Security=True;Pooling=False" "SQL Solution\Aphelion.MeerkatStaging.DB\Aphelion.MeerkatStaging.DB\Aphelion.MeerkatStaging.DB.sqlproj" > Deploy\Deploy_MeerkatStagingDB.txt


