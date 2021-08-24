@echo off
echo %cd%^>safe

echo Please wait...
ping localhost -n 2 >nul
echo Booting Safe.bat
ping localhost -n 1 >nul
echo Loading safe.bat
ping localhost -n 1 >nul
echo Loading os_core.ini...
ping localhost -n 3 >nul
echo Loading boxie boi.png
ping localhost -n 1 >nul