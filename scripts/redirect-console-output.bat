@echo off

rem Pipes console window output to file.

start cmd /c null-param.bat ^>log.txt

echo Open 'log.txt' now to see output before it's deleted...
pause >nul

if exist log.txt del log.txt