ECHO "Building DBs"
Call BuildDB.bat
ECHO Building Lightswitch"
CALL BuildLS.bat
ECHO Building ETL
CALL BuildETL.bat
Echo Deploying Lightswitch
Call DeployDB.bat
Echo Deploying Lightswitch
CALL DeployLS.bat
Echo Deploying ETL
CALL DeployETL.bat