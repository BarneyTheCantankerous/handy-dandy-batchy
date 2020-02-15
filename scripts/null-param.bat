@echo off

rem Checks whether an argument was given to the script.

if not "%~1"=="" (
	echo "Yay, a gift(s)!"
) else (
	echo "Seriously, nothing?"
)

pause