rem this scipt credit:Phanuwat.J
call setmail.bat
set logname= %cd%\log\sendmail %date:~7,2%%date:~4,2%%date:~10,4%_%time:~0,2%%time:~3,2%%time:~6,2%.log
if "%1"=="ERROR" GOTO P_EXCEPTION
GOTO G_EXCEPTION
:P_EXCEPTION
REM exception happened, notify someone
blat %problem% -f %SENDFROM% -to %SENDTO% -server %MAILSERVERNAME% -subject "Trial Tracker batch has unexpected error." 
blat %content% -attach %ATTACH_RESULT% -attach %ATTACH_DB_SCRIPT_LOG% -f %SENDFROM% -to %SENDTOAdmin% -server %MAILSERVERNAME% -subject "For Admin :: Trial Tracker batch has unexpected error ( %2 )."
GOTO E_CLOSE_S
:G_EXCEPTION
REM Batch Job complete
blat %content% -attach %ATTACH_RESULT% -attach %ATTACH_DB_SCRIPT_LOG% -f %SENDFROM% -to %SENDTO% -cc %CCMail% -server %MAILSERVERNAME% -subject "Trial Tracker Batch completed sucessfully ( %2 )."  -log %logname%

GOTO E_CLOSE_S

:E_CLOSE_S
