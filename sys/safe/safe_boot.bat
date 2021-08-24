@echo off
echo %cd%^>win
echo Booting...
echo Please wait...
echo Loading...
echo Starting os_bootup_sounds.vbs
ping localhost -n 8 >nul
echo %time% %date%
echo Real OS Username: %username%
echo OS Name: JWOS
echo Boot Code: %random%
echo Directory: %cd%
echo ===================================================
echo Checking Disk...
ping localhost -n 2 >nul
echo OK
echo Boot Done. Lauching to the start menu
cls
safe_menu.bat