@echo off

rem Native way of extracting contents of ZIP file.
rem Params:
rem 	1 - ZIP file
rem 	2 - Output path

if exist %~1 (
	if not %~x1==.zip exit /b
) else (
	echo no zip file specified
	exit /b
)

if "%~2"=="" (
	exit /b
) else (
	if not exist %~2 mkdir %~2
)

call :unzip "%~1" "%~2"
goto eof

:unzip
set vbs="%temp%\_.vbs"
if exist %vbs% del /f /q %vbs%
>%vbs%  echo Set fso = CreateObject("Scripting.FileSystemObject")
>>%vbs% echo If NOT fso.FolderExists(%2) Then
>>%vbs% echo fso.CreateFolder(%2)
>>%vbs% echo End If
>>%vbs% echo set objShell = CreateObject("Shell.Application")
>>%vbs% echo set FilesInZip=objShell.NameSpace(%1).items
>>%vbs% echo objShell.NameSpace(%2).CopyHere(FilesInZip)
>>%vbs% echo Set fso = Nothing
>>%vbs% echo Set objShell = Nothing
cscript //nologo %vbs%
if exist %vbs% del /f /q %vbs%
exit /b

:eof