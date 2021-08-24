@echo off
:a
echo The date is %date%
cmdMenuSel f870 "Refresh" "Exit"
if %ERRORLEVEL% == 1 goto a
if %ERRORLEVEL% == 2 goto b


:b
cls
"%cd%\JWOS\os_menu.bat"