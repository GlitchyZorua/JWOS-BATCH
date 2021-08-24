@echo off
:e
echo.
echo.
echo ::::::::: ::::::::::: ::::::::   ::::::::  
echo :+:    :+:    :+:    :+:    :+: :+:    :+: 
echo +:+    +:+    +:+    +:+    +:+ +:+        
echo +#++:++#+     +#+    +#+    +:+ +#++:++#++ 
echo +#+    +#+    +#+    +#+    +#+        +#+ 
echo #+#    #+#    #+#    #+#    #+# #+#    #+# 
echo ######### ########### ########   ######## 
echo [1] Boot to safe mode
echo [2] Boot to CMD
echo [3] Exit
choice /c 1234 /n
if %errorlevel%==1 goto a
if %errorlevel%==2 goto b
if %errorlevel%==3 goto c
:a
echo Boot to safe mode? (y/n)
choice /c yn /n
if %errorlevel%==1 goto safe
if %errorlevel%==2 goto e


:safe
echo Please wait...
echo %cd%^>safe
ping localhost -n 2 >nul
echo Booting Safe.bat
ping localhost -n 1 >nul
echo Loading safe.bat
ping localhost -n 1 >nul
echo Loading os_core.ini...
ping localhost -n 3 >nul
echo Loading boxie boi.png
ping localhost -n 1 >nul
cho %cd%^>cd sys
cd sys
cho %cd%^>cd safe
cd safe
safe_boot.bat

:c
echo Please wait..
exit