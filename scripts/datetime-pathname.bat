@echo off

rem Converts the date and time into a format usable for file and folder names, quite useful when generating logs. 
rem Format: DDMMYYYY_HHMMSS

set hour=%time:~0,2%
if "%hour:~0,1%" == " " set hour=0%hour:~1,1%
set log_date=%date:/=%
set log_time=%hour%%time:~3,2%%time:~6,2%
set log_name=%log_date%_%log_time%

echo %log_name%
pause