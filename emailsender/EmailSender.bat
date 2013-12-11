rem this scipt credit:Phanuwat.J
call setmail.bat
set date=%date%
set time1=%time%
set hour=%time1:~0,2%
if "%hour:~0,1%" == " " set hour=0%hour:~1,1%
set logname= %cd%\log\sendmail_%date:~10,4%%date:~4,2%%date:~7,2%_%hour%%time1:~3,2%%time1:~6,2%.log
if "%1"=="ERROR" GOTO P_EXCEPTION
GOTO G_EXCEPTION
:P_EXCEPTION
REM exception happened, notify someone
blat %ATTACH_DB_SCRIPT_LOG% -attach %cd%\..\VbaErrorLog.txt -f %SENDFROM% -to %SENDTO% -cc %CCMail% -server %MAILSERVERNAME% -subject "Trial Tracker status : %subject% ( %1 %2 )."  -log %logname%
rem blat %content% -attach %ATTACH_RESULT% -attach %ATTACH_DB_SCRIPT_LOG% -f %SENDFROM% -to %SENDTOAdmin% -server %MAILSERVERNAME% -subject "For Admin :: Trial Tracker status : %subject% has unexpected error ( %2 )."
GOTO E_CLOSE_S
:G_EXCEPTION
REM Batch Job complete
blat %content% -attach %ATTACH_DB_SCRIPT_LOG% -f %SENDFROM% -to %SENDTO% -cc %CCMail% -server %MAILSERVERNAME% -subject "Trial Tracker status : %subject% ( %2 )."  -log %logname%

GOTO E_CLOSE_S

:E_CLOSE_S
exit