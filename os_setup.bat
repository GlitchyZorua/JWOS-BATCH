@echo off
:c
echo Welcome to the JWOS Setup!
pause
echo Please Select a drive to install
cmdMenuSel f870 "C: " "A: " "(Unknown drive)"
if %ERRORLEVEL% == 1 goto a
if %ERRORLEVEL% == 2 goto b
if %ERRORLEVEL% == 3 bsod.bat


:b
echo error: no disk found
pause
goto c

:a
echo Installing... Please wait...
echo > notes.ini
echo > os_core.ini
ping localhost -n 8 >nul
echo Some things to note here:
echo Most things require node.js and npm in order to function. If you do not have that installed yet, please do now.
cmdMenuSel f870 "Yes, I do have node.js installed. Skip. " "No, I don't have node.js." "Continue without node.js (if you already have node_modules folder, select this)"
if %ERRORLEVEL% == 1 goto d
if %ERRORLEVEL% == 2 goto e
if %ERRORLEVEL% == 3 goto f





:e
echo You are required to have node.js installed. This should install that for you. Once your done, Please press done. If you accidently close it, then press "Install" below
start node-v14.13.1-x64.msi
cmdMenuSel f870 "Install" "Done. "
if %ERRORLEVEL% == 1 goto start node-v14.13.1-x64.msi
if %ERRORLEVEL% == 2 goto d

:f
echo You must also have a telnet service. Do you have that enabled?
cmdMenuSel f870 "Yes" "No"
if %ERRORLEVEL% == 2 goto e
if %ERRORLEVEL% == 3 goto g

:d
cls
echo Installing NPM Modules... please wait...
echo Please do not close this window.
echo Installing Module: NPM
npm i npm
echo Installing Module: Chalk
npm i chalk
echo Installion finished
goto g

:g
echo Please check that telnet is enabled. Go to Control Panel ^> Programs and Features ^> Turn Windows features on or off. Scroll down and find "Telnet Client."
echo If required to reboot, Reboot by clicking the button below. Your settings that has been installed in JWOS will be saved. After you reboot, open os_boot.bat.
cmdMenuSel f870 "Reboot" "Continue without reboot."
if %ERRORLEVEL% == 1 goto h
if %ERRORLEVEL% == 2 goto i

:i
echo Please wait...
ping localhost -n 2 >nul
echo Ok, booting to JWOS
cls
os_boot.bat


:h
echo Reboot?
cmdMenuSel f870 "Yes" "No"
if %ERRORLEVEL% == 1 goto g
if %ERRORLEVEL% == 2 goto j
goto j


:j
echo See you later, I guess.
shutdown -r
pause