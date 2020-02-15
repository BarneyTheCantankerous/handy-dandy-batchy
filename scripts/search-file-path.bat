@echo off

rem Search for a file, recursively within every sub directory of a given path, and return the directory containing the file.

set "dir_path=%~1"
set "file=%~2"

set "dir_path=%~1"
if "%dir_path%"=="" exit /b
if not exist "%dir_path%" exit /b

set dir=%cd%
cd %dir_path%
for /r %%f in (*"%file%") do (
  echo %%~dpf
  goto eof
)

:eof
cd %dir%
pause