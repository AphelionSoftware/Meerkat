"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" "Development\MeerkatCapture_MH\Meerkat_Capture\Meerkat_Capture.lsxproj" /T:Rebuild /P:Configuration=Release > Deploy\CaptureBuild.txt
"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" "Development\MeerkatCapture_MH\Meerkat_Capture\Meerkat_Capture.lsxproj" /T:Publish /P:Configuration=Release > Deploy\CapturePublish.txt
"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" "Development\MeerkatAdmin_MH\MeerkatAdmin_2\MeerkatAdmin_2_1.lsxproj" /T:Rebuild /P:Configuration=Release > Deploy\AdminBuild.txt
"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" "Development\MeerkatAdmin_MH\MeerkatAdmin_2\MeerkatAdmin_2_1.lsxproj" /T:Publish /P:Configuration=Release > Deploy\AdminPublish.txt
"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" "Development\Aphelion.Meerkat.FormBuilder\Aphelion.Meerkat.FormBuilder.lsxtproj" /T:Rebuild /P:Configuration=Release > Deploy\FormBuilderBuild.txt
"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" "Development\Aphelion.Meerkat.FormBuilder\Aphelion.Meerkat.FormBuilder.lsxtproj" /T:Publish /P:Configuration=Release > Deploy\FormBuilderPublish.txt
"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" "Development\Aphelion.Meerkat.FormCapture\Aphelion.Meerkat.FormCapture\Aphelion.Meerkat.FormCapture.lsxtproj" /T:Rebuild /P:Configuration=Release > Deploy\FormCaptureBuild.txt
"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" "Development\Aphelion.Meerkat.FormCapture\Aphelion.Meerkat.FormCapture\Aphelion.Meerkat.FormCapture.lsxtproj" /T:Publish /P:Configuration=Release > Deploy\FormCapturePublish.txt
"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" "Development\Aphelion.Meerkat.EventRegister\Aphelion.Meerkat.EventRegister\Aphelion.Meerkat.EventRegister.lsxtproj" /T:Rebuild /P:Configuration=Release > Deploy\EventRegisterBuild.txt
"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" "Development\Aphelion.Meerkat.EventRegister\Aphelion.Meerkat.EventRegister\Aphelion.Meerkat.EventRegister.lsxtproj" /T:Publish /P:Configuration=Release > Deploy\EventRegisterPublish.txt
"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" "Development\Meerkat.ReportsManager\Meerkat.ReportsManager\Meerkat.ReportsManager.lsxtproj" /T:Rebuild /P:Configuration=Release > Deploy\ReportManagerBuild.txt
"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" "Development\Meerkat.ReportsManager\Meerkat.ReportsManager\Meerkat.ReportsManager.lsxtproj" /T:Publish /P:Configuration=Release > Deploy\ReportManagerPublish.txt

xcopy c:\installs\Meerkat_Capture\*.*  %~dp0\DeployMeerkat_Capture\ /Y
xcopy c:\installs\Meerkat_Admin\*.*  %~dp0\DeployMeerkat_Admin\ /Y
xcopy c:\installs\Meerkat_FormBuilder\*.*  %~dp0\Deploy\Meerkat_FormBuilder\ /Y
xcopy c:\installs\Meerkat_FormCapture\*.*  %~dp0\Deploy\Meerkat_FormCapture\ /Y
xcopy c:\installs\Meerkat_EventRegister\*.*  %~dp0\Deploy\Meerkat_EventRegister\ /Y
xcopy c:\installs\Meerkat_ReportsManager\*.*  %~dp0\Deploy\Meerkat_ReportsManager\ /Y

