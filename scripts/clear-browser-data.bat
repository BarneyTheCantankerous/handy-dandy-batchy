@echo off 

rem Clears browser data of Chrome, Firefox, Internet Explorer or/and Opera.

set dir=%cd%

:: exit if no param has been provided
if "%~1"=="" (
	echo no parameter provided
	goto eof
)

:: clear browser data for all
if /I %~1==all (
	call :chrome
	call :firefox
	call :ie
	call :opera
)

:: clear only chrome data 
if /I %~1==chrome ( 
	call :chrome
)

:: clear only firefox data 
if /I %~1==firefox ( 
	call :firefox
)

:: clear only ie data 
if /I %~1==ie (
	call :ie
)

:: clear only opera data 
if /I %~1==opera ( 
	call :opera
)

goto eof

:chrome
echo ***** CLEARING GOOGLE CHROME *****
call :clearData "%LocalAppData%\Google\Chrome\User Data"
exit /b 0

:firefox
echo ***** CLEARING FIREFOX *****
call :clearData "%LocalAppData%\Mozilla\Firefox\Profiles"
exit /b 0

:ie
echo ***** CLEARING INTERNET EXPLORER *****
call :clearData "%LocalAppData%\Microsoft\Intern~1"
call :clearData "%LocalAppData%\Microsoft\Windows\History"
call :clearData "%LocalAppData%\Microsoft\Windows\Tempor~1"
call :clearData "%AppData%\Microsoft\Windows\Cookies"
exit /b 0

:opera
echo ***** CLEARING OPERA *****
call :clearData "%LocalAppData%\Opera\Opera"
call :clearData "%AppData%\Opera\Opera"
exit /b 0

:clearData
del /q /s /f %1
rd /s /q %1
exit /b 0

:eof
cd %dir%
pause