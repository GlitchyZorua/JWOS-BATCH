@echo off
:a
echo %random%
cmdMenuSel f870 "Roll again" "Exit"
if %ERRORLEVEL% == 1 goto a
if %ERRORLEVEL% == 2 goto b

:b
cls
"%cd%\JWOS\os_menu.bat"