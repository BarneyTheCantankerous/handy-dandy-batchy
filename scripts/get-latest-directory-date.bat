@echo off

rem Get directory by latest created and modified date.

set "dir_path=%~1"
if "%dir_path%"=="" exit /b
if not exist "%dir_path%" exit /b

rem get by latest created date
call :get_latest a

rem get by latest modified date
call :get_latest c

goto eof

:get_latest
for /f "delims=" %%a in ('dir "%dir_path%" /b /ad-h /t:%1 /od') do set latest_dir=%%a
echo %latest_dir%

:eof
pause