set date=%date%
set time1=%time%
set hour=%time1:~0,2%
if "%hour:~0,1%" == " " set hour=0%hour:~1,1%
set logname= %cd%\log\%date:~10,4%%date:~4,2%%date:~7,2%.%hour%%time1:~3,2%%time1:~6,2%.log
rem clemb -server -hostname %hostname% -port %port%  -username %username% -password %password%  -script %cd%\script.txt -execute -log %logname%  
@echo on
echo Piyanan.K > finish.bin

