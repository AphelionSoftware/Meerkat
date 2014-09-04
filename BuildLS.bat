REM "C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" "Development\MeerkatCapture_MH\Meerkat_Capture\Meerkat_Capture.lsxtproj" /T:Rebuild /P:Configuration=Release > Deploy\CaptureBuild.txt
REM "C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" "Development\MeerkatCapture_MH\Meerkat_Capture\Meerkat_Capture.lsxtproj" /T:Publish /P:Configuration=Release > Deploy\CapturePublish.txt
REM "C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" "Development\MeerkatAdmin_MH\MeerkatAdmin_2\MeerkatAdmin_2_1.lsxtproj" /T:Rebuild /P:Configuration=Release > Deploy\AdminBuild.txt
REM "C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" "Development\MeerkatAdmin_MH\MeerkatAdmin_2\MeerkatAdmin_2_1.lsxtproj" /T:Publish /P:Configuration=Release > Deploy\AdminPublish.txt
REM "C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" "Development\Aphelion.Meerkat.FormBuilder\Aphelion.Meerkat.FormBuilder.lsxtproj" /T:Rebuild /P:Configuration=Release > Deploy\FormBuilderBuild.txt
REM "C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" "Development\Aphelion.Meerkat.FormBuilder\Aphelion.Meerkat.FormBuilder.lsxtproj" /T:Publish /P:Configuration=Release > Deploy\FormBuilderPublish.txt
REM "C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" "Development\Aphelion.Meerkat.FormCapture\Aphelion.Meerkat.FormCapture\Aphelion.Meerkat.FormCapture.lsxtproj" /T:Rebuild /P:Configuration=Release > Deploy\FormCaptureBuild.txt
REM "C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" "Development\Aphelion.Meerkat.FormCapture\Aphelion.Meerkat.FormCapture\Aphelion.Meerkat.FormCapture.lsxtproj" /T:Publish /P:Configuration=Release > Deploy\FormCapturePublish.txt
REM "C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" "Development\Aphelion.Meerkat.EventRegister\Aphelion.Meerkat.EventRegister\Aphelion.Meerkat.EventRegister.lsxtproj" /T:Rebuild /P:Configuration=Release > Deploy\EventRegisterBuild.txt
REM "C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" "Development\Aphelion.Meerkat.EventRegister\Aphelion.Meerkat.EventRegister\Aphelion.Meerkat.EventRegister.lsxtproj" /T:Publish /P:Configuration=Release > Deploy\EventRegisterPublish.txt
REM "C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" "Development\Meerkat.ReportsManager\Meerkat.ReportsManager\Meerkat.ReportsManager.lsxtproj" /T:Rebuild /P:Configuration=Release > Deploy\ReportManagerBuild.txt
REM "C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" "Development\Meerkat.ReportsManager\Meerkat.ReportsManager\Meerkat.ReportsManager.lsxtproj" /T:Publish /P:Configuration=Release > Deploy\ReportManagerPublish.txt
REM 
REM xcopy c:\installs\Meerkat_Capture\*.*  %~dp0\Deploy\Meerkat_Capture\ /Y
REM xcopy c:\installs\Meerkat_Admin\*.*  %~dp0\Deploy\Meerkat_Admin\ /Y
REM xcopy c:\installs\Meerkat_FormBuilder\*.*  %~dp0\Deploy\Meerkat_FormBuilder\ /Y
REM xcopy c:\installs\Meerkat_FormCapture\*.*  %~dp0\Deploy\Meerkat_FormCapture\ /Y
REM xcopy c:\installs\Meerkat_EventRegister\*.*  %~dp0\Deploy\Meerkat_EventRegister\ /Y
REM xcopy c:\installs\Meerkat_ReportsManager\*.*  %~dp0\Deploy\Meerkat_ReportsManager\ /Y

xcopy c:\installs\Meerkat_Capture\Meerkat_Capture.SetParameters.xml  %~dp0\Deploy\Meerkat_Capture\ /Y
xcopy c:\installs\Meerkat_Admin\MeerkatAdmin_2_1.SetParameters.xml  %~dp0\Deploy\Meerkat_Admin\ /Y
xcopy c:\installs\Meerkat_FormBuilder\Aphelion.Meerkat.FormBuilder.SetParameters.xml  %~dp0\Deploy\Meerkat_FormBuilder\ /Y
xcopy c:\installs\Meerkat_FormCapture\Aphelion.Meerkat.FormCapture.SetParameters.xml  %~dp0\Deploy\Meerkat_FormCapture\ /Y
xcopy c:\installs\Meerkat_EventRegister\Meerkat_EventRegister.SetParameters.xml  %~dp0\Deploy\Meerkat_EventRegister\ /Y
xcopy c:\installs\Meerkat_ReportsManager\Meerkat.ReportsManager.SetParameters.xml  %~dp0\Deploy\Meerkat_ReportsManager\ /Y
xcopy c:\installs\Meerkat_UAM\Aphelion.Meerkat.UserAccessManager.SetParameters.xml  %~dp0\Deploy\Meerkat_UAM\ /Y

