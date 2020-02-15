@echo off

rem Open a webpage in the default browser.

set "site=%~1"
if "%site%"=="" set site=www.google.com
start "" %site%
exit /b 0