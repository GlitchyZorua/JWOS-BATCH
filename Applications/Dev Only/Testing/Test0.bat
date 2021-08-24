@echo off
color 0a
title KeyStrokeSim
goto Start

:Start
cls
echo press d or f
choice /c df /n
if %errorlevel%==1 goto Finished
if %errorlevel%==2 goto Finished

:Finished
echo You have Pressed D or F!
pause
goto Start