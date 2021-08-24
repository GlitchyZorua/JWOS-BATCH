@echo off
:c
echo Safe mode
cmdMenuSel f870 "Date & Time" "Boot without Important Files" "BSOD" "Terminal" "Shutdown" 
if %ERRORLEVEL% == 1 goto a
if %ERRORLEVEL% == 2 goto b
if %ERRORLEVEL% == 3 goto bsod
if %ERRORLEVEL% == 4 goto d
if %ERRORLEVEL% == 5 goto e

:a
echo %time% %date%
pause
cls
goto c

:b
echo Please wait...
ping localhost -n 10 >nul
color 04
ECHO ERROR
ping localhost -n 1 >nul
ECHO ERROR
ping localhost -n 1 >nul
ECHO ERROR
ping localhost -n 1 >nul
ECHO ERROR
ping localhost -n 1 >nul
ECHO ERROR
ping localhost -n 1 >nul
ECHO ERROR
ping localhost -n 1 >nul
ECHO ERROR
ping localhost -n 1 >nul
ECHO ERROR
ping localhost -n 1 >nul
ECHO ERROR
ping localhost -n 1 >nul
ECHO ERROR
ping localhost -n 1 >nul
ECHO ERROR
ping localhost -n 1 >nul
ECHO ERROR
ping localhost -n 1 >nul
ECHO ERROR
ping localhost -n 1 >nul
ECHO ERROR
ping localhost -n 1 >nul
ECHO ERROR
ping localhost -n 1 >nul
ECHO ERROR
ping localhost -n 1 >nul
ECHO ERROR
ping localhost -n 1 >nul
ECHO ERROR
ping localhost -n 1 >nul
ECHO ERROR
ping localhost -n 1 >nul
ECHO ERROR
ping localhost -n 1 >nul
ECHO ERROR
ping localhost -n 1 >nul
ECHO ERROR
ping localhost -n 1 >nul
ECHO ERROR
ping localhost -n 1 >nul
ECHO ERROR
ping localhost -n 1 >nul
ECHO ERROR
ping localhost -n 1 >nul
ECHO ERROR
ping localhost -n 1 >nul
ECHO ERROR
ping localhost -n 1 >nul
goto bsod






:bsod
cls
title BSOD
color 17
echo A problem has been detected and JWOS has been shut down to prevent damage to your computer.
echo.
echo IMPORTANT_FILES_MISSING_OR_DISABLED
echo.
echo If this is the first time you've seen this stop error screen, restart your computer. if this screen appears again, follow these steps:
echo.
echo Check to make sure any new hardware or software is properly installed. If this is a new installation, ask your hardware or software manufacturer for and Windows updates you might need.
echo.
echo If problems continue, disable or remove any newly installed hardware or software. Disable BIOS memory options such as caching or shadowing. If you need to use Safe Mode to remove or disable components, restart your computer, press F8 to select Advanced Startup Options, and then select Safe Mode.
echo.
echo Technical information:
echo.
echo *** STOP: 0x000000FE (0x00000008, 0x000000006, 0x00000009, 0x847075cc)
ping localhost -n 10 >nul
exit


:d
cmd


:e
cls
echo Shutting down...
exit