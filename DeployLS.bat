CALL Deploy\Meerkat_Capture\Meerkat_Capture.deploy.cmd /Y  > Deploy\Meerkat_CaptureLS.txt
REM XCOPY C:\inetpub\wwwroot\Meerkat_Capture\*.* C:\inetpub\Meerkat_Capture\ /A

CALL Deploy\Meerkat_Admin\MeerkatAdmin_2_1.deploy.cmd /Y  > Deploy\Meerkat_AdminLS.txt
REM XCOPY C:\inetpub\wwwroot\Meerkat_Admin\*.* C:\inetpub\Meerkat_Admin\ /A

CALL Deploy\Meerkat_FormCapture\Aphelion.Meerkat.FormCapture.deploy.cmd /Y  > Deploy\Meerkat_FormCaptureLS.txt
REM XCOPY C:\inetpub\wwwroot\Meerkat_FormCapture\*.* C:\inetpub\Meerkat_FormCapture\ /A

CALL Deploy\Meerkat_FormBuilder\Aphelion.Meerkat.FormBuilder.deploy.cmd /Y  > Deploy\Meerkat_FormBuilderLS.txt
REM XCOPY C:\inetpub\wwwroot\Meerkat_FormBuilder\*.* C:\inetpub\Meerkat_FormBuilder\ /A

CALL Deploy\Meerkat_EventRegister\Aphelion.Meerkat.EventRegister.deploy.cmd /Y  > Deploy\Meerkat_EventRegisterLS.txt
REM XCOPY C:\inetpub\wwwroot\Meerkat_EventRegister\*.* C:\inetpub\Meerkat_EventRegister\ /A

CALL Deploy\Meerkat_ReportsManager\Meerkat.ReportsManager.deploy.cmd /Y  > Deploy\Meerkat_ReportsManagerLS.txt
REM XCOPY C:\inetpub\wwwroot\Meerkat_ReportsManager\*.* C:\inetpub\Meerkat_ReportsManager\ /A

CALL Deploy\Meerkat_UAM\Aphelion.Meerkat.UserAccessManager.deploy.cmd /Y  > Deploy\Meerkat_UAM.txt
REM XCOPY C:\inetpub\wwwroot\Meerkat_ReportsManager\*.* C:\inetpub\Meerkat_ReportsManager\ /A

IISRESET /restart
