@echo off 
cls
Title Validating Batch Images in Your System...
set t=timeout /t "1" ^>nul
if not exist "%systemDrive%\System\Bpaint" (md "%systemDrive%\System\Bpaint")
%t%
copy /y "logo.ico" "%systemDrive%\System\Bpaint\logo.ico"
%t%
copy /y "Bim.bat" "%windir%\system32\Bim.bat"
%t%
copy /y "fn.dll" "%windir%\system32\fn.dll"
call :fix Bim "%systemDrive%\System\Bpaint\logo.ico" "%windir%\system32\Bim.bat"
echo. Validated Batch Images in your system...
pause
exit








:fix
setlocal
set File_type=%~1
set icon=%~2
set openWith=%~3
	echo. '%File_type%' is not defined in Registry.
	%t%
	echo.
	echo.
	set /p ".=Defining this File_type[.%File_type%]"<nul
	%t%
	set /p ".=."<nul
	%t%
	set /p ".=."<nul
	%t%
	reg add HKCR\.%File_type% /ve /t REG_SZ /d kvc.%File_type% /f>nul
	set /p ".=."<nul
	%t%
	set /p ".=(Done)"<nul
	echo.
	echo.
	set /p ".=Making Important Changes [.%File_type%]"<nul
	%t%
	reg add HKCR\kvc.%File_type% /ve /t REG_SZ /d "%File_type% File" /f>nul
	set /p ".=."<nul
	%t%
	reg add HKCR\kvc.%File_type%\DefaultIcon /ve /t REG_SZ /d "%icon%" /f>nul
	set /p ".=."<nul
	%t%
	reg add HKCR\kvc.%File_type%\Shell
	set /p ".=."<nul
	%t%
	reg add HKCR\kvc.%File_type%\shell\Open
	reg add HKCR\kvc.%File_type%\shell\Open\command /ve /t REG_SZ /d "%openWith% ""%%1""" /f>nul
	set /p ".=(Done)"<nul
	echo.
endlocal
goto :eof
