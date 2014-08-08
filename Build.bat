"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" "Development\MeerkatCapture_MH\Meerkat_Capture\Meerkat_Capture.lsxproj" /T:Rebuild /P:Configuration=Release > CaptureBuild.txt
"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" "Development\MeerkatCapture_MH\Meerkat_Capture\Meerkat_Capture.lsxproj" /T:Publish /P:Configuration=Release > CapturePublish.txt
"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" "Development\MeerkatAdmin_MH\MeerkatAdmin_2\MeerkatAdmin_2_1.lsxproj" /T:Rebuild /P:Configuration=Release > AdminBuild.txt
"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" "Development\MeerkatAdmin_MH\MeerkatAdmin_2\MeerkatAdmin_2_1.lsxproj" /T:Publish /P:Configuration=Release > AdminPublish.txt
"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" "Development\Aphelion.Meerkat.FormBuilder\Aphelion.Meerkat.FormBuilder.lsxtproj" /T:Rebuild /P:Configuration=Release > FormBuilderBuild.txt
"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" "Development\Aphelion.Meerkat.FormBuilder\Aphelion.Meerkat.FormBuilder.lsxtproj" /T:Publish /P:Configuration=Release > FormBuilderPublish.txt
"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" "Development\Aphelion.Meerkat.FormCapture\Aphelion.Meerkat.FormCapture\Aphelion.Meerkat.FormCapture.lsxtproj" /T:Rebuild /P:Configuration=Release > FormCaptureBuild.txt
"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" "Development\Aphelion.Meerkat.FormCapture\Aphelion.Meerkat.FormCapture\Aphelion.Meerkat.FormCapture.lsxtproj" /T:Publish /P:Configuration=Release > FormCapturePublish.txt
"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" "Development\Aphelion.Meerkat.EventRegister\Aphelion.Meerkat.EventRegister\Aphelion.Meerkat.EventRegister.lsxtproj" /T:Rebuild /P:Configuration=Release > EventRegisterBuild.txt
"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" "Development\Aphelion.Meerkat.EventRegister\Aphelion.Meerkat.EventRegister\Aphelion.Meerkat.EventRegister.lsxtproj" /T:Publish /P:Configuration=Release > EventRegisterPublish.txt
"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" "Development\Meerkat.ReportsManager\Meerkat.ReportsManager\Meerkat.ReportsManager.lsxtproj" /T:Rebuild /P:Configuration=Release > ReportManagerBuild.txt
"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" "Development\Meerkat.ReportsManager\Meerkat.ReportsManager\Meerkat.ReportsManager.lsxtproj" /T:Publish /P:Configuration=Release > ReportManagerPublish.txt

xcopy c:\installs\Meerkat_Capture\*.*  %~dp0\DeployMeerkat_Capture\ /Y
xcopy c:\installs\Meerkat_Admin\*.*  %~dp0\DeployMeerkat_Admin\ /Y
xcopy c:\installs\Meerkat_FormBuilder\*.*  %~dp0\Deploy\Meerkat_FormBuilder\ /Y
xcopy c:\installs\Meerkat_FormCapture\*.*  %~dp0\Deploy\Meerkat_FormCapture\ /Y
xcopy c:\installs\Meerkat_EventRegister\*.*  %~dp0\Deploy\Meerkat_EventRegister\ /Y
xcopy c:\installs\Meerkat_ReportsManager\*.*  %~dp0\Deploy\Meerkat_ReportsManager\ /Y

