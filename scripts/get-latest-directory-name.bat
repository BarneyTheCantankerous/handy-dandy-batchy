@echo off

rem Get directory by descending name (e.g. from folders folder1, folder2 and folder3, folder3 would be returned).

set "dir_path=%~1"
if "%dir_path%"=="" exit /b
if not exist "%dir_path%" exit /b

for /f "tokens=*" %%a in ('dir "%dir_path%" /b /ad /on *') do set latest_dir=%%a
echo %latest_dir%
pause