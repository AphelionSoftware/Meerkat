"C:\Program Files (x86)\MSBuild\12.0\Bin\amd64\msbuild.exe" "Development\MeerkatCapture_MH\Meerkat_Capture\Meerkat_Capture.lsxproj" /T:Publish /P:Configuration=Release
"C:\Program Files (x86)\MSBuild\12.0\Bin\amd64\msbuild.exe" "Development\MeerkatAdmin_MH\MeerkatAdmin_2\MeerkatAdmin_2_1" /T:Publish /P:Configuration=Release
"C:\Program Files (x86)\MSBuild\12.0\Bin\amd64\msbuild.exe" "Development\Aphelion.Meerkat.FormBuilder\Aphelion.Meerkat.FormBuilder.lsxproj" /T:Publish /P:Configuration=Release
"C:\Program Files (x86)\MSBuild\12.0\Bin\amd64\msbuild.exe" "Development\Aphelion.Meerkat.FormCapture\Aphelion.Meerkat.FormCapture\Aphelion.Meerkat.FormCapture.lsxproj" /T:Publish /P:Configuration=Release
"C:\Program Files (x86)\MSBuild\12.0\Bin\amd64\msbuild.exe" "Development\Aphelion.Meerkat.EventRegister\Aphelion.Meerkat.EventRegister\Aphelion.Meerkat.EventRegister.lsxproj" /T:Publish /P:Configuration=Release
"C:\Program Files (x86)\MSBuild\12.0\Bin\amd64\msbuild.exe" "Development\Meerkat.ReportsManager\Meerkat.ReportsManager\Meerkat.ReportsManager.lsxtproj" /T:Publish /P:Configuration=Release

xcopy c:\installs\Meerkat_Capture\*.*  %~dp0\DeployMeerkat_Capture /A
xcopy c:\installs\Meerkat_Admin\*.*  %~dp0\DeployMeerkat_Admin /A
xcopy c:\installs\Meerkat_FormBuilder\*.*  %~dp0\DeployMeerkat_FormBuilder /A
xcopy c:\installs\Meerkat_FormCapture\*.*  %~dp0\DeployMeerkat_FormCapture /A
xcopy c:\installs\Meerkat_EventRegister\*.*  %~dp0\DeployMeerkat_EventRegister /a
xcopy c:\installs\Meerkat_ReportManager\*.*  %~dp0\DeployMeerkat_ReportManager /a

