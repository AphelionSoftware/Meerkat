CALL Deploy\Meerkat_Capture\Meerkat_Capture.deploy.cmd /Y  > Deploy\Meerkat_CaptureLS.txt
CALL Deploy\Meerkat_Admin\Meerkat_Admin.deploy.cmd /Y  > Deploy\Meerkat_AdminLS.txt
CALL Deploy\Meerkat_FormCapture\Aphelion.Meerkat.FormCapture.deploy.cmd /Y  > Deploy\Meerkat_FormCaptureLS.txt
CALL Deploy\Meerkat_FormBuilder\Aphelion.Meerkat.FormBuilder.deploy.cmd /Y  > Deploy\Meerkat_FormBuilderLS.txt
CALL Deploy\Meerkat_EventRegister\Aphelion.Meerkat.EventRegister.deploy.cmd /Y  > Deploy\Meerkat_EventRegisterLS.txt
CALL Deploy\Meerkat_ReportsManager\Meerkat.ReportsManager.deploy.cmd /Y  > Deploy\Meerkat_ReportsManagerLS.txt
IISRESET /restart
