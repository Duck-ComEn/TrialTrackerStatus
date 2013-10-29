echo off
rem ------------delete old result
del *.bin
cd StreamResult
echo Y | del *
cd ..
rem ===========set the user environment===========
set hostname=dmsrv4.prb.hgst.com
set port=28046
rem ------------username is the user ID
set username= 2412655
rem ------------password is the password of clementine server(dmsrv4)
set password= 83BO9M
rem ------------log is the generated log path
set streamname=%cd%\getResult_Stream.str

rem %date:~7,2%%date:~4,2%%date:~10,4%_%time:~0,2%%time:~3,2%%time:~6,2%.log
set date=%date%
set time=%time%
set logname= %cd%\log\%date:~7,2%%date:~4,2%%date:~10,4%.%time:~0,2%%time:~3,2%%time:~6,2%.log

clemb -server -hostname %hostname% -port %port%  -username %username% -password %password%  -script %cd%\script.txt -execute %streamname% -log %logname%  
@echo on
echo Piyanan.K > finish.bin

