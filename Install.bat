CALL Deploy\Meerkat_Capture\Meerkat_Capture.deploy.cmd /Y
CALL Deploy\Meerkat_Admin\Meerkat_Admin.deploy.cmd /Y
CALL Deploy\Meerkat_FormCapture\Aphelion.Meerkat.FormCapture.deploy.cmd /Y
CALL Deploy\Meerkat_FormBuilder\Aphelion.Meerkat.FormBuilder.deploy.cmd /Y
CALL Deploy\Meerkat_EventRegister\Aphelion.Meerkat.EventRegister.deploy.cmd /Y
CALL Deploy\Meerkat_ReportsManager\Meerkat.ReportsManager.deploy.cmd /Y
IISRESET /restart
