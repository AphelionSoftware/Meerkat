"C:\Program Files (x86)\Microsoft Visual Studio 10.0\Common7\IDE\devenv" ETL\Aphelion.Meerkat.SSIS\Aphelion.Meerkat.SSIS.sln /rebuild 
MKDIR Deploy\ETL
COPY "ETL\Aphelion.Meerkat.SSIS\Aphelion.Meerkat.ETL\bin\Development\Aphelion.ispac" "Deploy\ETL\Aphelion.Meerkat.ETL.ispac" /Y 
COPY "ETL\Aphelion.Meerkat.SSIS\Aphelion.FileWatcher_QueueInsert\Aphelion.FileWatcher_QueueInsert\bin\Development\Aphelion.ispac" "Deploy\ETL\Aphelion.FileWatcher_QueueInsert.ispac" /Y 
COPY "ETL\Aphelion.Meerkat.SSIS\Aphelion.SPJobs\bin\Development\Aphelion.ispac" "Deploy\ETL\Aphelion.SPJobs.ispac" /Y 

