@echo off

setlocal

if "%1" == "" (
		echo Please input file name
		goto :EOF
		)

set FILENAME=%~n1
set SUFFIX=%~x1

if "%SUFFIX%" == "" (
		@for %%e in (%PATHEXT%) do (
			@for %%i in (%FILENAME%%%e) do (
				@if not "%%~$PATH:i"=="" (
					echo %%~$PATH:i 
					)
				)
			)
		) else (
			@for %%i in (%FILENAME%%SUFFIX%) do (
				@if not "%%~$PATH:i" == "" (
					echo %%~$PATH:i
					)
				)
			)

endlocal

