"C:\Program Files (x86)\Microsoft Visual Studio 10.0\Common7\IDE\devenv" ETL\Aphelion.Meerkat.SSIS\Aphelion.Meerkat.SSIS.sln /build 
XCOPY "ETL\Aphelion.Meerkat.SSIS\Aphelion.Meerkat.ETL\bin\Development\*.ispac" "Deploy\ETL\Aphelion.Meerkat.ETL.ispac" /Y /F

XCOPY "ETL\Aphelion.Meerkat.SSIS\Aphelion.FileWatcher_QueueInsert\Aphelion.FileWatcher_QueueInsert\bin\Development\*.ispac" "Deploy\ETL\Aphelion.FileWatcher_QueueInsert.ispac" /Y /F

