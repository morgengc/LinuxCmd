@echo off
:: ====================================================================
::
:: csd_which.cmd
:: Searches PATH for a file and prints full path and extension.
:: This utility assumes PATHEXT=.COM;.EXE;.BAT;.CMD.
:: Changes to the value of PATHEXT are ignored.
::
:: Usage:
::    csd_which filename [ variable ]
::
:: Parameters:
::    filename ... This name is searched in all directories of PATH.
::    variable ... Environment variable that receives the result of
::                 the search. If this argument is missing the result
::                 is written to standard output.
:: ====================================================================

	set csd_which_x=%~x1
	if "%csd_which_x%" == "" goto :no_extension

	if exist %~nx1 call :t_found %~f1 %2 && goto :EOF
	for /f %%i in ("%1") do if exist "%%~$PATH:i" call :t_found "%%~$PATH:i" %2
	goto :EOF

:no_extension
	for %%i in (%1.com %1.exe %1.cmd %1.bat %1.dll %1.ocx) do if exist "%%~$PATH:i" call :t_found "%%~$PATH:i" %2
	goto :EOF

:t_found
:: first copy parameter to a variable
	set csd_which_x=%1

:: then remove all double quotes
	set csd_which_x=%csd_which_x:"=%

	if "%2" == "" echo %csd_which_x% && goto :EOF
	call csd_do SET "%2=%csd_which_x%"

:EOF
	set csd_which_x=
