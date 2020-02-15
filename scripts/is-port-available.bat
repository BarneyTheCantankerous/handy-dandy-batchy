@echo off

rem Will continually check if a port has become available.

set "port=%~1"
set timer=5

if "%port%"=="" exit /b
if not "%~2"=="" set timer=%~2

call :isPortAvailable
pause
goto eof

:isPortAvailable
netstat /o /a | find /i "listening" | find ":%port%" >nul 2>nul && (
  timeout %timer%
  call :isPortAvailable
)
echo Port is now available
exit /b 0

:eof
pause