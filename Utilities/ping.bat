@echo off
:b
echo Choose an option
cmdMenuSel f870 "Ping a site/ip" "Exit" 
if %ERRORLEVEL% == 1 goto a
if %ERRORLEVEL% == 2 goto b

:a
Set input=

set /p input=
ping %input%
goto b